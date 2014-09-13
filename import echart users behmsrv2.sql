use mcbean_clinic

--delete from useraccount



select * from lu_users order by user_name
select * from useraccount

select t1.createdby , t2.User_Name
from DOCUMENT_DESCRIPTION t1
left join LU_USERS t2
on  t1.CreatedBy = t2.user_name
where t2.User_Name is null
order by createdby

--insert into LU_USERS (
--[User_Name], [PassWord], Initials, Security_Level, DoctorNumber, [Current], 
--[TimeStamp], [User], PassWordExpired, 
--PasswordExpiryDate, GroupProfile, Revision, 
--CreatedBy, CreationDate, ModifiedDate, ModifiedBy, MTDoctorNumber, CanProofFor)
--select 'dawn', 'dawn', 'd', 0, 0, 0, 
--GETDATE(),  'dawn', 1, GETDATE(), 'echart', 0, 'rmcbean', GETDATE(), getdate(),'rmcbean',1,1

--INSERT INTO LU_USERS (
--[User_Name], [PassWord], Initials, Security_Level, DoctorNumber, [Current], 
--[TimeStamp], [User], PassWordExpired, 
--PasswordExpiryDate, GroupProfile, Revision, 
--CreatedBy, CreationDate, ModifiedDate, ModifiedBy, MTDoctorNumber, CanProofFor)
--select 'Complexions/Meredith', 'Complexions/Meredith', 'd', 0, 0, 0, 
--GETDATE(),  'Complexions/Meredith', 1, GETDATE(), 'echart', 0, 'rmcbean', GETDATE(), getdate(),'rmcbean',1,1

--INSERT INTO LU_USERS (
--[User_Name], [PassWord], Initials, Security_Level, DoctorNumber, [Current], 
--[TimeStamp], [User], PassWordExpired, 
--PasswordExpiryDate, GroupProfile, Revision, 
--CreatedBy, CreationDate, ModifiedDate, ModifiedBy, MTDoctorNumber, CanProofFor)
--select 'fameena', 'fameena', 'd', 0, 0, 0, 
--GETDATE(),  'fameena', 1, GETDATE(), 'echart', 0, 'rmcbean', GETDATE(), getdate(),'rmcbean',1,1



INSERT INTO dbo.useraccount (LoginName, DisplayName, IsActive, ExpiryDate, SecurityLevel, Initials)
SELECT  [User_Name], [User_Name], 0, '2013-12-31', security_level, initials
FROM LU_USERS
WHERE [USER_NAME] not in (select loginname from dbo.UserAccount)

exec spCreateUser 'BEHMSRV2\gaye','BEHMSRV2\gaye',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\donna','BEHMSRV2\donna',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\drbehm','BEHMSRV2\drbehm',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\jill','BEHMSRV2\jill',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\meri','BEHMSRV2\meri',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\reed','BEHMSRV2\reed',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\regina','BEHMSRV2\regina',1,'2014-12-31', 2, null, null
exec spCreateUser 'BEHMSRV2\stella','BEHMSRV2\stella',1,'2014-12-31', 2, null, null