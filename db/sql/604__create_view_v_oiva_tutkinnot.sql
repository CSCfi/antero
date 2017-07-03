IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_oiva_tutkinnot'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_oiva_tutkinnot as select 1 as a'
GO

ALTER VIEW dw.[v_oiva_tutkinnot] AS

SELECT
      sa_oiva_luvat.jarjestajaYtunnus AS 'Koulutuksen järjestäjä Koodi',
	  d_organisaatioluokitus.organisaatio_fi AS 'Koulutuksen järjestäjä',
	  sa_oiva_luvat.paatospvm AS 'Päätöksen päivämäärä',
	  sa_oiva_luvat.diaarinumero AS 'Diaarinumero',
	  sa_oiva_luvat.alkupvm AS 'Voimaantulo',
	  d_organisaatioluokitus.latitude AS 'Leveyskoordinaatti',
	  d_organisaatioluokitus.longitude AS 'Pituuskoordinaatti',
	  d_organisaatioluokitus.kunta_koodi AS 'Kunta Koodi',
	  d_alueluokitus.kunta_fi AS 'Kunta',
	  d_alueluokitus.maakunta_koodi AS 'Maakunta Koodi',
	  d_alueluokitus.maakunta_fi AS 'Maakunta',
	  sa_oiva_maaraykset.koodiarvo AS 'Koulutus Koodi',
	  d_koulutusluokitus.koulutusluokitus_fi AS 'Tutkinto',
	  d_koulutusluokitus.koulutusalataso1_koodi AS 'Koulutusala (taso 1) Koodi',
	  d_koulutusluokitus.koulutusalataso1_fi AS 'Koulutusala (taso 1)',
	  d_koulutusluokitus.tutkintotyyppi_koodi AS 'Tutkintotyyppi Koodi',
	  d_koulutusluokitus.tutkintotyyppi_fi AS 'Tutkintotyyppi'

  FROM [ANTERO].[sa].[sa_oiva_maaraykset] 
  LEFT JOIN sa.sa_oiva_luvat ON sa_oiva_maaraykset.lupaId = sa_oiva_luvat._source_id
  LEFT JOIN dw.d_koulutusluokitus ON sa_oiva_maaraykset.koodiarvo = d_koulutusluokitus.koulutusluokitus_koodi
  LEFT JOIN dw.d_organisaatioluokitus ON sa_oiva_luvat.jarjestajaYtunnus = d_organisaatioluokitus.organisaatio_koodi
  LEFT JOIN dw.d_alueluokitus ON d_organisaatioluokitus.kunta_koodi = d_alueluokitus.kunta_koodi
  WHERE koodisto = 'koulutus' AND alkupvm = '2018-01-01'

GO
