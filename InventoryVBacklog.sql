select 
	[PartWhse].[PartNum] as [PartWhse_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	[PartWhse].[DemandQty] as [PartWhse_DemandQty],
	[PartWhse].[OnHandQty] as [PartWhse_OnHandQty]
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

 where ((Part.PartNum = '167979'  or Part.PartNum = '151991'  or Part.PartNum = '161195'  or Part.PartNum = '166859'  or Part.PartNum = '160028'  or Part.PartNum = '157222'  or Part.PartNum = '153330'  or Part.PartNum = '167979'  or Part.PartNum = '151991'  or Part.PartNum = '154650-LW'  or Part.PartNum = '167882'  or Part.PartNum = '150598'  or Part.PartNum = '155961'  or Part.PartNum = '153203'  or Part.PartNum = '160634'  or Part.PartNum = '160642'  or Part.PartNum = '160634-14'  or Part.PartNum = '166931'  or Part.PartNum = '158936-24'  or Part.PartNum = '166930'  or Part.PartNum = '160647'  or Part.PartNum = '171002'  or Part.PartNum = '160772'  or Part.PartNum = '156499'  or Part.PartNum = '156498'  or Part.PartNum = '166447-30'  or Part.PartNum = '153243'  or Part.PartNum = '153243-JCS'  or Part.PartNum = '170565'  or Part.PartNum = '166105'  or Part.PartNum = '157448'  or Part.PartNum = '157449'  or Part.PartNum = '166859'  or Part.PartNum = '169156'  or Part.PartNum = '157377'  or Part.PartNum = '157012'  or Part.PartNum = '157074'  or Part.PartNum = '158941'  or Part.PartNum = '166154'  or Part.PartNum = '167676'  or Part.PartNum = '8302014'  or Part.PartNum = '8302024'  or Part.PartNum = '168084'  or Part.PartNum = '168787' or Part.PartNum = '170789'  or Part.PartNum = '8300012'  or Part.PartNum = '165486'  or Part.PartNum = '171231'  or Part.PartNum = '172057' or Part.PartNum = '155747'  or Part.PartNum = '160028' ))