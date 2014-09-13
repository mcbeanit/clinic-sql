SELECT
  `ApplicationUserId`,
  `LoginName`,
  `FirstName`,
  `LastName`,
  `DisplayName`,
  `PasswordHash`,
  `IsActive`,
  `ExpiryDate`,
  `SecurityLevel`,
  `FailedLogins` 
FROM `mcbeanit_clinic`.`applicationuser`
WHERE LoginName = '{0}'