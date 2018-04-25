select 
	[SalesRep].[Name] as [SalesRepName],
	[Customer].[CustNum] as [CustomerNumber],
	[Customer].[Name] as [CustomerName],
	[Customer].[Address1] as [CustomerAddress],
	[Customer].[City] as [CustomerCity],
	[Customer].[State] as [CustomerState],
	[Customer].[Zip] as [CustomerZip],
	[Customer].[PhoneNum] as [CustomerPhoneNumber],
	[Customer].[EMailAddress] as [CustomerEmail]
from Erp.Customer as Customer
inner join Erp.SalesRep as SalesRep on
Customer.Company = SalesRep.Company
and
Customer.SalesRepCode = SalesRep.SalesRepCode
where [SalesRep].[RepReportsTo] = 'WEST'
order by [SalesRep].[Name];