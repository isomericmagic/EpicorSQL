select 
	[Customer].[TerritoryID] as [Customer_TerritoryID],
	COUNT([Customer].[CustID]) as CustomerCount
from Erp.SalesRep as SalesRep
inner join Erp.Customer as Customer on 
	SalesRep.Company = Customer.Company
And
	SalesRep.SalesRepCode = Customer.SalesRepCode
where
	SalesRep.EMailAddress = '{EmailAddress}'
group by
	[Customer].[TerritoryID]