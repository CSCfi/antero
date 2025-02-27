USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 12.3.2020 12:41:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan] AS

-- drop table f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan
-- select * into dbo.f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan from v_f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan

-- truncate table f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan
-- insert into f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan select * from v_f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan

SELECT
	 tilastointivuosi = tilv
	,tilv_date = CAST(tilv+'0101' as date)
    ,lahde = Cast([lahde] as nvarchar(10))
    ,koulutusluokitus = Cast([koulk] as nvarchar(6))
    ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = Cast(Case when [tutktav]='9' then '-1' when ltrim(coalesce([tutktav],''))='' then '-1' else [tutktav] end as nvarchar(2))
    ,ammatillisen_koulutuksen_koulutuslaji = Cast(Case when [tutklaja]='9' then '-1' when ltrim([tutklaja])='' then '-1' else [tutklaja] end as nvarchar(2))
    ,opetushallinnon_koulutus = Cast(Case when [ophal]='9' then '-1' when ltrim([ophal])='' then '-1' else [ophal] end as nvarchar(2))
    ,koulutuksen_opetuskieli = Cast(Case when ltrim([kkieli])='' then '-1' else [kkieli] end as nvarchar(10))
    ,nuorten_aikuisten_koulutus_amm = Cast(Case when [aikoul]='9' then '-1' when ltrim([aikoul])='' then '-1' else [aikoul] end as nvarchar(2))
    ,koulutuksen_sijaintimaakunta = Cast(Case when left([kmaak],1)='9' then '-1' when ltrim([kmaak])='' then '-1' else [kmaak] end as nvarchar(2))
    ,sukupuoli = Cast(Case when [sp]='9' then '-1' when ltrim([sp])='' then '-1' else [sp] end as nvarchar(2))
    ,aikuisopiskelija = Cast(Case when [aiopis]='9' then '-1' when ltrim([aiopis])='' then '-1' else Cast(Cast([aiopis] as int) as nvarchar(2)) end as nvarchar(2))
    ,koulutuksen_aloittamislukuvuosi = Cast([alvv] as nvarchar(4))
    ,koulutuksen_aloittamislukukausi = Cast([allk] as nvarchar(1))
    ,kirjoillaolo_tammikuu = Cast(Case when [olotamm]='9' then '-1' when ltrim([olotamm])='' then '-1' else [olotamm] end as nvarchar(10))
    ,kirjoillaolo_syyskuu = Cast(Case when [olosyys]='9' then '-1' when ltrim([olosyys])='' then '-1' else [olosyys] end as nvarchar(10))
    ,kotikunnan_kuntaryhma = Cast(Case when [tilvaskunryh]='9' then '-1' when ltrim([tilvaskunryh])='' then '-1' else [tilvaskunryh] end as nvarchar(2))
    ,koulutusryhma_koulutuslaji3 = Cast(Case when [klajir2]='9' then '-1' when ltrim([klajir2])='' then '-1' else [klajir2] end as nvarchar(2))
    ,aidinkieli_kieli = Cast(Case when left([aikieli],1)='9' then '-1' when ltrim([aikieli])='' then '-1' else [aikieli] end as nvarchar(10))
--Johdetut muuttujat
	--,aidinkieli_versio3 = Cast(Case when left([aikieli],1)='9' then '-1' when ltrim([aikieli])='' then '-1' when [aikieli] in ('fi', 'se') then 'fs' when [aikieli]='sv' then 'sv' else '99' end as nvarchar(2))
	-- Listataan tuntemattomat muiksi / CSC Jarmo 31.7.2015
	,aidinkieli_versio3 = Cast(Case when [aikieli] in ('fi', 'se') then 'fs' when [aikieli]='sv' then 'sv' else '99' end as nvarchar(2))
	,koulutussektori = Cast(Case when left([lahde],1)='9' then '-1' when ltrim([lahde])='' then '-1'
		 when [lahde] = '21' then '2' 
		 when [lahde] in ('31', '33', '34', '35') then '3' 
		 when [lahde] = '41' then '4' 
		 when [lahde] = '51' then '5' 
		 else '-2' end as nvarchar(2))
--Mittarit
    ,opiskelijoiden_lkm = [lkm]
--  ,[luontipvm]
-- aineistotiedot
	,tietolahde = tietolahde
	,rivinumero = rivinumero
FROM VipunenTK_DW.dbo.sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan






GO


USE [ANTERO]