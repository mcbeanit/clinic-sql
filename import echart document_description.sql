use mcbean_clinic

-- import the echart document_description table into the mcbean_clinic table

--insert into dbo.category ([Description])
--   select distinct Category from document_description
--   where Category not in (select [description] from dbo.Category)
   
--insert into dbo.DocumentLocationRoot (path)
--	select distinct document_image 
--	from document_description 
--	where document_image is not null
--	and document_image not in (select [path] from DocumentLocationRoot)

--update dbo.DocumentLocationRoot
--	set FileCount = 0, FileSize = 0, Active = 0

--update dbo.DocumentLocationRoot
--set dbo.DocumentLocationRoot.filecount = t2.fcount
--from dbo.DocumentLocationRoot t1
--inner join
--	(select [document_image], COUNT([document_image]) as fcount
--	from Document_description 
--	where document_image is not null
--	group by Document_image ) t2
--	on t1.[Path] = t2.document_Image

-- referential integrity on the patient table is not good, so we have to
-- insert missing patients

--insert into dbo.Patient (PatientId, DisplayName)
--select dat_index_number, 'Conversion: Missing Patient' from document_description
--where dat_index_number not in (select patientid from dbo.Patient)


insert into Document (LegacyDocumentId, PatientId, ProviderId, VisitDate, EditDate, Proofed, Billed, Notes, SecurityLevel,ModuleId)
select Document_Number,Dat_Index_Number, MT_Doctor_Number,Date_of_Document,Date_of_Index,Proofed,Billed,isnull(patient_Notes,'Missing Note'),Security_Level,0
from Document_description
inner join dbo.Patient
on dbo.patient.patientid = document_description.dat_index_number
where document_number not in (select legacydocumentid from Document)

--select * from DOCUMENT_DESCRIPTION 
--where Patient_Notes is null

declare @oldCount int
declare @newCount int

set @oldCount = (select COUNT(*) from DOCUMENT_DESCRIPTION)
set @newCount = (select COUNT(*) from dbo.Document)

if @oldCount <> @newCount
begin
	print 'old and new counts do not match'
	print 'old: '
	print @oldCount
	print 'new: '
	print @newCount
end

begin transaction

create table #categories
(
	[description] varchar (50),
	categoryid int,
	legacyDocumentId int
)

insert into #categories ([description], legacyDocumentId)
	select Category, document_number FROM DOCUMENT_DESCRIPTION order by document_number
	
UPDATE t1
SET t1.categoryid = t2.CategoryId
FROM #categories t1
INNER JOIN dbo.Category t2
ON t1.[description] = t2.[Description]	collate SQL_Latin1_General_CP1_CI_AS

update t1
set t1.categoryid = t2.categoryid
from dbo.Document t1
inner join #categories t2
on t1.legacydocumentid = t2.legacyDocumentId

drop table #categories

--rollback

--commit


--UPDATE CUST
--SET    CUST.OrderAmount = ORDR.Amount
--FROM   dbo.Customers CUST
--INNER JOIN dbo.Orders ORDR ON CUST.CustomerID = ORDR.CustomerID