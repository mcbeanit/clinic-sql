USE [mcbean_clinic]
GO
/****** Object:  StoredProcedure [dbo].[spCreateUser]    Script Date: 10/18/2014 22:02:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================
-- Author:			Robert McBean
-- Create date:		January 15, 2014
-- Description:		Add a new user account with audit logging
-- ============================================================

ALTER PROCEDURE [dbo].[spCreateUser]

	@LoginName varchar(100),
	@DisplayName varchar(100),
	@IsActive bit, 
	@ExpiryDate datetime,
	@SecurityLevel int,
	@Initials varchar(10),
	@EMail varchar(500)

AS
	SET NOCOUNT ON;

	BEGIN
	
	declare @UserID int
	declare @UserAccountId int

	BEGIN TRY
	
		BEGIN TRANSACTION
		
		set @UserID = (SELECT UserAccountId FROM UserAccount Account WHERE LoginName = SYSTEM_USER)
		set @UserAccountId = (SELECT useraccountid from UserAccount Where loginname = 'mcbean')
		
		IF NOT EXISTS (SELECT useraccountid from UserAccount Where loginname = @LoginName)
		BEGIN

			INSERT INTO UserAccount (LoginName, DisplayName, IsActive, ExpiryDate, SecurityLevel, Initials, EMail)
				SELECT @LoginName, @DisplayName, @IsActive, @ExpiryDate, @SecurityLevel, @Initials, @EMail 
		
			INSERT INTO dbo.AuditTrail (AuditTrailCategoryId, UserAccountId, EventDateTime,DataId, Comment)
   				SELECT 10, @UserID, GETDATE(), SCOPE_IDENTITY() , 'add user'
   		END
		
		COMMIT

	END TRY
	
	BEGIN CATCH
		SELECT  ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		ROLLBACK
	END CATCH

	END


