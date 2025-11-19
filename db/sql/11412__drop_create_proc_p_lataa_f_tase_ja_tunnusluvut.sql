USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut]    Script Date: 29.10.2025 15.06.03 ******/
DROP PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut]    Script Date: 29.10.2025 15.06.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut] AS

DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_tase_ja_tunnusluvut]

 
		SELECT 
			vuosi
			,ytunnus
			,sarake
			,omistajatyyppi_nimi
			,maara_euroa
		INTO #Maarat
		FROM dw.f_amos_tase_ja_tunnusluvut_kustannuskysely
		UNION ALL
		SELECT
			vuosi
			,ytunnus
			,sarake
			,omistajatyyppi_nimi
			,maara_euroa
		FROM dw.f_amos_tase_ja_tunnusluvut_kunta

SELECT 
   		 vuosi
		,d_organisaatioluokitus_id = coalesce(d1.id,-1)
		,omistajatyyppi_nimi
		,d_amos_spl_jarjestaja_linkki_id = coalesce(d2.id,-1)
		,vos_rahoitus
		,toimintatuotot_vos = toimintatuotot+vos_rahoitus
		,toimintakulut
		,toimintakate = toimintatuotot+vos_rahoitus-toimintakulut
		,poistot_arvonalen = poistot
		,investoinnit
		,ylialijaama
		,taseen_loppusumma = vastattavaa
		,oma_paaoma
		,rahoitusomaisuus
		,edel_ylialijaama
		,poistoero_vapaaehtvar = poistoero+arvonkorotusrahastot 
		,vieras_paaoma
		,lyhyt_vieras_paaoma
		,rahoitustuotot
		,rahoituskulut

INTO ANTERO.dw.f_amos_tase_ja_tunnusluvut
FROM(
	SELECT 
		 vuosi
		,ytunnus
		,omistajatyyppi_nimi
		,ISNULL(toimintakulut, 0) AS toimintakulut
		,ISNULL(toimintatuotot, 0) AS toimintatuotot
		,ISNULL(poistot, 0) AS poistot
		,ISNULL(vastattavaa, 0) AS vastattavaa
		,ISNULL(rahoitusomaisuus, 0) AS rahoitusomaisuus
		,ISNULL(poistoero, 0) AS poistoero
		,ISNULL(vieras_paaoma, 0) AS vieras_paaoma
		,ISNULL(rahoitustuotot, 0) AS rahoitustuotot
		,ISNULL(rahoituskulut, 0) AS rahoituskulut
		,ISNULL(lyhyt_vieras_paaoma, 0) AS lyhyt_vieras_paaoma
		,ISNULL(oma_paaoma, 0) AS oma_paaoma
		,ISNULL(ylialijaama, 0) AS ylialijaama
		,ISNULL(investoinnit, 0) AS investoinnit
		,ISNULL(arvonkorotusrahastot, 0) AS arvonkorotusrahastot
		,ISNULL(vos_rahoitus, 0) AS vos_rahoitus
		,ISNULL(edel_ylialijaama, 0) AS edel_ylialijaama

	FROM #Maarat
	PIVOT ( 
			SUM(maara_euroa)
			FOR sarake IN (toimintakulut, toimintatuotot, poistot, vastattavaa, rahoitusomaisuus, poistoero, vieras_paaoma, rahoitustuotot, rahoituskulut, lyhyt_vieras_paaoma, oma_paaoma, ylialijaama, investoinnit, arvonkorotusrahastot, vos_rahoitus, edel_ylialijaama)
			) AS p ) MQ
	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = MQ.ytunnus
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 ON d2.ytunnus_avain = MQ.ytunnus

	DROP TABLE IF EXISTS #Maarat
