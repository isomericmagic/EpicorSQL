SELECT TOP 25 
OrderHed.OrderNum as [OrderHed_OrderNum],
Customer.Name as [Customer_Name],
ShipVia.Description as [ShipVia_Description],
OrderHed.EntryPerson as [OrderHed_EntryPerson],
CASE WHEN Customer.CreditHold = 1 THEN 'Yes' ELSE 'No' END AS [Customer_CreditHold]
FROM Erp.OrderHed
INNER JOIN Erp.OrderHed_UD AS OrderHed_UD ON 
	OrderHed.SysRowID = OrderHed_UD.ForeignSysRowID	
INNER JOIN Erp.ShipVia AS ShipVia ON 
	OrderHed.Company = ShipVia.Company
AND
	OrderHed.ShipViaCode = ShipVia.ShipViaCode
INNER JOIN Erp.Customer AS Customer ON 
	OrderHed.Company = Customer.Company
AND
	OrderHed.BTCustNum = Customer.CustNum
--WHERE OrderHed_UD.CheckBox01 != 0 AND OrderHed.TotalShipped < OrderHed.OrderAmt AND OrderHed.OpenOrder != 0;
WHERE OrderHed.OpenOrder != 0 AND (DAY(OrderHed.RequestDate) = DAY(GETDATE())) AND (MONTH(OrderHed.RequestDate) = MONTH(GETDATE())) AND (YEAR(OrderHed.RequestDate) = YEAR(GETDATE())) AND OrderHed.TotalShipped < OrderHed.OrderAmt AND ShipVia.Description != 'Will Call';
--WHERE OrderHed.OpenOrder != 0 AND (DAY(OrderHed.RequestDate) = DAY(GETDATE())) AND (MONTH(OrderHed.RequestDate) = MONTH(GETDATE())) AND (YEAR(OrderHed.RequestDate) = YEAR(GETDATE())) AND OrderHed.TotalShipped < OrderHed.OrderAmt AND ShipVia.Description = 'Will Call';