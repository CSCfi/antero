USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_toisen_asteen_keskeyttaneet_unpvt]    Script Date: 30.7.2025 10.14.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE [dbo].[p_lataa_toisen_asteen_keskeyttaneet_unpvt] AS

--Huom. d.jatkaa_toinen_aste_boo yhdessä komplementtinsa kanssa takaavat eronneen sisältyvän väh. yhteen kategoriaan. 
--Huom. Sama tieto voi esiintyä eri avaimella ja selitteellä sektorista riippuen.

DROP TABLE IF EXISTS [dbo].[toisen_asteen_keskeyttaneet_unpvt]

SELECT 
	[master_oid]
    ,[opiskeluoikeus_oid]
    ,[viimeinen_lasna]
    ,[vuosi]
    ,[kuukausi]

	,keskeyttaminen_kategoria = kategoria

INTO  [dbo].[toisen_asteen_keskeyttaneet_unpvt]

FROM (
	
	SELECT 
		[master_oid]
		,[opiskeluoikeus_oid]
		,[viimeinen_lasna]
		,[vuosi]
		,[kuukausi]

		,d.jatkaa_tutkinto_boo
		,jatkaa_nuortenops
		,jatkaa_aikuistenops
		,jatkaa_tutkintotyyppi
		,d.jatkaa_koulutusala_taso3_boo
		,d.jatkaa_koulutusala_taso2_boo
		,d.jatkaa_koulutusala_taso1_boo
		,jatkaa_muu_ammatillinen
		,jatkaa_amm_valmentava
		,jatkaa_lukio_valmentava
		,jatkaa_valmentava
		,jatkaa_amm_tutkintokoulutus
		,jatkaa_ammatillinen
		,jatkaa_yleissivistava
		,d.jatkaa_toinen_aste_boo
		,jatkaa_oppilaitos
		,jatkaa_kj
		,jatkaa_kj_siirtyi_amm = jatkaa_kj * jatkaa_ammatillinen
		,keskeyttanyt_amm_tutkintokoulutus = 1 - jatkaa_amm_tutkintokoulutus
		,keskeyttanyt_amm_koulutus = 1 - jatkaa_ammatillinen
		,keskeyttanyt_toinen_aste = 1 - d.jatkaa_toinen_aste_boo
		,vaihtoi_tutkinto_siirtyi_amm = (1 - d.jatkaa_tutkinto_boo) * jatkaa_amm_tutkintokoulutus
		,vaihtoi_amm_tutkinto = jatkaa_amm_tutkintokoulutus * (1 - d.jatkaa_tutkinto_boo) --sisältötupla edellisen kanssa
		,vaihtoi_amm_tutkintotyyppi = jatkaa_amm_tutkintokoulutus * (1 - jatkaa_tutkintotyyppi)
		,vaihtoi_amm_koulutusala_taso_3 = jatkaa_amm_tutkintokoulutus * (1 - d.jatkaa_koulutusala_taso3_boo)
		,vaihtoi_amm_koulutusala_taso_2 = jatkaa_amm_tutkintokoulutus * (1 - d.jatkaa_koulutusala_taso2_boo)
		,vaihtoi_amm_koulutusala_taso_1 = jatkaa_amm_tutkintokoulutus * (1 - d.jatkaa_koulutusala_taso1_boo)
		,vaihtoi_lukio = [jatkaa_yleissivistava] * (1 - [jatkaa_oppilaitos])
		,vaihtoi_lukio_sama_kj = [jatkaa_yleissivistava] * (1 - [jatkaa_oppilaitos]) * [jatkaa_kj]
		,vaihtoi_kj_siirtyi_amm = (1 - [jatkaa_kj]) * [jatkaa_ammatillinen]
		,vaihtoi_kj_jatkaa_lukio = (1 - [jatkaa_kj]) * [jatkaa_yleissivistava]
		,vaihtoi_kj_sama_amm_tutkinto = (1 - [jatkaa_kj]) * jatkaa_amm_tutkintokoulutus * d.jatkaa_tutkinto_boo
		,vaihtoi_kj_eri_amm_tutkinto = (1 - [jatkaa_kj]) * jatkaa_amm_tutkintokoulutus * (1 - d.jatkaa_tutkinto_boo)
		,vaihtoi_kj_sama_lukio_tutkinto = (1 - [jatkaa_kj]) * jatkaa_yleissivistava * d.jatkaa_tutkinto_boo

	FROM [Koski_SA].[dbo].[toisen_asteen_keskeyttaneet] sa
	LEFT JOIN ANTERO.dw.d_keskeyttaminen_vaiheittainen d ON d.keskeyttaminen_vaiheittainen_koodi = sa.keskeyttaminen_vaiheittainen_koodi

) q

UNPIVOT (
	arvo FOR kategoria in (
		jatkaa_tutkinto_boo
		,[jatkaa_nuortenops]
		,[jatkaa_aikuistenops]
		,[jatkaa_tutkintotyyppi]
		,jatkaa_koulutusala_taso3_boo
		,jatkaa_koulutusala_taso2_boo
		,jatkaa_koulutusala_taso1_boo
		,[jatkaa_muu_ammatillinen]
		,[jatkaa_amm_valmentava]
		,[jatkaa_lukio_valmentava]
		,[jatkaa_valmentava]
		,[jatkaa_ammatillinen]
		,[jatkaa_yleissivistava]
		,jatkaa_toinen_aste_boo
		,[jatkaa_oppilaitos]
		,[jatkaa_kj]
		,jatkaa_kj_siirtyi_amm
		,keskeyttanyt_amm_tutkintokoulutus
		,keskeyttanyt_amm_koulutus
		,keskeyttanyt_toinen_aste
		,vaihtoi_tutkinto_siirtyi_amm
		,vaihtoi_amm_tutkinto
		,vaihtoi_amm_tutkintotyyppi
		,vaihtoi_amm_koulutusala_taso_3
		,vaihtoi_amm_koulutusala_taso_2
		,vaihtoi_amm_koulutusala_taso_1
		,vaihtoi_lukio
		,vaihtoi_lukio_sama_kj
		,vaihtoi_kj_siirtyi_amm
		,vaihtoi_kj_jatkaa_lukio
		,vaihtoi_kj_sama_amm_tutkinto
		,vaihtoi_kj_eri_amm_tutkinto
		,vaihtoi_kj_sama_lukio_tutkinto
	)
) unpvt

WHERE unpvt.arvo = 1

GO


