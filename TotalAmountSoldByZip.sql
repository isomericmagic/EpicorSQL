select sum(InvcHead.InvoiceAmt) as [Total_Amount_Shipped],
SUBSTRING (Customer.Zip,1,5) as [Customer_Zip]
from Erp.InvcHead
inner join Erp.Customer on 
InvcHead.CustNum = Customer.CustNum
group by Customer.Zip