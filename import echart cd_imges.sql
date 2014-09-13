use mcbean_clinic

delete from DocumentLocationRoot

INSERT INTO dbo.DocumentLocationRoot ([Path], FileCount, FileSize, Active)
SELECT [path] + name, numfiles, totalsize, activeimage
FROM CD_Images

select * FROM mcbean_clinic.dbo.DOCUMENTLOCATIONROOT

