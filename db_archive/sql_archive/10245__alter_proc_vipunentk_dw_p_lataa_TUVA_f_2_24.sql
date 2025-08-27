USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TUVA_f_2_24]    Script Date: 18.10.2024 16:33:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















ALTER PROCEDURE [dbo].[p_lataa_TUVA_f_2_24] AS

TRUNCATE TABLE  [VipunenTK].[dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24]

INSERT INTO [VipunenTK].[dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24]
SELECT 
       tilastointivuosi = f.[tilv]
      ,[tilv_date]
      ,lahde_avain = f.[lahde]
	  ,lahde_id = ISNULL(d1.id, -2)
      ,koulutuksen_jarjestajakoodi = f.[jarj]
	  ,koulutuksen_jarjestaja_id = coalesce(d2.id,-1)
	  ,koulutuksen_jarjestaja_historia_id = coalesce(d2h.id,-1)
      ,oppilaitoskoodi = f.[tunn]
	  ,oppilaitos_id = coalesce(d3.id,-1)
	  ,oppilaitos_historia_id = coalesce(d3h.id,-1)
      ,tuva_rahoitusjarjestelmakoodi = f.[suunta]
	  ,tuva_rahoitusjarjestelma_id = coalesce(d4.id,-1)
      ,aloitusvuosi = f.[allv]
      ,aloituslukukausi = f.[allk]
      ,[aloituskausikoodi]
	  ,aloituskausikoodi_id = coalesce(d5.kausi_id,-1)
      ,suoritusvuosi = f.[suorv]
      ,suorituslukukausi = f.[suorlk]
      ,[suorituskausikoodi]
	  ,suorituskausikoodi_id = coalesce(d6.kausi_id,-1)
      ,koulutuksen_pituus_kk = f.[tuva_kk]
      ,sukupuolikoodi = f.[sp]
	  ,sukupuoli_id = coalesce(d7.id,-1)
      ,ikaryhma9 = f.[ikar9]
	  ,ikaryhma9_id = coalesce(d8.id,-1)
      ,aidinkieli_versio1 = f.[aikielir1]
	  ,aidinkieli_versio1_id = coalesce(d9.id,-1)
      ,asuinmaakunta = f.[tilvasmaak]
	  ,asuinmaakunta_id = coalesce(d10.id,-1)
      ,asuinmaakuntax = f.[tilvasmaakx]
	  ,asuinmaakuntax_id = coalesce(d11.id,-1)
	  ,uusien_lkm = case when f.[tilv] = f.[allv] then  f.[lkm] else null end
      ,osallistuneiden_lkm = f.[lkm]
	  ,suorittaneiden_lkm = case when suorv = '' then null else f.[lkm] end
      ,f.[tietolahde]
      ,[rivinumero]

  FROM [VipunenTK_DW].[dbo].[sa_2_24_Tuva_osallistuneet_ja_suorittaneet] f

  LEFT JOIN VipunenTK..d_lahde d1 ON d1.lahde_koodi = f.lahde
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain=f.jarj
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain=f.jarj AND f.tilv_date between d2h.alkaa and d2h.paattyy
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.oppilaitos_avain=f.tunn
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d3h ON d3h.oppilaitos_avain=f.tunn AND f.tilv_date between d3h.alkaa and d3h.paattyy

  LEFT JOIN VipunenTK..d_tuva_rahoitusjarjestelma d4 ON d4.rahoitusjarjestelma_koodi = f.suunta
  LEFT JOIN VipunenTK..d_kausi d5 ON d5.kausi_id = f.aloituskausikoodi
  LEFT JOIN VipunenTK..d_kausi d6 ON d6.kausi_id = f.suorituskausikoodi
  LEFT JOIN VipunenTK..d_sukupuoli  AS d7 ON d7.sukupuoli_koodi= f.sp
  LEFT JOIN VipunenTK..d_ika d8 ON d8.ika_avain = f.ikar9
  LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d9 ON d9.aidinkieli_versio1_koodi =f.aikielir1 AND f.tilv_date between d9.alkaa and d9.paattyy
  LEFT JOIN VipunenTK..d_alueluokitus AS d10 ON d10.alueluokitus_avain ='MAAK'+f.tilvasmaak
  LEFT JOIN VipunenTK..d_alueluokitus AS d11 ON d11.alueluokitus_avain ='MAAK'+f.tilvasmaakx




GO


