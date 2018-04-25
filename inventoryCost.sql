select
    [Part].[ClassID] as [Part_ClassID],
	[Part].[PartNum] as [Part_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[Part].[UnitPrice] as [Part_UnitPrice],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	[PartWhse].[WarehouseCode] as [PartWhse_WarehouseCode],
	CASE WHEN (PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.StdMtlBurCost) >= (PartCost.AvgLaborCost + PartCost.AvgBurdenCost + PartCost.AvgMaterialCost + PartCost.AvgSubContCost + PartCost.AvgMtlBurCost) 
	THEN (PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.StdMtlBurCost)
	ELSE (PartCost.AvgLaborCost + PartCost.AvgBurdenCost + PartCost.AvgMaterialCost + PartCost.AvgSubContCost + PartCost.AvgMtlBurCost) END as [Calculated_Cost],
	CASE WHEN (PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.StdMtlBurCost) >= (PartCost.AvgLaborCost + PartCost.AvgBurdenCost + PartCost.AvgMaterialCost + PartCost.AvgSubContCost + PartCost.AvgMtlBurCost) 
	THEN (PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.StdMtlBurCost)
	ELSE (PartCost.AvgLaborCost + PartCost.AvgBurdenCost + PartCost.AvgMaterialCost + PartCost.AvgSubContCost + PartCost.AvgMtlBurCost) END * [PartWhse].[OnHandQty] as [Calculated_Total_Cost]
from Erp.Part as Part
inner join Erp.PartCost as PartCost on (
	Part.Company = PartCost.Company
And
	Part.PartNum = PartCost.PartNum
)
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (Part.PartNum <> 'MISC ITEM'  and Part.PartNum <> 'MISC ITEMS'  and Part.PartNum <> 'MISC SERVICE' ) )

 where (PartWhse.WarehouseCode = 'B' OR PartWhse.WarehouseCode = 'BAR' OR PartWhse.WarehouseCode = 'F' OR PartWhse.WarehouseCode = 'F9' OR PartWhse.WarehouseCode = 'N' OR PartWhse.WarehouseCode = 'V' OR PartWhse.WarehouseCode = 'Z') AND
 [PartWhse].[OnHandQty] <> 0