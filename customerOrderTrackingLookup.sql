select 
	[OrderHed].[OrderNum] as [OrderHed_OrderNum],
	[ShipHead].[PackNum] as [ShipHead_PackNum],
	[ShipHead].[ShipDate] as [ShipHead_ShipDate],
	[ShipHead].[TrackingNumber] as [ShipHead_TrackingNumber]
from Erp.OrderHed as OrderHed 
inner join Erp.ShipDtl as ShipDtl on 
	OrderHed.Company = ShipDtl.Company
And
	OrderHed.OrderNum = ShipDtl.OrderNum

inner join Erp.ShipHead as ShipHead on 
	ShipDtl.Company = ShipHead.Company
And
	ShipDtl.PackNum = ShipHead.PackNum
where [OrderHed].[OrderNum] = '{ordernumber}' and [ShipHead].[TrackingNumber] != ''
