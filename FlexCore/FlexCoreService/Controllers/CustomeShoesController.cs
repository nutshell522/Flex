using EFModels.Models;
using FlexCoreService.CustomeShoes.Exts;
using FlexCoreService.CustomeShoes.Infra.DPRepository;
using FlexCoreService.CustomeShoes.Interface;
using FlexCoreService.CustomeShoes.Models.Dtos;
using FlexCoreService.CustomeShoes.Models.VMs;
using FlexCoreService.CustomeShoes.Service;
using FlexCoreService.Orders;
using FlexCoreService.ProductCtrl.Models.VM;
using FlexCoreService.ProductCtrl.Service;
using FlexCoreService.UserCtrl.Models.Dtos;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text;
using static NuGet.Packaging.PackagingConstants;

namespace FlexCoreService.Controllers
{
	[EnableCors("AllowAny")]
	[Route("api/[controller]")]
	[ApiController]
	public class CustomeShoesController : ControllerBase
	{
		private readonly AppDbContext _db;
        private CustomeShoesDPRepository _csrepo;
        private ICustomeShoesRepository _repo;
        private ICustomerChooseRepository _chooserepo;
        public CustomeShoesController(AppDbContext context, ICustomeShoesRepository repo, ICustomerChooseRepository chooserepo)
		{
			_db = context;
			_repo = repo;
            _chooserepo = chooserepo;
        }

		// POST: api/CustomizedShoesPo/
		[HttpGet("GetAll")]
		public async Task<ActionResult<IEnumerable<CustomeShoesVM>>> GetAllCustomeShoes()
		{
			var server = new CustomeShoesService(_repo);
			var shoes = server.SearchCustomeShoes().Select(p => p.ToCardVM()).ToList();
			if (shoes.Count == 0)
			{
				return NotFound();
			}
			return shoes;
		}

        // Get: api/CustomizedShoesPo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CustomeShoesVM>>> SearchCustomeShoesCategory(int shoescategoryId)
        {
            var server = new CustomeShoesService(_repo);
            var shoes = server.SearchCustomeShoesCategory(shoescategoryId).Select(p => p.ToCardVM()).ToList();
            if (shoes.Count == 0)
            {
                return BadRequest();
            }
            return Ok(shoes);
        }


        // GET: api/CustomizedShoesPo/5
        [HttpGet("shoes/Customization/{shoesProductId}")]
        public async Task<ActionResult<CustomeShoesVM>> GetShoes(int shoesProductId)
        {
            var server = new CustomeShoesService(_repo);

            var shoes = server.SearchOneCustomeShoes(shoesProductId);

            var chooseserver = new ShoesChoosesService(_chooserepo);

            var chooses = chooseserver.GetOptions().ToList();
            var chooses2 = chooseserver.GetColor().ToList();
            var chooses3 = chooseserver.GetMaterial().ToList();

            var vm = shoes.ToAllVM(chooses, chooses2, chooses3);

            if (vm == null)
            {
                return NotFound();
            }

            return vm;
        }

        [HttpGet("shoes/detail/{shoesProductId}")]
        public async Task<ActionResult<ShoesDetailVM>> GetShoesDetail(int shoesProductId)
        {
            var server = new CustomeShoesService(_repo);

            var shoes = server.GetShoesDetail(shoesProductId);

            var chooseserver = new ShoesChoosesService(_chooserepo);

            var chooses = chooseserver.GetSizes().ToList();
            
            var vm = shoes.ToDetailVM(chooses);

            if (vm == null)
            {
                return NotFound();
            }

            return vm;
        }

        //GET: api/Products/Detial/productId
        [HttpGet("Imgs/{shoesProductId}")]
        public async Task<ActionResult<IEnumerable<ShoesImgsVM>>> GetShoesImgs(int shoesProductId)
        {
            var service = new CustomeShoesService(_repo);

            var shoes = service.GetShoesImgs(shoesProductId).Select(i => i.ToImgVM());

            if (shoes == null)
            {
                return BadRequest();
            }

            return Ok(shoes);
        }

		[HttpPost("EnterCustomerChoose")]
		public async Task<ActionResult<string>> ChooseSizeandQty([FromBody] ShoesOrderDto dto)
		{
            string input = Guid.NewGuid().ToString(); // 生成一個唯一的 GUID
            byte[] bytes = Encoding.UTF8.GetBytes(input);
            string hash = string.Empty;
            using (MD5 md5 = MD5.Create())
            {
                byte[] hashBytes = md5.ComputeHash(bytes);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2")); // 將每個位元組轉換為兩位的十六進制數字
                }
                hash = sb.ToString();
                dto.ShoesOrderId = hash; // 將雜湊賦值給 ShoesOrderId
            }

            ShoesOrder order = new ShoesOrder
			{
				ShoesOrderId = dto.ShoesOrderId,
				Qty = dto.Qty.Value,
				fk_ShoesSizeId = dto.fk_ShoesSizeId.Value,
				Remark = dto.Remark,
			};

			_db.ShoesOrders.Add(order);
			await _db.SaveChangesAsync();
			return Ok(hash);
		}

        [HttpPost("ChoseAllOptions")]
        public async Task<CustomeShoesGroupDto> ChooseAllOptions ([FromBody] CustomeShoesGroupDto dto)
        {
            ShoesGroup shoesgroup = new ShoesGroup
            {
                ShoesGroupId = dto.ShoesGroupId,
                fk_ShoesMainId = dto.ShoesMainId,
                fk_OptionId = dto.OptionId,
                fk_MaterialId = dto.MaterialId,
                fk_ShoesColorId = dto.ShoesColorId,
                fk_CustomerOrderId = dto.CustomerOrderId,
            };

            _db.ShoesGroups.Add(shoesgroup);
            await _db.SaveChangesAsync();
            return dto;
        }

        [HttpPost("IntoOrder")]
        public async Task<IActionResult> ShoesIntoOrders([FromBody] ShoesToOrderDto dto)
        {

            order shoes = new order
            {
                fk_member_Id = dto.fk_member_Id,
                ordertime = DateTime.Now,
                total_quantity = dto.total_quantity,
                freight = dto.freight,
                cellphone = dto.cellphone,
                receiver = dto.receiver,
                recipient_address = dto.recipient_address,
                total_price = dto.total_price,
                pay_method_Id = dto.pay_method_Id,
                order_status_Id = dto.order_status_Id,
                pay_status_Id = dto.pay_status_Id,
                order_description = dto.order_description,
                fk_typeId = dto.fk_typeId,

            };
            _db.orders.Add(shoes);
            await _db.SaveChangesAsync();

            orderItem shoesitem = new orderItem
            {
                order_Id = shoes.Id,
                product_name = dto.product_name,
                per_price = dto.per_price,
                quantity = dto.quantity,
                Items_description = dto.Items_description,
                fk_typeId = dto.fk_typeId,
                discount_name = dto.discount_name,
                subtotal = dto.subtotal,
                discount_subtotal = dto.discount_subtotal,
            };

            _db.orderItems.Add(shoesitem);
            await _db.SaveChangesAsync();

            return Ok();
        }


        [HttpGet("shoes/Customization/Order/{ShoesOrderId}")]
        public async Task<ActionResult<ShoesTotalOrderVM>> GetShoesOrderTotal(string ShoesOrderId)
        {
            var server = new CustomeShoesService(_repo);

            var shoes = server.GetShoesTotalOrder(ShoesOrderId);

            var chooseserver = new ShoesChoosesService(_chooserepo);

            var chooses = chooseserver.GetAllOptions(ShoesOrderId).ToList();

            var vm = shoes.ToTotalOrderVM(chooses);

            if (vm == null)
            {
                return NotFound();
            }

            return vm;
        }

        

        private bool ShoesExists(int id)
		{
			return (_db.CustomizedShoesPos?.Any(e => e.ShoesProductId == id)).GetValueOrDefault();
		}
	}
}
