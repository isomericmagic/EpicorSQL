select 
	sum([InvcDtl].[ExtPrice]) as [AmountShipped]
from Erp.InvcHead as InvcHead
 inner join Erp.InvcDtl as InvcDtl on 
	InvcHead.Company = InvcDtl.Company
And
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum
 and ( (InvcDtl.ExtPrice > 0 ) )

inner join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum
where (DAY(InvcHead.InvoiceDate) = DAY(GETDATE())) and (MONTH(InvcHead.InvoiceDate) = MONTH(GETDATE())) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE()))
--where (MONTH(InvcHead.InvoiceDate) = MONTH(GETDATE())) and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE()))
--where (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE()))