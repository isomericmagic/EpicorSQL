select 
	[Part].[PartNum] as [Part_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[Part].[UnitPrice] as [Unit_Price],
	[Part].[TypeCode] as [Part_TypeCode],
	[Part].[ClassID] as [Part_ClassID],
	[Part].[ProdCode] as [Part_ProdCode],
	[PartPC].[ProdCode] as [PartPC_ProdCode],
	[Part].[CostMethod] as [Part_CostMethod],
	[Part].[TrackSerialNum] as [Part_TrackSerialNum]
from Erp.Part as Part
right outer join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum

full outer join Erp.PurAgent as PurAgent on 
	PartPlant.Company = PurAgent.Company
And
	PartPlant.BuyerID = PurAgent.BuyerID
inner join Erp.PartPC as PartPC on 
	Part.Company = PartPC.Company
And
	Part.PartNum = PartPC.PartNum
where PartPC.ProdCode not like '09%';