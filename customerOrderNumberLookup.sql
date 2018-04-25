select OrderHed.OrderNum as [Order_Num],
OrderHed.PONum as [PO_Num],
OrderHed.OrderAmt as [Order_Amt], 
OrderHed.OrderDate as [Order_Date],
CASE when orderHed.OpenOrder = '0' THEN 'NO' ELSE 'YES' END as [OpenOrder]
from erp.OrderHed
where OrderHed.CustNum = '{orderNumber}' and [OrderHed].[OrderDate] > DATEADD(year,-2,GETDATE())
order by OrderDate DESC