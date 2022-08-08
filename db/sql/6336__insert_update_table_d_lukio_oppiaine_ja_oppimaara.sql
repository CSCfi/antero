/****** Script for SelectTopNRows command from SSMS  ******/
use antero
go

update [dw].[d_lukio_oppiaine_ja_oppimaara]
set jarjestys=9050, ryhma_koodi='muu', ryhma_nimi='Muut opinnot', jarjestys_ryhma=9
where koodi='OA' and koodisto='lukionmuutopinnot'
;

if not exists (select * from [dw].[d_lukio_oppiaine_ja_oppimaara] where koodi='OA' and koodisto!='lukionmuutopinnot')
begin
	insert [dw].[d_lukio_oppiaine_ja_oppimaara] (
		[koodisto]
		,[koodi]
		,[nimi]
		,[nimi_sv]
		,[nimi_en]
		,[jarjestys]
		,[ryhma_koodi]
		,[ryhma_nimi]
		,[ryhma_nimi_sv]
		,[ryhma_nimi_en]
		,[jarjestys_ryhma]
	)
	select [koodisto] = 'manuaalinen'
		,[koodi]
		,[nimi]
		,[nimi_sv]
		,[nimi_en]
		,[jarjestys]
		,[ryhma_koodi]
		,[ryhma_nimi]
		,[ryhma_nimi_sv]
		,[ryhma_nimi_en]
		,[jarjestys_ryhma]
	from [dw].[d_lukio_oppiaine_ja_oppimaara] where koodi='OA' and koodisto='lukionmuutopinnot'
end
;