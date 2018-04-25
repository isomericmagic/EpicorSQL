select 
	[Customer].[Name] as [CustomerName],
	sum([OrderHed].[TotalCharges]) as [OpenValueSum]
from Erp.OrderHed as OrderHed
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
And
	OrderHed.BTCustNum = Customer.CustNum
 and ( (Customer.CreditHold = 1 ) )

 where ((OrderHed.OpenOrder = 1 )) and ([OrderHed].[TotalCharges] > 0)
 group by [Customer].[Name]