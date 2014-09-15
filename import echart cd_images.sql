-- one time script to set up the document root location table
-- last updated: 14-Sep-2014

use mcbean_clinic

declare @path varchar(50)

update dbo.DocumentLocationRoot set Active = 0

set @path = '\\BEHMSRV2\d$\medtech\images\mt000119.001'
INSERT INTO dbo.DocumentLocationRoot ([Path],FileCount,FileSize, Active ) VALUES (@path, 0,0,0)

set @path = '\\BEHMSRV2\d$\medtech\images\mt000119.002'
INSERT INTO dbo.DocumentLocationRoot ([Path],FileCount,FileSize, Active ) VALUES (@path, 0,0,1)


select * FROM mcbean_clinic.dbo.DOCUMENTLOCATIONROOT

