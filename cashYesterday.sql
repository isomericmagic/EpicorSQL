select 
	sum([CashHead].[TranAmt]) as [CashHead_TranAmt]
from Erp.CashHead as CashHead
where (DAY(CashHead.TranDate) = DAY(GETDATE()-1)) and (MONTH(CashHead.TranDate) = MONTH(GETDATE())) and (YEAR(CashHead.TranDate) = YEAR(GETDATE()))