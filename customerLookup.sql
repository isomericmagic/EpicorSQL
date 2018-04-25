select top 1000
	[Customer].[CustNum] as [Customer_CustNum],
	[Customer].[Name] as [Customer_Name],
	[Customer].[Address1] as [Customer_Address],
	[Customer].[City] as [Customer_City],
	[Customer].[State] as [Customer_State],
	[Customer].[Zip] as [Customer_Zip],
	[Customer].[TerritoryID] as [Customer_Territory]
from Erp.Customer
 where Customer.Name LIKE '%{customernumber}%';