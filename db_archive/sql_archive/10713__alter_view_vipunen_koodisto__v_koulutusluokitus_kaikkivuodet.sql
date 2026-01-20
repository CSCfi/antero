USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[_v_koulutusluokitus_kaikkivuodet]    Script Date: 26.3.2025 16.30.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[_v_koulutusluokitus_kaikkivuodet] AS

-- Palauta koulutusluokituksen eri tilastovuosien koodit yhdessä taulussa
-- Jarmo 14.3.2014
-- Select * from Vipunen_koodisto.dbo.[_v_koulutusluokitus_kaikkivuodet]
-- Select * from Vipunen_koodisto.dbo.[_v_koulutusluokitus_kaikkivuodet] where tilv in ('2014')

-- Jarmo 25.9.2015
-- lisätty uudet kentät luokitukseen
-- selitteet on lisätty kolmelle kielelle
--  nyt kentille on vain englanninkieliset selitteet. Kun suomen- ja ruotsinkieliset tulevat tarjolle, tieto haetaan niistä.
-- 2015 ja 2014 dataan
 	   --,[iscfibroad2013]
	   --,[iscleni2011]
	   --,[iscleni2011_r] = [iscleni2011]
	   --,[iscleni2011_e] = [iscleni2011]
	   --,[isccat2011]
	   --,[isccatni2011]
	   --,[isccatni2011_r] = [isccatni2011]
	   --,[isccatni2011_e] = [isccatni2011]
	   --,[iscsubcat2011]
	   --,[iscsubcatni2011]
	   --,[iscsubcatni2011_r] = [iscsubcatni2011]
	   --,[iscsubcatni2011_e] = [iscsubcatni2011]
-- vain 2015 dataan
	   --,[iscfi2013]
	   --,[iscfini2013]
	   --,[iscfini2013_r] = [iscfini2013]
	   --,[iscfini2013_e] = [iscfini2013]
	   --,[iscfinarrow2013]
	   --,[iscfinarrowni2013]
	   --,[iscfinarrowni2013_r] = [iscfinarrowni2013]
	   --,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   --,[iscfibroad2013]
	   --,[iscfibroadni2013]
	   --,[iscfibroadni2013_r] = [iscfibroadni2013]
	   --,[iscfibroadni2013_e] = [iscfibroadni2013]
-- vanhoihin tauluihin tiedot on lisätty tutnemattomina

-- Jarmo 2.6.2016
-- lisätty uusia kenttä 
--   kaste_taso1 (iscle) SV ja FI 
--   kaste_taso2 kokonaan
--   kala taso1 (iscfibroad) SV ja FI
--   kala taso2 (iscfinarrow) SV ja FI
--   kala taso3 (iscfi) SV ja FI



SELECT 
    [koulutuskoodi] = CAST (KaikkiVuodet.koulutuskoodi AS nvarchar (255)) 
	,[alkaa] = CAST (tilv+'-01-01' AS datetime2(7))
	,[paattyy] = NULL
	,[tilv] = CAST (KaikkiVuodet.tilv AS nvarchar(4)) 
	,[koulutusselite_FI] = ISNULL (CAST (KaikkiVuodet.selite_FI AS nvarchar (255)),'Tuntematon')
	,[koulutuslyhytselite_FI] = KaikkiVuodet.lyhytselite_FI
	,[koulutusselite_SV] =ISNULL (CAST (KaikkiVuodet.selite_SV AS nvarchar (255)),'Information saknas')
	,[koulutuslyhytselite_SV] = KaikkiVuodet.lyhytselite_SV
	,[koulutusselite_EN] = ISNULL (CAST (KaikkiVuodet.selite_EN AS nvarchar (255)),'Missing data')
	,[koulutuslyhytselite_EN] = KaikkiVuodet.lyhytselite_EN
	,[tasokoodi] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar (5)),'')
	--,[tasoselite_FI] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), 'Tieto puuttuu')
    --,[tasoselite_SV] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), 'Information saknas')
    --,[tasoselite_EN] = ISNULL (CAST (KaikkiVuodet.taso AS nvarchar(255)), 'Missing data')
	,[koulutusala_tkkoodi] = KaikkiVuodet.kala
	,[koulutusala_tkselite_FI] = ISNULL (CAST (KaikkiVuodet.kalanimi AS nvarchar(255)),'Tuntematon')
	--,[kalalnimi] = KaikkiVuodet.kalalnimi
	,[koulutusala_tkselite_SV] = ISNULL (CAST (KaikkiVuodet.kalanimi_r  AS nvarchar(255)),'Information saknas') 
	--,[kalalnimi_r] = KaikkiVuodet.kalalnimi_r
	,[koulutusaste_tkkoodi] = KaikkiVuodet.kaste
	,[koulutusaste_tkselite_FI] = ISNULL (CAST (KaikkiVuodet.kastenimi AS nvarchar(255)),'Tuntematon')
	,[koulutusaste_tkselite_SV] = ISNULL (CAST (KaikkiVuodet.kastenimi_r AS nvarchar(255)),'Information saknas')
	--,[opmastlni] = KaikkiVuodet.opmastlni
	--,[opm95alalni] = KaikkiVuodet.opm95alalni
	,[isclekkoodi] = Case when KaikkiVuodet.isclek='' then '-1' else Right('00'+KaikkiVuodet.isclek,2) end --5.12.2014 Jarmo CSC Lisätään etunollat ja muutetaan tyhjä tuntemattomaksi
	,[isclekselite_FI] = ISNULL (CAST ((SELECT top 1 selite_FI FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Tuntematon') 
	,[isclekselite_SV] = ISNULL (CAST ((SELECT top 1 selite_SV FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
	,[isclekselite_EN] = ISNULL (CAST ((SELECT top 1 selite_EN FROM VipunenTK_lisatiedot.dbo.iscle k WHERE k.iscle = KaikkiVuodet.iscle AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[isclekoodi] = KaikkiVuodet.iscle
	,[iscfikkoodi] = Case when KaikkiVuodet.iscfik='' then '-1' else KaikkiVuodet.iscfik end --5.12.2014 Jarmo CSC Muutetaan tyhjä tuntemattomaksi
	,[iscdekoodi]  = KaikkiVuodet.iscde
	,[iscdeselite_FI] = ISNULL (CAST ((SELECT top 1 selite_FI FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Tuntematon')
	,[iscdeselite_SV] = ISNULL (CAST ((SELECT top 1 selite_SV FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
	,[iscdeselite_EN] = ISNULL (CAST ((SELECT top 1 selite_EN FROM VipunenTK_lisatiedot.dbo.iscde k WHERE k.iscde = KaikkiVuodet.iscde AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[iscorkoodi] = KaikkiVuodet.iscor
	,[iscornimi_FI] = ISNULL (CAST ((SELECT top 1 selite_FI FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Tuntematon')
	,[iscornimi_SV] = ISNULL (CAST ((SELECT top 1 selite_SV FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
	,[iscornimi_EN] = ISNULL (CAST ((SELECT top 1 selite_EN FROM VipunenTK_lisatiedot.dbo.iscor k WHERE k.iscor = KaikkiVuodet.iscor AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[iscstkoodi] = CAST (KaikkiVuodet.iscst AS nvarchar(255))
	,[iscstselite_FI] = ISNULL (CAST ((SELECT top 1 selite_FI FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Tuntematon')
	,[iscstselite_SV] = ISNULL (CAST ((SELECT top 1 selite_SV FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
	,[iscstselite_EN] = ISNULL (CAST ((SELECT top 1 selite_EN FROM VipunenTK_lisatiedot.dbo.iscst k WHERE k.iscst = KaikkiVuodet.iscst AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[iscdukoodi] = CAST (KaikkiVuodet.iscdu AS nvarchar(255))
	,[iscduselite_FI] = ISNULL (CAST ((SELECT top 1 selite_FI FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Tuntematon')
    ,[iscduselite_SV] = ISNULL (CAST ((SELECT top 1 selite_SV FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
    ,[iscduselite_EN] = ISNULL (CAST ((SELECT top 1 selite_EN FROM VipunenTK_lisatiedot.dbo.iscdu k WHERE k.iscdu = KaikkiVuodet.iscdu AND CAST (tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[tietolahde] = ISNULL (CAST (KaikkiVuodet.tietolahde AS nvarchar(50)),'Manuaalinen') 
	,[korvaavakoodi] = ISNULL (KaikkiVuodet.korvaavakoodi,'')
    ,[iscleselite_FI] = ISNULL (CAST (KaikkiVuodet.iscleknim AS nvarchar(255)),'Tuntematon')
    ,[iscleselite_SV] = ISNULL (CAST ('*SV*' + KaikkiVuodet.iscleknim AS nvarchar(255)),'Information saknas')
    ,[iscleselite_EN] = ISNULL (CAST (' *EN*' + KaikkiVuodet.iscleknim AS nvarchar(255)),'Missing data')
    ,[iscfikselite_FI] = Case when KaikkiVuodet.iscfiknim='' then 'Tuntematon' else ISNULL (CAST (KaikkiVuodet.iscfiknim AS nvarchar(255)),'Tuntematon') end
    ,[iscfikselite_SV] = Case when KaikkiVuodet.iscfiknim='' then 'Information saknas' else ISNULL (CAST ('*SV*' + KaikkiVuodet.iscfiknim AS nvarchar(255)),'Information saknas') end
    ,[iscfikselite_EN] = Case when KaikkiVuodet.iscfiknim='' then 'Missing data' else ISNULL (CAST ('*EN*' + KaikkiVuodet.iscfiknim AS nvarchar(255)),'Missing data') end
    ,[koulutusala_tkselite_EN] = ISNULL (CAST ('*EN*' + KaikkiVuodet.kalanimi AS nvarchar(255)),'Missing data')
    ,[koulutusaste_tkselite_EN] = ISNULL (CAST ('*EN*' + KaikkiVuodet.kastenimi AS nvarchar(255)),'Missing data')
    ,[koulutusala2002koodi] = ISNULL(CAST (NULLIF(KaikkiVuodet.opmala,'') AS nvarchar(2)),'-1')
    ,[koulutusala2002selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opmalani,'') AS nvarchar(255)),'Tuntematon')
    ,[koulutusala2002selite_SV] = ISNULL (CAST ((SELECT koulutusala_2002_SV FROM VipunenTK_lisatiedot.dbo.koulutusala2002 k WHERE k.koulutusala_2002koodi=KaikkiVuodet.opmala AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas') 
    ,[koulutusala2002selite_EN] = ISNULL (CAST ((SELECT koulutusala_2002_EN FROM VipunenTK_lisatiedot.dbo.koulutusala2002 k WHERE k.koulutusala_2002koodi=KaikkiVuodet.opmala AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data') 
    ,[opintoala2002koodi] = ISNULL(CAST (NULLIF(KaikkiVuodet.opmopa,'') AS nvarchar(3)),'-1')
	,[opintoala2002selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opmopani,'') AS nvarchar(255)),'Tuntematon')
    ,[opintoala2002selite_SV] = ISNULL (CAST ((SELECT opintoala2002_SV FROM VipunenTK_lisatiedot.dbo.opintoala2002 k WHERE k.opintoala2002_koodi=KaikkiVuodet.opmopa AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas') 
    ,[opintoala2002selite_EN] = ISNULL (CAST ((SELECT opintoala2002_EN FROM VipunenTK_lisatiedot.dbo.opintoala2002 k WHERE k.opintoala2002_koodi=KaikkiVuodet.opmopa AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data') 
   	,[koulutusaste2002koodi] = ISNULL(CAST(NULLIF(KaikkiVuodet.opmast,'') AS nvarchar(2)),'-1')
    ,[koulutusaste2002selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opmastni,'') AS nvarchar(255)),'Tuntematon')
    ,[koulutusaste2002selite_SV] = ISNULL (CAST ((SELECT koulutusaste_2002_SV FROM VipunenTK_lisatiedot.dbo.koulutusaste_2002 k WHERE k.koulutusaste_2002koodi=KaikkiVuodet.opmast AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas')
    ,[koulutusaste2002selite_EN] = ISNULL (CAST ((SELECT koulutusaste_2002_EN FROM VipunenTK_lisatiedot.dbo.koulutusaste_2002 k WHERE k.koulutusaste_2002koodi=KaikkiVuodet.opmast AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data')
	,[koulutusala1995koodi] = ISNULL(CAST (NULLIF(KaikkiVuodet.opm95ala,'') AS nvarchar(2)),'-1')
    ,[koulutusala1995selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opm95alani,'') AS nvarchar(255)),'Tuntematon')
    ,[koulutusala1995selite_SV] = ISNULL (CAST ('*SV*' + KaikkiVuodet.opm95alani AS nvarchar(255)),'Information saknas')
    ,[koulutusala1995selite_EN] = ISNULL (CAST ('*EN*' + KaikkiVuodet.opm95alani AS nvarchar(255)),'Missing data')
    ,[opintoala1995koodi] = ISNULL(CAST (NULLIF(KaikkiVuodet.opm95opa,'') AS nvarchar(2)),'-1')
    ,[opintoala1995selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opm95opani,'') AS nvarchar(255)),'Tuntematon')
    ,[opintoala1995selite_SV] = ISNULL (CAST ((SELECT opintoala_1995_SV FROM VipunenTK_lisatiedot.dbo.opintoala1995 k WHERE k.opintoala_1995koodi=KaikkiVuodet.opm95opa AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Information saknas') 
    ,[opintoala1995selite_EN] = ISNULL (CAST ((SELECT opintoala_1995_EN FROM VipunenTK_lisatiedot.dbo.opintoala1995 k WHERE k.opintoala_1995koodi=KaikkiVuodet.opm95opa AND CAST(tilv+'-01-01' AS datetime2(7)) BETWEEN k.alkaa AND k.paattyy) AS nvarchar(255)),'Missing data') 
    ,[koulutusaste1995koodi] = ISNULL(CAST (NULLIF(KaikkiVuodet.opm95ast,'') AS nvarchar(2)),'-1')
    ,[koulutusaste1995selite_FI] = ISNULL (CAST (NULLIF(KaikkiVuodet.opm95astni,'') AS nvarchar(255)),'Tuntematon')
    ,[koulutusaste1995selite_SV] = ISNULL (CAST ('*SV*' + NULLIF(KaikkiVuodet.opm95astni,'') AS nvarchar(255)),'Information saknas')
    ,[koulutusaste1995selite_EN] = ISNULL (CAST ('*EN*' + NULLIF(KaikkiVuodet.opm95astni,'') AS nvarchar(255)),'Missing data')
    ,[olokoodi] = ISNULL (CAST (KaikkiVuodet.olokoodi AS nvarchar(255)),'Tuntematon')
    ,[lakkautusvuosi] = ISNULL (CAST (KaikkiVuodet.lakkv AS nvarchar(255)),'Tuntematon')
    ,[korvaava_koulutuskoodi] = ISNULL (CAST (KaikkiVuodet.korvkoulk AS nvarchar(6)),'')
    ,[muutosvuosi] = ISNULL (CAST (KaikkiVuodet.nmuutosv AS nvarchar(255)),'Tuntematon')
	,[iscle2011koodi] = CAST (KaikkiVuodet.iscle2011 AS nvarchar(255))
	,[iscle2011selite_FI] = case KaikkiVuodet.iscleni2011 when 'Bachelors or equivalent level' then 'Bachelor''s or equivalent level' when 'Masters or equivalent level' then 'Master''s or equivalent level' else ISNULL (CAST (KaikkiVuodet.iscleni2011 AS nvarchar(255)),'Tuntematon') end
	,[iscle2011selite_SV] = case KaikkiVuodet.iscleni2011_r when 'Bachelors or equivalent level' then 'Bachelor''s or equivalent level' when 'Masters or equivalent level' then 'Master''s or equivalent level' else ISNULL (CAST (KaikkiVuodet.iscleni2011_r AS nvarchar(255)),'Information saknas') end	
	,[iscle2011selite_EN] = case KaikkiVuodet.iscleni2011_e when 'Bachelors or equivalent level' then 'Bachelor''s or equivalent level' when 'Masters or equivalent level' then 'Master''s or equivalent level' else ISNULL (CAST (KaikkiVuodet.iscleni2011_e AS nvarchar(255)),'Missing data') end
	,[isccat2011koodi] = CAST (KaikkiVuodet.isccat2011 AS nvarchar(255))
	,[isccat2011selite_FI] = ISNULL (CAST (KaikkiVuodet.isccatni2011 AS nvarchar(255)),'Tuntematon')
	,[isccat2011selite_SV] = ISNULL (CAST (KaikkiVuodet.isccatni2011_r AS nvarchar(255)),'Information saknas')
	,[isccat2011selite_EN] = ISNULL (CAST (KaikkiVuodet.isccatni2011_e AS nvarchar(255)),'Missing data')
	,[iscsubcat2011koodi] = CAST (KaikkiVuodet.iscsubcat2011 AS nvarchar(255))
	,[iscsubcat2011selite_FI] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011 AS nvarchar(255)),'Tuntematon')
	,[iscsubcat2011selite_SV] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011_r AS nvarchar(255)),'Information saknas')
	,[iscsubcat2011selite_EN] = ISNULL (CAST (KaikkiVuodet.iscsubcatni2011_e AS nvarchar(255)),'Missing data')
	,[iscfi2013koodi] = CAST (KaikkiVuodet.iscfi2013 AS nvarchar(255))
	,[iscfi2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfini2013 AS nvarchar(255)),'Tuntematon')
	,[iscfi2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfini2013_r AS nvarchar(255)),'Information saknas')
	,[iscfi2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfini2013_e AS nvarchar(255)),'Missing data')
	,[iscfinarrow2013koodi] = CAST (KaikkiVuodet.iscfinarrow2013 AS nvarchar(255))
	,[iscfinarrow2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013 AS nvarchar(255)),'Tuntematon')
	,[iscfinarrow2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013_r AS nvarchar(255)),'Information saknas')
	,[iscfinarrow2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfinarrowni2013_e AS nvarchar(255)),'Missing data')
	,[iscfibroad2013koodi] = CAST (KaikkiVuodet.iscfibroad2013 AS nvarchar(255))
	,[iscfibroad2013selite_FI] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013 AS nvarchar(255)),'Tuntematon')
	,[iscfibroad2013selite_SV] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013_r AS nvarchar(255)),'Information saknas')
	,[iscfibroad2013selite_EN] = ISNULL (CAST (KaikkiVuodet.iscfibroadni2013_e AS nvarchar(255)),'Missing data')
	,[kaste_t2koodi] = ISNULL(CAST (KaikkiVuodet.kaste_t2 AS nvarchar(255)),'-1')
	,[kaste_t2_FI] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni] AS nvarchar(255)),'Tuntematon')
	,[kaste_t2_SV] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni_sv] AS nvarchar(255)),'Information saknas')
	,[kaste_t2_EN] = ISNULL (CAST (KaikkiVuodet.[kaste_t2ni_en] AS nvarchar(255)),'Missing data')

    --,[jarjestys] = ''
    --,[jarjestys_taso] = ''
    --,[jarjestys_koulutusala_tk] = ''
    --,[jarjestys_koulutusaste_tk] = ''
    --,[jarjestys_koulutusala2002] = ''
    --,[jarjestys_opintoala2002] = ''
    --,[jarjestys_koulutusaste2002] = ''
    --,[jarjestys_koulutusala1995] = ''
    --,[jarjestys_opintoala1995] = ''
    --,[jarjestys_koulutusaste1995] = ''
    --,[jarjestys_isclek] = ''
    --,[jarjestys_iscle] = ''
    --,[jarjestys_iscfik] = ''
    --,[jarjestys_iscde] = ''
    --,[jarjestys_iscor] = ''
    --,[jarjestys_iscst] = ''
    --,[jarjestys_iscdu] = ''
--INTO dbo._koulutusluokitus_vainkoulutuskoodit
FROM(

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv] = '2000'
  FROM [Vipunen_koodisto].[koodisto_2000].[koulutusluokitus] d
  where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2001'
  FROM [Vipunen_koodisto].[koodisto_2001].[koulutusluokitus] d
  where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2002'
  FROM [Vipunen_koodisto].[koodisto_2002].[koulutusluokitus] d
  where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2003'
  FROM [Vipunen_koodisto].[koodisto_2003].[koulutusluokitus] d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2004'
  FROM [Vipunen_koodisto].[koodisto_2004].[koulutusluokitus] d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2005'
  FROM [Vipunen_koodisto].[koodisto_2005].[koulutusluokitus] d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'  

UNION ALL
 
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2006'
  FROM [Vipunen_koodisto].[koodisto_2006].[koulutusluokitus] d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL
  
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2007'
  FROM [Vipunen_koodisto].[koodisto_2007].[koulutusluokitus]  d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL
  
SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2008'
  FROM [Vipunen_koodisto].[koodisto_2008].[koulutusluokitus] d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'
UNION ALL

SELECT [koulutuskoodi]
	   ,[alkaa]
	   ,[paattyy]
	   ,[korvaavakoodi]
	   ,[taso]
	   ,[selite_FI]
	   ,[lyhytselite_FI]
	   ,[selite_SV]
	   ,[lyhytselite_SV]
	   ,[selite_EN]
	   ,[lyhytselite_EN]
	   ,[kala]
	   ,ISNULL((select[kalanimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi
	   ,ISNULL((select[kalalnimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi
	   ,ISNULL((select[kalanimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalanimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalanimi_r
	   ,ISNULL((select[kalalnimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.kalalnimi_r from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kala=d.kala)) as kalalnimi_r
	   ,[kaste]
	   ,ISNULL((select[kastenimi]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi
	   ,ISNULL((select[kastenimi_r]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[kastenimi_r] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.kaste=d.kaste)) as kastenimi_r
	   ,[opmala]
	   ,ISNULL((select[opmalani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalani
	   ,ISNULL((select[opmalalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmalalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmala=d.opmala)) as opmalalni
	   ,[opmopa]
	   ,ISNULL((select[opmopani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopani
	   ,ISNULL((select[opmopalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmopalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmopa=d.opmopa)) as opmopalni
	   ,[opmast] 
	   ,ISNULL((select[opmastni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastni
	   ,ISNULL((select[opmastlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opmastlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opmast=d.opmast)) as opmastlni
	   ,[opm95ala]
	   ,ISNULL((select[opm95alani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alani
	   ,ISNULL((select[opm95alalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95alalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ala=d.opm95ala)) as opm95alalni
	   ,[opm95opa]
	   ,ISNULL((select[opm95opani]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opani] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opani
	   ,ISNULL((select[opm95opalni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95opalni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95opa=d.opm95opa)) as opm95opalni
	   ,[opm95ast]
	   ,ISNULL((select[opm95astni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astni
	   ,ISNULL((select[opm95astlni]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[opm95astlni] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.opm95ast=d.opm95ast)) as opm95astlni
	   ,[isclek]
	   ,[iscle]
	   ,ISNULL((select[iscleknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscleknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.isclek=d.isclek)) as iscleknim
	   ,[iscfik]
	   ,ISNULL((select[iscfiknim]FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]as s where s.[koulk] = [koulutuskoodi]),(select top 1 k.[iscfiknim] from [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus] k where k.iscfik=d.iscfik)) as iscfiknim
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti]
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = korvaavakoodi
	   ,[nmuutosv] = NULL
       ,[tilv]= '2009'
  FROM [Vipunen_koodisto].[koodisto_2009].[koulutusluokitus]  d
    where koulutuskoodi ! = '-1' and
  koulutuskoodi != '-2'

UNION ALL

SELECT  [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi] = NULL
	   ,[lakkv] = NULL
	   ,[korvkoulk] = NULL
	   ,[nmuutosv] = NULL
	   ,[tilv]= '2010'
  FROM [Vipunen_koodisto].[koodisto_2010].[koulutusluokitus]
    where [koulk] != '-1' and
  [koulk] != '-2'

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv]= '2011'
  FROM [Vipunen_koodisto].[koodisto_2011].[koulutusluokitus]  
    where [koulk]  ! = '-1' and
  [koulk] != '-2'
  
  
 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = NULL
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011] = NULL
	   ,[isccatni2011] = NULL
	   ,[isccatni2011_r] = NULL
	   ,[isccatni2011_e] = NULL
	   ,[iscsubcat2011] = NULL
	   ,[iscsubcatni2011] = NULL
	   ,[iscsubcatni2011_r] = NULL
	   ,[iscsubcatni2011_e] = NULL
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde]
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv]= '2012'
  FROM [Vipunen_koodisto].[koodisto_2012].[koulutusluokitus]  
    where [koulk]  ! = '-1' and
  [koulk] != '-2'

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
-- CSC Jarmo 30.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä kannattaa purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscfibroad2013]
	   ,[iscleni2011]
	   ,[iscleni2011_r] = [iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011] */
	   ,[iscfibroad2013] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde] = 'TK_6_5_sopv_14'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2013
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_14
    where [koulk]  ! = '-1' and
  [koulk] != '-2'

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
-- CSC Jarmo 30.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä kannattaa purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscfibroad2013]
	   ,[iscleni2011]
	   ,[iscleni2011_r] = [iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011] */
	   ,[iscle2011] = NULL
	   ,[iscleni2011] = NULL
	   ,[iscleni2011_r] = NULL
	   ,[iscleni2011_e] = NULL
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
-- CSC Jarmo 29.8.2016
-- Aiemmin tuli vain englanninkielinen selite ja se monistettiin kaikkiin kieliin.
-- Tämä pitää purkaa kokonaan, jotta samalle koodille ei tule monenkielisiä selitteitä.
/*	   ,[iscfi2013]
	   ,[iscfini2013]
	   ,[iscfini2013_r] = [iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013]
	   ,[iscfinarrowni2013_r] = [iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013]
	   ,[iscfibroadni2013_r] = [iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013] */
	   ,[iscfi2013] = NULL
	   ,[iscfini2013] = NULL
	   ,[iscfini2013_r] = NULL
	   ,[iscfini2013_e] = NULL
	   ,[iscfinarrow2013] = NULL
	   ,[iscfinarrowni2013] = NULL
	   ,[iscfinarrowni2013_r] = NULL
	   ,[iscfinarrowni2013_e] = NULL
	   ,[iscfibroad2013] = NULL
	   ,[iscfibroadni2013] = NULL
	   ,[iscfibroadni2013_r] = NULL
	   ,[iscfibroadni2013_e] = NULL
	   ,[kaste_t2] = NULL
	   ,[kaste_t2ni] = NULL
	   ,[kaste_t2ni_sv] = NULL
	   ,[kaste_t2ni_en] = NULL
	   ,[tietolahde] = 'TK_6_5_sopv_15'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2014
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_15
    where [koulk]  ! = '-1' and
  [koulk] != '-2'

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi]
	   ,[rnimi]
	   ,[rlnimi]
	   ,[enimi]
	   ,[elnimi]
	   ,[kala]
	   ,[kalanimi]
	   ,[kalalnimi]
	   ,[kalanimi_r]
	   ,[kalalnimi_r]
	   ,[kaste]
	   ,[kastenimi]
	   ,[kastenimi_r]
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni]
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni]
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni]
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni]
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni]
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni]
	   ,[isclek]
	   ,[iscle]
	   ,[iscleknim]
	   ,[iscfik]
	   ,[iscfiknim]
	   ,[iscde]
	   ,[iscor]
	   ,[iscst]
	   ,[iscdu]
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_16b'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2015
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_16b
    where [koulk]  ! = '-1' and
  [koulk] != '-2'

 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni] = NULL
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni] = NULL
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni] = NULL
	   ,[opm95ala]
	   ,[opm95alani]
	   ,[opm95alalni] = NULL
	   ,[opm95opa]
	   ,[opm95opani]
	   ,[opm95opalni] = NULL
	   ,[opm95ast]
	   ,[opm95astni]
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_17'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2016
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_17
    where [koulk]  ! = '-1' and
  [koulk] != '-2'


 UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni] = NULL
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni] = NULL
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_18'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2017
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_18
    where [koulk]  ! = '-1' and
  [koulk] != '-2'
  
UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni] = NULL
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni] = NULL
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_19'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2018
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_19
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala]
	   ,[opmalani]
	   ,[opmalalni] = NULL
	   ,[opmopa]
	   ,[opmopani]
	   ,[opmopalni] = NULL
	   ,[opmast]
	   ,[opmastni]
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_20'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --2019
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala] = (select opmala FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk)
	   ,[opmalani] = (select opmalani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmalalni] = NULL
	   ,[opmopa] = (select opmopa FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopani] = (select opmopani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopalni] = NULL
	   ,[opmast] = (select opmast FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastni] = (select opmastni FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_21'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --[N-1]
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_21 f
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala] = (select opmala FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk)
	   ,[opmalani] = (select opmalani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmalalni] = NULL
	   ,[opmopa] = (select opmopa FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopani] = (select opmopani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopalni] = NULL
	   ,[opmast] = (select opmast FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastni] = (select opmastni FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_22'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --[N-1]
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_22 f
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala] = (select opmala FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk)
	   ,[opmalani] = (select opmalani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmalalni] = NULL
	   ,[opmopa] = (select opmopa FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopani] = (select opmopani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopalni] = NULL
	   ,[opmast] = (select opmast FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastni] = (select opmastni FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_23'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --[N-1]
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_23 f
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

  UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala] = (select opmala FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk)
	   ,[opmalani] = (select opmalani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmalalni] = NULL
	   ,[opmopa] = (select opmopa FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopani] = (select opmopani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopalni] = NULL
	   ,[opmast] = (select opmast FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastni] = (select opmastni FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_24'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --[N-1]
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_24 f
  where [koulk]  ! = '-1' and
  [koulk] != '-2'

  UNION ALL

SELECT [koulutuskoodi] = [koulk]
	   ,[alkaa] = NULL
	   ,[paattyy] = NULL
	   ,[korvaavakoodi] = korvkoulk
	   ,[taso]
	   ,[snimi]
	   ,[slnimi] = NULL
	   ,[rnimi]
	   ,[rlnimi] = NULL
	   ,[enimi]
	   ,[elnimi] = NULL
	   ,[kala] = NULL
	   ,[kalanimi] = NULL
	   ,[kalalnimi] = NULL
	   ,[kalanimi_r] = NULL
	   ,[kalalnimi_r] = NULL
	   ,[kaste] = NULL
	   ,[kastenimi] = NULL
	   ,[kastenimi_r] = NULL
	   ,[opmala] = (select opmala FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk)
	   ,[opmalani] = (select opmalani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmalalni] = NULL
	   ,[opmopa] = (select opmopa FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopani] = (select opmopani FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmopalni] = NULL
	   ,[opmast] = (select opmast FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastni] = (select opmastni FROM TK_H9098_CSC.dbo.TK_6_5_sopv_20 viimeinenVuosi where viimeinenVuosi.koulk = f.koulk) 
	   ,[opmastlni] = NULL
	   ,[opm95ala] = NULL
	   ,[opm95alani] = NULL
	   ,[opm95alalni] = NULL
	   ,[opm95opa] = NULL
	   ,[opm95opani] = NULL
	   ,[opm95opalni] = NULL
	   ,[opm95ast] = NULL
	   ,[opm95astni] = NULL
	   ,[opm95astlni] = NULL
	   ,[isclek] = NULL
	   ,[iscle] = NULL
	   ,[iscleknim] = NULL
	   ,[iscfik] = NULL
	   ,[iscfiknim] = NULL
	   ,[iscde] = NULL
	   ,[iscor] = NULL
	   ,[iscst] = NULL
	   ,[iscdu] = NULL
	   ,[iscle2011]
	   ,[iscleni2011] = [kaste_t1ni]
	   ,[iscleni2011_r] = [kaste_t1ni_sv]--[iscleni2011]
	   ,[iscleni2011_e] = [iscleni2011]
	   ,[isccat2011]
	   ,[isccatni2011]
	   ,[isccatni2011_r] = [isccatni2011]
	   ,[isccatni2011_e] = [isccatni2011]
	   ,[iscsubcat2011]
	   ,[iscsubcatni2011]
	   ,[iscsubcatni2011_r] = [iscsubcatni2011]
	   ,[iscsubcatni2011_e] = [iscsubcatni2011]
	   ,[iscfi2013]
	   ,[iscfini2013] = [kala_t3ni]
	   ,[iscfini2013_r] = [kala_t3ni_sv]--[iscfini2013]
	   ,[iscfini2013_e] = [iscfini2013]
	   ,[iscfinarrow2013]
	   ,[iscfinarrowni2013] = [kala_t2ni]
	   ,[iscfinarrowni2013_r] = [kala_t2ni_sv]--[iscfinarrowni2013]
	   ,[iscfinarrowni2013_e] = [iscfinarrowni2013]
	   ,[iscfibroad2013]
	   ,[iscfibroadni2013] = [kala_t1ni]
	   ,[iscfibroadni2013_r] = [kala_t1ni_sv]--[iscfibroadni2013]
	   ,[iscfibroadni2013_e] = [iscfibroadni2013]
	   ,[kaste_t2]
	   ,[kaste_t2ni]
	   ,[kaste_t2ni_sv]
	   ,[kaste_t2ni_en]
	   ,[tietolahde] = 'TK_6_5_sopv_25'
	   ,[kommentti] = NULL
	   ,[olokoodi]
	   ,[lakkv]
	   ,[korvkoulk]
	   ,[nmuutosv]
       ,[tilv] --[N-1]
  FROM TK_H9098_CSC.dbo.TK_6_5_sopv_25 f
  where [koulk]  ! = '-1' and
  [koulk] != '-2'


) KaikkiVuodet

--VIRHEKORJAUS 8.1.2015 JN
--WHERE tilv<2013


GO


