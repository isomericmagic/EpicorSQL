select
InvcHead.InvoiceNum,
InvcHead.InvoiceDate,
OrderHed.OrderDate,
OrderHed.OrderNum,
InvcDtl.PartNum,
Part.PartDescription,
Part.ClassID,
Customer.Name,
Customer.CustID   
from Erp.InvcHead as InvcHead
inner join Erp.InvcDtl as InvcDtl on 
	InvcHead.Company = InvcDtl.Company
And
	InvcHead.InvoiceNum = InvcDtl.InvoiceNum	
inner join Erp.OrderHed as OrderHed on 
	InvcHead.Company = OrderHed.Company
And
	InvcHead.OrderNum = OrderHed.OrderNum	
inner join Erp.Part as Part on 
	InvcDtl.Company = Part.Company
And
	InvcDtl.PartNum = Part.PartNum
inner join Erp.Customer as Customer on	
	InvcHead.Company = Customer.Company
And
	InvcHead.CustNum = Customer.CustNum
where CreditMemo = 0