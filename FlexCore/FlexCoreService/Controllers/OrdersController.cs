using EFModels.Models;
using FlexCoreService.Orders;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace FlexCoreService.Controllers
{
		[EnableCors("AllowAny")]
		[Route("api/[controller]")]
		[ApiController]
		public class OrdersController : ControllerBase
		{
			private readonly AppDbContext _context;

			public OrdersController(AppDbContext context)
			{
				_context = context;
			}
			[HttpGet("GetOrders")]
			public async Task<IEnumerable<OrdersIndexVM>> GetOrders(string? keyword, int? typeId, DateTime? begintime,DateTime? endtime)
			{
				var db = _context;
			if (_context.orders == null)
				{
				return null;
				}
			var orderStatuses = db.order_statuses.AsNoTracking().ToDictionary(os => os.Id, os => os.order_status1);
				var paymethods = db.pay_methods.AsNoTracking().ToDictionary(pd => pd.Id, pd => pd.pay_method1);
				var paystatuses = db.pay_statuses.AsNoTracking().ToDictionary(ps => ps.Id, ps => ps.pay_status1);
				var query = typeId.HasValue
				? _context.orders.Where(o => o.fk_typeId == typeId)
				: _context.orders;
			if (!string.IsNullOrEmpty(keyword))
			{
				query = query.Where(o =>
					o.orderItems.Any(oi => oi.product_name.Contains(keyword))
				);
			}
			if (begintime.HasValue && endtime.HasValue)
			{
				query = query.Where(o =>
					o.ordertime >= begintime.Value && o.ordertime <= endtime.Value
				);
			}

			return query.Select(p => new OrdersIndexVM
				{
					Id = p.Id,
					ordertime = p.ordertime,
					fk_member_Id = p.fk_member_Id,
					total_quantity = p.total_quantity,
					order_status_Id = p.order_status_Id,
					order_status = orderStatuses.ContainsKey(p.order_status_Id) ? orderStatuses[p.order_status_Id] : string.Empty,
					pay_method_Id = p.pay_method_Id,
					pay_method = paymethods.ContainsKey(p.pay_method_Id) ? paymethods[p.pay_method_Id] : string.Empty,
					pay_status_Id = p.pay_status_Id,
					pay_status = paystatuses.ContainsKey(p.pay_status_Id) ? paystatuses[p.pay_status_Id] : string.Empty,
					coupon_name = p.coupon_name,
					coupon_discount = p.coupon_discount,
					freight = p.freight,
					cellphone = p.cellphone,
					receipt = p.receipt,
					receiver = p.receiver,
					recipient_address = p.recipient_address,
					order_description = p.order_description,
					close = (bool)p.close,
					total_price = p.total_price,
					fk_typeId = p.fk_typeId,
					orderItems = (List<OrderItemsVM>)GetOrderItemsIndex(p.Id)
				});
			}
			private static IEnumerable<OrderItemsVM> GetOrderItemsIndex(int orderId)
			{
				var db = new AppDbContext();


				var orderItems = db.orderItems
					.AsNoTracking()
					.Where(o => o.order_Id == orderId)
					.ToList()
					.Select(o => new OrderItemsVM
					{
						Id = o.Id,
						order_Id = o.order_Id,
						product_name = o.product_name,
						per_price = o.per_price,
						quantity = o.quantity,
						discount_name = o.discount_name,
						subtotal = o.subtotal,
						discount_subtotal = o.discount_subtotal,
						Items_description = o.Items_description
					})
					.ToList();

				return orderItems;
			}

		}
	
}
