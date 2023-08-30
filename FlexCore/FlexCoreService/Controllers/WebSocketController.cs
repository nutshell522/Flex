using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Concurrent;
using System.Net.WebSockets;
using System.Text;
using System.Text.RegularExpressions;

namespace FlexCoreService.Controllers
{
    public class WebSocketController : Controller
    {
        private static ConcurrentDictionary<string, List<WebSocket>> MemberWebSockets = new ConcurrentDictionary<string, List<WebSocket>>();
        private static ConcurrentDictionary<string, ConcurrentQueue<string>> MessageQueues = new ConcurrentDictionary<string, ConcurrentQueue<string>>();

        private string GetValidMembersId(string? membersId)
        {
            if (string.IsNullOrEmpty(membersId))
            {
                return "user1";
            }
            return membersId!;
        }

        [Route("ws")]
        [HttpGet]
        public async Task<IActionResult> Connect(string? membersId)
        {
            membersId = GetValidMembersId(membersId);

            if (HttpContext.WebSockets.IsWebSocketRequest)
            {
                using var webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
                await ProcessWebSocket(webSocket, membersId);
            }
            else
            {
                HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
            }

            return new EmptyResult();
        }

        private async Task ProcessWebSocket(WebSocket webSocket, string? membersId)
        {
            if (!MemberWebSockets.ContainsKey(membersId))
            {
                MemberWebSockets.TryAdd(membersId, new List<WebSocket>());
                MessageQueues.TryAdd(membersId, new ConcurrentQueue<string>());
            }
            MemberWebSockets[membersId].Add(webSocket);

            var buffer = new byte[1024 * 4];
            var res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
            string? UserName = null;

			while (!res.CloseStatus.HasValue)
			{
				UserName = "匿名";
				var cmd = Encoding.UTF8.GetString(buffer, 0, res.Count);
				JObject data = JObject.Parse(cmd);
				string? Name = Convert.ToString(data["userName"]);
				string? Message = $"{Convert.ToString(data["message"])}";

                if (!string.IsNullOrEmpty(Name))
                {
                    UserName = Name;
                }

                string fullMessage = JsonConvert.SerializeObject(new
                {
                    userName = UserName,
                    message = Message
                });

                // 儲存訊息並廣播給相同 membersId 的連線者
                MessageQueues[membersId].Enqueue(fullMessage);
                await Broadcast(fullMessage, MemberWebSockets[membersId]);

                res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
            }

            // 連線關閉時的處理，從集合中移除 WebSocket
            MemberWebSockets[membersId].Remove(webSocket);
        }

        private async Task SendToWebSocket(WebSocket webSocket, string message)
        {
            var buff = Encoding.UTF8.GetBytes(message);
            var data = new ArraySegment<byte>(buff, 0, buff.Length);

            try
            {
                await webSocket.SendAsync(data, WebSocketMessageType.Text, true, CancellationToken.None);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending message: {ex.Message}");
            }
        }

        private async Task Broadcast(string message, List<WebSocket> webSockets)
        {
            var buff = Encoding.UTF8.GetBytes(message);
            var data = new ArraySegment<byte>(buff, 0, buff.Length);

            foreach (var webSocket in webSockets)
            {
                if (webSocket.State == WebSocketState.Open)
                {
                    await SendToWebSocket(webSocket, message);
                }
            }
        }
    }
}
//namespace FlexCoreService.Controllers
//{
//	public class WebSocketController : Controller
//	{
//		private static ConcurrentDictionary<string, List<WebSocket>> MemberWebSockets = new ConcurrentDictionary<string, List<WebSocket>>();
//		private static ConcurrentDictionary<string, ConcurrentQueue<string>> MessageQueues = new ConcurrentDictionary<string, ConcurrentQueue<string>>();

//		private string GetValidMembersId(string? membersId)
//		{
//			if (string.IsNullOrEmpty(membersId))
//			{
//				return "user1";
//			}
//			return membersId!;
//		}

//		[Route("ws")]
//		[HttpGet]
//		public async Task<IActionResult> Connect(string? membersId)
//		{
//			membersId = GetValidMembersId(membersId);

//			if (HttpContext.WebSockets.IsWebSocketRequest)
//			{
//				using var webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
//				await ProcessWebSocket(webSocket, membersId);
//			}
//			else
//			{
//				HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
//			}

//			return new EmptyResult();
//		}

//		private async Task ProcessWebSocket(WebSocket webSocket, string? membersId)
//		{
//			if (!MemberWebSockets.ContainsKey(membersId))
//			{
//				MemberWebSockets.TryAdd(membersId, new List<WebSocket>());
//				MessageQueues.TryAdd(membersId, new ConcurrentQueue<string>());
//			}
//			MemberWebSockets[membersId].Add(webSocket);

//			// 傳送先前儲存的訊息給新連線者
//			while (MessageQueues[membersId].TryDequeue(out string message))
//			{
//				await SendToWebSocket(webSocket, message);
//			}

//			var buffer = new byte[1024 * 4];
//			var res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
//			string? UserName = null;

//			while (!res.CloseStatus.HasValue)
//			{
//				UserName = "匿名";
//				var cmd = Encoding.UTF8.GetString(buffer, 0, res.Count);
//				JObject data = JObject.Parse(cmd);
//				string? Name = Convert.ToString(data["userName"]);
//				string? Message = $"{Convert.ToString(data["message"])} \n at {DateTime.Now.ToString("HH:mm:ss")}";

//				if (!string.IsNullOrEmpty(Name))
//				{
//					UserName = Name;
//				}

//				string fullMessage = JsonConvert.SerializeObject(new
//				{
//					userName = UserName,
//					message = Message
//				});

//				// 儲存訊息並廣播給相同 membersId 的連線者
//				MessageQueues[membersId].Enqueue(fullMessage);
//				await Broadcast(fullMessage, MemberWebSockets[membersId]);

//				res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
//			}
//		}

//		private async Task SendToWebSocket(WebSocket webSocket, string message)
//		{
//			var buff = Encoding.UTF8.GetBytes(message);
//			var data = new ArraySegment<byte>(buff, 0, buff.Length);

//			try
//			{
//				await webSocket.SendAsync(data, WebSocketMessageType.Text, true, CancellationToken.None);
//			}
//			catch (Exception ex)
//			{
//				Console.WriteLine($"Error sending message: {ex.Message}");
//			}
//		}

//		private async Task Broadcast(string message, List<WebSocket> webSockets)
//		{
//			var buff = Encoding.UTF8.GetBytes(message);
//			var data = new ArraySegment<byte>(buff, 0, buff.Length);

//			foreach (var webSocket in webSockets)
//			{
//				if (webSocket.State == WebSocketState.Open)
//				{
//					await SendToWebSocket(webSocket, message);
//				}
//			}
//		}
//	}
//}


//namespace FlexCoreService.Controllers
//{
//	public class WebSocketController : Controller
//	{
//		//static ConcurrentDictionary<int, WebSocket> WebSockets = new ConcurrentDictionary<int, WebSocket>();
//		static ConcurrentDictionary<string, List<WebSocket>> MemberWebSockets = new ConcurrentDictionary<string, List<WebSocket>>();
//		private string GetValidMembersId(string? membersId)
//		{
//			if(string.IsNullOrEmpty(membersId))
//			{
//				return "user1";
//			}
//			return membersId!;
//		}
//		[Route("ws")]
//		[HttpGet]
//		public async Task<IActionResult> Connect(string? membersId)
//		{
//			membersId = GetValidMembersId(membersId);

//			if (HttpContext.WebSockets.IsWebSocketRequest)
//			{
//				using var webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
//				await ProcessWebSocket(webSocket, membersId);
//			}
//			else
//			{
//				HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
//			}

//			return new EmptyResult();
//		}

//		private async Task ProcessWebSocket(WebSocket webSocket, string? membersId)
//		{
//			if (!MemberWebSockets.ContainsKey(membersId))
//			{
//				MemberWebSockets.TryAdd(membersId, new List<WebSocket>());
//			}
//			MemberWebSockets[membersId].Add(webSocket);
//			//WebSockets.TryAdd(webSocket.GetHashCode(), webSocket);
//			var buffer = new byte[1024 * 4];
//			var res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
//			string? UserName = null;

//			while (!res.CloseStatus.HasValue)
//			{
//				UserName = "匿名";
//				var cmd = Encoding.UTF8.GetString(buffer, 0, res.Count);
//				JObject data = JObject.Parse(cmd);
//				string? Name = Convert.ToString(data["userName"]);
//				string? Message = $"{Convert.ToString(data["message"])} \n at {DateTime.Now.ToString("HH:mm:ss")}";

//				if (!string.IsNullOrEmpty(Name))
//				{
//					UserName = Name;
//				}
//				foreach (var memberId in MemberWebSockets.Keys)
//				{
//					await Broadcast(JsonConvert.SerializeObject(new
//					{
//						userName = UserName,
//						message = Message
//					}), MemberWebSockets[memberId]);
//				}
//				//await Broadcast(JsonConvert.SerializeObject(new
//				//{
//				//	userName = UserName,
//				//	message = Message
//				//}), MemberWebSockets[membersId]);

//				res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
//			}
//		}

//		private async Task Broadcast(string message, List<WebSocket> webSockets)
//		{
//			var buff = Encoding.UTF8.GetBytes(message);
//			var data = new ArraySegment<byte>(buff, 0, buff.Length);

//			foreach (var webSocket in webSockets)
//			{
//				if (webSocket.State == WebSocketState.Open)
//				{
//					try
//					{
//						await webSocket.SendAsync(data, WebSocketMessageType.Text, true, CancellationToken.None);
//					}
//					catch (Exception ex)
//					{
//						// Handle exceptions when sending to a WebSocket
//						Console.WriteLine($"Error sending message: {ex.Message}");
//					}
//				}
//			}
//		}
//	}
//}

