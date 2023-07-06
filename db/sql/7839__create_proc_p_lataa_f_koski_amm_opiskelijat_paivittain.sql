USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijat_paivittain]    Script Date: 6.7.2023 14:05:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijat_paivittain] AS


DROP TABLE IF EXISTS dw.f_koski_amm_opiskelijat_paivittain

SELECT
	 tilastovuosi = k.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_oo_aloitus_id = COALESCE(d2.id,-1)
	,d_kytkin_ooalkanutkuussa_id = COALESCE(d3.id,-1)
	,d_kytkin_ooalkanutaikaisintaan_id = COALESCE(d9.id,-1)
	,case
		when k.ika_ryhma = 1 then 'Alle 19'
		when k.ika_ryhma = 2 then '19-20'
		when k.ika_ryhma = 3 then 'Yli 20'
		else 'Tieto puuttuu'
	end as 'ika_ryhma'
	,d_maatjavaltiot2_kansalaisuus_id = COALESCE(d4.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d5.id,-1)
	,case
		when k.tutkintotyyppi IS NULL then 'Tieto puuttuu'
		else k.tutkintotyyppi
	end as 'd_tutkintotyyppi_id'
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d6.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d7.id,-1)
	,d_organisaatioluokitus_alue_id = COALESCE(d8.id,-1)
	,case
		when k.ika_ryhma = 1 then '1'
		when k.ika_ryhma = 2 then '2'
		when k.ika_ryhma = 3 then '3'
		else '4'
	end as 'jarj_ika_ryhma'
	,case 
		when k.tutkintotyyppi = 'Ammatilliset perustutkinnot' then '1'
		when k.tutkintotyyppi = 'Ammattitutkinnot' then '2'
		when k.tutkintotyyppi = 'Erikoisammattitutkinnot' then '3'
		when k.tutkintotyyppi = 'VALMA' then '4'
		when k.tutkintotyyppi = 'TELMA' then '5'
		when k.tutkintotyyppi = 'TUVA' then '6'
		when k.tutkintotyyppi = 'Muu ammatillinen koulutus' then '7'
		else '8'
	end as 'jarj_tutkintotyyppi'
	,opiskelijat = lkm
	,pv_kk = pv_kk
	,loadtime = GETDATE()

INTO dw.f_koski_amm_opiskelijat_paivittain
	
FROM (
	SELECT
		 [vuosi]
		,[kuukausi]
		,[paiva]
		,[oo_aloitusvuosi]
		,[oo_aloituskuukausi]
		,[oo_alkanut_kuussa]
		,[oo_alkanut_aikaisintaan]
		,[ika_ryhma]
		,[kansalaisuus]
		,[suorituksen_tyyppi]
		,[tutkintotyyppi]
		,[oppilaitos_oid]
		,[lkm]
		,[pv_kk]
	FROM Koski_SA.dbo.amm_opiskelijat_paivittain sa
) k

LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = CONCAT(k.vuosi,'-',RIGHT(CONCAT('0',k.kuukausi),2),'-',RIGHT(CONCAT('0',k.paiva),2))
LEFT JOIN dw.d_kalenteri d2 ON d2.kalenteri_avain = CONCAT(k.oo_aloitusvuosi,'-',RIGHT(CONCAT('0',k.oo_aloituskuukausi),2),'-01')
LEFT JOIN dw.d_kytkin d3 ON d3.kytkin_koodi = oo_alkanut_kuussa
LEFT JOIN dw.d_maatjavaltiot2 d4 ON d4.maatjavaltiot2_koodi = k.kansalaisuus
LEFT JOIN dw.d_suorituksen_tyyppi d5 ON d5.koodi = k.suorituksen_tyyppi
LEFT JOIN dw.d_organisaatioluokitus d6 ON d6.organisaatio_oid = k.oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d7 ON d7.organisaatio_oid = d6.ylaorganisaatio_oid
LEFT JOIN dw.d_alueluokitus d8 ON d8.alueluokitus_avain = 'Kunta_'+d6.kunta_koodi
LEFT JOIN dw.d_kytkin d9 ON d9.kytkin_koodi = oo_alkanut_aikaisintaan






GO


