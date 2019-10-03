USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 8.2.2018 16:09:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_tab_vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] AS

SELECT 
--Aikamuuttujat
		  'Tilastovuosi' = [tilastovuosi]
--Henkilömuuttujat
		  --,'Asuinalueen AVI' = d1.avi
		  --,'Asuinalueen ELY' = d1.ely
		  ,'Asuinmaakunta' = d1.maakunta

--Koulutusmuuttujat
      ,'Koulutusnimike' = d6.koulutus
	  ,'Opintoala (02 luokitus)' = d6.opintoala2002
	  ,'Koulutusala (95 luok.)' = d6.opintoala1995
	  ,'Koulutusala (02 luok.)' = d6.koulutusala2002
	  ,'Koulutusala, taso 1' = d6.iscfibroad2013
	  ,'Koulutusala, taso 2' = d6.iscfinarrow2013
	  ,'Koulutusala, taso 3' = d6.iscfi2013
	  ,'Koulutusaste, taso 1' = d6.iscle2011
	  ,'Koulutusaste, taso 2' = d6.Koulutusaste_taso2
	  ,'OKM ohjauksen ala, korkeak.' = d6.OKM_ohjauksen_ala

--Järjestykset
	  --,jarjestys_avi = d1.jarjestys_avi
	  --,jarjestys_ely = d1.jarjestys_ely
	  ,jarjestys_maakunta = d1.jarjestys_maakunta
	  ,jarjestys_koulutus = d6.jarjestys
	  ,jarjestys_koulutus_SV = Cast(Case when d6.id = -1 then 'ööö1' when d6.id = -2 then 'ööö2' else left(d6.koulutus_SV,10) end as nvarchar(10))
	  ,jarjestys_koulutus_EN = Cast(Case when d6.id = -1 then 'ööö1' when d6.id = -2 then 'ööö2' else left(d6.koulutus_EN,10) end as nvarchar(10))
	  ,jarjestys_opintoala2002 = d6.jarjestys_opintoala2002
	  ,jarjestys_koulutusala1995 = d6.jarjestys_opintoala1995
	  ,jarjestys_koulutusala2002 = d6.jarjestys_koulutusala2002
	  ,jarjestys_Koulutusala_taso1 = d6.jarjestys_iscfibroad2013
	  ,jarjestys_Koulutusala_taso2 = d6.jarjestys_iscfinarrow2013
	  ,jarjestys_Koulutusala_taso3 = d6.jarjestys_iscfi2013
	  ,jarjestys_Koulutusaste_taso1 = d6.jarjestys_iscle2011
	  ,jarjestys_Koulutusaste_taso2 = d6.jarjestys_koulutusaste_taso2
	  ,jarjestys_okm_ohjauksenala = d6.jarjestys_OKM_ohjauksen_ala

--Koodit
	  ,[Koodit Asuinmaakunta] = d1.maakunta_koodi
	  ,[Koodit Koulutuskoodi] = d6.koulutus_koodi
	  ,[Koodit Opintoala (02 luokitus)] = d6.opintoala2002_koodi
	  ,[Koodit Koulutusala (95 luokitus)] = d6.opintoala1995_koodi
	  ,[Koodit Koulutusala (02 luokitus)] = d6.koulutusala2002_koodi
	  ,[Koodit Koulutusala taso 1] = d6.iscfibroad2013_koodi
	  ,[Koodit Koulutusala taso 2] = d6.iscfinarrow2013_koodi
	  ,[Koodit Koulutusala taso 3] = d6.iscfi2013_koodi
	  ,[Koodit Koulutusaste taso 1] = d6.iscle2011_koodi
	  ,[Koodit Koulutusaste taso 2] = d6.Koulutusaste_taso2_koodi
	  ,[Koodit OKM ohjauksen ala, korkeak.] = d6.OKM_ohjauksen_ala_koodi

--Lukumäärämuuttujat
      ,'Sisäänmuuttaneiden lkm' = f.sisaanmuutto
      ,'Ulosmuuttaneiden lkm' = f.ulosmuutto

--RUOTSI
--Aikamuuttujat
		  ,'Statistikår' = [tilastovuosi]
--Henkilömuuttujat
		  --,'Bostadsortens RFV-område' = d1.avi_SV
		  --,'Bostadsortens NTM-område' = d1.ely_SV
		  ,'Bostadslandskap' = d1.maakunta_SV
--Koulutusmuuttujat
      ,'Utbildningsbenämning' = d6.koulutus_SV
	  ,'Studieområde (2002)' = d6.opintoala2002_SV
	  ,'Utbildningsområde (1995)' = d6.opintoala1995_SV
	  ,'Utbildningsområde (2002)' = d6.koulutusala2002_SV
	  ,'Utbildn.område, nivå 1' = d6.iscfibroad2013_SV
	  ,'Utbildn.område, nivå 2' = d6.iscfinarrow2013_SV
	  ,'Utbildn.område, nivå 3' = d6.iscfi2013_SV
	  ,'Utbildn.nivå, nivå 1' = d6.iscle2011_SV
	  ,'Utbildn.nivå, nivå 2' = d6.Koulutusaste_taso2_SV
	  ,'UKM-styrningsområde högskolor' = d6.OKM_ohjauksen_ala_SV

--ENGLANTI
--Aikamuuttujat
		  ,'Statistical year' = [tilastovuosi]
--Henkilömuuttujat
		  --,'AVI area of the place of residence' = d1.avi_EN
		  --,'ELY area of the place of residence' = d1.ely_EN
		  ,'Region of residence ' = d1.maakunta_EN
--Koulutusmuuttujat
      ,'Name of education' = d6.koulutus_EN
	  ,'Subfield of education (2002)' = d6.opintoala2002_EN
	  ,'Field of education (1995)' = d6.opintoala1995_EN
	  ,'Field of education (2002)' = d6.koulutusala2002_EN
	  ,'Field of ed. tier 1' = d6.iscfibroad2013_EN
	  ,'Field of ed. tier 2' = d6.iscfinarrow2013_EN
	  ,'Field of ed. tier 3' = d6.iscfi2013_EN
	  ,'Level of ed. tier 1' = d6.iscle2011_EN
	  ,'Level of ed. tier 2' = d6.Koulutusaste_taso2_EN
	  ,'Field of ed. HE steering' = d6.OKM_ohjauksen_ala_EN

FROM VipunenTK.[dbo].[f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] f
  LEFT JOIN VipunenTK.[dbo].d_alueluokitus d1
    ON d1.id = f.[asuinmaakunta_id]
  LEFT JOIN VipunenTK.[dbo].d_koulutusluokitus d6
    ON d6.id = f.[koulutusluokitus_id]



GO

USE [ANTERO]