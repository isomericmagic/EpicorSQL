select 
	[Customer].[CustID] as [Customer_CustID],
	[Customer].[Name] as [Customer_Name],
	[OrderRel].[OrderNum] as [OrderRel_OrderNum],
	[OrderRel].[OrderLine] as [OrderRel_OrderLine],
	[OrderRel].[PartNum] as [OrderRel_PartNum],
	[OrderDtl].[LineDesc] as [OrderDtl_LineDesc],
	((OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty)) as [Calculated_OpenQty],
	(((case when  (OrderDtl.PricePerCode = 'M')  then   ((((case when  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty) > 0  then  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty)  else  0 end))/ 1000) * OrderDtl.DocUnitPrice * (1 - (OrderDtl.DiscountPercent / 100)))  else  ((case when  (OrderDtl.PricePerCode = 'C')  then  ((((case when  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty) > 0  then  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty)  else  0 end))/ 100) * OrderDtl.DocUnitPrice * (1 - (OrderDtl.DiscountPercent / 100)))  else  ((((case when  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty) > 0  then  (OrderRel.OurReqQty - OrderRel.OurJobShippedQty - OrderRel.OurStockShippedQty)  else  0 end))/ 1) * OrderDtl.DocUnitPrice * (1 - (OrderDtl.DiscountPercent / 100))) end)) end))) as [Calculated_OpenValue]
from Erp.OrderHed as OrderHed
inner join Erp.OrderDtl as OrderDtl on 
	OrderHed.Company = OrderDtl.Company
And
	OrderHed.OrderNum = OrderDtl.OrderNum
 and ( OrderDtl.OpenLine = 1  )

inner join Erp.OrderRel as OrderRel on 
	OrderDtl.Company = OrderRel.Company
And
	OrderDtl.OrderNum = OrderRel.OrderNum
And
	OrderDtl.OrderLine = OrderRel.OrderLine

inner join Erp.Customer as Customer on 
	OrderHed.Company = Customer.Company
And
	OrderHed.CustNum = Customer.CustNum
 and ( Customer.CreditHold = 1  )

left outer join Erp.ShipVia as ShipVia on 
	OrderRel.Company = ShipVia.Company
And
	OrderRel.ShipViaCode = ShipVia.ShipViaCode

 where (OrderHed.OpenOrder = 1)
 and OrderHed.OpenOrder = 1
 order by  OrderHed.Company ,  OrderHed.OrderNum ,  OrderRel.OrderLine ,  OrderRel.OrderRelNum 