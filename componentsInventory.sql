select
	sum((( PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.FIFOAvgLaborCost + PartCost.FIFOAvgBurdenCost + PartCost.FIFOAvgMaterialCost + PartCost.FIFOAvgMtlBurCost )  * PartWhse.OnHandQty)) as [Components_Total_Cost]
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
 where (PartWhse.OnHandQty <> 0 ) and (([Part].[ClassID] LIKE 'F%') or ([Part].[ClassID] LIKE 'G%') or ([Part].[ClassID] LIKE 'H%') )