use mcbean_clinic

declare @path varchar(50)

set @path = '\\BEHMSRV2\d$\medtech\Images\'
delete from DocumentLocationRoot


INSERT INTO dbo.DocumentLocationRoot ([Path], FileCount, FileSize, Active)
SELECT @path + name, isnull(numfiles,0), ISNULL(totalsize,0), activeimage
FROM CD_Images

select * FROM mcbean_clinic.dbo.DOCUMENTLOCATIONROOT

