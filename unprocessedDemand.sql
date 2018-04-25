select 
	[DemandHead].[PONum] as [DemandHead_PONum],
	[DemandHead].[OrderNum] as [DemandHead_OrderNum],
	[DemandHead].[Date01] as [DemandHead_Date01],
	[Customer].[CustID] as [Customer_CustID],
	[Customer].[Name] as [Customer_Name],
	[Customer].[CSR] as [Customer_CSR],
	[DemandDetail].[RejectedBySystem] as [DemandDetail_RejectedBySystem]
from Erp.DemandHead as DemandHead
inner join Erp.DemandDetail as DemandDetail on 
	DemandHead.Company = DemandDetail.Company
And
	DemandHead.DemandContractNum = DemandDetail.DemandContractNum
And
	DemandHead.DemandHeadSeq = DemandDetail.DemandHeadSeq

inner join Erp.DemandSchedule as DemandSchedule on 
	DemandDetail.Company = DemandSchedule.Company
And
	DemandDetail.DemandContractNum = DemandSchedule.DemandContractNum
And
	DemandDetail.DemandHeadSeq = DemandSchedule.DemandHeadSeq
And
	DemandDetail.DemandDtlSeq = DemandSchedule.DemandDtlSeq

inner join Erp.Customer as Customer on 
	Customer.Company = DemandHead.Company
And
	Customer.CustNum = DemandHead.CustNum