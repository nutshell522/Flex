-- insert cart假資料 
INSERT INTO ShoppingCarts(fk_MemberID)
VALUES (1),(2),(3),(4),(5);
go

-- insert cart假資料 
INSERT INTO CartItems(fk_CardId,fk_ProductId,Description,Qty)
VALUES (1,1,'',2),
(1,6,'',1),
(1,7,'',5),
(1,16,'',2),
(3,6,'',1);
go
-- insert discounts假資料
INSERT INTO Discounts(DiscountName,DiscountDescription,fk_ProjectTagId,DiscountType,DiscountValue,ConditionType,ConditionValue,StartDate,EndDate,OrderBy,Status)
VALUES
('九折優惠','此專區單件9折',16,1,10,0,0,'2023-01-01',null,1000,1), 
('夏秋特賣','此專區單件8折',15,1,20,0,0,'2023-08-01','2023-09-30',100,1) 
go
-- insert sending coupon 註冊券
insert INTO CouponSendings(fk_CouponId,fk_MemberId,SentDate,StartDate,EndDate ,RedemptionStatus,RedeemedDate)
values
(1,1,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,2,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,3,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,4,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,5,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,6,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,7,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,8,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,9,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,10,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,11,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,12,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,13,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,14,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,15,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,16,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,17,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,18,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,19,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,20,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,21,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,22,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,23,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,24,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(1,25,'2023-08-10 00:00:00','2023-08-10 00:00:00','2023-09-10 23:59:59',0,null),
(6,1,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,2,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,3,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,4,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,5,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,6,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,7,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,8,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,9,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,10,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,11,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,12,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,13,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,14,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,15,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,16,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,17,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,18,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,19,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,20,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,21,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,22,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,23,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,24,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(6,25,'2023-08-12 00:00:00','2023-08-15 00:00:00','2023-09-15 23:59:59',0,null),
(7,1,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,2,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null),
(7,3,'2023-08-19 00:00:00','2023-08-19 00:00:00',null,0,null);


select 
c.CouponId as Id, c.fk_CouponCategoryId as CouponCategoryId, cs.SendingId, c.CouponName, c.MinimumPurchaseAmount,
c.DiscountType, c.DiscountValue, cs.StartDate, cs.EndDate 
from CouponSendings as cs
inner join Coupons as c on c.CouponId = cs.fk_CouponId
where cs.fk_MemberId = 1 and RedemptionStatus = 0

UPDATE CouponSendings SET
RedemptionStatus = 1,
RedeemedDate = getdate()
WHERE SendingId = 3

select * from discounts as d
where d.StartDate <= getdate() and ( d.EndDate > getdate() OR d.EndDate IS NULL) and d.status = 1

-- cartitem sql select語法
select 
ci.CartItemId, c.CartId, pg.ProductGroupId as ProductId, ci.Qty, p.ProductId as ProductSaleId, 
p.ProductName, p.UnitPrice, p.SalesPrice, sc.SizeName as Size, cc.ColorName as Color, 
pir.ImgPath, ssc.SalesCategoryName, d.DiscountId, d.DiscountName, d.DiscountDescription, 
d.DiscountType, d.DiscountValue, d.ConditionType, d.ConditionValue, d.OrderBy as DiscountOrder
from CartItems as ci
inner join ShoppingCarts as C on c.CartId = ci.fk_CardId
inner join ProductGroups as pg on pg.ProductGroupId = ci.fk_ProductId
inner join Products as p on p.ProductId = pg.fk_ProductId
inner join ColorCategories as cc on cc.ColorId = pg.fk_ColorId
inner join SizeCategories as sc on sc.SizeId = pg.fk_SizeId
inner join ProductSubCategories as psc on psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
inner join ProductCategories as pc on pc.ProductCategoryId = psc.fk_ProductCategoryId
inner join SalesCategories as ssc on ssc.SalesCategoryId = pc.fk_SalesCategoryId
left join ProjectTagItems as pti on pti.fk_ProductId = p.ProductId
left join(
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
left join Discounts as d on d.fk_ProjectTagId = pti.fk_ProjectTagId
where p.Status=0 and p.LogOut=0 and c.fk_MemberID = 1 
AND (d.StartDate <= GETDATE() AND (d.EndDate > GETDATE() OR d.EndDate IS NULL) AND d.status = 1
OR d.DiscountId IS NULL)
GROUP BY
ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
d.DiscountId, d.DiscountName, d.DiscountDescription, d.DiscountType, d.DiscountValue,
d.ConditionType, d.ConditionValue, d.OrderBy, ssc.SalesCategoryName ,p.ProductName
ORDER BY p.ProductId asc, d.OrderBy asc;

-- cartitem sql select語法2
select 
ci.CartItemId, c.CartId, pg.ProductGroupId as ProductId, ci.Qty, p.ProductId as ProductSaleId, 
p.ProductName, p.UnitPrice, p.SalesPrice, sc.SizeName as Size, cc.ColorName as Color, 
pir.ImgPath, ssc.SalesCategoryName, d.DiscountId, d.DiscountName, d.DiscountDescription, 
d.DiscountType, d.DiscountValue, d.ConditionType, d.ConditionValue, d.OrderBy as DiscountOrder
from CartItems as ci
inner join ShoppingCarts as C on c.CartId = ci.fk_CardId
inner join ProductGroups as pg on pg.ProductGroupId = ci.fk_ProductId
inner join Products as p on p.ProductId = pg.fk_ProductId
inner join ColorCategories as cc on cc.ColorId = pg.fk_ColorId
inner join SizeCategories as sc on sc.SizeId = pg.fk_SizeId
inner join ProductSubCategories as psc on psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
inner join ProductCategories as pc on pc.ProductCategoryId = psc.fk_ProductCategoryId
inner join SalesCategories as ssc on ssc.SalesCategoryId = pc.fk_SalesCategoryId
left join ProjectTagItems as pti on pti.fk_ProductId = p.ProductId
left join(
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
left join Discounts as d on d.fk_ProjectTagId = pti.fk_ProjectTagId
where CartItemId=1 
AND (d.StartDate <= GETDATE() AND (d.EndDate > GETDATE() OR d.EndDate IS NULL) AND d.status = 1
OR d.DiscountId IS NULL)
GROUP BY
ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
d.DiscountId, d.DiscountName, d.DiscountDescription, d.DiscountType, d.DiscountValue,
d.ConditionType, d.ConditionValue, d.OrderBy, ssc.SalesCategoryName ,p.ProductName
ORDER BY p.ProductId asc, d.OrderBy asc;

-- 
SELECT TOP 1 ci.cartitemId,ci.Qty
FROM CartItems AS ci
JOIN ShoppingCarts AS sc ON sc.CartId = ci.fk_CardId
WHERE sc.fk_MemberID = 1 AND ci.fk_ProductId = 21

select * from CartItems

UPDATE CartItems SET
qty = 15
WHERE CartItemId = 1

select * from CartItems

select CartId
from ShoppingCarts as sc
where sc.fk_MemberID = 1

select 
c.CouponId as Id, c.fk_CouponCategoryId as CouponCategoryId, cs.SendingId, c.CouponName, c.MinimumPurchaseAmount,
c.DiscountType, c.DiscountValue, cs.StartDate, cs.EndDate 
from CouponSendings as cs
inner join Coupons as c on c.CouponId = cs.fk_CouponId
where cs.fk_MemberId = 1 and RedemptionStatus = 0
and cs.StartDate <= CURRENT_TIMESTAMP and (cs.EndDate > CURRENT_TIMESTAMP or cs.EndDate is null);


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
WHERE p.Status = 0 AND p.LogOut = 0 AND c.fk_MemberID = 1 
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


select * from orders order by id desc
select * from orderItems order by id desc

insert orders(
ordertime, fk_member_Id, total_quantity, order_status_Id, pay_method_Id,
pay_status_Id, coupon_name, coupon_discount, freight, total_price,
receiver, cellphone, recipient_address,fk_typeId,orderCode,
biller,bill_cellphone,bill_address,agreement)
values(
getdate(),1,1,1,2,
3,null,0,500,1000,
'David','09999','中壢',1,'123456789',
'David','09999','中壢',1)

insert orderItems(
order_Id, product_name, per_price, quantity, discount_name,
discount_subtotal, subtotal, Items_description, fk_typeId,productcommit,
comment)
values(
17,'衣服',1000,1,null,
0,1000,'顏色:灰-尺寸:M',1,10,
0)

select * from ProductGroups

UPDATE ProductGroups SET
Qty = 15
WHERE ProductGroupId = 1

select * from ProductGroups
where ProductGroupId = 1 and Qty > 20

SELECT CASE WHEN EXISTS (SELECT 1 FROM ProductGroups WHERE ProductGroupId = 1 AND Qty >= 1) THEN 1 ELSE 0 END

select qty from ProductGroups where ProductGroupId = 1

select CouponId, EndType,EndDate,RequirementType,Requirement 
from Coupons where fk_CouponCategoryId = 4 and Status = 1 and StartDate <= GETDATE() and  (EndDate > GETDATE() or EndDate is null)

select * from Coupons
select * from CouponSendings

insert CouponSendings(
fk_CouponId, fk_MemberId, SentDate, StartDate, EndDate,
RedemptionStatus, RedeemedDate)
values(4,1,GETDATE(),GETDATE(),null,
0,null)

UPDATE CouponSendings SET
RedeemedDate = GETDATE(),
RedemptionStatus = 1
WHERE SendingId = 54

select * from discounts as d
where d.StartDate <= getdate() 
and ( d.EndDate > getdate() OR d.EndDate IS NULL) 
and d.status = 1

select * from ProjectTagItems as pti
join ProjectTags as pt on pt.ProjectTagId = pti.fk_ProjectTagId
join Discounts as d on d.fk_ProjectTagId = pt.ProjectTagId
join Products as p on p.ProductId = pti.fk_ProductId
join ProductSubCategories as psc on psc.ProductSubCategoryId = p.fk_ProductSubCategoryId
join ProductCategories as pc on pc.ProductCategoryId = psc.fk_ProductCategoryId
join SalesCategories as ssc on ssc.SalesCategoryId = pc.fk_SalesCategoryId
join(
    SELECT *
    FROM ProductImgs AS pi
    WHERE pi.ProductImgId = (
        SELECT TOP 1 pi2.ProductImgId
        FROM ProductImgs AS pi2
        WHERE pi2.fk_ProductId = pi.fk_ProductId
        ORDER BY pi2.ProductImgId
    )
) AS pir ON pir.fk_ProductId = p.ProductId
where d.DiscountId = 10 and ssc.SalesCategoryId = 2

select * from ProductImgs