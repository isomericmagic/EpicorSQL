select
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	sum([PartWhse].[OnHandQty]) as [PartWhse_OnHandQty],
	sum([PartWhse].[DemandQty]) as [PartWhse_DemandQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 where ((PartWhse.PartNum = '{partnumber}') or (Part.PartDescription LIKE '%{partnumber}%')) AND ((PartWhse.WarehouseCode = 'B') or (PartWhse.WarehouseCode = 'F') or (PartWhse.WarehouseCode = 'F9') or (PartWhse.WarehouseCode = 'N') or (PartWhse.WarehouseCode = 'V') or (PartWhse.WarehouseCode = 'WIP04') or (PartWhse.WarehouseCode = 'WIP05') or (PartWhse.WarehouseCode = 'WIP06')) AND Part.WebPart = 1
 group by [PartWhse].[PartNum],[Part].[PartDescription]