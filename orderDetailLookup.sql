select
OrderDtl.OrderLine as [OrderLine],
OrderDtl.PartNum as [PartNum],
OrderDtl.LineDesc as [LineDesc],
OrderDtl.UnitPrice as [UnitPrice],
OrderDtl.OrderQty as [OrderQty],
(OrderDtl.UnitPrice * OrderDtl.OrderQty) as [ExtPrice]
from Erp.OrderDtl as OrderDtl
--where OrderDtl.OrderNum = '263649'
where OrderDtl.OrderNum = '{ordernumber}'
order by OrderDtl.OrderLine asc