select Name,
Address1,
City,
State,
Zip,
PhoneNum,
FaxNum,
EMailAddress
from Erp.Customer
where Customer.GroupCode LIKE 'T%';