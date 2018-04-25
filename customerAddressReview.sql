select 
	[Customer].[CustID] as [Customer_CustID],
	[Customer].[Name] as [Customer_Name],
	[Customer].[Address1] as [Customer_Address1],
	[Customer].[Address2] as [Customer_Address2],
	[Customer].[Address3] as [Customer_Address3],
	[Customer].[TradingPartnerName] as [Customer_TradingPartnerName],
	[Customer].[City] as [Customer_City],
	[Customer].[State] as [Customer_State],
	[Customer].[Zip] as [Customer_Zip],
	[Customer].[Country] as [Customer_Country],
	[ShipTo].[Name] as [ShipTo_Name],
	[ShipTo].[Address1] as [ShipTo_Address1],
	[ShipTo].[City] as [ShipTo_City],
	[ShipTo].[State] as [ShipTo_State],
	[ShipTo].[ZIP] as [ShipTo_ZIP],
	[ShipTo].[Country] as [ShipTo_Country]
from Erp.Customer as Customer
left outer join Erp.ShipTo as ShipTo on 
	Customer.Company = ShipTo.Company
And
	Customer.CustNum = ShipTo.CustNum

 where (Customer.TradingPartnerName > '.')