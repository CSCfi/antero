/****** Script for SelectTopNRows command from SSMS  ******/
use antero
go

if exists (select * from [dw].[d_perusopetus_oppiaine_ja_oppimaara] where jarjestys < 1000)
begin
	update [dw].[d_perusopetus_oppiaine_ja_oppimaara]
	set jarjestys-=1000
	where jarjestys>9000

	update [dw].[d_perusopetus_oppiaine_ja_oppimaara]
	set jarjestys+=1000
end
;

update [dw].[d_perusopetus_oppiaine_ja_oppimaara]
set ryhma_koodi='muu', jarjestys_ryhma=9, ryhma2_koodi='muu', jarjestys_ryhma2=9 
where ryhma_koodi='opo'
;

update [dw].[d_perusopetus_oppiaine_ja_oppimaara]
set ryhma_nimi='Muut opinnot', ryhma_nimi_sv='Övriga studier', ryhma2_nimi='Muut opinnot', ryhma2_nimi_sv='Övriga studier'
where ryhma_koodi='muu'
;

if not exists (select * from [dw].[d_perusopetus_oppiaine_ja_oppimaara] where nimi='Oman äidinkielen opinnot')
begin
	insert [dw].[d_perusopetus_oppiaine_ja_oppimaara] (
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
		,[ryhma2_koodi]
		,[ryhma2_nimi]
		,[ryhma2_nimi_sv]
		,[ryhma2_nimi_en]
		,[jarjestys_ryhma2]
	)
	values (
		'manuaalinen'
		,'OA'
		,'Oman äidinkielen opinnot'
		,'Studier i det egna modersmålet'
		,null
		,8100
		,'oma'
		,'Oman äidinkielen opinnot'
		,'Studier i det egna modersmålet'
		,null
		,8
		,'oma'
		,'Oman äidinkielen opinnot'
		,'Studier i det egna modersmålet'
		,null
		,8
	)
end
;