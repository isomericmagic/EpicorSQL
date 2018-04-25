select 
	[Customer].[Name] as [Customer_Name],
	[SalesRep].[Name] AS [SalesRepName],
	[SalesRep].[RepReportsTo] AS [Territory],
	(sum( OrderHed.TotalCharges )) as [Calculated_Sum]
from Erp.OrderHed as OrderHed
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
And
	OrderHed.BTCustNum = Customer.CustNum
INNER JOIN Erp.SalesRep AS SalesRep ON
	Customer.Company = SalesRep.Company
AND
	Customer.SalesRepCode = SalesRep.SalesRepCode

where (YEAR(OrderHed.OrderDate) = '2016') and 
OrderHed.TotalCharges > 0
group by [Customer].[Name],[SalesRep].[Name],[SalesRep].[RepReportsTo]
order by [SalesRep].[Name]