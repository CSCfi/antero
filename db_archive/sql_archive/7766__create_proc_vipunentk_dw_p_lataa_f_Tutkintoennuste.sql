USE [VipunenTK_DW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_Tutkintoennuste] AS


-- Määrittelyt: https://wiki.eduuni.fi/pages/viewpage.action?pageId=364592639

TRUNCATE TABLE VipunenTK.dbo.f_Tutkintoennuste

SELECT 
	[Tilastovuosi] = f.[tilastointivuosi]
	,NULL as Lukuvuosi
	,d16.iscfi2013 as 'Koulutusala, taso 3'
	,d16.iscfi2013_koodi as koulutusala_koodi
	,d7.koulutustyyppi
	,d16.Koulutusaste_taso2
	,NULL as 'Myöhempi tutkinto'
	,NULL as 'Alkuperäinen/muu tutkintolaji'
	,NULL as 'Pääasiallinen toiminta'
	,CASE WHEN d5.ika_int BETWEEN 15 and 34 THEN '15-34' ELSE '35-64' END as 'Ikä'
    ,[Aloit2] = SUM(case when d16.Koulutusaste_taso2_koodi in (62,63,71,72,73,81,82,91) then aloittaneet else 0 end)
	,[tutkinnon_suorittaneet] = NULL
	,[tyovoima_yhteensa] = NULL
	,NULL as 'alkuperaisen_tutkinnon_suorittaneet'
	,NULL as 'myohemman_tutkinnon_suorittaneet'
	,NULL as suoritetut_tutkinnot
	,NULL as 'alkuperaisen_tutkinnon_aloittaneet'
	,CASE 
		WHEN d7.koulutustyyppi in ('Ammattikorkeakoulututkinto, päivätoteutus', 'Ammattikorkeakoulututkinto, monimuotototeutus') THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END as 'Ennusteen koulutusaste'
FROM [VipunenTK].[dbo].[f_OTV_2_8_Korkeakouluopiskelijat] f
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
LEFT JOIN [VipunenTK].[dbo].d_oppilaitoksen_taustatiedot d9 ON d9.id = f.oppilaitos_id
LEFT JOIN [VipunenTK].[dbo].d_oppilaitoksen_taustatiedot d9b ON d9b.id = f.koulutuksen_jarjestaja_id
LEFT JOIN [VipunenTK].[dbo].d_oppilaitoksen_taustatiedot_historia d9c ON d9c.id = f.oppilaitos_historia_id
LEFT JOIN [VipunenTK].[dbo].d_oppilaitoksen_taustatiedot_historia d9d ON d9d.id = f.koulutuksen_jarjestaja_historia_id
LEFT JOIN [VipunenTK].[dbo].d_lahde d10 ON d10.id = f.lahde_id
LEFT JOIN [VipunenTK].[dbo].d_ika d5 ON d5.id = f.ika_id
LEFT JOIN [VipunenTK].[dbo].d_koulutustyyppi d7 ON d7.id = f.koulutustyyppi_id
WHERE d10.lahde_koodi in ('-1','41','42','51','52') AND d9.oppilaitoskoodi NOT IN ('02557','10031','02358')
AND coalesce(d9.oppilaitoksen_korvaavakoodi,d9.oppilaitoskoodi) not in ('01029','01569','10102') 
AND f.tilastointivuosi >= 2017 and d5.ika_int BETWEEN 15 and 64
AND ((d7.koulutustyyppi in ('Ammattikorkeakoulututkinto, päivätoteutus', 'Ammattikorkeakoulututkinto, monimuotototeutus') and d16.Koulutusaste_taso2 = 'Ammattikorkeakoulututkinto') or d16.Koulutusaste_taso2 in ('Alempi korkeakoulututkinto', 'Ylempi korkeakoulututkinto'))
GROUP BY [tilastointivuosi],CASE WHEN d5.ika_int BETWEEN 15 and 34 THEN '15-34' ELSE '35-64' END 
	,d16.iscfi2013 
	,d16.iscfi2013_koodi
	,d7.koulutustyyppi
	,d16.Koulutusaste_taso2
,CASE 
		WHEN d7.koulutustyyppi in ('Ammattikorkeakoulututkinto, päivätoteutus', 'Ammattikorkeakoulututkinto, monimuotototeutus') THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END 

UNION ALL

select 
	[Tilastovuosi] = f.tilv,
	NULL as Lukuvuosi,
	d16.iscfi2013 as 'Koulutusala, taso 3',
	d16.iscfi2013_koodi as koulutusala_koodi,
	'Ammatillinen koulutus',
	d16.Koulutusaste_taso2,
	NULL as 'Myöhempi tutkinto',
	NULL as 'Alkuperäinen/muu tutkintolaji',
	NULL as 'Pääasiallinen toiminta',
	CASE WHEN d5.ika_int BETWEEN 15 and 34 THEN '15-34' ELSE '35-64' END as 'Ikä',
	SUM(f.aloittaneet) as Aloit2
	,[Tutkinnon suorittaneet] = NULL
	,[Työvoima yhteensä] = NULL
	,NULL as 'Alkuperäisen tutkinnon suorittaneet'
	,NULL as 'Myöhemmän tutkinnon suorittaneet'
	,NULL as suoritetut_tutkinnot
	,NULL as 'Alkuperäisen tutkinnon aloittaneet'
	,'Ammatillinen koulutus' as 'Ennusteen koulutusaste'
from VipunenTK.[dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d16 on d16.id=f.koulutusluokitus_id
LEFT JOIN [VipunenTK].[dbo].d_ika d5 ON d5.id = f.ika_1v_id
LEFT JOIN VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d15 on d15.id=f.ammatillisen_koulutuksen_koulutuslaji_id
LEFT JOIN VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d27 on d27.id=f.koulutuksen_tavoite_toteuma_id
WHERE d15.ammatillisen_koulutuksen_koulutuslaji = 'ammatillinen perustutkinto' and f.tilv >= 2017 and d5.ika_int BETWEEN 15 and 64
AND d27.koulutuksen_tavoite_toteuma = 'Koko tutkinto'
GROUP BY f.tilv,d16.iscfi2013,d16.Koulutusaste_taso2,CASE WHEN d5.ika_int BETWEEN 15 and 34 THEN '15-34' ELSE '35-64' END,d16.iscfi2013_koodi

UNION ALL

Select 
	[Tilastointivuosi] as Tilastovuosi
	,NULL as Lukuvuosi
	,d1.iscfi2013 as 'Koulutusala, taso 3'
	,d1.iscfi2013_koodi as koulutusala_koodi
	,NULL
	,d1.Koulutusaste_taso2 as 'Koulutusaste, taso 2'
	,NULL as 'Myöhempi tutkinto'
	,NULL as 'Alkuperäinen/muu tutkintolaji'
	,NULL as 'Pääasiallinen toiminta'
	,'25-49' as 'Ikä'
	,NULL
	,[Tutkinnon suorittaneet] = SUM(lukumaara)
	,[Työvoima yhteensä] = NULL
	,NULL as 'Alkuperäisen tutkinnon suorittaneet'
	,NULL as 'Myöhemmän tutkinnon suorittaneet'
	,NULL as suoritetut_tutkinnot
	,NULL as 'Alkuperäisen tutkinnon aloittaneet'
	,CASE 
		WHEN Koulutusaste_taso2_koodi in (32,33,41) THEN 'Ammatillinen koulutus'
		WHEN Koulutusaste_taso2_koodi = 62 THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END as 'Ennusteen koulutusaste'
FROM VipunenTK.dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta f
LEFT JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
LEFT JOIN d_oppisopimuskoulutus d4 on d4.id = oppisopimuskoulutus_id
LEFT JOIN d_paaasiallinen_toiminta d14 on d14.id = f.paaasiallinen_toiminta_versio6_id
LEFT JOIN d_ika d18 on d18.id = vaeston_ika_1v_id
WHERE aineisto <> 'R' and tilastointivuosi >= 2018 and d18.ika_int between 25 and 49 and (Koulutusaste_taso2_koodi in (32,33,41,62,72,73) or (Koulutusaste_taso2_koodi = 63 and iscfi2013_koodi in ('0112', '0918', '0916')))
GROUP BY tilastointivuosi
,d1.iscfi2013
,d1.iscfi2013_koodi
,d1.Koulutusaste_taso2
,CASE 
	WHEN Koulutusaste_taso2_koodi in (32,33,41) THEN 'Ammatillinen koulutus'
	WHEN Koulutusaste_taso2_koodi = 62 THEN 'Ammattikorkeakoulukoulutus'
	ELSE 'Yliopistokoulutus'
END 

UNION ALL

Select 
	 [Tilastointivuosi] as Tilastovuosi
	,NULL as Lukuvuosi
	,d1.iscfi2013 as 'Koulutusala, taso 3'
	,d1.iscfi2013_koodi as koulutusala_koodi
	,NULL
	,d1.Koulutusaste_taso2 as 'Koulutusaste, taso 2'
	,NULL as 'Myöhempi tutkinto'
	,NULL as 'Alkuperäinen/muu tutkintolaji'
	,d14.paaasiallinen_toiminta as 'Pääasiallinen toiminta'
	,'25-49' as 'Ikä'
	,NULL
	,[Tutkinnon suorittaneet] = NULL
	,[Työvoima yhteensä] = SUM(lukumaara)
	,NULL as 'Alkuperäisen tutkinnon suorittaneet'
	,NULL as 'Myöhemmän tutkinnon suorittaneet'
	,NULL as suoritetut_tutkinnot
	,NULL as 'Alkuperäisen tutkinnon aloittaneet'
	,CASE 
		WHEN Koulutusaste_taso2_koodi in (32,33,41) THEN 'Ammatillinen koulutus'
		WHEN Koulutusaste_taso2_koodi = 62 THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END as 'Ennusteen koulutusaste'
FROM VipunenTK.dbo.f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta f
LEFT JOIN d_koulutusluokitus d1 on d1.id = koulutusluokitus_id
LEFT JOIN d_oppisopimuskoulutus d4 on d4.id = oppisopimuskoulutus_id
LEFT JOIN d_paaasiallinen_toiminta d14 on d14.id = f.paaasiallinen_toiminta_versio6_id
LEFT JOIN d_ika d18 on d18.id = vaeston_ika_1v_id
WHERE aineisto <> 'R' and tilastointivuosi >= 2018 and d18.ika_int between 25 and 49 and (Koulutusaste_taso2_koodi in (32,33,41,62,72,73) or (Koulutusaste_taso2_koodi = 63 and iscfi2013_koodi in ('0112', '0918', '0916')))
and ((d14.paaasiallinen_toiminta in ('Päätoiminen työllinen', 'Työtön') or (d14.paaasiallinen_toiminta = 'Työllinen opiskelija' and d1.iscfi2013_koodi in ('0841','0911','0912'))))
GROUP BY tilastointivuosi, d14.paaasiallinen_toiminta
,d1.iscfi2013 
,d1.iscfi2013_koodi
,d1.Koulutusaste_taso2,
CASE 
		WHEN Koulutusaste_taso2_koodi in (32,33,41) THEN 'Ammatillinen koulutus'
		WHEN Koulutusaste_taso2_koodi = 62 THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END 


UNION ALL

SELECT 
	Tilastovuosi
	,NULL as Lukuvuosi
	,[Koulutusala, taso 3]
	,[koulutusala_koodi]
	,koulutustyyppi
	,[Koulutusaste, taso 2]
	,unpvt.myohempi_tutkinto as 'Myöhempi tutkinto'
	,NULL as 'Alkuperäinen/muu tutkintolaji'
	,NULL as 'Pääasiallinen toiminta'
	,NULL as 'Ikä'
    ,[Aloit2] = NULL
	,[tutkinnon_suorittaneet] = NULL
	,[tyovoima_yhteensa] = NULL
	,[Alkuperäisen tutkinnon suorittaneet] as 'alkuperaisen_tutkinnon_suorittaneet'
	,unpvt.myohemmat_tutkinnot as 'myohemman_tutkinnon_suorittaneet'
	,NULL as 'suoritetut_tutkinnot'
	,NULL as 'alkuperaisen_tutkinnon_aloittaneet'
	,[Ennusteen koulutusaste]
FROM (
Select 
	[suorv] as 'Tilastovuosi' 
	,NULL as Lukuvuosi
	,d3.iscfi2013 as 'Koulutusala, taso 3'
	,d3.iscfi2013_koodi as koulutusala_koodi
	,NULL as koulutustyyppi
	,d3.Koulutusaste_taso2 as 'Koulutusaste, taso 2'
	,NULL as 'Ikä'
	,NULL as 'Aloit2'
	,NULL as 'tutkinnon_suorittaneet'
	,NULL as 'tyovoima_yhteena'
	,SUM([henkiloiden_lkm]) as 'Alkuperäisen tutkinnon suorittaneet'
	,SUM([amm_henkiloiden_lkm]) as 'Ammatillinen perustutkinto'
	,SUM([Myohemman_yliopistotutkinnon_suorittaneiden_lkm]) as 'Yliopistotutkinto'
	,SUM([amk_henkiloiden_lkm]) as 'Ammattikorkeakoulututkinto'
	,NULL as suoritetut_tutkinnot
	,NULL as 'Alkuperäisen tutkinnon aloittaneet'
	,CASE 
		WHEN d3.Koulutusaste_taso2_koodi = '32' THEN 'Ammatillinen koulutus'
		WHEN d3.Koulutusaste_taso2_koodi = '62' THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END as 'Ennusteen koulutusaste'
FROM VipunenTK.dbo.f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8 f
LEFT JOIN d_tarkastelujakso d1 ON d1.id = tarkastelujakso_id
LEFT JOIN d_koulutusluokitus d3 ON d3.id = koulutusluokitus_id
WHERE d1.tarkastelujakso_koodi = '7' and suorv >= 2010 and (d3.Koulutusaste_taso2_koodi in ('32', '62', '72') or (d3.Koulutusaste_taso2_koodi = '63' and d3.iscfi2013_koodi in ('0112','0410','0820','0841')))
GROUP BY [suorv] ,d3.Koulutusaste_taso2 ,d3.iscfi2013,d3.iscfi2013_koodi, CASE 
		WHEN d3.Koulutusaste_taso2_koodi = '32' THEN 'Ammatillinen koulutus'
		WHEN d3.Koulutusaste_taso2_koodi = '62' THEN 'Ammattikorkeakoulukoulutus'
		ELSE 'Yliopistokoulutus'
	END
) f
UNPIVOT  
   (myohemmat_tutkinnot FOR myohempi_tutkinto IN   
      ([Ammatillinen perustutkinto], Yliopistotutkinto, Ammattikorkeakoulututkinto)  
)AS unpvt

UNION ALL

SELECT  
	NULL,
	d1.lukuvuosi as Lukuvuosi,
	COALESCE(NULLIF(d7.iscfi2013,'Tuntematon'),d7b.iscfi2013) as 'Koulutusala, taso 3',
	COALESCE(NULLIF(d7.iscfi2013_koodi, -1), d7b.iscfi2013_koodi) as koulutusala_koodi,
	d6.koulutuslaji2,
	COALESCE(NULLIF(d7.Koulutusaste_taso2,'Tuntematon'),d7b.koulutusaste_taso2) as 'Koulutusaste, taso 2',
	NULL as 'Myöhempi tutkinto',
	'Alkuperäinen tutkintolaji' as 'Alkuperäinen/muu tutkintolaji',
	NULL as 'Pääasiallinen toiminta',
	NULL as 'Ikä',
	NULL,
	NULL,
	NULL,
	NULL as 'Alkuperäisen tutkinnon suorittaneet',
	NULL as 'Myöhemmän tutkinnon suorittaneet',
	NULL as 'suoritetut_tutkinnot',
	SUM(lkm_int) as 'Alkuperäisen tutkinnon aloittaneet',
	CASE 
		WHEN f.aineistokoodi = 'K3.9' THEN 'Ammatillinen koulutus'
		WHEN d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112' THEN 'Yliopistokoulutus'
		ELSE 'Ammattikorkeakoulukoulutus'
	END as 'Ennusteen koulutusaste'
FROM VipunenTK.dbo.f_aloittaneiden_lapaisy f 
LEFT JOIN dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi 
LEFT JOIN dbo.d_tarkastelujakso AS d17 ON d17.id = f.tarkastelujakso_id 
LEFT JOIN dbo.d_koulutuslaji2 AS d6 ON d6.id = f.koulutuslaji2_id 
LEFT JOIN dbo.d_koulutusluokitus AS d7 ON d7.id = f.koulk_id 
LEFT JOIN dbo.d_koulutusluokitus d7b ON d7b.koulutusluokitus_avain=coalesce(d7.korvaava_koulutus_koodi,'-1')
LEFT JOIN dbo.d_lahde AS d10 ON d10.id = f.lahde_id 
WHERE (f.aineistokoodi = 'K3.9' AND d10.lahde_koodi in ('31','33','34','35','36') AND f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
AND (d17.tarkastelujakso_koodi = '4' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2012 AND d6.jarjestamistapa = 'opetussuunnitelmaperusteinen koulutus/tutkinto'
AND coalesce(d7.Koulutusaste_taso2_koodi, d7b.Koulutusaste_taso2_koodi) = '32')) OR
(f.aineistokoodi = 'K3.10' AND d10.lahde_koodi = '51' AND f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
AND d17.tarkastelujakso_koodi = '9' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2008 AND (d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112')) OR
(aineistokoodi = 'K3.10' AND d10.lahde_koodi = '41' AND d6.koulutuslaji2_koodi <> '52' AND [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
AND d17.tarkastelujakso_koodi = '6,5' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2011 AND d7.Koulutusaste_taso2_koodi =  '62')
GROUP BY COALESCE(NULLIF(d7.Koulutusaste_taso2,'Tuntematon'),d7b.koulutusaste_taso2), COALESCE(NULLIF(d7.iscfi2013_koodi, -1), d7b.iscfi2013_koodi),
		COALESCE(NULLIF(d7.iscfi2013,'Tuntematon'),d7b.iscfi2013), d1.lukuvuosi, d6.koulutuslaji2, CASE 
		WHEN f.aineistokoodi = 'K3.9' THEN 'Ammatillinen koulutus'
		WHEN d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112' THEN 'Yliopistokoulutus'
		ELSE 'Ammattikorkeakoulukoulutus'
	END

UNION ALL

SELECT
	Tilastovuosi
	,Lukuvuosi
	,[Koulutusala, taso 3]
	,[koulutusala_koodi]
	,koulutuslaji2
	,[Koulutusaste, taso 2]
	,[Myöhempi tutkinto]
	,unpvt.Tutkintolaji as 'Alkuperäinen/muu tutkintolaji'
	,NULL as 'Pääasiallinen toiminta'
	,Ikä
    ,[Aloit2]
	,[tutkinnon_suorittaneet]
	,[tyovoima_yhteensa]
	,[Alkuperäisen tutkinnon suorittaneet]
	,[Myöhemmän tutkinnon suorittaneet]
	,unpvt.suoritetut_tutkinnot as 'suoritetut_tutkinnot'
	,[Alkuperäisen tutkinnon aloittaneet]
	,[Ennusteen koulutusaste]
FROM (
	SELECT  
		NULL as Tilastovuosi,
		d1.lukuvuosi as Lukuvuosi,
		COALESCE(NULLIF(d7.iscfi2013,'Tuntematon'),d7b.iscfi2013) as 'Koulutusala, taso 3',
		COALESCE(NULLIF(d7.iscfi2013_koodi, -1), d7b.iscfi2013_koodi) as koulutusala_koodi,
		d6.koulutuslaji2,
		COALESCE(NULLIF(d7.Koulutusaste_taso2,'Tuntematon'),d7b.koulutusaste_taso2) as 'Koulutusaste, taso 2',
		NULL as 'Myöhempi tutkinto',
		NULL as 'Ikä',
		NULL as Aloit2,
		NULL as tutkinnon_suorittaneet,
		NULL as tyovoima_yhteensa,
		NULL as 'Alkuperäisen tutkinnon suorittaneet',
		NULL as 'Myöhemmän tutkinnon suorittaneet',
		SUM(CASE 
			WHEN [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tutkinto alkuperäisessä tutkintolajissa' THEN lkm_int
			ELSE 0
		END) as 'Alkuperäinen tutkintolaji',
		SUM(CASE 
			WHEN [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tutkinto muussa tutkintolajissa' THEN lkm_int
			ELSE 0
		END) as 'Muu tutkintolaji',
		NULL as 'Alkuperäisen tutkinnon aloittaneet',
		CASE 
			WHEN f.aineistokoodi = 'K3.9' THEN 'Ammatillinen koulutus'
			WHEN d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112' THEN 'Yliopistokoulutus'
			ELSE 'Ammattikorkeakoulukoulutus'
		END as 'Ennusteen koulutusaste'
	FROM  VipunenTK.dbo.f_aloittaneiden_lapaisy f 
	LEFT JOIN dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi 
	LEFT JOIN dbo.d_tarkastelujakso AS d17 ON d17.id = f.tarkastelujakso_id 
	LEFT JOIN dbo.d_koulutuslaji2 AS d6 ON d6.id = f.koulutuslaji2_id 
	LEFT JOIN dbo.d_koulutusluokitus AS d7 ON d7.id = f.koulk_id 
	LEFT JOIN dbo.d_koulutusluokitus d7b ON d7b.koulutusluokitus_avain=coalesce(d7.korvaava_koulutus_koodi,'-1')
	LEFT JOIN dbo.d_lahde AS d10 ON d10.id = f.lahde_id 
	WHERE (f.aineistokoodi = 'K3.9' AND d10.lahde_koodi in ('31','33','34','35','36') AND f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
	AND (d17.tarkastelujakso_koodi = '4' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2012 AND d6.jarjestamistapa = 'opetussuunnitelmaperusteinen koulutus/tutkinto'
	AND coalesce(d7.Koulutusaste_taso2_koodi, d7b.Koulutusaste_taso2_koodi) = '32')) OR
	(f.aineistokoodi = 'K3.10' AND d10.lahde_koodi = '51' AND f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
	AND d17.tarkastelujakso_koodi = '9' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2008 AND (d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112')) OR
	(aineistokoodi = 'K3.10' AND d10.lahde_koodi = '41' AND d6.koulutuslaji2_koodi <> '52' AND [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
	AND d17.tarkastelujakso_koodi = '6,5' AND CAST(LEFT(d1.lukuvuosi,4) as int) >= 2011 AND d7.Koulutusaste_taso2_koodi =  '62')
	GROUP BY COALESCE(NULLIF(d7.Koulutusaste_taso2,'Tuntematon'),d7b.koulutusaste_taso2), COALESCE(NULLIF(d7.iscfi2013_koodi, -1), d7b.iscfi2013_koodi),
			COALESCE(NULLIF(d7.iscfi2013,'Tuntematon'),d7b.iscfi2013), d1.lukuvuosi, d6.koulutuslaji2, CASE 
			WHEN f.aineistokoodi = 'K3.9' THEN 'Ammatillinen koulutus'
			WHEN d6.koulutuslaji2_koodi = '51b' or COALESCE(NULLIF(d7.iscfi2013_koodi,-1),d7b.iscfi2013_koodi) = '0112' THEN 'Yliopistokoulutus'
			ELSE 'Ammattikorkeakoulukoulutus'
		END
) f
UNPIVOT  
   (suoritetut_tutkinnot FOR Tutkintolaji IN   
      ([Alkuperäinen tutkintolaji], [Muu tutkintolaji])  
)AS unpvt

GO

USE [ANTERO]