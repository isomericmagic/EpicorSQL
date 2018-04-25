select 
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	25 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '159943'
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '161195'  
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '157721X' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '169612' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '159414' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '151991-SP' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	6 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '159345' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	10 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '172023-H' 
union select  
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty],
	2 as [PartPlant_MinimumQty]
from Erp.Part as Part
inner join Erp.PartWhse as PartWhse on 
	Part.Company = PartWhse.Company
And
	Part.PartNum = PartWhse.PartNum
 and ( (PartWhse.WarehouseCode = 'F9' ) )

inner join Erp.PartPlant as PartPlant on 
	Part.Company = PartPlant.Company
And
	Part.PartNum = PartPlant.PartNum
where Part.PartNum = '160832'; 
 
 
 
