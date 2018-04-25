select --top 6000
	[Customer].[Name] as [Customer_Name],
	[Customer].[CustNum] as [Customer_CustNum],
	[CustCnt].[EMailAddress] as [Customer_EMailAddress],
	[OrderHed].[OrderNum] as [OrderHed_OrderNum],
	[OrderHed].[PONum] as [OrderHed_PONum],
	[OrderHed].[OrderDate] as [OrderHed_OrderDate],
	[OrderHed].[TotalCharges] as [OrderHed_TotalCharges],
	[OrderHed].[TotalInvoiced] as [OrderHed_TotalInvoiced]
from Erp.Customer as Customer
inner join Erp.OrderHed as OrderHed on 
	Customer.Company = OrderHed.Company
And
	Customer.CustNum = OrderHed.BTCustNum
inner join Erp.CustCnt as CustCnt on 
	Customer.Company = CustCnt.Company
And
	Customer.CustNum = CustCnt.CustNum
where [CustCnt].[EMailAddress] = '{emailAddress}' and [OrderHed].[OrderDate] > DATEADD(year,-1,GETDATE())
order by [OrderHed].[OrderNum] DESC