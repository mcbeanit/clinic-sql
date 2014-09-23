use mcbean_clinic

UPDATE EChartDocumentLocation
	SET DocumentLocationRootId = 11
	WHERE Document_Image = 'mt000119.001'
	
UPDATE EChartDocumentLocation
	SET DocumentLocationRootId = 12
	WHERE Document_Image = 'mt000119.002'
	
SELECT count(*) FROM EChartDocumentLocation
WHERE DocumentLocationRootId is null

UPDATE t1
SET t1.DocumentId = t2.DocumentId
FROM EChartDocumentLocation t1
INNER JOIN Document t2 on t1.Document_Number = t2.LegacyDocumentId

select document_number, documentid from echartdocumentlocation