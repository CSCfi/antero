/****** Script for SelectTopNRows command from SSMS  ******/

  update [ANTERO].[dw].[d_perusopetus_oppiaine_ja_oppimaara]
  set jarjestys = '2130'
  ,ryhma_koodi='kie'
  ,ryhma_nimi='Kielet'
  ,ryhma_nimi_sv='Språk'
  ,jarjestys_ryhma='2'
  ,ryhma2_koodi='kie'
  ,ryhma2_nimi='Kielet'
  ,ryhma2_nimi_sv='Språk'
  ,jarjestys_ryhma2='2'
  where koodisto='koskioppiaineetyleissivistava' and koodi='AOM'