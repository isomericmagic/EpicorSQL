select 
ShipTo.Name as [ShipToName],
ShipTo.Address1 as [ShipToAddress1],
ShipTo.Address2 as [ShipToAddress2],
ShipTo.Address3 as [ShipToAddress3],
ShipTo.City as [ShipToCity],
ShipTo.State as [ShipToState],
ShipTo.Zip as [ShipToZip],
ShipTo.Country as [ShipToCountry]
from Erp.OrderHed as OrderHed
inner join Erp.ShipTo as ShipTo on 
OrderHed.Company = ShipTo.Company
and
OrderHed.CustNum = ShipTo.CustNum
and 
OrderHed.ShipToNum = ShipTo.ShipToNum
inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
and
	OrderHed.BTCustNum = Customer.CustNum
inner join Erp.CustCnt as CustCnt on 
	Customer.Company = CustCnt.Company
And
	Customer.CustNum = CustCnt.CustNum
where OrderHed.OrderNum = '{ordernumber}' --and [CustCnt].[EMailAddress] = '{emailAddress}'