USE [Vipunen_koodisto]
GO

/****** Object:  View [dbo].[v_koulutusluokitus]    Script Date: 10.1.2018 12:05:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER VIEW [dbo].[v_koulutusluokitus] AS

-- Palauta koulutusluokituksen koulutuskoodi, koulutusaste, koulutusala ja opintoala samalla
-- koulutusluokitus_avain sisältää
--  koulutuskoodi = kuusi numeroa
--  koulutusaste_tk = KASTE + koulutusaste_tk koodi
--  koulutusaste2002 = OPMAST + koulutusaste2002 koodi
--  opintoala2002 = OPMOPA + opintoala2002 koodi
--  opintoala1995 = OPM95OPA + opintoala1995 koodi
--  johdettu sosioekonominen asema koulutuskoodi SA9999
-- 2.10.2014 lisätty koulutusalat OPMALA ja OPM95ALA
-- 2.6.2016 lisätty kaste_taso2-kentät	
-- 9.1.0218 lisätty join, jolla haetaan erikoisammattitutkinnoille (3-alkuiset koodit vaihtuivat 4-alkuisiksi) uuden koulutusluokituksen tiedot -Anssi
-- iscle2011		= koulutusaste, taso 1
-- kaste_t2			= koulutusaste, taso 2
-- iscfibroad2013	= koulutusala, taso 1
-- iscfinarrow2013	= koulutusala, taso 2
-- iscfi2013		= koulutusala, taso 3


-- select * from [dbo].[v_koulutusluokitus]


--Palautetaan rivit
SELECT DISTINCT
      [koulutusluokitus_avain]
	  ,kaikkirivit.tilv
      ,[alkaa] = Cast(kaikkirivit.alkaa as date)
      ,kaikkirivit.[paattyy]
	  ,kaikkirivit.[koulutuskoodi]
      ,kaikkirivit.[koulutusselite_FI]
      ,kaikkirivit.[koulutusselite_SV]
      ,kaikkirivit.[koulutusselite_EN]
      ,kaikkirivit.[koulutuslyhytselite_FI]
      ,kaikkirivit.[koulutuslyhytselite_SV]
      ,kaikkirivit.[koulutuslyhytselite_EN]
      ,[tasokoodi] = ISNULL(kaikkirivit.[tasokoodi], '')
      ,kaikkirivit.[koulutusala_tkkoodi]
      ,kaikkirivit.[koulutusala_tkselite_FI]
      ,kaikkirivit.[koulutusala_tkselite_SV]
      ,kaikkirivit.[koulutusala_tkselite_EN]
      ,kaikkirivit.[koulutusaste_tkkoodi]
      ,kaikkirivit.[koulutusaste_tkselite_FI]
      ,kaikkirivit.[koulutusaste_tkselite_SV]
      ,kaikkirivit.[koulutusaste_tkselite_EN]
      ,ISNULL(kaikkirivit.[isclekkoodi], '-1') [isclekkoodi]
      ,kaikkirivit.[isclekselite_FI]
      ,kaikkirivit.[isclekselite_SV]
      ,kaikkirivit.[isclekselite_EN]
      ,ISNULL(kaikkirivit.[iscdekoodi], '-1') [iscdekoodi]
      ,kaikkirivit.[iscdeselite_FI]
      ,kaikkirivit.[iscdeselite_SV]
      ,kaikkirivit.[iscdeselite_EN]
      ,ISNULL(kaikkirivit.[iscorkoodi], '-1') [iscorkoodi]
      ,kaikkirivit.[iscornimi_FI]
      ,kaikkirivit.[iscornimi_SV]
      ,kaikkirivit.[iscornimi_EN]
      ,ISNULL(kaikkirivit.[iscstkoodi], '-1') [iscstkoodi]
      ,kaikkirivit.[iscstselite_FI]
      ,kaikkirivit.[iscstselite_SV]
      ,kaikkirivit.[iscstselite_EN]
      ,ISNULL(kaikkirivit.[iscdukoodi], '-1') [iscdukoodi]
      ,kaikkirivit.[iscduselite_FI]
      ,kaikkirivit.[iscduselite_SV]
      ,kaikkirivit.[iscduselite_EN]
      ,ISNULL(kaikkirivit.[isclekoodi], '-1') [isclekoodi]
      ,kaikkirivit.[iscleselite_FI]
      ,kaikkirivit.[iscleselite_SV]
      ,kaikkirivit.[iscleselite_EN]
      ,ISNULL(kaikkirivit.[iscfikkoodi], '-1') [iscfikkoodi]
      ,kaikkirivit.[iscfikselite_FI]
      ,kaikkirivit.[iscfikselite_SV]
      ,kaikkirivit.[iscfikselite_EN]
      ,kaikkirivit.[koulutusala2002koodi]
      ,kaikkirivit.[koulutusala2002selite_FI]
      ,kaikkirivit.[koulutusala2002selite_SV]
      ,kaikkirivit.[koulutusala2002selite_EN]
      ,kaikkirivit.[opintoala2002koodi]
      ,kaikkirivit.[opintoala2002selite_FI]
      ,kaikkirivit.[opintoala2002selite_SV]
      ,kaikkirivit.[opintoala2002selite_EN]
      ,kaikkirivit.[koulutusaste2002koodi]
      ,kaikkirivit.[koulutusaste2002selite_FI]
      ,kaikkirivit.[koulutusaste2002selite_SV]
      ,kaikkirivit.[koulutusaste2002selite_EN]
      ,kaikkirivit.[koulutusala1995koodi]
      ,kaikkirivit.[koulutusala1995selite_FI]
      ,kaikkirivit.[koulutusala1995selite_SV]
      ,kaikkirivit.[koulutusala1995selite_EN]
      ,kaikkirivit.[opintoala1995koodi]
      ,kaikkirivit.[opintoala1995selite_FI]
      ,kaikkirivit.[opintoala1995selite_SV]
      ,kaikkirivit.[opintoala1995selite_EN]
      ,kaikkirivit.[koulutusaste1995koodi]
      ,kaikkirivit.[koulutusaste1995selite_FI]
      ,kaikkirivit.[koulutusaste1995selite_SV]
      ,kaikkirivit.[koulutusaste1995selite_EN]
      --,kaikkirivit.[iscle2011koodi] = ISNULL([iscle2011koodi],kaikkirivit. '-1') 
      --,kaikkirivit.[iscle2011selite_FI] = case when [iscle2011selite_FI]='Tuntematon' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_FI from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_FI,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_FI] end
      --,kaikkirivit.[iscle2011selite_SV] = case when [iscle2011selite_SV]='Information saknas' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_SV from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_SV,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_SV] end
      --,kaikkirivit.[iscle2011selite_EN] = case when [iscle2011selite_EN]='Missing data' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_EN from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_EN,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_EN] end
	  -- yo selitteet tulevat nyt tilastokeskukselta / CSC Jarmo 2.6.2016
      ,[iscle2011koodi] = ISNULL(COALESCE(kaikkirivit.[iscle2011koodi],v.iscle2011koodi), '-1') 
      ,[iscle2011selite_FI] = coalesce(v.iscle2011selite_FI,kaikkirivit.iscle2011selite_FI) --= case when [iscle2011selite_FI]='Tuntematon' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_FI from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_FI,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_FI] end
      ,[iscle2011selite_SV] = coalesce(v.iscle2011selite_SV,kaikkirivit.iscle2011selite_SV) --= case when [iscle2011selite_SV]='Information saknas' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_SV from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_SV,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_SV] end
      ,[iscle2011selite_EN] = coalesce(v.iscle2011selite_EN,kaikkirivit.iscle2011selite_EN) --= case when [iscle2011selite_EN]='Missing data' and iscle2011koodi is not null and iscle2011koodi<>'-1' then (select top 1 kv.iscle2011selite_EN from Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet kv where kv.iscle2011koodi=kaikkirivit.iscle2011koodi and isnull(kv.iscle2011selite_EN,kaikkirivit.'')<>'') else kaikkirivit.[iscle2011selite_EN] end
      ,[isccat2011koodi] = ISNULL(kaikkirivit.[isccat2011koodi], '-1') 
      ,kaikkirivit.[isccat2011selite_FI]
      ,kaikkirivit.[isccat2011selite_SV]
      ,kaikkirivit.[isccat2011selite_EN]
      ,[iscsubcat2011koodi] = ISNULL(kaikkirivit.[iscsubcat2011koodi], '-1') 
      ,kaikkirivit.[iscsubcat2011selite_FI]
      ,kaikkirivit.[iscsubcat2011selite_SV]
      ,kaikkirivit.[iscsubcat2011selite_EN]
      ,[iscfi2013koodi] = ISNULL(COALESCE(kaikkirivit.[iscfi2013koodi],v.iscfi2013koodi), '-1') 
      ,[iscfi2013selite_FI] = coalesce(v.iscfi2013selite_FI,kaikkirivit.iscfi2013selite_FI)
      ,[iscfi2013selite_SV] = coalesce(v.iscfi2013selite_SV,kaikkirivit.iscfi2013selite_SV)
      ,[iscfi2013selite_EN] = coalesce(v.iscfi2013selite_EN,kaikkirivit.iscfi2013selite_EN)
      ,[iscfinarrow2013koodi] = ISNULL(COALESCE(kaikkirivit.[iscfinarrow2013koodi],v.iscfinarrow2013koodi), '-1') 
      ,[iscfinarrow2013selite_FI] = coalesce(v.iscfinarrow2013selite_FI,kaikkirivit.iscfinarrow2013selite_FI)
      ,[iscfinarrow2013selite_SV] = coalesce(v.iscfinarrow2013selite_SV,kaikkirivit.iscfinarrow2013selite_SV)
      ,[iscfinarrow2013selite_EN] = coalesce(v.iscfinarrow2013selite_EN,kaikkirivit.iscfinarrow2013selite_EN)
      ,[iscfibroad2013koodi] = ISNULL(COALESCE(kaikkirivit.[iscfibroad2013koodi],v.iscfibroad2013koodi), '-1') 
      ,[iscfibroad2013selite_FI] = coalesce(v.iscfibroad2013selite_FI,kaikkirivit.iscfibroad2013selite_FI)
      ,[iscfibroad2013selite_SV] = coalesce(v.iscfibroad2013selite_SV,kaikkirivit.iscfibroad2013selite_SV)
      ,[iscfibroad2013selite_EN] = coalesce(v.iscfibroad2013selite_EN,kaikkirivit.iscfibroad2013selite_EN)
	  ,[kaste_t2koodi] = case when kaikkirivit.kaste_t2koodi = '-1' then COALESCE(v.kaste_t2koodi,kaikkirivit.kaste_t2koodi) else kaikkirivit.kaste_t2koodi end
	  ,[kaste_t2_FI] = coalesce(v.kaste_t2_FI,kaikkirivit.[kaste_t2_FI])
	  ,[kaste_t2_SV] = coalesce(v.kaste_t2_SV,kaikkirivit.[kaste_t2_SV])
	  ,[kaste_t2_EN] = coalesce(v.kaste_t2_EN,kaikkirivit.[kaste_t2_EN])
      ,kaikkirivit.[olokoodi]
      ,kaikkirivit.[lakkautusvuosi]
      ,kaikkirivit.[korvaava_koulutuskoodi]
      ,kaikkirivit.[muutosvuosi]
      ,kaikkirivit.[tietolahde]
      ,kaikkirivit.[korvaavakoodi]

-- Järjestys yhtenäistetty / Jarmo 4.12.2014
      ,[jarjestys] = Cast(Left(Case when kaikkirivit.[koulutusselite_FI]='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusselite_FI],'Tuntematon'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala_tk] = Cast(Left(Case when kaikkirivit.koulutusala_tkselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusala_tkkoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala1995] = Cast(Left(Case when kaikkirivit.koulutusala1995selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusala1995koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusala2002] = Cast(Left(Case when kaikkirivit.koulutusala2002selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusala2002koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste_tk] = Cast(Left(Case when kaikkirivit.koulutusaste_tkselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusaste_tkkoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste1995] = Cast(Left(Case when kaikkirivit.koulutusaste1995selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusaste1995koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_koulutusaste2002] = Cast(Left(Case when kaikkirivit.koulutusaste2002selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[koulutusaste2002koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_opintoala1995] = Cast(Left(Case when kaikkirivit.opintoala1995selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[opintoala1995koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_opintoala2002] = Cast(Left(Case when kaikkirivit.opintoala2002selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[opintoala2002koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_isclek] = Cast(Left(Case when kaikkirivit.isclekselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[isclekkoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscde] = Cast(Left(Case when kaikkirivit.iscdeselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscdekoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscst] = Cast(Left(Case when kaikkirivit.iscstselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscstkoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscdu] = Cast(Left(Case when kaikkirivit.iscduselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscdukoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscle] = Cast(Left(Case when kaikkirivit.iscleselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[isclekoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscfik] = Cast(Left(Case when kaikkirivit.iscfikselite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscfikkoodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscle2011] = Cast(Left(Case when coalesce(v.iscle2011selite_FI,kaikkirivit.iscle2011selite_FI)='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscle2011koodi],'-1'),coalesce(v.iscle2011koodi,'ööö')) end, 10) as nvarchar(10))
      ,[jarjestys_isccat2011] = Cast(Left(Case when kaikkirivit.isccat2011selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[isccat2011koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscsubcat2011] = Cast(Left(Case when kaikkirivit.iscsubcat2011selite_FI='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscsubcat2011koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      ,[jarjestys_iscfi2013] = Cast(Left(Case when coalesce(v.iscfi2013selite_FI,kaikkirivit.iscfi2013selite_FI)='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscfi2013koodi],'-1'),coalesce(v.iscfi2013koodi,'ööö')) end, 10) as nvarchar(10))
      ,[jarjestys_iscfinarrow2013] = Cast(Left(Case when coalesce(v.iscfinarrow2013selite_FI,kaikkirivit.iscfinarrow2013selite_FI)='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscfinarrow2013koodi],'-1'),coalesce(v.iscfinarrow2013koodi,'ööö')) end, 10) as nvarchar(10))
      ,[jarjestys_iscfibroad2013] = Cast(Left(Case when coalesce(v.iscfibroad2013selite_FI,kaikkirivit.iscfibroad2013selite_FI)='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[iscfibroad2013koodi],'-1'),coalesce(v.iscfibroad2013koodi,'ööö')) end, 10) as nvarchar(10))
      ,[jarjestys_kaste_t2] = Cast(Left(Case when coalesce(v.kaste_t2_fi,kaikkirivit.[kaste_t2_FI])='Tuntematon' then 'ööö' else Isnull(nullif(kaikkirivit.[kaste_t2koodi],'-1'),coalesce(v.kaste_t2koodi,'ööö')) end, 10) as nvarchar(10))


FROM ( --kaikkirivit


--Koulutuskoodit
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST (koulutuskoodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi]
      ,[koulutusselite_FI]
      ,[koulutusselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_FI]
      ,[koulutuslyhytselite_SV]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[koulutusaste_tkselite_EN]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[isclekoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikkoodi]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi]
	  ,[kaste_t2_FI]
	  ,[kaste_t2_SV]
	  ,[kaste_t2_EN]
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
      ,[tietolahde]
      ,[korvaavakoodi]

-- Järjestys yhtenäistetty / Jarmo 4.12.2014
      ,[jarjestys] = Case when [koulutusselite_FI]='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusselite_FI],'Tuntematon'),'ööö') end
      ,[jarjestys_koulutusala_tk] = Case when koulutusala_tkselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusala_tkkoodi],'-1'),'ööö') end
      ,[jarjestys_koulutusala1995] = Case when koulutusala1995selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusala1995koodi],'-1'),'ööö') end
      ,[jarjestys_koulutusala2002] = Case when koulutusala2002selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusala2002koodi],'-1'),'ööö') end
      ,[jarjestys_koulutusaste_tk] = Case when koulutusaste_tkselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusaste_tkkoodi],'-1'),'ööö') end
      ,[jarjestys_koulutusaste1995] = Case when koulutusaste1995selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusaste1995koodi],'-1'),'ööö') end
      ,[jarjestys_koulutusaste2002] = Case when koulutusaste2002selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([koulutusaste2002koodi],'-1'),'ööö') end
      ,[jarjestys_opintoala1995] = Case when opintoala1995selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([opintoala1995koodi],'-1'),'ööö') end
      ,[jarjestys_opintoala2002] = Case when opintoala2002selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([opintoala2002koodi],'-1'),'ööö') end
      ,[jarjestys_isclek] = Case when isclekselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([isclekkoodi],'-1'),'ööö') end
      ,[jarjestys_iscde] = Case when iscdeselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscdekoodi],'-1'),'ööö') end
      ,[jarjestys_iscst] = Case when iscstselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscstkoodi],'-1'),'ööö') end
      ,[jarjestys_iscdu] = Case when iscduselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscdukoodi],'-1'),'ööö') end
      ,[jarjestys_iscle] = Case when iscleselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([isclekoodi],'-1'),'ööö') end
      ,[jarjestys_iscfik] = Case when iscfikselite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscfikkoodi],'-1'),'ööö') end
      ,[jarjestys_iscle2011] = Case when iscle2011selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscle2011koodi],'-1'),'ööö') end
      ,[jarjestys_isccat2011] = Case when isccat2011selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([isccat2011koodi],'-1'),'ööö') end
      ,[jarjestys_iscsubcat2011] = Case when iscsubcat2011selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscsubcat2011koodi],'-1'),'ööö') end
      ,[jarjestys_iscfi2013] = Case when iscfi2013selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscfi2013koodi],'-1'),'ööö') end
      ,[jarjestys_iscfinarrow2013] = Case when iscfinarrow2013selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscfinarrow2013koodi],'-1'),'ööö') end
      ,[jarjestys_iscfibroad2013] = Case when iscfibroad2013selite_FI='Tuntematon' then 'ööö' else Isnull(Nullif([iscfibroad2013koodi],'-1'),'ööö') end
      ,[jarjestys_kaste_t2] = Cast(Left(Case when [kaste_t2_FI]='Tuntematon' then 'ööö' else Isnull(Nullif([kaste_t2koodi],'-1'),'ööö') end, 10) as nvarchar(10))
      
      --Alkuperäinen koodi
      --,[jarjestys] = [koulutusselite_FI]
      --,[jarjestys_koulutusala_tk] = koulutusala_tkselite_FI
      --,[jarjestys_koulutusala1995] = koulutusala1995selite_FI
      --,[jarjestys_koulutusala2002] = koulutusala2002selite_FI
      --,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      --,[jarjestys_koulutusaste1995] = koulutusaste1995selite_FI
      --,[jarjestys_koulutusaste2002] = koulutusaste2002selite_FI
      --,[jarjestys_opintoala1995] = opintoala1995selite_FI
      --,[jarjestys_opintoala2002] = opintoala2002selite_FI
      --,[jarjestys_isclek] = isclekselite_FI
      --,[jarjestys_iscde] = iscdeselite_FI
      --,[jarjestys_iscst] = iscstselite_FI
      --,[jarjestys_iscdu] = iscduselite_FI
      --,[jarjestys_iscle] = iscleselite_FI
      --,[jarjestys_iscfik] = iscfikselite_FI


FROM (
SELECT --DISTINCT
	   [koulutuskoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[koulutusselite_FI]
      ,[koulutuslyhytselite_FI]
      ,[koulutusselite_SV]
      ,[koulutuslyhytselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[isclekoodi]
      ,[iscfikkoodi]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[tietolahde]
      ,[korvaavakoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi]
	  ,[kaste_t2_FI]
	  ,[kaste_t2_SV]
	  ,[kaste_t2_EN]
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
  FROM [Vipunen_koodisto].dbo._v_koulutusluokitus_kaikkivuodet
  where [koulutuskoodi]  ! = '-1' and
  [koulutuskoodi] != '-2' 
 ) koulutuskoodit
 
--Koulutusala_2002 OPMALA
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('OPMALA'+koulutusala2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = '-1'
      ,[koulutusasteselite_FI] = 'Tuntematon'
      ,[koulutusasteselite_SV] = 'Okänd'
      ,[koulutusasteselite_EN] = 'Unknown'
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      ,[koulutusala2002koodi] = koulutusala2002koodi
      ,[koulutusala2002selite_FI] = koulutusala2002selite_FI
      ,[koulutusala2002selite_SV] = koulutusala2002selite_SV
      ,[koulutusala2002selite_EN] = koulutusala2002selite_EN
      ,[opintoala2002koodi] = '-1'
      ,[opintoala2002selite_FI] = 'Tuntematon'
      ,[opintoala2002selite_SV] = 'Okänd'
      ,[opintoala2002selite_EN] = 'Unknown'
      ,[koulutusaste2002koodi] = '-1'
      ,[koulutusaste2002selite_FI] = 'Tuntematon'
      ,[koulutusaste2002selite_SV] = 'Okänd'
      ,[koulutusaste2002selite_EN] = 'Unknown'
      ,[koulutusala1995koodi] = '-1'
      ,[koulutusala1995selite_FI] = 'Tuntematon'
      ,[koulutusala1995selite_SV] = 'Okänd'
      ,[koulutusala1995selite_EN] = 'Unknown'
      ,[opintoala1995koodi] = '-1'
      ,[opintoala1995selite_FI] = 'Tuntematon'
      ,[opintoala1995selite_SV] = 'Okänd'
      ,[opintoala1995selite_EN] = 'Unknown'
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL OPMALA'
      ,[korvaavakoodi] = ''
      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  'ööö'
      ,[jarjestys_koulutusala2002] =  koulutusala2002selite_FI
      ,[jarjestys_koulutusaste_tk] = 'ööö'
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'ööö'
      ,[jarjestys_opintoala1995] =  'ööö'
      ,[jarjestys_opintoala2002] =  'ööö'
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      -- ,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusala2002koodi]   ! = '-1'
  and [koulutusala2002koodi] != '-2' 
  and [koulutusala2002selite_FI] != 'Tuntematon' 
 ) koulutusalat_2002

--Koulutusala_1995 OPM95ALA
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('OPM95ALA'+koulutusala1995koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = '-1'
      ,[koulutusasteselite_FI] = 'Tuntematon'
      ,[koulutusasteselite_SV] = 'Okänd'
      ,[koulutusasteselite_EN] = 'Unknown'
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      ,[koulutusala2002koodi] = '-1'
      ,[koulutusala2002selite_FI] = 'Tuntematon'
      ,[koulutusala2002selite_SV] = 'Okänd'
      ,[koulutusala2002selite_EN] = 'Unknown'
      ,[opintoala2002koodi] = '-1'
      ,[opintoala2002selite_FI] = 'Tuntematon'
      ,[opintoala2002selite_SV] = 'Okänd'
      ,[opintoala2002selite_EN] = 'Unknown'
      ,[koulutusaste2002koodi] = '-1'
      ,[koulutusaste2002selite_FI] = 'Tuntematon'
      ,[koulutusaste2002selite_SV] = 'Okänd'
      ,[koulutusaste2002selite_EN] = 'Unknown'
      ,[koulutusala1995koodi] = koulutusala1995koodi
      ,[koulutusala1995selite_FI] = koulutusala1995selite_FI
      ,[koulutusala1995selite_SV] = koulutusala1995selite_SV
      ,[koulutusala1995selite_EN] = koulutusala1995selite_EN
      ,[opintoala1995koodi] = '-1'
      ,[opintoala1995selite_FI] = 'Tuntematon'
      ,[opintoala1995selite_SV] = 'Okänd'
      ,[opintoala1995selite_EN] = 'Unknown'
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL OPM95ALA'
      ,[korvaavakoodi] = ''
      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  koulutusala1995selite_FI
      ,[jarjestys_koulutusala2002] =  'ööö'
      ,[jarjestys_koulutusaste_tk] = 'ööö'
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'ööö'
      ,[jarjestys_opintoala1995] =  'ööö'
      ,[jarjestys_opintoala2002] =  'ööö'
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      -- ,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusala1995koodi]   ! = '-1'
  and [koulutusala1995koodi] != '-2' 
  and [koulutusala1995selite_FI] != 'Tuntematon' 
 ) koulutusalat_1995



--Koulutusaste_tk
UNION ALL 
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('KASTE'+koulutusaste_tkkoodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = koulutusaste_tkkoodi
      ,[koulutusasteselite_FI] = koulutusaste_tkselite_FI
      ,[koulutusasteselite_SV] = koulutusaste_tkselite_SV
      ,[koulutusasteselite_EN] = koulutusaste_tkselite_EN
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      ,[koulutusala2002koodi] = '-1'
      ,[koulutusala2002selite_FI] = 'Tuntematon'
      ,[koulutusala2002selite_SV] = 'Okänd'
      ,[koulutusala2002selite_EN] = 'Unknown'
      ,[opintoala2002koodi] = '-1'
      ,[opintoala2002selite_FI] = 'Tuntematon'
      ,[opintoala2002selite_SV] = 'Okänd'
      ,[opintoala2002selite_EN] = 'Unknown'
      ,[koulutusaste2002koodi] = '-1'
      ,[koulutusaste2002selite_FI] = 'Tuntematon'
      ,[koulutusaste2002selite_SV] = 'Okänd'
      ,[koulutusaste2002selite_EN] = 'Unknown'
      ,[koulutusala1995koodi] = '-1'
      ,[koulutusala1995selite_FI] = 'Tuntematon'
      ,[koulutusala1995selite_SV] = 'Okänd'
      ,[koulutusala1995selite_EN] = 'Unknown'
      ,[opintoala1995koodi] = '-1'
      ,[opintoala1995selite_FI] = 'Tuntematon'
      ,[opintoala1995selite_SV] = 'Okänd'
      ,[opintoala1995selite_EN] = 'Unknown'
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL KASTE'
      ,[korvaavakoodi] = ''

      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  'ööö'
      ,[jarjestys_koulutusala2002] =  'ööö'
      ,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'ööö'
      ,[jarjestys_opintoala1995] =  'ööö'
      ,[jarjestys_opintoala2002] =  'ööö'
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusaste_tkkoodi]  ! = '-1'
  and [koulutusaste_tkkoodi] != '-2' 
  and [koulutusaste_tkselite_FI] != 'Tuntematon' 
  --order by koulutusaste_tkkoodi
 ) koulutusasteet_tk


--Koulutusaste2002
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('OPMAST'+koulutusaste2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = '-1'
      ,[koulutusasteselite_FI] = 'Tuntematon'
      ,[koulutusasteselite_SV] = 'Okänd'
      ,[koulutusasteselite_EN] = 'Unknown'
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      ,[koulutusala2002koodi] = '-1'
      ,[koulutusala2002selite_FI] = 'Tuntematon'
      ,[koulutusala2002selite_SV] = 'Okänd'
      ,[koulutusala2002selite_EN] = 'Unknown'
      ,[opintoala2002koodi] = '-1'
      ,[opintoala2002selite_FI] = 'Tuntematon'
      ,[opintoala2002selite_SV] = 'Okänd'
      ,[opintoala2002selite_EN] = 'Unknown'
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi] = '-1'
      ,[koulutusala1995selite_FI] = 'Tuntematon'
      ,[koulutusala1995selite_SV] = 'Okänd'
      ,[koulutusala1995selite_EN] = 'Unknown'
      ,[opintoala1995koodi] = '-1'
      ,[opintoala1995selite_FI] = 'Tuntematon'
      ,[opintoala1995selite_SV] = 'Okänd'
      ,[opintoala1995selite_EN] = 'Unknown'
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL OPMAST'
      ,[korvaavakoodi] = ''

      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  'ööö'
      ,[jarjestys_koulutusala2002] =  'ööö'
      ,[jarjestys_koulutusaste_tk] = 'ööö'
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'koulutusaste2002selite_FI'
      ,[jarjestys_opintoala1995] =  'ööö'
      ,[jarjestys_opintoala2002] =  'ööö'
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [koulutusaste_tkkoodi]  ! = '-1'
  and [koulutusaste2002koodi] != '-2' 
  and [koulutusaste2002koodi] != '' 
  and [koulutusaste2002selite_FI] != 'Tuntematon' 
  --order by koulutusaste2002koodi
 ) koulutusasteet2002
 


--Opintoala2002
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('OPMOPA'+opintoala2002koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = '-1'
      ,[koulutusasteselite_FI] = 'Tuntematon'
      ,[koulutusasteselite_SV] = 'Okänd'
      ,[koulutusasteselite_EN] = 'Unknown'
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala2002koodi] --= '-1'
      ,[koulutusala2002selite_FI] --= 'Tuntematon'
      ,[koulutusala2002selite_SV] --= 'Okänd'
      ,[koulutusala2002selite_EN] --= 'Unknown'
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi] = '-1'
      ,[koulutusaste2002selite_FI] = 'Tuntematon'
      ,[koulutusaste2002selite_SV] = 'Okänd'
      ,[koulutusaste2002selite_EN] = 'Unknown'
      ,[koulutusala1995koodi] = '-1'
      ,[koulutusala1995selite_FI] = 'Tuntematon'
      ,[koulutusala1995selite_SV] = 'Okänd'
      ,[koulutusala1995selite_EN] = 'Unknown'
      ,[opintoala1995koodi] = '-1'
      ,[opintoala1995selite_FI] = 'Tuntematon'
      ,[opintoala1995selite_SV] = 'Okänd'
      ,[opintoala1995selite_EN] = 'Unknown'
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL OPMOPA'
      ,[korvaavakoodi] = ''

      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  'ööö'
      ,[jarjestys_koulutusala2002] =  'ööö'
      ,[jarjestys_koulutusaste_tk] = 'ööö'
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'ööö'
      ,[jarjestys_opintoala1995] =  'ööö'
      ,[jarjestys_opintoala2002] =  opintoala2002selite_FI
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      --,[koulutusala1995koodi]
      --,[koulutusala1995selite_FI]
      --,[koulutusala1995selite_SV]
      --,[koulutusala1995selite_EN]
      --,[opintoala1995koodi]
      --,[opintoala1995selite_FI]
      --,[opintoala1995selite_SV]
      --,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [opintoala2002koodi]  ! = '-1'
  and [opintoala2002koodi] != '-2' 
  and [opintoala2002koodi] != '' 
  and [opintoala2002selite_FI] != 'Tuntematon' 
  --order by koulutusaste2002koodi
 ) opintoalat2002


--Opintoala1995
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('OPM95OPA'+opintoala1995koodi AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi] = '-1'
      ,[koulutusselite_FI] = 'Tuntematon'
      ,[koulutusselite_SV] = 'Okänd'
      ,[koulutusselite_EN] = 'Unknown'
      ,[koulutuslyhytselite_FI] = 'Tuntematon'
      ,[koulutuslyhytselite_SV] = 'Okänd'
      ,[koulutuslyhytselite_EN] = 'Unknown'
      ,[tasokoodi] = '-1'
	  ,[koulutusalakoodi] = '-1'
      ,[koulutusalaselite_FI] = 'Tuntematon'
      ,[koulutusalaselite_SV] = 'Okänd'
      ,[koulutusalaselite_EN] = 'Unknown'
	  ,[koulutusastekoodi] = '-1'
      ,[koulutusasteselite_FI] = 'Tuntematon'
      ,[koulutusasteselite_SV] = 'Okänd'
      ,[koulutusasteselite_EN] = 'Unknown'
      ,[isclekkoodi] = '-1'
      ,[isclekselite_FI] = 'Tuntematon'
      ,[isclekselite_SV] = 'Okänd'
      ,[isclekselite_EN] = 'Unknown'
      ,[iscdekoodi] = '-1'
      ,[iscdeselite_FI] = 'Tuntematon'
      ,[iscdeselite_SV] = 'Okänd'
      ,[iscdeselite_EN] = 'Unknown'
      ,[iscorkoodi] = '-1'
      ,[iscornimi_FI] = 'Tuntematon'
      ,[iscornimi_SV] = 'Okänd'
      ,[iscornimi_EN] = 'Unknown'
      ,[iscstkoodi] = '-1'
      ,[iscstselite_FI] = 'Tuntematon'
      ,[iscstselite_SV] = 'Okänd'
      ,[iscstselite_EN] = 'Unknown'
      ,[iscdukoodi] = '-1'
      ,[iscduselite_FI] = 'Tuntematon'
      ,[iscduselite_SV] = 'Okänd'
      ,[iscduselite_EN] = 'Unknown'
      ,[isclekoodi] = '-1'
      ,[iscleselite_FI] = 'Tuntematon'
      ,[iscleselite_SV] = 'Okänd'
      ,[iscleselite_EN] = 'Unknown'
      ,[iscfikkoodi] = '-1'
      ,[iscfikselite_FI] = 'Tuntematon'
      ,[iscfikselite_SV] = 'Okänd'
      ,[iscfikselite_EN] = 'Unknown'
      ,[koulutusala2002koodi] = '-1'
      ,[koulutusala2002selite_FI] = 'Tuntematon'
      ,[koulutusala2002selite_SV] = 'Okänd'
      ,[koulutusala2002selite_EN] = 'Unknown'
      ,[opintoala2002koodi] = '-1'
      ,[opintoala2002selite_FI] = 'Tuntematon'
      ,[opintoala2002selite_SV] = 'Okänd'
      ,[opintoala2002selite_EN] = 'Unknown'
      ,[koulutusaste2002koodi] = '-1'
      ,[koulutusaste2002selite_FI] = 'Tuntematon'
      ,[koulutusaste2002selite_SV] = 'Okänd'
      ,[koulutusaste2002selite_EN] = 'Unknown'
      ,[koulutusala1995koodi] --= '-1'
      ,[koulutusala1995selite_FI] --= 'Tuntematon'
      ,[koulutusala1995selite_SV] --= 'Okänd'
      ,[koulutusala1995selite_EN] --= 'Unknown'
      ,[opintoala1995koodi] = opintoala1995koodi
      ,[opintoala1995selite_FI] = opintoala1995selite_FI
      ,[opintoala1995selite_SV] = opintoala1995selite_SV
      ,[opintoala1995selite_EN] = opintoala1995selite_EN
      ,[koulutusaste1995koodi] = '-1'
      ,[koulutusaste1995selite_FI] = 'Tuntematon'
      ,[koulutusaste1995selite_SV] = 'Okänd'
      ,[koulutusaste1995selite_EN] = 'Unknown'
	  ,[iscle2011koodi] = '-1'
	  ,[iscle2011selite_FI] = 'Tuntematon'
	  ,[iscle2011selite_SV] = 'Okänd'
	  ,[iscle2011selite_EN] = 'Unknown'
	  ,[isccat2011koodi] = '-1'
	  ,[isccat2011selite_FI] = 'Tuntematon'
	  ,[isccat2011selite_SV] = 'Okänd'
	  ,[isccat2011selite_EN] = 'Unknown'
	  ,[iscsubcat2011koodi] = '-1'
	  ,[iscsubcat2011selite_FI] = 'Tuntematon'
	  ,[iscsubcat2011selite_SV] = 'Okänd'
	  ,[iscsubcat2011selite_EN] = 'Unknown'
	  ,[iscfi2013koodi] = '-1'
	  ,[iscfi2013selite_FI] = 'Tuntematon'
	  ,[iscfi2013selite_SV] = 'Okänd'
	  ,[iscfi2013selite_EN] = 'Unknown'
	  ,[iscfinarrow2013koodi] = '-1'
	  ,[iscfinarrow2013selite_FI] = 'Tuntematon'
	  ,[iscfinarrow2013selite_SV] = 'Okänd'
	  ,[iscfinarrow2013selite_EN] = 'Unknown'
	  ,[iscfibroad2013koodi] = '-1'
	  ,[iscfibroad2013selite_FI] = 'Tuntematon'
	  ,[iscfibroad2013selite_SV] = 'Okänd'
	  ,[iscfibroad2013selite_EN] = 'Unknown'
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi] = '-1'
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi] = ''
      ,[tietolahde] = 'CSC SQL OPM95OPA'
      ,[korvaavakoodi] = ''

      ,[jarjestys] =  'ööö'
      ,[jarjestys_koulutusala_tk] =  'ööö'
      ,[jarjestys_koulutusala1995] =  'ööö'
      ,[jarjestys_koulutusala2002] =  'ööö'
      ,[jarjestys_koulutusaste_tk] = 'ööö'
      ,[jarjestys_koulutusaste1995] =  'ööö'
      ,[jarjestys_koulutusaste2002] =  'ööö'
      ,[jarjestys_opintoala1995] =  opintoala1995selite_FI
      ,[jarjestys_opintoala2002] =  'ööö'
      ,[jarjestys_isclek] =  'ööö'
      ,[jarjestys_iscde] =  'ööö'
      ,[jarjestys_iscst] =  'ööö'
      ,[jarjestys_iscdu] =  'ööö'
      ,[jarjestys_iscle] =  'ööö'
      ,[jarjestys_iscfik] =  'ööö'
      ,[jarjestys_iscle2011] = 'ööö'
      ,[jarjestys_isccat2011] = 'ööö'
      ,[jarjestys_iscsubcat2011] = 'ööö'
      ,[jarjestys_iscfi2013] = 'ööö'
      ,[jarjestys_iscfinarrow2013] = 'ööö'
      ,[jarjestys_iscfibroad2013] = 'ööö'
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT DISTINCT
	   --[koulutuskoodi]
       [alkaa]
      ,[paattyy]
      ,[tilv]
      --,[koulutusselite_FI]
      --,[koulutuslyhytselite_FI]
      --,[koulutusselite_SV]
      --,[koulutuslyhytselite_SV]
      --,[koulutusselite_EN]
      --,[koulutuslyhytselite_EN]
      --,[tasokoodi]
      --,[koulutusala_tkkoodi]
      --,[koulutusala_tkselite_FI]
      --,[koulutusala_tkselite_SV]
      --,[koulutusaste_tkkoodi]
      --,[koulutusaste_tkselite_FI]
      --,[koulutusaste_tkselite_SV]
      --,[isclekkoodi]
      --,[isclekselite_FI]
      --,[isclekselite_SV]
      --,[isclekselite_EN]
      --,[isclekoodi]
      --,[iscfikkoodi]
      --,[iscdekoodi]
      --,[iscdeselite_FI]
      --,[iscdeselite_SV]
      --,[iscdeselite_EN]
      --,[iscorkoodi]
      --,[iscornimi_FI]
      --,[iscornimi_SV]
      --,[iscornimi_EN]
      --,[iscstkoodi]
      --,[iscstselite_FI]
      --,[iscstselite_SV]
      --,[iscstselite_EN]
      --,[iscdukoodi]
      --,[iscduselite_FI]
      --,[iscduselite_SV]
      --,[iscduselite_EN]
      --,[tietolahde]
      --,[korvaavakoodi]
      --,[iscleselite_FI]
      --,[iscleselite_SV]
      --,[iscleselite_EN]
      --,[iscfikselite_FI]
      --,[iscfikselite_SV]
      --,[iscfikselite_EN]
      --,[koulutusala_tkselite_EN]
      --,[koulutusaste_tkselite_EN]
      --,[koulutusala2002koodi]
      --,[koulutusala2002selite_FI]
      --,[koulutusala2002selite_SV]
      --,[koulutusala2002selite_EN]
      --,[opintoala2002koodi]
      --,[opintoala2002selite_FI]
      --,[opintoala2002selite_SV]
      --,[opintoala2002selite_EN]
      --,[koulutusaste2002koodi]
      --,[koulutusaste2002selite_FI]
      --,[koulutusaste2002selite_SV]
      --,[koulutusaste2002selite_EN]
      -- koulutusala ja opintoala ovat aina hierarkiassa / Jarmo 7.10.2014
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      --,[koulutusaste1995koodi]
      --,[koulutusaste1995selite_FI]
      --,[koulutusaste1995selite_SV]
      --,[koulutusaste1995selite_EN]
      --,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      --,[muutosvuosi]
  FROM [Vipunen_koodisto].[dbo]._v_koulutusluokitus_kaikkivuodet
  where [opintoala1995koodi]  ! = '-1'
  and [opintoala1995koodi] != '-2' 
  and [opintoala1995koodi] != '' 
  and [opintoala1995selite_FI] != 'Tuntematon' 
  --order by koulutusaste2002koodi
 ) opintoalat1995
 
 
-- SA9999
UNION ALL
SELECT DISTINCT
      [koulutusluokitus_avain] = CAST ('SA9999' AS nvarchar (10))
	  ,tilv
      ,[alkaa]
      ,[paattyy]
	  ,[koulutuskoodi]
      ,[koulutusselite_FI]
      ,[koulutusselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_FI]
      ,[koulutuslyhytselite_SV]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[koulutusaste_tkselite_EN]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[isclekoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikkoodi]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]
      ,[koulutusala2002selite_SV]
      ,[koulutusala2002selite_EN]
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]
      ,[opintoala2002selite_SV]
      ,[opintoala2002selite_EN]
      ,[koulutusaste2002koodi]
      ,[koulutusaste2002selite_FI]
      ,[koulutusaste2002selite_SV]
      ,[koulutusaste2002selite_EN]
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
      ,[tietolahde]
      ,[korvaavakoodi]
      
      ,[jarjestys] = [koulutusselite_FI]
      ,[jarjestys_koulutusala_tk] = koulutusala_tkselite_FI
      ,[jarjestys_koulutusala1995] = koulutusala1995selite_FI
      ,[jarjestys_koulutusala2002] = koulutusala2002selite_FI
      ,[jarjestys_koulutusaste_tk] = koulutusaste_tkselite_FI
      ,[jarjestys_koulutusaste1995] = koulutusaste1995selite_FI
      ,[jarjestys_koulutusaste2002] = koulutusaste2002selite_FI
      ,[jarjestys_opintoala1995] = opintoala1995selite_FI
      ,[jarjestys_opintoala2002] = opintoala2002selite_FI
      ,[jarjestys_isclek] = isclekselite_FI
      ,[jarjestys_iscde] = iscdeselite_FI
      ,[jarjestys_iscst] = iscstselite_FI
      ,[jarjestys_iscdu] = iscduselite_FI
      ,[jarjestys_iscle] = iscleselite_FI
      ,[jarjestys_iscfik] = iscfikselite_FI
      ,[jarjestys_iscle2011] = iscle2011selite_FI
      ,[jarjestys_isccat2011] = isccat2011selite_FI
      ,[jarjestys_iscsubcat2011] = iscsubcat2011selite_FI
      ,[jarjestys_iscfi2013] = iscfi2013selite_FI
      ,[jarjestys_iscfinarrow2013] = iscfi2013selite_FI
      ,[jarjestys_iscfibroad2013] = iscfibroad2013selite_FI
      ,[jarjestys_kaste_t2] = 'ööö'


FROM (
SELECT --DISTINCT
	   [koulutuskoodi]
      ,[alkaa]
      ,[paattyy]
      ,[tilv]
      ,[koulutusselite_FI]
      ,[koulutuslyhytselite_FI]
      ,[koulutusselite_SV]
      ,[koulutuslyhytselite_SV]
      ,[koulutusselite_EN]
      ,[koulutuslyhytselite_EN]
      ,[tasokoodi]
      ,[koulutusala_tkkoodi]
      ,[koulutusala_tkselite_FI]
      ,[koulutusala_tkselite_SV]
      ,[koulutusaste_tkkoodi]
      ,[koulutusaste_tkselite_FI]
      ,[koulutusaste_tkselite_SV]
      ,[isclekkoodi]
      ,[isclekselite_FI]
      ,[isclekselite_SV]
      ,[isclekselite_EN]
      ,[isclekoodi]
      ,[iscfikkoodi]
      ,[iscdekoodi]
      ,[iscdeselite_FI]
      ,[iscdeselite_SV]
      ,[iscdeselite_EN]
      ,[iscorkoodi]
      ,[iscornimi_FI]
      ,[iscornimi_SV]
      ,[iscornimi_EN]
      ,[iscstkoodi]
      ,[iscstselite_FI]
      ,[iscstselite_SV]
      ,[iscstselite_EN]
      ,[iscdukoodi]
      ,[iscduselite_FI]
      ,[iscduselite_SV]
      ,[iscduselite_EN]
      ,[tietolahde]
      ,[korvaavakoodi]
      ,[iscleselite_FI]
      ,[iscleselite_SV]
      ,[iscleselite_EN]
      ,[iscfikselite_FI]
      ,[iscfikselite_SV]
      ,[iscfikselite_EN]
      ,[koulutusala_tkselite_EN]
      ,[koulutusaste_tkselite_EN]
      ,[koulutusala2002koodi]
      ,[koulutusala2002selite_FI]= 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon'
      ,[koulutusala2002selite_SV]= 'Ingen examen efter den grundläggande utbildningen eller examen okänd'
      ,[koulutusala2002selite_EN] = 'No degree after elementary education or degree unknown'
      ,[opintoala2002koodi]
      ,[opintoala2002selite_FI]= 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon'
      ,[opintoala2002selite_SV]= 'Ingen examen efter den grundläggande utbildningen eller examen okänd'
      ,[opintoala2002selite_EN]= 'No degree after elementary education or degree unknown'
      ,[koulutusaste2002koodi]='91'
      ,[koulutusaste2002selite_FI]= 'Ei perusasteen jälkeistä tutkintoa tai tutkinto tuntematon'
      ,[koulutusaste2002selite_SV]= 'Ingen examen efter den grundläggande utbildningen eller examen okänd'
      ,[koulutusaste2002selite_EN]= 'No degree after elementary education or degree unknown'
      ,[koulutusala1995koodi]
      ,[koulutusala1995selite_FI]
      ,[koulutusala1995selite_SV]
      ,[koulutusala1995selite_EN]
      ,[opintoala1995koodi]
      ,[opintoala1995selite_FI]
      ,[opintoala1995selite_SV]
      ,[opintoala1995selite_EN]
      ,[koulutusaste1995koodi]
      ,[koulutusaste1995selite_FI]
      ,[koulutusaste1995selite_SV]
      ,[koulutusaste1995selite_EN]
	  ,[iscle2011koodi]
	  ,[iscle2011selite_FI]
	  ,[iscle2011selite_SV]
	  ,[iscle2011selite_EN]
	  ,[isccat2011koodi]
	  ,[isccat2011selite_FI]
	  ,[isccat2011selite_SV]
	  ,[isccat2011selite_EN]
	  ,[iscsubcat2011koodi]
	  ,[iscsubcat2011selite_FI]
	  ,[iscsubcat2011selite_SV]
	  ,[iscsubcat2011selite_EN]
	  ,[iscfi2013koodi]
	  ,[iscfi2013selite_FI]
	  ,[iscfi2013selite_SV]
	  ,[iscfi2013selite_EN]
	  ,[iscfinarrow2013koodi]
	  ,[iscfinarrow2013selite_FI]
	  ,[iscfinarrow2013selite_SV]
	  ,[iscfinarrow2013selite_EN]
	  ,[iscfibroad2013koodi]
	  ,[iscfibroad2013selite_FI]
	  ,[iscfibroad2013selite_SV]
	  ,[iscfibroad2013selite_EN]
	  ,[kaste_t2koodi] = '-1'
	  ,[kaste_t2_FI] = 'Tuntematon'
	  ,[kaste_t2_SV] = 'Okänd'
	  ,[kaste_t2_EN] = 'Unknown'
      ,[olokoodi]
      ,[lakkautusvuosi]
      ,[korvaava_koulutuskoodi]
      ,[muutosvuosi]
  FROM [Vipunen_koodisto].dbo._v_koulutusluokitus_kaikkivuodet
  where [koulutuskoodi]   = '999999' 
 ) SA999999

) kaikkirivit

left join Vipunen_koodisto.dbo._v_koulutusluokitus_kaikkivuodet v on v.koulutuskoodi='4'+right(kaikkirivit.koulutuskoodi,len(kaikkirivit.koulutuskoodi)-1) and kaikkirivit.koulutuskoodi like '3%' and kaikkirivit.koulutusselite_FI like '%erikoisammattitutkinto%' and v.tilv=2015



GO

USE [ANTERO]
