select 
	sum((OrderRel.OurReqQty * OrderDtl.UnitPrice)) as [Calculated_OpenTotal]
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

 where ((OrderHed.OpenOrder = 1 )) AND ([SalesRep].[RepReportsTo] = 'SOUTHEAS' OR [SalesRep].[RepReportsTo] = 'SOUTHWES')