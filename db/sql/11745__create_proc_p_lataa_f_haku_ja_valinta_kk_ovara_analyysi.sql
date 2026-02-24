USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_kk_ovara_analyysi]    Script Date: 5.2.2026 8.03.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_haku_ja_valinta_kk_odw_analyysi]

GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_kk_ovara_analyysi] AS

DECLARE @loadtime datetime = getdate();

-- TRUNCATE TABLE ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi
DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi

-- INSERT INTO ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi
SELECT DISTINCT
	f.master_oid,
	f.hakemus_oid,
	d7.oid as hakukohde_oid,
	d6.haku_oid,
	f.koulutuksen_alkamisvuosi,
	d0.id as sa_haku_ja_valinta_vuosikello_korkea_aste_id,
	f.d_sukupuoli_id,
	f.d_ika_id,
	f.d_organisaatioluokitus_oppilaitos_id,
	f.d_maatjavaltiot2_kansalaisuus_id,
	f.d_alueluokitus_kotikunta_id,
	f.d_koulutusluokitus_id,
	f.ensikertalainen,	
	f.aidosti_ensikertainen,
	f.toisen_asteen_koulutuksen_suoritusvuosi,
	f.hakutoive,
	f.valittu,
	f.vastaanottanut_paikan,
	HK.Hakukerta,
	@loadtime as loadtime
INTO ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi
FROM [ANTERO].[dw].[f_haku_ja_valinta_hakeneet_korkea_aste] f
INNER JOIN ANTERO.dw.d_haku d6 on d6.korkeakouluhaku = 1 and d6.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_hakukohde d7 on d7.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_kausi d8 on d8.id = f.d_kausi_koulutuksen_alkamiskausi_id
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d0 on 
((d0.haku_oid=d6.haku_oid and d0.haku_oid is not null) OR (d0.koulutuksen_alkamiskausi=concat(cast(f.koulutuksen_alkamisvuosi as varchar),cast(d8.selite_fi as varchar)) and d6.hakutapa_koodi <> '01' and d0.haku_oid is null))
and @loadtime >= d0.visualisoinnit
LEFT JOIN (
	SELECT
		hakemus_oid,
		master_oid,
		rank() OVER(PARTITION BY master_oid ORDER BY kausi, hakemus_luotu) as hakukerta
	FROM (
		SELECT DISTINCT
			master_oid,
			hakemus_oid,
			CONCAT(CAST(koulutuksen_alkamisvuosi as varchar), koulutuksen_alkamiskausi) as kausi,
			hakemus_luotu
		FROM ANTERO.sa.sa_ovara_hakeneet
		WHERE kk_haku = 1
	) s
) HK on HK.hakemus_oid = f.hakemus_oid