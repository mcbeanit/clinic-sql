use mcbean_clinic

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Robert McBean
-- Create date:		January 2, 2014
-- Description:		Admin function to unproof a document.
-- =============================================

CREATE PROCEDURE dbo.dbUnproofDocument 
		
	@documentId as integer,
	@userId as integer,
	@comment as varchar(500) 
	
AS
BEGIN

	SET NOCOUNT ON;

   	if @documentId <= 0
   		raiserror('Parameter documentId was missing or invalid',16,1)
   		
   	if @userId <= 0
   		raiserror('Parameter patientId was missing or invalid', 16,1)
   		
   	
   	BEGIN TRY
   
   		
   		BEGIN TRANSACTION
   		
   		UPDATE dbo.Document
   		SET proofed = 0
   		WHERE DocumentId = @DocumentId
   		
   		INSERT INTO dbo.AuditTrail (AuditTrailCategoryId, UserAccountId, EventDateTime,DataId, Comment)
   			SELECT 1,2,GETDATE(), 1, 'this is the comment'
   		
   		
   		COMMIT
   		
   		
   	END TRY
   	
   	BEGIN CATCH
   		SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
   		ROLLBACK TRANSACTION
   	END CATCH
   	
END
GO
