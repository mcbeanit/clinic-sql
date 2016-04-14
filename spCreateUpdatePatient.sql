USE [mcbean_clinic]
GO
/****** Object:  StoredProcedure [dbo].[spCreateUpdatePatient]    Script Date: 10/18/2014 22:43:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Robert McBean
-- Create date: 17-Oct-2014
-- Description:	Update a patient record, Update the referring doctor id.
--              Update the local doctor.
-- =============================================
ALTER PROCEDURE [dbo].[spCreateUpdatePatient] 
	
	@PatientId INT,
	@DisplayName varchar(100),
	@FirstName varchar(50),
	@MiddleName varchar(50),
	@LastName varchar(50),
	@DateOfBirth datetime,
	@DateOfDeath datetime,
	@Address VARCHAR(100),
	@City VARCHAR(50),
	@Province VARCHAR(50),
	@PostalCode VARCHAR(50),
	@Gender char(1),
	@PHN VARCHAR(100),
	@HomePhone VARCHAR(100),
	@CelPhone VARCHAR(100),
	@WorkPhone VARCHAR(100),
	@RefProviderId int,
	@LocalDoctorId int

	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @UserID int
	
	
	SET @UserID = (SELECT UserAccountId FROM UserAccount Account WHERE LoginName = SYSTEM_USER)

	IF NOT EXISTS (SELECT PatientId FROM Patient WHERE PatientId = @PatientId)
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
				INSERT INTO Patient 
					(PatientId,DisplayName,FirstName,MiddleName,LastName,DateOfBirth,[Address],City,
					 PostalCode, Province, Gender, PHN, HomePhone, CelPhone, WorkPhone, ModifiedDate ) 
				VALUES 
					(@PatientId,@DisplayName,@FirstName, @MiddleName, @LastName, @DateOfBirth, @Address, @City, 
					 @PostalCode, @Province, @Gender, @PHN, @HomePhone, @CelPhone, @WorkPhone, GetDate())
			COMMIT
		END TRY
		
		BEGIN CATCH
			ROLLBACK
			SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		END CATCH
		
	END
	ELSE
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION
			UPDATE Patient SET DisplayName = @DisplayName, FirstName = @FirstName, MiddleName = @MiddleName, 
			                   LastName = @LastName, DateOfBirth = @DateOfBirth,[Address] = @Address, 
			                   City = @City, Province = @Province, PostalCode = @PostalCode, Gender = @Gender, 
			                   PHN = @PHN, HomePhone = @HomePhone, CelPhone = @CelPhone, WorkPhone = @WorkPhone, 
			                   ModifiedDate = GetDate()
				WHERE PatientId =@PatientId
			COMMIT
		END TRY
		
		BEGIN CATCH
			ROLLBACK
			SELECT  ERROR_MESSAGE() AS ErrorMessage,ERROR_LINE() AS ErrorLine, ERROR_NUMBER() AS ErrorNumber
		END CATCH
	END
END


