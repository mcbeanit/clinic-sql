use mcbean_clinic

insert into dbo.Provider (ProviderId,VendorId,displayname)
	select mt_doctor_number, mt_doctor_number, mt_doctor_name
	from LU_DOCTORS
	where mt_doctor_number not in (select providerid from dbo.Provider)
	
update dbo.Provider set VendorId = ProviderId, Active = 1, ProviderIdentifier = vendorid


select * from dbo.provider

