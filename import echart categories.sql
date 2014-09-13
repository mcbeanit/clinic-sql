use mcbean_clinic

delete from Category

INSERT INTO dbo.Category ([Description] )
SELECT Category FROM LU_Category 
WHERE Category NOT IN (SELECT [Description] FROM dbo.Category)

SELECT *  FROM dbo.Category

select t1.[Description], t2.Category 
from dbo.Category t1
left join DOCUMENT_DESCRIPTION t2
on t1.[Description] = t2.Category
where t2.Category is null
