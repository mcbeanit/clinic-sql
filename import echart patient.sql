use mcbean_clinic

-- import the patient_demographic table from echart into mcbean_clinic
-- First NULL fields that have blanks strings, and NULL
--   columns not of interest

update patient_demographics set patientId = null

update patient_demographics set patient_name = null
where LEN(patient_name) = 0

update patient_demographics set provincecode = null
where LEN(provincecode) = 0

update patient_demographics set personal_health_number = null
where LEN(personal_health_Number) = 0

update patient_demographics set chart_number = null
where LEN(chart_number) = 0

update patient_demographics set mtdocnum = null
where LEN(mtdocnum) = 0

update patient_demographics set MT_Doctor_ULI = null
where LEN(mt_doctor_uli) = 0

update patient_demographics set RefDocULI = null
where LEN(refdoculi) = 0

update patient_demographics set selectcode = null
where len(selectCode) = 0

update patient_demographics set date_of_birth = null
where LEN(date_of_birth) = 0

update patient_demographics set sex = null
where LEN(sex) = 0

update patient_demographics set [address] = null
where LEN([address]) = 0

update patient_demographics set city = null
where LEN(city) = 0

update patient_demographics set province = null
where LEN(province) = 0

update patient_demographics set postal_code = null
where len(postal_code) = 0

update patient_demographics set phone_home = null
where LEN(phone_home) = 0

update patient_demographics set phone_work = null
where LEN(phone_work) = 0

update patient_demographics set email = null
where LEN(email) = 0

update patient_demographics set balance = null, benefitsused = null

update patient_demographics set babystatus = null

update patient_demographics set extrainfo = null
where LEN(extrainfo) = 0

update patient_demographics set LabelFlag = null
update patient_demographics set lastrefdate = null

update patient_demographics set marital = null
where LEN(marital) = 0

update patient_demographics set lastchange = null, lastchangeUser = null
update patient_demographics set nextofkin = null, life_style = null
update patient_demographics set family_history = null
update patient_demographics set allergies = null
update patient_demographics set medication = null
update patient_demographics set tobacco = null
update Patient_demographics set reproductive = null
update patient_demographics set vaccination = null
update patient_demographics set healthrisks = null
update patient_demographics set operations = null
update patient_demographics set bloodtype = null where LEN(bloodtype) = 0
update patient_demographics set note = null where LEN(note) = 0
update patient_demographics set pastmedicalhistory = null
update patient_demographics set gravida = null
update patient_demographics set parity = null, abortions = null

-- ignore all the vaccine columns which have old demo data

update patient_demographics set timestamp = null, [user] = null, status = null,
rosterstrdate = null, rosterenddate = null

update patient_demographics set revision = null where LEN(revision) = 0
update patient_demographics set createdby = null where LEN(createdby) = 0
update patient_demographics set modifiedby = null where LEN(modifiedby) = 0
update patient_demographics set confidentialitytype = null where LEN(confidentialitytype) = 0


-- start building the basic person data

insert into dbo.Patient (PatientId, displayname, dateofbirth,[Address],city,Province,postalcode) 
 select dat_index_number, patient_name, date_of_birth,[address], city, provincecode,postal_code
 from patient_demographics
 where Dat_Index_Number not in (SELECT PatientID FROM dbo.Patient)
 
 update patient 
	set gender = 
	case when t2.sex = 'Male' then 'm'
	  when t2.sex = 'Female' then 'f' 
	end 
 from patient t1
 inner join patient_demographics t2
 on t1.PatientId = t2.dat_index_number

update Patient
set PHN = t2.personal_health_number
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.personal_health_number is not null

update Patient
set Note = t2.note
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.note is not null
	
update Patient
set HomePhone = t2.phone_home
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.phone_home is not null

update Patient
set WorkPhone = t2.phone_work
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.phone_work is not null	
	
update Patient 
set [dbo].[patient].[Address] = t2.[address]
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.[address] is not null	

update Patient 
set dbo.patient.city = t2.city
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.city is not null	
	
update Patient 
set dbo.patient.providerid = t2.mtdocnum
from Patient t1
inner join patient_demographics t2
on t1.PatientId = t2.dat_index_number
where t2.mtdocnum is not null
	
update Patient
set province = 'AB'
where City = 'Calgary'

update Patient Set HomePhone = REPLACE(HomePhone,' ','')
update Patient SET HomePhone = NULL WHERE LEN(HomePhone) = 0
update Patient set HomePhone = REPLACE(HomePhone,'(','')
update Patient set HomePhone = REPLACE(HomePhone,')','')
update Patient set HomePhone = REPLACE(HomePhone,'-','')

update Patient Set WorkPhone = REPLACE(WorkPhone,' ','')
update Patient SET WorkPhone = NULL WHERE LEN(WorkPhone) = 0
update Patient set WorkPhone = REPLACE(WorkPhone,'(','')
update Patient set WorkPhone = REPLACE(WorkPhone,')','')
update Patient set WorkPhone = REPLACE(WorkPhone,'-','')

select patientid, displayname, workphone, LEN(workphone)
from Patient
where WorkPhone is not null and LEN(workphone) <> 7 and Len(workphone) <> 10

select patientid, displayname, homephone, len(homephone)
from Patient
where homephone is not null and LEN(homephone) <> 7 and Len(homephone) <> 10

