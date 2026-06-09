use antero 
go

if not exists (
	select 1 
	from [sa].[sa_amos_siirtotiedosto_okm8] 
	where [voimaan_alkaen] = '2026-01-01'
)
begin
	insert [sa].[sa_amos_siirtotiedosto_okm8] (
		[organisaatio_fi]
		,[koul_jarj]
		,[paa_asiallinen_toiminta_maakunta_koodi]
		,[omistajatyyppi_koodi]
		,[omistajatyyppi]
		,[voimaan_alkaen]
		,[kommentti]
		,[tiedostonimi]
		,[latauspvm]
		,[lastmodified]
		,[source]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
	)
	select 
		[organisaatio_fi]
		,[koul_jarj] = trim([koul_jarj])
		,[paa_asiallinen_toiminta_maakunta_koodi] = trim([paa_asiallinen_toiminta_maakunta_koodi])
		,[omistajatyyppi_koodi] = trim([omistajatyyppi_koodi])
		,[omistajatyyppi]
		,[voimaan_alkaen] = '2026-01-01'
		,[kommentti]
		,[tiedostonimi]
		,[latauspvm]
		,[lastmodified]
		,[source]
		,[Koul. järjestäjän PILKE-alue (kokeilu)]
	from [sa].[sa_amos_siirtotiedosto_okm8]
	where koul_jarj != '2189108-4'
	and [voimaan_alkaen] = '2025-01-01'
end
