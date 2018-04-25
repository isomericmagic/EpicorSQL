select top(10)
	[Customer].[Name] as [Customer_Name],
	(sum( OrderHed.TotalCharges )) as [Calculated_Sum]
from Erp.OrderHed as OrderHed
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
And
	OrderHed.BTCustNum = Customer.CustNum

where (OrderHed.OrderDate = DATEADD(day, DATEDIFF(day, 0, GETDATE()), 0)) and 
OrderHed.TotalCharges > 0
group by [Customer].[Name]
 order by [Calculated_Sum] desc