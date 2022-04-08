USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]    Script Date: 8.4.2022 13:56:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] AS

--EXEC [sa].[p_lataa_sa_hakukohde_koulutus]
--EXEC [sa].[p_lataa_sa_hakukohde_kielet]

TRUNCATE TABLE dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat

INSERT INTO dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat (
	 
      koulutuksen_alkamisvuosi
	  ,d_kausi_koulutuksen_alkamiskausi_id
	  ,[d_haku_id]
	  ,[d_hakuaika_id]
	  ,[d_hakuaika_kouta_id]
      ,[d_hakukohde_id]
	  ,[d_organisaatio_koulutuksen_jarjestaja_id]
	  ,[d_organisaatio_oppilaitos_id]
	  ,[d_organisaatio_toimipiste_id]
      ,[d_alueluokitus_hakukohde_id]
      ,[d_koulutusluokitus_hakukohde_id]
	  ,[d_koulutustyyppi_id]
	  ,[d_tutkinnon_aloitussykli_kk_id]
	  ,[d_tutkinnon_taso_kk_id]
      ,[d_kieli_koulutus_id]
	  ,[d_opintojen_laajuus_id]
      ,[d_pohjakoulutusvaatimus_id] 
	  ,[aloituspaikat]
      ,[valintojen_aloituspaikat]
      ,[ensikertalaisten_aloituspaikat]
      ,[alin_laskettuvalintapistemaara]
	  ,loadtime
	  ,source
	  ,username
)


SELECT distinct
d3.koulutuksen_alkamisvuosi,
coalesce(d4.id,'-1'),
coalesce(d11.id,'-1') as d_haku_id,
coalesce(d15.id,'-1') as d_hakuaika_id,
coalesce(d15b.id,'-1') as d_hakuaika_kouta_id,
coalesce(d12.id,'-1') as d_hakukohde_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'koulutustoimija_%' then d5a.id
		when d5b.organisaatio_avain like 'koulutustoimija_%' then d5b.id
		when d5c.organisaatio_avain like 'koulutustoimija_%' then d5c.id
		when d5d.organisaatio_avain like 'koulutustoimija_%' then d5d.id
	end)
,'-1') as d_organisaatio_koulutuksen_jarjestaja_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'oppilaitos_%' then d5a.id
		when d5b.organisaatio_avain like 'oppilaitos_%' then d5b.id
		when d5c.organisaatio_avain like 'oppilaitos_%' then d5c.id
		when d5d.organisaatio_avain like 'oppilaitos_%' then d5d.id
	end)
,'-1') as d_organisaatio_oppilaitos_id,
coalesce(
	(case
		when d5a.organisaatio_avain like 'toimipiste_%' then d5a.id
		when d5b.organisaatio_avain like 'toimipiste_%' then d5b.id
		when d5c.organisaatio_avain like 'toimipiste_%' then d5c.id
		when d5d.organisaatio_avain like 'toimipiste_%' then d5d.id
	end)
,'-1') as d_organisaatio_toimipiste_id,
coalesce(d6.id,'-1') as d_alueluokitus_hakukohde_id,
coalesce(d7.id,'-1') as d_koulutusluokitus_hakukohde_id,
coalesce(d16.id,'-1') as d_koulutustyyppi_id,
coalesce(d17.id,'-1') as d_tutkinnon_aloitussykli_kk,
coalesce(d18.id,'-1') as d_tutkinnon_taso_kk,
coalesce(d10.id,'-1') as d_kieli_koulutus_id,
coalesce(d14.id,'-1') as d_opintojen_laajuus_id,
coalesce(d13.id,'-1') as d_pohjakoulutusvaatimus_id,
d1.aloituspaikatLkm as aloituspaikat,
valintojenAloituspaikatLkm as valintojen_aloituspaikat,
ensikertalaistenAloituspaikat as ensikertalaisten_aloituspaikat,
d19.AlinLaskettuValintapistemaara as alin_laskettuvalintapistemaara,
getdate(),
'ETL: p_lataa_f_haku_ja_valinta_aloituspaikat_ja_pistemaarat' AS source,
suser_name()

FROM (
	SELECT DISTINCT s1.oid, s1.tila, s2.oid as hakukohde_oid, s2.tila as hakukohde_tila, 
	s2.aloituspaikatLkm, s2.valintojenAloituspaikatLkm, s2.ensikertalaistenAloituspaikat, s2.hakuaikaId FROM [sa].[koulutustarjonta_haku] s1
	left join sa.koulutustarjonta_hakukohde s2 on s1.oid=s2.hakuOid
	UNION ALL
	SELECT DISTINCT s1.hakuOid, upper(s1.tila), s2.hakukohdeOid as hakukohde_oid, upper(s2.tila), 
	s2.aloituspaikatLukumaara as hakukohde_tila, NULL, s2.aloituspaikatEnsikertalaisille, NULL FROM [sa].[sa_kouta_haku] s1
	left join sa.sa_kouta_hakukohteet s2 on s1.hakuOid=s2.hakuOid
	) d1
left join sa.sa_hakukohde_koulutus d3 on d3.hakukohde_oid=d1.hakukohde_oid and d3.hakukohdekoulutus_nro=1
left join dw.d_kausi d4 on d4.koodi=d3.koulutuksen_alkamiskausi
left join dw.d_organisaatioluokitus d5a ON d5a.organisaatio_oid = d3.organisaatio_oid
left join dw.d_organisaatioluokitus d5b ON d5b.organisaatio_oid = d5a.ylaorganisaatio_oid
left join dw.d_organisaatioluokitus d5c ON d5c.organisaatio_oid = d5b.ylaorganisaatio_oid
left join dw.d_organisaatioluokitus d5d ON d5d.organisaatio_oid = d5c.ylaorganisaatio_oid
left join dw.d_alueluokitus d6 on d6.alueluokitus_avain='kunta_'+coalesce(d5a.kunta_koodi,d5b.kunta_koodi,d5c.kunta_koodi,d5d.kunta_koodi)
left join dw.d_koulutusluokitus d7 on d7.koulutusluokitus_koodi=d3.hakukohdekoulutus_koodi
left join sa.v_hakukohde_taso_sykli d8 on d8.hakukohde_oid=d1.hakukohde_oid
left join sa.sa_hakukohde_kielet d9 on d9.hakukohde_oid=d1.hakukohde_oid
left join dw.d_kieli d10 on d10.kieli_koodi=d9.kieli_avain
left join dw.d_haku d11 on d11.haku_oid=d1.oid
left join dw.d_hakukohde d12 on d12.oid=d1.hakukohde_oid
left join dw.d_pohjakoulutusvaatimus d13 on d13.koodi=d3.pohjakoulutusvaatimus_koodi
left join dw.d_opintojenlaajuus d14 on d14.koodi=d3.laajuus_koodi
left join dw.d_hakuaika d15 on d15.hakuaikaId=d1.hakuaikaId
left join dw.d_hakuaika_kouta d15b on d15b.haku_oid=d1.oid
left join dw.d_koulutustyyppi d16 on d16.koodi=d3.koulutustyyppi_koodi
left join dw.d_tutkinnon_aloitussykli_kk d17 on d17.koodi=d8.hakukohteen_tutkinnon_taso_kk_sykli
left join dw.d_tutkinnon_taso_kk d18 on d18.koodi=d8.hakukohteen_tutkinnon_taso_kk
left join (select distinct HakukohdeOID, AlinLaskettuValintapistemaara from sa.sa_odw_hakeneet) d19 on d19.HakukohdeOID=d1.hakukohde_oid

WHERE d1.hakukohde_tila in ('JULKAISTU','ARKISTOITU')
and (d1.tila in ('JULKAISTU','ARKISTOITU') OR (d1.tila='VALMIS' AND d11.kohdejoukontarkenne_fi = 'Jatkotutkintohaku'))

GO

USE [ANTERO]