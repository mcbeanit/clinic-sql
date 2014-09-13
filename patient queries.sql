use adi_prod

select * from lkpcity

select COUNT(patientcity) as c, patientcity
from tblPatient 
group by patientcity
order by c desc

select distinct patientcity, patientprovstate
from tblpatient
where patientpostalcode like 't6v1c%' 
and PatientCity is not null and PatientProvState is not null
