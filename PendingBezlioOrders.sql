SELECT TOP 100
OrderHed.OrderNum as [OrderHed_OrderNum],
Customer.Name as [Customer_Customer_Name],
OrderHed.TotalCharges as [OrderHed_TotalCharges],
OrderHed.NeedByDate as [OrderHed_NeedByDate]
FROM Erp.OrderHed
INNER JOIN Erp.Customer AS Customer ON 
	OrderHed.Company = Customer.Company
AND
	OrderHed.BTCustNum = Customer.CustNum
WHERE Customer.CustNum IN ('2574','231','693', '4572', '528') and OrderHed.EntryPerson = 'manager' and OrderHed.OrderHeld = '1'
Order By OrderHed.NeedByDate