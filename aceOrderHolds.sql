select OrderHed.OrderNum,
OrderHed.OrderDate,
OrderHed.NeedByDate,
OrderHed.RequestDate,
ShipHead.ShipDate,
OrderDtl.PartNum,
ShipHead.PackNum,
OrderDtl.LineDesc
from Erp.OrderHed
inner join Erp.OrderDtl on
OrderHed.OrderNum = OrderDtl.OrderNum
inner join Erp.ShipDtl on 
OrderDtl.OrderLine = ShipDtl.OrderLine
and
OrderDtl.OrderNum = ShipDtl.OrderNum
inner join Erp.ShipHead on 
ShipDtl.PackNum = ShipHead.PackNum
where OrderHed.CustNum = '149' and OrderHed.OrderDate >= '12/1/2017' and OrderHed.orderDate <= '12/31/2017' and OrderHed.OpenORder = '0' and ShipHead.ShipDate > OrderHed.NeedByDate;