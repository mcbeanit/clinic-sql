USE [mcbean_clinic]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================================================
-- Author:		R.McBean
-- Create date: 1-Apr-2016
-- Description:	Insert to the DocumentLocationTable and increment the 
--              page number if not provided. @PageNumber = 0 means find
---             and assign the next page number.
-- =============================================================================

ALTER PROCEDURE [dbo].[spInsertDocumentLocation]

	@DocumentId INT,
	@DocumentLocationRootId INT,
	@Path VARCHAR(1000),
	@PageNumber INT
	
AS

BEGIN

	SET NOCOUNT ON;
	
	IF PageNumber = 0 
	BEGIN	
		SET @PageNumber = (SELECT COUNT(*) FROM DocumentLocation WHERE DocumentId = @DocumentId);
	END
	
	INSERT INTO DocumentLocation(DocumentLocationRootId, [Path], DocumentId, PageNumber)
		VALUES
		(@DocumentLocationRootId,@Path,@DocumentId, @PageNumber);

END
	
	



	