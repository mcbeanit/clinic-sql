use mcbean_clinic

begin transaction


	
insert into dbo.ShortCutCode  (Code, ReplaceText)
select ShortCutCode, isnull(ReplacementText,'Missing shortcut text.') FROM LU_SHORTCUTCODES t1
where t1.shortcutcode not in (select Code from dbo.shortCutCode)


select * from LU_SHORTCUTCODES where ReplacementText is null
select * from dbo.ShortCutCode 

rollback

--commit