select
	[Part].[ClassID] as [PartClassID],
	[Part].[PartNum] as [PartNum],
	[Part].[PartDescription] as [PartDescription],
	(PartCost.StdLaborCost + PartCost.StdBurdenCost + PartCost.StdMaterialCost + PartCost.StdSubContCost + PartCost.StdMtlBurCost) as [StandardCost],
	(PartCost.FIFOAvgLaborCost + PartCost.FIFOAvgBurdenCost + PartCost.FIFOAvgMaterialCost + PartCost.FIFOAvgSubContCost + PartCost.FIFOAvgMtlBurCost) as [FIFO_Cost]
from Erp.Part as Part
inner join Erp.PartCost as PartCost on 
	Part.Company = PartCost.Company
And
	Part.PartNum = PartCost.PartNum