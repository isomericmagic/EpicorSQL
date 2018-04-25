select 
	[PartTran].[PartNum] as [PartTran_PartNum],
	[Part].[PartDescription] as [Part_PartDescription],
	(sum( PartTran.TranQty )) as [Calculated_TransQty]
from Erp.Part
inner join Erp.PartTran as PartTran on 
	PartTran.Company = Part.Company
And
	PartTran.PartNum = Part.PartNum
where ((PartTran.TranDate >= '6/8/2016' ) and (PartTran.TranType = 'STK-CUS'  or PartTran.TranType = 'STK-MTL'  or PartTran.TranType = 'STK-UKN' )) 
group by [PartTran].[PartNum],[Part].[PartDescription]
order by [PartTran].[PartNum]