USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_3_1a]    Script Date: 7.8.2018 13:49:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_f_3_1a] AS

truncate table   [VipunenTK].[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]

insert into  [VipunenTK].[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]

--sel
SELECT
	 tilastointivuosi = f.tilastointivuosi
	,tilv_date = f.tilv_date
	,oppisryh = f.oppisryh
	,oppisryh_id = coalesce(d1.id,-1)
	,sukupuoli = f.sukupuoli
	,sukupuoli_id = coalesce(d2.id,-1)
	,aidinkieli_versio1 = f.aidinkieli_versio1
	,aidinkieli_versio1_id = coalesce(d3.id,-1)
	,ika = f.ika
	,ika_id = coalesce(d4.id,-1)
	,opetushallinnon_koulutusala= f.opetushallinnon_koulutusala
	,opetushallinnon_koulutusala_id = coalesce(d5.id,-1)
	,opetushallinnon_koulutusaste= f.opetushallinnon_koulutusaste
	,opetushallinnon_koulutusaste_id = coalesce(d6.id,-1)
	,koulutusala_taso_1=f.koulutusala_taso_1_avain
	,koulutuala_taso_1_id=coalesce(d11.id,-1)
	,koulutusaste_taso_2=f.koulutusaste_taso_2_avain
	,koulutusaste_taso_2_id=coalesce(d12.id,-1)
	,ammatillisen_koulutuksen_koulutuslaji= f.ammatillisen_koulutuksen_koulutuslaji
	,ammatillisen_koulutuksen_koulutuslaji_id = coalesce(d7.id,-1)
	,koulutuksen_sijaintimaakunta= f.koulutuksen_sijaintimaakunta
	,koulutuksen_sijaintimaakunta_id = coalesce(d8.id,-1)
	,paaasiallinen_toiminta_versio3= f.paaasiallinen_toiminta_versio3
	,paaasiallinen_toiminta_versio3_id = coalesce(d9.id,-1)
	,ammattiasema= f.ammattiasema
	,ammattiasema_id = coalesce(d10.id,-1)
    ,opiskelijat = f.opiskelijat
    ,tietolahde = f.tietolahde
    ,rivinumero = f.rivinumero
    
    --frm
FROM [VipunenTK_DW].[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] f
LEFT JOIN VipunenTK..d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet  AS d1 ON d1.oppis_osallis_ja_tutk_suor_koodi=f.oppisryh AND f.tilv_date between d1.alkaa and d1.paattyy

LEFT JOIN VipunenTK..d_sukupuoli AS d2 ON d2.id  = f.sukupuoli

LEFT JOIN VipunenTK..d_aidinkieli_versio1  AS d3 ON d3.aidinkieli_versio1_koodi =f.aidinkieli_versio1 AND f.tilv_date between d3.alkaa and d3.paattyy

LEFT JOIN VipunenTK..d_ika    AS d4 ON d4.ika_avain    = f.ika

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d5 ON d5.koulutusluokitus_avain ='OPMALA'+f.opetushallinnon_koulutusala

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d6 ON d6.koulutusluokitus_avain ='OPMAST'+f.opetushallinnon_koulutusaste

LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d7 ON d7.ammatillisen_koulutuksen_koulutuslaji_koodi = f.ammatillisen_koulutuksen_koulutuslaji

LEFT JOIN VipunenTK..d_alueluokitus   AS d8 ON d8.alueluokitus_avain ='MAAK'+f.koulutuksen_sijaintimaakunta

LEFT JOIN VipunenTK..d_paaasiallinen_toiminta AS d9 ON d9.paaasiallinen_toiminta_koodi  = f.paaasiallinen_toiminta_versio3

LEFT JOIN VipunenTK..d_ammattiasema AS d10 ON d10.ammattiasema_koodi  = f.ammattiasema

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d11 ON d11.koulutusluokitus_avain =f.koulutusala_taso_1_avain

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d12 ON d12.koulutusluokitus_avain =f.koulutusaste_taso_2_avain
GO

USE[ANTERO]