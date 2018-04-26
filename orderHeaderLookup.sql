select
CASE WHEN OrderHed.UseOTS = '1' THEN OrderHed.OTSName ELSE ShipTo.Name END as [ShipToName],
CASE WHEN OrderHed.UseOTS = '1' THEN OrderHed.OTSAddress1 ELSE ShipTo.Address1 END as [ShipToAddress],
CASE WHEN OrderHed.UseOTS = '1' THEN OrderHed.OTSCity ELSE ShipTo.City END as [ShipToCity],
CASE WHEN OrderHed.UseOTS = '1' THEN OrderHed.OTSState ELSE ShipTo.State END as [ShipToState],
CASE WHEN OrderHed.UseOTS = '1' THEN OrderHed.OTSZIP ELSE ShipTo.ZIP END as [ShipToZip]
from
Erp.OrderHed as [OrderHed]
inner join Erp.ShipTo as [ShipTo] on
OrderHed.CustNum = ShipTo.CustNum 
and
OrderHed.ShipToNum = ShipTo.ShipToNum
and 
OrderHed.Company = ShipTo.Company
--where OrderHed.OrderNum = '264891'
where OrderHed.OrderNum = '{ordernumber}' and OrderHed.CustNum = '2574'