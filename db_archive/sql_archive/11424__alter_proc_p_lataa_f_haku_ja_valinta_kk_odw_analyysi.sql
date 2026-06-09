USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_kk_odw_analyysi]    Script Date: 21.11.2025 12.34.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_kk_odw_analyysi] AS

DECLARE @loadtime datetime = getdate();

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_pvm
SELECT
	s.oid, 
	YEAR(MIN(s.pvm)) as vuosi,
	MONTH(MIN(s.pvm)) as kuukausi
INTO ANTERO.sa.temp_haku_ja_valinta_aiempi_pvm
FROM (
	SELECT 
		(select d from dbo.biginttodate (alkamispaivamaara)) as pvm
		,[oid]
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet] t
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d1 on t.tavoitetutkinto = d1.koulutusluokitus_koodi
	WHERE d1.koulutusastetaso1_koodi <> '9'
	UNION ALL
	SELECT 
		(select d from dbo.biginttodate (suorituspaivamaara)) as pvm
		,[oid]
	FROM [ANTERO].[sa].[sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot] t
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d1 on t.tutkinto = d1.koulutusluokitus_koodi
	WHERE d1.koulutusastetaso1_koodi <> '9'
) s
GROUP BY s.oid

TRUNCATE TABLE ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi

INSERT INTO ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi
SELECT DISTINCT
	s.[HenkiloOID],
	s.[HakemusOid],
	[HakukohdeOID],
	[HakuOid],
	s2.koulutuksen_alkamisvuosi,
	d0.id as sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	coalesce(d1.id, -1) as d_sukupuoli_id,
	coalesce(d2.id, -1) as d_ika_id,
	coalesce(d3.id, -1) as d_organisaatioluokitus_id,
	coalesce(d4.id, -1) as d_kansalaisuus_id,
	coalesce(d5.id, -1) as d_alueluokitus_kotikunta_id,
	coalesce(d7.id, -1) as d_koulutusluokitus_id,
	[Ensikertalainen],	
	[ToisenAsteenKoulutuksenSuoritusvuosi],
	[HakutoiveNumero],
	CASE
		WHEN [ValinnanTila] in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') or [VastaanotonTila] in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
		ELSE 0
	END as valittu,
	CASE
		WHEN [VastaanotonTila] in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
		ELSE 0
	END as vastaanottanut_paikan,
	s.[HakuaikaAlku],
	[HakuaikaLoppu],
	HK.Hakukerta,
	case 
		when Ensikertalainen = 0 then 0 
		when ae.vuosi < s2.koulutuksen_alkamisvuosi then 0
		when ae.vuosi = s2.koulutuksen_alkamisvuosi and s2.koulutuksen_alkamiskausi = 's' and ae.kuukausi < 8 then 0
		else 1
	end as aidostiEnsikertalainen
FROM [ANTERO].[sa].[sa_odw_hakeneet] s
LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s.SukupuoliKoodi
LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain = s.Ika
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d3 ON d3.organisaatio_oid = s.OppilaitosOID
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = s.KansalaisuusKoodi
LEFT JOIN ANTERO.dw.d_alueluokitus d5 on d5.kunta_koodi = s.KotikuntaKoodi
INNER JOIN ANTERO.dw.d_haku d6 on d6.korkeakouluhaku = 1 and d6.haku_oid = s.HakuOid
LEFT JOIN ANTERO.sa.sa_hakukohde_koulutus s2 on s2.hakukohde_oid = s.HakukohdeOID and s2.hakukohdekoulutus_nro = 1
LEFT JOIN ANTERo.dw.d_koulutusluokitus d7 on d7.koulutusluokitus_koodi = s2.hakukohdekoulutus_koodi
LEFT JOIN ANTERO.dw.d_kausi d8 on d8.koodi = s2.koulutuksen_alkamiskausi
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d0 on 
((d0.haku_oid=d6.haku_oid and d0.haku_oid is not null) OR (d0.koulutuksen_alkamiskausi=cast(s2.koulutuksen_alkamisvuosi as varchar)+cast(d8.jarjestys as varchar) and d6.hakutapa_koodi <> '01' and d0.haku_oid is null))
and @loadtime >= d0.visualisoinnit
LEFT JOIN (
	SELECT *, Hakukerta = row_number() over (partition by f2.HenkiloOID order by f2.koulutuksen_alkamisvuosi, f2.HakuaikaAlku) FROM (
		SELECT f2.HenkiloOID, f2.HakemusOid, MIN(f2.HakuaikaAlku) as HakuaikaAlku, MIN(concat(s.koulutuksen_alkamisvuosi, d.jarjestys)) as koulutuksen_alkamisvuosi
		FROM [ANTERO].[sa].[sa_odw_hakeneet] f2
		LEFT JOIN ANTERO.sa.sa_hakukohde_koulutus s on s.hakukohde_oid = f2.HakukohdeOID and s.hakukohdekoulutus_nro = 1
		LEFT JOIN ANTERO.dw.d_kausi d on d.koodi = s.koulutuksen_alkamiskausi
		WHERE f2.hakukohteen_tutkinnon_taso_kk_sykli = 1
		GROUP BY f2.HenkiloOID, f2.HakemusOid
	) f2
) HK on HK.HakemusOid = s.HakemusOid
LEFT JOIN sa.temp_haku_ja_valinta_aiempi_pvm ae on ae.oid = s.HenkiloOID

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_aiempi_pvm


GO


