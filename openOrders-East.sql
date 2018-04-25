select 
	[SalesRep].[RepReportsTo] as [SalesRep_RepReportsTo],
	[OrderHed].[SalesRepList] as [OrderHed_SalesRepList],
	[Customer].[CustID] as [Customer_CustID],
	[Customer].[Name] as [Customer_Name],
	[OrderRel].[OrderNum] as [OrderRel_OrderNum],
	[OrderHed].[OrderDate] as [OrderHed_OrderDate],
	[OrderRel].[ReqDate] as [OrderRel_ReqDate],
	[OrderRel].[NeedByDate] as [OrderRel_NeedByDate],
	[OrderRel].[OrderLine] as [OrderRel_OrderLine],
	[OrderRel].[OrderRelNum] as [OrderRel_OrderRelNum],
	[OrderDtl].[PartNum] as [OrderDtl_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[OrderRel].[OurReqQty] as [OrderRel_OurReqQty],
	[OrderDtl].[UnitPrice] as [OrderDtl_UnitPrice],
	(OrderRel.OurReqQty * OrderDtl.UnitPrice) as [Calculated_OpenTotal],
	[Customer].[CreditHold] as [Customer_CreditHold],
	[OrderHed].[OrderHeld] as [OrderHed_OrderHeld],
	[OrderHed].[EntryPerson] as [OrderHed_EntryPerson]
from Erp.OrderHed as OrderHed
inner join Erp.OrderDtl as OrderDtl on (
	OrderHed.Company = OrderDtl.Company
And
	OrderHed.OrderNum = OrderDtl.OrderNum
) and ( (OrderDtl.OpenLine = 1 ) )

inner join Erp.OrderRel as OrderRel on (
	OrderDtl.Company = OrderRel.Company
And
	OrderDtl.OrderNum = OrderRel.OrderNum
And
	OrderDtl.OrderLine = OrderRel.OrderLine
) and ( (OrderRel.OpenRelease = 1 ) )

inner join Erp.Customer as Customer on (
	OrderHed.Company = Customer.Company
And
	OrderHed.CustNum = Customer.CustNum
)
inner join Erp.SalesRep as SalesRep on 
	Customer.Company = SalesRep.Company
And
	Customer.SalesRepCode = SalesRep.SalesRepCode

inner join Erp.Part as Part on 
	OrderRel.Company = Part.Company
And
	OrderRel.PartNum = Part.PartNum

 where ((OrderHed.OpenOrder = 1 )) AND [SalesRep].[RepReportsTo] = 'EAST'
 order by [OrderRel].[OrderNum]