select  p.displayname as patient, c.description, u.displayname,eventdatetime,comment, substring(d.notes,1,50) as note
from audittrail
inner join useraccount u
on u.useraccountid = audittrail.useraccountid
inner join audittrailcategory c
on c.audittrailcategoryid = audittrail.audittrailcategoryid
inner join document d
on d.documentId = audittrail.dataid
inner join patient p
on d.patientid = p.patientid