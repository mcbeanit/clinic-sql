use mcbean_clinic

-- update the document location table for documents that have referral letters or scans

begin transaction

IF OBJECT_ID('tempdb..#documentlocation') IS NOT NULL
	DROP TABLE #documentlocation

create table #documentlocation
(
	documentId int,
	legacyDocumentId int,
	document_Image varchar(1000),
	document_Location varchar(1000),	
	documentLocationRootId int
)

-- first get what we need from echart into the temp file

insert #documentlocation (legacyDocumentId, document_Image,document_Location)
select Document_Number,Document_Image, Document_Location 
from DOCUMENT_DESCRIPTION
where Document_Image is not null and Document_Location is not null

-- map the new documentId to the old echart documentID

update t1
set t1.documentId = t2.documentId
from #documentlocation t1
inner join dbo.Document t2 on t1.legacyDocumentId = t2.LegacyDocumentId 

select COUNT(*) from #documentlocation order by legacyDocumentId 


rollback


select * from dbo.Document where LegacyDocumentId = 66