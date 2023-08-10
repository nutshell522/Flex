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
GROUP BY
ci.CartItemId, c.CartId, pg.ProductGroupId, ci.Qty, p.ProductId,
p.UnitPrice, p.SalesPrice, sc.SizeName, cc.ColorName, pir.ImgPath,
d.DiscountId, d.DiscountName, d.DiscountDescription, d.DiscountType, d.DiscountValue,
d.ConditionType, d.ConditionValue, d.OrderBy, ssc.SalesCategoryName ,p.ProductName
ORDER BY p.ProductId asc, d.OrderBy asc;

-- 
select *
from CartItems
select TOP 1 1
from CartItems as ci
join ShoppingCarts as sc on sc.CartId = ci.fk_CardId
where sc.fk_MemberID = 1 and ci.fk_ProductId = 1

select * from CartItems

UPDATE CartItems SET
qty = 15
WHERE CartItemId = 1

select * from CartItems

select CartId
from ShoppingCarts as sc
where sc.fk_MemberID = 1
