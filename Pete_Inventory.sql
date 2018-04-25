select 
	[Part].[ClassID] as [Part_ClassID],
	[Part].[TypeCode] as [Part_TypeCode],
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	[PartWhse].[WarehouseCode] as [PartWhse_WarehouseCode],
	(( PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.FIFOAvgLaborCost + PartCost.FIFOAvgBurdenCost + PartCost.FIFOAvgMaterialCost + PartCost.FIFOAvgMtlBurCost )  * PartWhse.OnHandQty) as [Calculated_TotalCost]
from Erp.PartWhse as PartWhse
inner join Erp.PartCost as PartCost on 
	PartWhse.Company = PartCost.Company
And
	PartWhse.PartNum = PartCost.PartNum

inner join Erp.Part as Part on 
	PartWhse.Company = Part.Company
And
	PartWhse.PartNum = Part.PartNum
 and ( (Part.PartNum <> 'MISC ITEM'  and Part.PartNum <> 'MISC ITEMS'  and Part.PartNum <> 'MISC SERVICE' ) )

 where (PartWhse.OnHandQty <> 0 )