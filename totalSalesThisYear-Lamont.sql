select Customer.name as [Customer],
sum(InvcHead.InvoiceAmt) as [Total_Shipped]
from ERP.Customer
inner join Erp.InvcHead on 
Customer.CustNum = InvcHead.CustNum
and 
Customer.Company = InvcHead.Company
where Customer.CustNum IN (3942,227,6056,231,6396,1948,316,319,317,693,6516,1372,6491,6673,1966,6588,2038,2039,6418,2218,2219,2574,6560,3854,4285,4572,6461,4796,3176,6357)
and (YEAR(InvcHead.InvoiceDate) = YEAR(GETDATE()))
group by Customer.Name