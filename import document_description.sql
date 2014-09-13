use mcbean_clinic

-- import the echart document_description table into the mcbean_clinic table

insert into dbo.category ([Description])
   select distinct Category from document_description
   where Category not in (select [description] from dbo.Category)
   
insert into dbo.DocumentLocationRoot (path)
	select distinct document_image 
	from document_description 
	where document_image is not null
	and document_image not in (select [path] from DocumentLocationRoot)

update dbo.DocumentLocationRoot
	set FileCount = 0, FileSize = 0, Active = 0

update dbo.DocumentLocationRoot
set dbo.DocumentLocationRoot.filecount = t2.fcount
from dbo.DocumentLocationRoot t1
inner join
	(select [document_image], COUNT([document_image]) as fcount
	from Document_description 
	where document_image is not null
	group by Document_image ) t2
	on t1.[Path] = t2.document_Image

insert into dbo.Provider (ProviderId,VendorId,displayname)
	select mt_doctor_number, mt_doctor_number, 'EChart'
	from document_description
	where mt_doctor_number is not null
	 and mt_doctor_number not in (select providerid from dbo.Provider)
	group by mt_doctor_number

update dbo.Provider set VendorId = ProviderId, Active = 1, ProviderIdentifier = vendorid

update dbo.Provider set dbo.Provider.DisplayName = t2.mt_doctor_name
from dbo.Provider t1
inner join dbo.LU_Doctors t2
on t1.ProviderId = t2.mt_doctor_number

-- referential integrity on the patient table is not good, so we have to
-- insert missing patients

insert into dbo.Patient (PatientId, DisplayName)
select dat_index_number, 'Conversion: Missing Patient' from document_description
where dat_index_number not in (select patientid from dbo.Patient)

insert into Document (LegacyDocumentId, PatientId, ProviderId, VisitDate, EditDate, Proofed, Billed, Notes, SecurityLevel,ModuleId)
select Document_Number,Dat_Index_Number, MT_Doctor_Number,Date_of_Document,Date_of_Index,Proofed,Billed,patient_Notes,Security_Level,0
from Document_description
inner join dbo.Patient
on dbo.patient.patientid = document_description.dat_index_number
where document_number not in (select legacydocumentid from Document)

select * from provider
select * from document
select * from Category
select * from documentlocationroot

select * from useraccount

update UserAccount set IsActive = 1, ExpiryDate = '2014-12-13'

delete from document where documentid > 413124

select * from documentlocation