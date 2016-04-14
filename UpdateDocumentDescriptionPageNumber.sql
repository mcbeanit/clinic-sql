USE mcbean_clinic

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================
-- Author:		Robert McBean
-- Create date: April 2, 2016
-- Description:	One time update to PageNumber field in DocumentLocation
-- =======================================================================

ALTER PROCEDURE UpdatePageNumberFieldFromNULL

AS
BEGIN
	--SET NOCOUNT ON;
	
	UPDATE DocumentLocation SET PageNumber = 1
	WHERE PageNumber IS NULL;

END
GO
