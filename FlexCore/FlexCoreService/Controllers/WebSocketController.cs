using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using System.Collections.Concurrent;
using System.Net.WebSockets;
using System.Text;

namespace FlexCoreService.Controllers
{
	public class WebSocketController : Controller
	{
		static ConcurrentDictionary<int, WebSocket> WebSockets = new ConcurrentDictionary<int, WebSocket>();

		[Route("ws")]
		[HttpGet]
		public async Task<IActionResult> Connect()
		{
			if (HttpContext.WebSockets.IsWebSocketRequest)
			{
				using var webSocket = await HttpContext.WebSockets.AcceptWebSocketAsync();
				await ProcessWebSocket(webSocket);
			}
			else
			{
				HttpContext.Response.StatusCode = StatusCodes.Status400BadRequest;
			}

			return new EmptyResult();
		}

		private async Task ProcessWebSocket(WebSocket webSocket)
		{
			WebSockets.TryAdd(webSocket.GetHashCode(), webSocket);
			var buffer = new byte[1024 * 4];
			var res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
			string? UserName = null;

			while (!res.CloseStatus.HasValue)
			{
				UserName = "匿名";
				var cmd = Encoding.UTF8.GetString(buffer, 0, res.Count);
				JObject data = JObject.Parse(cmd);
				string? Name = Convert.ToString(data["userName"]);
				string? Message = $"{Convert.ToString(data["message"])} \n at {DateTime.Now.ToString("HH:mm:ss")}";

				if (!string.IsNullOrEmpty(Name))
				{
					UserName = Name;
				}

				Broadcast(JsonConvert.SerializeObject(new
				{
					userName = UserName,
					message = Message
				}));

				res = await webSocket.ReceiveAsync(new ArraySegment<byte>(buffer), CancellationToken.None);
			}
		}

		private void Broadcast(string message)
		{
			var buff = Encoding.UTF8.GetBytes(message);
			var data = new ArraySegment<byte>(buff, 0, buff.Length);

			Parallel.ForEach(WebSockets.Values, async (webSocket) =>
			{
				if (webSocket.State == WebSocketState.Open)
					await webSocket.SendAsync(data, WebSocketMessageType.Text, true, CancellationToken.None);
			});
		}
	}
}

