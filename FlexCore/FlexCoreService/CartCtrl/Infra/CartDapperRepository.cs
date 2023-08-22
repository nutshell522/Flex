using Dapper;
using EFModels.Models;
using FlexCoreService.CartCtrl.Exts;
using FlexCoreService.CartCtrl.Interface;
using FlexCoreService.CartCtrl.Models.Dtos;
using FlexCoreService.CartCtrl.Models.vm;
using Humanizer;
using Microsoft.CodeAnalysis;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using NuGet.Protocol.Plugins;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace FlexCoreService.CartCtrl.Infra
{
    public class CartDapperRepository : ICartRepository
    {
        private IConfiguration _configuration;
        private string _connStr;
        public CartDapperRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            _connStr = _configuration.GetConnectionString("AppDbContext");
        }

        public IEnumerable<CartItemDto> GetCartItems(int memberId)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connStr))
            {
                dbConnection.Open();
                string sql = @"
SELECT 
    ci.CartItemId, c.CartId, pg.ProductGroupId as ProductId, ci.Qty, p.ProductId as ProductSaleId, 
    p.ProductName, p.UnitPrice, p.SalesPrice, sc.SizeName as Size, cc.ColorName as Color, 
    pir.ImgPath, ssc.SalesCategoryName, 
    CASE 
        WHEN d.DiscountId IS NULL THEN NULL 
        WHEN d.StartDate > GETDATE() OR (d.EndDate IS NOT NULL AND d.EndDate <= GETDATE()) THEN NULL 
        ELSE d.DiscountId 
    END AS DiscountId, 
    MAX(d.DiscountName) as DiscountName, MAX(d.DiscountDescription) as DiscountDescription, 
    MAX(d.DiscountType) as DiscountType, MAX(d.DiscountValue) as DiscountValue, 
    MAX(d.ConditionType) as ConditionType, MAX(d.ConditionValue) as ConditionValue, 
    MAX(d.OrderBy) as DiscountOrder
FROM CartItems as ci
INNER JOIN ShoppingCarts as C ON c.CartId = ci.fk_CardId
INNER JOIN ProductGroups as pg ON pg.ProductGroupId = ci.fk_ProductId
INNER JOIN Products as p ON p.ProductId = pg.fk_ProductId
INNER JOIN ColorCategories as cc ON cc.ColorId = pg.fk_ColorId
INNER JOIN SizeCategories as sc ON sc.SizeId = pg.fk_SizeId
INNER JOIN ProductSubCategories as psc ON psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
INNER JOIN ProductCategories as pc ON pc.ProductCategoryId = psc.fk_ProductCategoryId
INNER JOIN SalesCategories as ssc ON ssc.SalesCategoryId = pc.fk_SalesCategoryId
LEFT JOIN ProjectTagItems as pti ON pti.fk_ProductId = p.ProductId
LEFT JOIN(
    SELECT
        pi.fk_ProductId,
        pi.ProductImgId,
        pi.ImgPath
    FROM ProductImgs AS pi
    WHERE pi.ProductImgId = (
        SELECT TOP 1 pi2.ProductImgId
        FROM ProductImgs AS pi2
        WHERE pi2.fk_ProductId = pi.fk_ProductId
        ORDER BY pi2.ProductImgId
    )
) AS pir ON pir.fk_ProductId = p.ProductId
LEFT JOIN Discounts as d ON d.fk_ProjectTagId = pti.fk_ProjectTagId
WHERE p.Status = 0 AND p.LogOut = 0 AND c.fk_MemberID = @MemberId
AND (
    (d.StartDate <= GETDATE() AND (d.EndDate > GETDATE() OR d.EndDate IS NULL) AND d.status = 1)
    OR d.DiscountId IS NULL
    OR (d.StartDate > GETDATE() OR (d.EndDate IS NOT NULL AND d.EndDate <= GETDATE()))
)
GROUP BY
    ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
    p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
    d.DiscountId, ssc.SalesCategoryName, p.ProductName,d.EndDate,d.StartDate
HAVING COUNT(p.ProductId) >= 1
ORDER BY p.ProductId asc, MAX(d.OrderBy) asc;
";

                var cartItems = dbConnection.Query<CartItemDto, CartItemProductDto, ProductDiscountDto, CartItemDto>(
                    sql,
                    (cartItem, product, discount) =>
                    {
                        cartItem.Product = product;
                        if (cartItem.Product != null)
                        {
                            cartItem.Product.MatchDiscounts = new List<ProductDiscountDto> { discount };
                        }
                        return cartItem;
                    },
                    new { MemberId = memberId },
                    splitOn: "ProductId,ProductSaleId,DiscountId"
                );

                // 將獲得資料組合起來 (相同商品不同折扣)
                var groupedCartItems = cartItems.GroupBy(cartItem => cartItem.CartItemId).Select(group =>
                {
                    var firstCartItem = group.First();
                    firstCartItem.Product.MatchDiscounts = group.Select(cartItem => cartItem.Product.MatchDiscounts.FirstOrDefault()).Where(discount => discount != null).ToList();
                    return firstCartItem;
                });

                return groupedCartItems;
            }
        }
        public CartItemDto GetCartItemById(int cartItemId)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connStr))
            {
                dbConnection.Open();
                string sql = @"SELECT 
    ci.CartItemId, c.CartId, pg.ProductGroupId as ProductId, ci.Qty, p.ProductId as ProductSaleId, 
    p.ProductName, p.UnitPrice, p.SalesPrice, sc.SizeName as Size, cc.ColorName as Color, 
    pir.ImgPath, ssc.SalesCategoryName, 
    CASE 
        WHEN d.DiscountId IS NULL THEN NULL 
        WHEN d.StartDate > GETDATE() OR (d.EndDate IS NOT NULL AND d.EndDate <= GETDATE()) THEN NULL 
        ELSE d.DiscountId 
    END AS DiscountId, 
    MAX(d.DiscountName) as DiscountName, MAX(d.DiscountDescription) as DiscountDescription, 
    MAX(d.DiscountType) as DiscountType, MAX(d.DiscountValue) as DiscountValue, 
    MAX(d.ConditionType) as ConditionType, MAX(d.ConditionValue) as ConditionValue, 
    MAX(d.OrderBy) as DiscountOrder
FROM CartItems as ci
INNER JOIN ShoppingCarts as C ON c.CartId = ci.fk_CardId
INNER JOIN ProductGroups as pg ON pg.ProductGroupId = ci.fk_ProductId
INNER JOIN Products as p ON p.ProductId = pg.fk_ProductId
INNER JOIN ColorCategories as cc ON cc.ColorId = pg.fk_ColorId
INNER JOIN SizeCategories as sc ON sc.SizeId = pg.fk_SizeId
INNER JOIN ProductSubCategories as psc ON psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
INNER JOIN ProductCategories as pc ON pc.ProductCategoryId = psc.fk_ProductCategoryId
INNER JOIN SalesCategories as ssc ON ssc.SalesCategoryId = pc.fk_SalesCategoryId
LEFT JOIN ProjectTagItems as pti ON pti.fk_ProductId = p.ProductId
LEFT JOIN(
    SELECT
        pi.fk_ProductId,
        pi.ProductImgId,
        pi.ImgPath
    FROM ProductImgs AS pi
    WHERE pi.ProductImgId = (
        SELECT TOP 1 pi2.ProductImgId
        FROM ProductImgs AS pi2
        WHERE pi2.fk_ProductId = pi.fk_ProductId
        ORDER BY pi2.ProductImgId
    )
) AS pir ON pir.fk_ProductId = p.ProductId
LEFT JOIN Discounts as d ON d.fk_ProjectTagId = pti.fk_ProjectTagId
WHERE ci.CartItemId = @CartItemId
AND (
    (d.StartDate <= GETDATE() AND (d.EndDate > GETDATE() OR d.EndDate IS NULL) AND d.status = 1)
    OR d.DiscountId IS NULL
    OR (d.StartDate > GETDATE() OR (d.EndDate IS NOT NULL AND d.EndDate <= GETDATE()))
)
GROUP BY
    ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
    p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
    d.DiscountId, ssc.SalesCategoryName, p.ProductName,d.EndDate,d.StartDate
HAVING COUNT(p.ProductId) >= 1
ORDER BY p.ProductId asc, MAX(d.OrderBy) asc;
";

                var cartItems = dbConnection.Query<CartItemDto, CartItemProductDto, ProductDiscountDto, CartItemDto>(
                    sql,
                    (cartItem, product, discount) =>
                    {
                        cartItem.Product = product;
                        if (cartItem.Product != null)
                        {
                            cartItem.Product.MatchDiscounts = new List<ProductDiscountDto> { discount };
                        }
                        return cartItem;
                    },
                    new { CartItemId = cartItemId },
                    splitOn: "ProductId,ProductSaleId,DiscountId"
                );

                // 將獲得資料組合起來 (相同商品不同折扣)
                var groupedCartItems = cartItems.GroupBy(cartItem => cartItem.CartItemId).Select(group =>
                {
                    var firstCartItem = group.First();
                    firstCartItem.Product.MatchDiscounts = group.Select(cartItem => cartItem.Product.MatchDiscounts.FirstOrDefault()).Where(discount => discount != null).ToList();
                    return firstCartItem;
                });

                return groupedCartItems.FirstOrDefault();
            }
        }
        public void CreateCartItem(CartItemDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
INSERT INTO CartItems(fk_CardId,fk_ProductId,Description,Qty)
VALUES (@CartId,@ProductId,@Description,@Qty)
";
                var parameters = new { CartId = dto.CartId.Value, ProductId = dto.ProductId.Value, Description = "", Qty = dto.Qty.Value };
                connection.Execute(sql, parameters);
            }
        }

        public void UpdateCartItemQty(CartItemDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
UPDATE CartItems SET
qty = @Qty
WHERE CartItemId = @CartItemId
";
                var parameters = new { dto.CartItemId, dto.Qty };
                connection.Execute(sql, parameters);
            }
        }

        public (bool DoesExist, int CartItemId, int Qty) ExistsCartItem(int memberId, int productId)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
SELECT TOP 1 ci.cartitemId, ci.Qty
FROM CartItems AS ci
JOIN ShoppingCarts AS sc ON sc.CartId = ci.fk_CardId
WHERE sc.fk_MemberID = @MemberID AND ci.fk_ProductId = @ProductId"
;
                var parameters = new { MemberID = memberId, ProductId = productId };

                var cartItem = connection.QuerySingleOrDefault<(int CartItemId, int Qty)?>(sql, parameters);

                if (cartItem != null)
                {
                    return (true, cartItem.Value.CartItemId, cartItem.Value.Qty);
                }
                else
                {
                    return (false, 0, 0);
                }
            }
        }
        public bool ExistsCart(int memberId)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
SELECT TOP 1 1
FROM ShoppingCarts as sc
WHERE sc.fk_MemberID = @MemberID;"
;
                var parameters = new { MemberID = memberId };
                bool doesExist = connection.QuerySingleOrDefault<bool>(sql, parameters);

                return doesExist;
            }
        }
        public int CreateCart(int memberId)
        {

            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
INSERT INTO ShoppingCarts(fk_MemberID)
VALUES (@MemberId);
SELECT SCOPE_IDENTITY();
"
;
                var parameters = new { MemberId = memberId };
                int newCartId = connection.QuerySingle<int>(sql, parameters);

                return newCartId;
            }
        }

        public int GetCartId(int memberId)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
select CartId
from ShoppingCarts as sc
where sc.fk_MemberID = @MemberId
";
                var parameters = new { MemberId = memberId };
                int CartId = connection.QuerySingle<int>(sql, parameters);
                return CartId;
            }
        }

        public void DeleteCartItem(CartItemDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string sql = @"
DELETE FROM CartItems
WHERE CartItemId = @CartItemId"
;

                var parameters = new { CartItemId = dto.CartItemId.Value };

                connection.Execute(sql, parameters);
            }
        }

        public IEnumerable<ProductDiscountDto> GetActiveDiscounts()
        {

            using (IDbConnection dbConnection = new SqlConnection(_connStr))
            {
                dbConnection.Open();
                string sql = @"
select * from discounts as d
where d.StartDate <= getdate() 
and ( d.EndDate > getdate() OR d.EndDate IS NULL) 
and d.status = 1
";

                return dbConnection.Query<ProductDiscountDto>(sql);
            }
        }

        public IEnumerable<CouponDto> GetMemberCoupons(int memberId)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connStr))
            {
                dbConnection.Open();
                string sql = @"select 
c.CouponId as Id, c.fk_CouponCategoryId as CouponCategoryId, cs.SendingId, c.CouponName, c.MinimumPurchaseAmount,
c.DiscountType, c.DiscountValue, cs.StartDate, cs.EndDate 
from CouponSendings as cs
inner join Coupons as c on c.CouponId = cs.fk_CouponId
where cs.fk_MemberId = @MemberId and RedemptionStatus = 0
and cs.StartDate <= CURRENT_TIMESTAMP and (cs.EndDate > CURRENT_TIMESTAMP or cs.EndDate is null);
";
                var parameters = new { MemberId = memberId };

                return dbConnection.Query<CouponDto>(sql, parameters);
            }
        }

        public CouponDto GetCouponById(int sendingId)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connStr))
            {
                dbConnection.Open();
                string sql = @"select 
c.CouponId as Id, c.fk_CouponCategoryId as CouponCategoryId, cs.SendingId, c.CouponName, c.MinimumPurchaseAmount,
c.DiscountType, c.DiscountValue, cs.StartDate, cs.EndDate 
from CouponSendings as cs
inner join Coupons as c on c.CouponId = cs.fk_CouponId
where cs.SendingId = @SendingId
";
                var parameters = new { SendingId = sendingId };

                return dbConnection.QueryFirstOrDefault<CouponDto>(sql, parameters);
            }
        }

        public void UpdateCouponUsage(CouponDto dto, DateTime date)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
UPDATE CouponSendings SET
RedemptionStatus = 1,
RedeemedDate = @RedeemedDate
WHERE SendingId = @SendingId
";
                var parameters = new
                {
                    SendingId = dto.SendingId,
                    RedeemedDate = date
                };
                connection.Execute(sql, parameters);
            }
        }

        public bool CheckIfProductGroupHasSufficientQty(CartItemDto dto, int memberId)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string sql = @"
SELECT CASE WHEN EXISTS (SELECT 1 FROM ProductGroups WHERE ProductGroupId = @ProductGroupId AND Qty > @Qty) THEN 1 ELSE 0 END";
                bool result = connection.QuerySingle<bool>(sql, new { ProductGroupId = dto.ProductId, Qty = dto.Qty });

                return result;
            }
        }

        public void UpdateProductGroupQty(CartItemDto dto, int qty)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
UPDATE ProductGroups SET
Qty = @Qty
WHERE ProductGroupId = @ProductGroupId
";
                var parameters = new
                {
                    Qty = qty,
                    ProductGroupId = dto.ProductId
                };
                connection.Execute(sql, parameters);
            }
        }

        public int CreateOrder(CartContext cartContext, string orderCode)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
insert orders(
ordertime, fk_member_Id, total_quantity, order_status_Id, pay_method_Id,
pay_status_Id, coupon_name, coupon_discount, freight, total_price,
receiver, cellphone, recipient_address,fk_typeId,orderCode,
biller,bill_cellphone,bill_address,agreement)
values(
getdate(),@MemberId,@TotalQty,1,@PayMethod,
3,@CouponName,@CouponDiscount,@Freight,@TotalPrice,
@Receiver,@CellPhone,@Address,1,@OrderCode,
@Biller,@BillCellPhone,@BillAddress,1)
SELECT SCOPE_IDENTITY();
"
;
                var parameters = new
                {
                    MemberId = cartContext.MemberId,
                    TotalQty = cartContext.TotalQty,
                    PayMethod = cartContext.checkoutData.PaymentInfo.PaymentMethod,
                    CouponName = cartContext.Coupon != null ? cartContext.Coupon.Name : null,
                    CouponDiscount = cartContext.CouponValue != null ? cartContext.CouponValue : 0,
                    Freight = cartContext.DeliveryFee,
                    TotalPrice = cartContext.TotalPrice,
                    Receiver = cartContext.checkoutData.ContactInfo.ContactName,
                    CellPhone = cartContext.checkoutData.ContactInfo.Phone,
                    Address = cartContext.checkoutData.ContactInfo.Address,
                    OrderCode = orderCode,
                    Biller = cartContext.checkoutData.BillingAddress.Name,
                    BillCellPhone = cartContext.checkoutData.BillingAddress.Phone,
                    BillAddress = cartContext.checkoutData.BillingAddress.Address,
                };
                int newCartId = connection.QuerySingle<int>(sql, parameters);

                return newCartId;
            }
        }

        public void CreateOrderItem(CartItemDto dto, int newId)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();
                string sql = @"
insert orderItems(
order_Id, product_name, per_price, quantity, discount_name,
discount_subtotal, subtotal, Items_description, fk_typeId,productcommit,
comment)
values(
@OrderId,@ProductName ,@PerPrice ,@Qty ,@DiscountName,
@DiscountSubTotal ,@SubTotal ,@ColorAndSize ,1 ,@ProductId,
0)
";
                var parameters = new
                {
                    OrderId = newId,
                    ProductName = dto.Product.ProductName,
                    PerPrice = dto.Product.SalesPrice,
                    Qty = dto.Qty.HasValue ? dto.Qty.Value : 0,
                    DiscountName = dto.Product.MatchDiscounts
                                        .Where(x => x.DiscountName != null)
                                        .Select(x => x.DiscountName)
                                        .Aggregate("", (current, next) => current + (current != "" ? ", " : "") + next),
                    DiscountSubTotal = dto.Product.MatchDiscounts.Sum(x => x.DiscountValue),
                    SubTotal = dto.Product.SalesPrice * dto.Qty.Value - dto.Product.MatchDiscounts.Sum(x => x.DiscountValue),
                    ColorAndSize = $"顏色:{dto.Product.Color} - 尺寸:{dto.Product.Size}",
                    ProductId = dto.ProductId,
                };
                connection.Execute(sql, parameters);
            }
        }

        public void SendNewCouponAfterCheckout(CouponSendingDto dto, int memberId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<CouponSendingDto> GetPresentCoupon()
        {
            throw new NotImplementedException();
        }

        public int GetOriginProductQty(CartItemDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string sql = @"
SELECT Qty FROM ProductGroups 
WHERE ProductGroupId = @ProductGroupId
";
                int qty = connection.QuerySingle<int>(sql, new { ProductGroupId = dto.ProductId });

                return qty;
            }
        }
    }
}
