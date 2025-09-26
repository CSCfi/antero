use antero 
go

if not exists (
	select 1 
	from [sa].[sa_amos_siirtotiedosto_okm1] 
	where vanha = '2189108-4' 
	and uusi is null
)
begin
	insert [sa].[sa_amos_siirtotiedosto_okm1] (
		[vanha]
		,[uusi]
		,[voimaan_alkaen]
		,[kommentti]
	)
	values (
		'2189108-4'
		,null
		,'2025-02-01'
		,'Cimson Koulutuspalvelut Oy:n järjestämislupa peruttu 1.2.2025 alkaen'
	)
end
