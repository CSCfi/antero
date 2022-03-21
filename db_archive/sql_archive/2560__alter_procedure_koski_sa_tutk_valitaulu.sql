USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]    Script Date: 24.10.2019 15:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus] AS

TRUNCATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]

INSERT INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus]


SELECT DISTINCT
	 ol_organisaatio_koodi
	,opintojen_rahoitus_koodi
	,suorituksen_tyyppi_koodi = case f.suorituksen_tyyppi when 'ammatillinentutkinto' then 1 when 'ammatillinentutkintoosittainen' then 2 else -1 end
	,kustannusryhma_koodi
	,oppisopimus_koodi
	,erityisopetus_koodi
	,tutkinto_koodi
	,paatason_suoritus_id
	,count_tutkinnot_ml_oppisopimuskoulutus = case when paataso=1 and suorituksen_tyyppi = 'ammatillinentutkinto' then opiskeluoikeus_oid else null end
	,count_tutkinnon_osat = suoritustason_tunniste
	,sum_osaamispisteet = koulutusmoduuli_laajuus_arvo

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu] f
left join ANTERO.[dw].[d_amos_spl_organisaatio_linkki] ol on ol.oo_koulutustoimija_oid = f.koulutustoimija_oid and rnk_kt=1

WHERE ol.amos_spl_master_ytunnus IS NOT NULL

GO

USE [ANTERO]