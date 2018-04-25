select 
	[OrderHed].[OrderNum] as [OrderNumber],
	[Customer].[Name] as [CustomerName],
	[OrderHed].[OrderDate] as [OrderDate],
	[OrderHed].[RequestDate] as [ShipDate],
	[OrderHed].[TotalCharges] as [OpenValueSum]
from Erp.OrderHed as OrderHed
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
And
	OrderHed.BTCustNum = Customer.CustNum
 and ( (Customer.CreditHold = 1 ) )

 where ((OrderHed.OpenOrder = 1 ))