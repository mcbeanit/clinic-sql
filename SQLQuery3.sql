use mcbean_clinic



--exec UpdatePageNumberFieldFromNULL


select count(*) from documentlocation --where pagenumber is null
where moduleid = 2

select * from documentlocation with (nowait) where documentid = 309332