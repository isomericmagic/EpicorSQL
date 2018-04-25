select 
	sum([CashHead].[TranAmt]) as [CashHead_TranAmt]
from Erp.CashHead as CashHead
where (MONTH(CashHead.TranDate) = MONTH(GETDATE())) and (YEAR(CashHead.TranDate) = YEAR(GETDATE()))