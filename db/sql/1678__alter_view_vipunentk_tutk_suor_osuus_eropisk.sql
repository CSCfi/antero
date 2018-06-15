USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 12.6.2018 15:19:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO















ALTER VIEW [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] AS

SELECT 

	  [tilv] AS Tilastovuosi
      ,d1.lahde AS [Lähde]
      ,[alvv] AS Aloitusvuosi
      ,d2.koulutuksen_jarjestaja AS [Koulutuksen järjestäjä]
	  ,d2.koulutuksen_jarjestajan_kieli AS [Koul. järjestäjän kieli]
	  ,d2.koulutuksen_jarjestajan_omistajatyyppi AS [Koul. järjestäjän omistajatyyppi]
	  ,d2.koulutuksen_jarjestajan_sijaintikunta AS [Koul. järjestäjän sijaintikunta]
	  --,d3.koulutusala AS Koulutusala
	  ,d8.iscfibroad2013 AS [Koulutusala, taso 1]
	  ,d4.maakunta AS [Koulutuksen maakunta]
	  ,d4.suuralue AS [Koulutuksen suuralue]
	  ,d4.ely AS [Koulutuksen ELY]
	  ,d4.avi AS [Koulutuksen AVI]
      ,CASE WHEN suorv = -1 THEN 'Tuntematon' ELSE CAST([suorv] AS nvarchar(4)) END AS [Tutkinnon suoritusvuosi]
	  --,d5.koulutusala AS [Suor. tutkinnon koulutusala]
	  ,d9.iscfibroad2013 AS [Suor. tutkinnon koulutusala, taso 1]
	  ,d6.suoritettu_tutkinto AS [Suoritettu tutkinto]
	  ,CASE WHEN d8.id = d9.id THEN 'Tutkinto alkuperäisellä koulutusalalla' WHEN d8.id <> d9.id AND d9.id <> -1 THEN 'Tutkinto muulla koulutusalalla' ELSE 'Ei suoritettua tutkintoa' END AS [Tutk. suor. alkup. koulutusalalla]
	  ,d7.tarkastelujakso AS Tarkastelujakso

	  --ruotsi
	  ,[tilv] AS [Statistikår]
      ,d1.lahde_SV AS [Källa]
      ,[alvv] AS [Begynnelseläsår]
      ,d2.koulutuksen_jarjestaja_SV AS [Utbildningsanordnare]
	  ,d2.koulutuksen_jarjestajan_kieli_SV AS [Utbildningsanordnarens språk]
	  ,d2.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Utbildningsanordnaren ägartyp]
	  ,d2.koulutuksen_jarjestajan_sijaintikunta_SV AS [Utbildningsanordnarens kommun]
	  --,d3.koulutusala_SV AS [Utbildningsområde]
	  ,d8.iscfibroad2013_SV AS [Utbildningsområde, nivå 1]
	  ,d4.maakunta_SV AS [Utbildningens landskap]
	  ,d4.suuralue_SV AS [Utbildningens storområde]
	  ,d4.ely_SV AS [Utbildningens NTM-område]
	  ,d4.avi_SV AS [Utbildningens RFV-område]
      ,CASE WHEN suorv = -1 THEN 'Okänd' ELSE CAST([suorv] AS nvarchar(4)) END AS [År då utbildningen avlagts]
	  --,d5.koulutusala_SV AS [Avl. examens utbildningsområde]
	  ,d9.iscfibroad2013_SV AS [Avl. examens utbildningsområde, nivå 1]
	  ,d6.suoritettu_tutkinto_SV AS [Avlagd examen]
	  ,CASE WHEN d8.id = d9.id THEN 'Examina i det ursprungliga utbildningsområde' WHEN d8.id <> d9.id AND d9.id <> -1 THEN 'Examina på andra utbildningsområde' ELSE 'Ingen examina' END AS [Examen avl. på urspr. utbildningsområde]
	  ,d7.tarkastelujakso_SV AS Granskningsperiod

	  --englanti
	  ,[tilv] AS [Statistical year]
      ,d1.lahde_EN AS [Source]
      ,[alvv] AS [First academic year]
      ,d2.koulutuksen_jarjestaja_EN AS [Education provider]
	  ,d2.koulutuksen_jarjestajan_kieli_EN AS [Language of the education provider]
	  ,d2.koulutuksen_jarjestajan_omistajatyyppi_EN AS [Type of education provider]
	  ,d2.koulutuksen_jarjestajan_sijaintikunta_EN AS [Municipality of the education provider]
	  --,d3.koulutusala_EN AS [Field of education]
	  ,d8.iscfibroad2013_EN AS [Field of education, tier 1]
	  ,d4.maakunta_EN AS [Region of education]
	  ,d4.suuralue_EN AS [Major region of education]
	  ,d4.ely_EN AS [ELY area of education]
	  ,d4.avi_EN AS [AVI area of education]
      ,CASE WHEN suorv = -1 THEN 'Unknown' ELSE CAST([suorv] AS nvarchar(4)) END AS [Graduation year]
	  --,d5.koulutusala_EN AS [Qualification's field of education]
	  ,d9.iscfibroad2013_EN AS [Qualification's field of education, tier 1]
	  ,d6.suoritettu_tutkinto_EN AS [Completed qualification]
	  ,CASE WHEN d8.id = d9.id THEN 'Degree from the original field of education' WHEN d8.id <> d9.id AND d9.id <> -1 THEN 'Degree from another field of education' ELSE 'No attained degree' END AS [Completed qualif. in orig. field of education]
	  ,d7.tarkastelujakso_EN AS [Reference period]

      ,[lkm] as lkm_int2

	  --järjestys
	  ,d1.jarjestys
      ,d2.jarjestys_koulutuksenjarjestaja
	  ,d2.jarjestys_koulutuksen_jarjestajan_kieli
	  ,d2.jarjestys_sijaintikunta_koulutuksenjarjestaja
	  ,d2.koulutuksen_jarjestajan_omistajatyyppikoodi
	  --,d3.jarjestys AS jarjestys_koulutusala
	  ,d8.jarjestys_iscfibroad2013 AS jarjestys_koulutusala_taso1
	  ,d4.jarjestys_maakunta
	  ,d4.jarjestys_suuralue
	  ,d4.jarjestys_ely
	  ,d4.jarjestys_avi
	  --,d5.jarjestys AS jarjestys_suoritettu_koulutusala
	  ,d9.jarjestys_iscfibroad2013 AS jarjestys_suoritettu_koulutusala_taso1
	  ,d6.jarjestys AS jarjestys_suoritettu_tutkinto
	  ,d7.jarjestys AS jarjestys_tarkastelujakso
	  ,CASE WHEN d8.id = d9.id THEN 0 WHEN d8.id <> d9.id AND d9.id <> -1 THEN 1 ELSE 2 END AS jarjestys_tutk_suor_alkup_koulutusalalla


  FROM [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] f
  INNER JOIN [VipunenTK].[dbo].[d_lahde] d1 ON d1.id = f.lahde_id
  INNER JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.id = f.oppilaitoksen_taustatiedot_id
  --INNER JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d3 ON d3.id = f.koulutusala_id
  INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] d4 ON d4.id = f.alueluokitus_id
  --INNER JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d5 ON d5.id = f.suoritettu_koulutusala_id
  INNER JOIN [VipunenTK].[dbo].[d_suoritettu_tutkinto] d6 ON d6.id = f.suoritettu_tutkinto_id
  INNER JOIN [VipunenTK].[dbo].[d_tarkastelujakso] d7 ON d7.id = f.tarkastelujakso_id
  INNER JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d8 ON d8.id = f.koulutusala_taso1_id
  INNER JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d9 ON d9.id = f.suoritettu_koulutusala_taso1_id





GO


USE [ANTERO]