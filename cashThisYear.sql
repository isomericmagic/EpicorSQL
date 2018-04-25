select 
	sum([CashHead].[TranAmt]) as [CashHead_TranAmt]
from Erp.CashHead as CashHead
where (YEAR(CashHead.TranDate) = YEAR(GETDATE()))