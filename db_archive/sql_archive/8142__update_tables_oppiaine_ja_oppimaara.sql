use ANTERO
go

update [ANTERO].[dw].[d_perusopetus_oppiaine_ja_oppimaara]
set ryhma2_koodi='aom'
	,ryhma2_nimi=nimi
	,ryhma2_nimi_sv=nimi_sv
	,ryhma2_nimi_en=null
	,nimi_en=null
where koodisto='koskioppiaineetyleissivistava' and koodi='AOM'

update [dw].[d_lukio_oppiaine_ja_oppimaara]
set nimi_sv='Modersmålsinriktat språk'
	,jarjestys=2400
	,ryhma_koodi='kie'
	,ryhma_nimi='kielet'
where koodisto='koskioppiaineetyleissivistava' and koodi='AOM'
