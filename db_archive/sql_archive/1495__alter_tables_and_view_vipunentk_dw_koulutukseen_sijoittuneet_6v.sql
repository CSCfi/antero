USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
DROP TABLE IF EXISTS [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]
GO
/****** Object:  View [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
DROP VIEW IF EXISTS [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu]
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
DROP TABLE IF EXISTS [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu](
	[aineistorivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [nvarchar](10) NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [nvarchar](2) NOT NULL,
	[etamaa] [nvarchar](2) NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus] [nvarchar](6) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[rivinumero] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL,
	[opisk_amm] [varchar](2) NULL,
	[opisk_amk] [varchar](2) NULL,
	[opisk_yo] [varchar](2) NULL,
	[opisk_amk_koulala1] [varchar](2) NULL,
	[opisk_amk_koulala2] [varchar](2) NULL,
	[opisk_amk_koulala3] [varchar](2) NULL,
	[opisk_amk_koulala4] [varchar](2) NULL,
	[opisk_amk_koulala5] [varchar](2) NULL,
	[opisk_amk_koulala6] [varchar](2) NULL,
	[opisk_amk_koulala7] [varchar](2) NULL,
	[opisk_amk_koulala8] [varchar](2) NULL,
	[opisk_amk_koulala9] [varchar](2) NULL,
	[opisk_amk_koulala10] [varchar](2) NULL,
	[opisk_yo_koulala1] [varchar](2) NULL,
	[opisk_yo_koulala2] [varchar](2) NULL,
	[opisk_yo_koulala3] [varchar](2) NULL,
	[opisk_yo_koulala4] [varchar](2) NULL,
	[opisk_yo_koulala5] [varchar](2) NULL,
	[opisk_yo_koulala6] [varchar](2) NULL,
	[opisk_yo_koulala7] [varchar](2) NULL,
	[opisk_yo_koulala8] [varchar](2) NULL,
	[opisk_yo_koulala9] [varchar](2) NULL,
	[opisk_yo_koulala10] [varchar](2) NULL,
	[opisk_vah2_koulala] [varchar](2) NULL,
	[haku_amm] [varchar](2) NULL,
	[haku_amk] [varchar](2) NULL,
	[haku_yo] [varchar](2) NULL,
	[eihaku_kk_eiopisk] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk] [int] NULL,
	[haku_kk_eiopisk_kk_eiopisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_amk_eiopisk_kk] [int] NULL,
	[haku_yo_eiopisk_kk] [int] NULL,
	[haku_amkyo_eiopisk_kk] [int] NULL,
	[opisk_kk] [int] NULL,
	[opisk_kk_eiopisk_ta] [int] NULL,
	[opisk_kk_opisk_ta] [int] NULL,
	[opisk_vain_amk] [int] NULL,
	[opisk_vain_yo] [int] NULL,
	[opisk_amkyo] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu]'))
EXEC dbo.sp_executesql @statement = N'


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu] AS
SELECT [aineistorivinumero]
      ,[tarkastelujakso]
      ,[tilv]
      ,[tilv_date]
      ,[tutkryh]
      ,[suorv]=(case when [suorv]='''' then ''-1'' else [suorv] end)
      ,[suorlk]=(case when [suorlk]='''' then ''-1'' else [suorlk] end)
      ,[sp]
      ,[syntv]=(case when [syntv]='''' then ''-1'' else [syntv] end)
      ,[aikielir1]
      ,[tutkkaskun]
      ,[kansalr1]
      ,[pohjmaa]
      ,[eumaa]
      ,[etamaa]
      ,[tunn]
      ,[jarj]
      ,[kkielir1]
      ,[tutklaja]
      ,[tutktav]
      ,[aikoul]
      ,[tutkmaak]
      ,[pohjkoulk]
      ,[koulutus] = (case when [koulutus]='''' then ''-1'' else [koulutus] end)
      ,[oppilaitos]
      ,[koulutuksen_jarjestaja]
      ,[koulutuksen_maakunta]= (case when [koulutuksen_maakunta]='''' then ''-1'' else [koulutuksen_maakunta]end)
      ,[monihaku]
      ,[paaasiallinen_toiminta]
      ,[ammattiasema]
      ,[lkm]
      ,[tietolahde]
      ,[aineisto]
      ,[lukiokoulutuksessa]
      ,[ammatillisessa_koulutuksessa]
      ,[ammattikorkeakoulutuksessa]
      ,[yliopistokoulutuksessa]
      ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa]
      ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa]
      ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa]
      ,[koulutuksen_paattaneiden_toiminta]
      ,[lukiokoulutuksessa_ke]= (cast ((case when [lukiokoulutuksessa] = 1 then ''Kyllä'' else ''Ei'' end) as nchar(5)))
      ,[ammatillisessa_koulutuksessa_ke] = (cast((case when ammatillisessa_koulutuksessa = 1 then ''Kyllä'' else ''Ei''end) as nchar(5)))
      ,[ammattikorkeakoulutuksessa_ke]= (cast((case when ammattikorkeakoulutuksessa = 1 then ''Kyllä'' else ''Ei''end) as nchar(5)))
      ,[yliopistokoulutuksessa_ke]= cast((case when yliopistokoulutuksessa = 1 then ''Kyllä'' else ''Ei''end) as nchar(5))
      ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa_ke]= cast((case when lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa= 1 then ''Kyllä'' else ''Ei''end) as nchar(5))
      ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa_ke]= cast((case when toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa= 1 then ''Kyllä'' else ''Ei''end) as nchar(5))
      ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa_ke] = cast((case when ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa = 1 then ''Kyllä'' else ''Ei''end) as nchar(5))
      ,[rivinumero]
      ,[ika_1v]
      ,[ika_5v]
	  ,opisk_amm
	  ,opisk_amk
	  ,opisk_yo
	  ,opisk_amk_koulala1
	  ,opisk_amk_koulala2
	  ,opisk_amk_koulala3
	  ,opisk_amk_koulala4 
	  ,opisk_amk_koulala5
	  ,opisk_amk_koulala6
	  ,opisk_amk_koulala7
	  ,opisk_amk_koulala8
	  ,opisk_amk_koulala9
	  ,opisk_amk_koulala10
	  ,opisk_yo_koulala1
	  ,opisk_yo_koulala2
	  ,opisk_yo_koulala3
	  ,opisk_yo_koulala4
	  ,opisk_yo_koulala5
	  ,opisk_yo_koulala6
	  ,opisk_yo_koulala7
	  ,opisk_yo_koulala8
	  ,opisk_yo_koulala9
	  ,opisk_yo_koulala10
	  ,opisk_vah2_koulala
	  ,haku_amm
	  ,haku_amk
	  ,haku_yo
	  ,eihaku_kk_eiopisk
	  ,eihaku_kk_eiopisk_kk_opisk_ta
	  ,haku_kk_eiopisk_kk
	  ,haku_kk_eiopisk_kk_eiopisk_ta
	  ,haku_kk_eiopisk_kk_opisk_ta
	  ,haku_amk_eiopisk_kk
	  ,haku_yo_eiopisk_kk
	  ,haku_amkyo_eiopisk_kk	
	  ,opisk_kk
	  ,opisk_kk_eiopisk_ta
	  ,opisk_kk_opisk_ta
	  ,opisk_vain_amk
	  ,opisk_vain_yo
	  ,opisk_amkyo
  FROM [VipunenTK_DW].[dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]



' 
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 28.3.2018 15:23:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu](
	[rivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tilv] [nvarchar](4) NOT NULL,
	[tilv_date] [date] NULL,
	[tutkryh] [int] NOT NULL,
	[suorv] [nvarchar](4) NOT NULL,
	[suorlk] [nvarchar](6) NOT NULL,
	[sp] [int] NOT NULL,
	[syntv] [nvarchar](8) NOT NULL,
	[aikielir1] [nvarchar](2) NOT NULL,
	[tutkkaskun] [nvarchar](3) NOT NULL,
	[kansalr1] [int] NOT NULL,
	[pohjmaa] [int] NOT NULL,
	[eumaa] [int] NOT NULL,
	[etamaa] [int] NOT NULL,
	[tunn] [nvarchar](10) NOT NULL,
	[jarj] [nvarchar](10) NOT NULL,
	[kkielir1] [nvarchar](4) NOT NULL,
	[tutklaja] [int] NOT NULL,
	[tutktav] [int] NOT NULL,
	[aikoul] [int] NOT NULL,
	[tutkmaak] [nvarchar](2) NOT NULL,
	[koulutus_1] [nvarchar](6) NULL,
	[oppilaitos_1] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_1] [nvarchar](10) NULL,
	[koulutuksen_maakunta_1] [nvarchar](2) NULL,
	[koulutus_2] [nvarchar](6) NULL,
	[oppilaitos_2] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja_2] [nvarchar](10) NULL,
	[koulutuksen_maakunta_2] [nvarchar](2) NULL,
	[monihaku] [int] NOT NULL,
	[paaasiallinen_toiminta] [int] NULL,
	[ammattiasema] [int] NULL,
	[lkm] [int] NOT NULL,
	[pohjkoulk] [nvarchar](6) NOT NULL,
	[tietolahde] [varchar](255) NOT NULL,
	[aineisto] [nvarchar](8) NOT NULL,
	[lukiokoulutuksessa] [int] NOT NULL,
	[ammatillisessa_koulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa] [int] NOT NULL,
	[yliopistokoulutuksessa] [int] NOT NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NOT NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NOT NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NOT NULL,
	[koulutuksen_paattaneiden_toiminta] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NOT NULL,
	[ika_5v] [nvarchar](10) NOT NULL,
	[opisk_amm] [int] NULL,
	[opisk_amk] [int] NULL,
	[opisk_yo] [int] NULL,
	[opisk_amk_koulala1] [int] NULL,
	[opisk_amk_koulala2] [int] NULL,
	[opisk_amk_koulala3] [int] NULL,
	[opisk_amk_koulala4] [int] NULL,
	[opisk_amk_koulala5] [int] NULL,
	[opisk_amk_koulala6] [int] NULL,
	[opisk_amk_koulala7] [int] NULL,
	[opisk_amk_koulala8] [int] NULL,
	[opisk_amk_koulala9] [int] NULL,
	[opisk_amk_koulala10] [int] NULL,
	[opisk_yo_koulala1] [int] NULL,
	[opisk_yo_koulala2] [int] NULL,
	[opisk_yo_koulala3] [int] NULL,
	[opisk_yo_koulala4] [int] NULL,
	[opisk_yo_koulala5] [int] NULL,
	[opisk_yo_koulala6] [int] NULL,
	[opisk_yo_koulala7] [int] NULL,
	[opisk_yo_koulala8] [int] NULL,
	[opisk_yo_koulala9] [int] NULL,
	[opisk_yo_koulala10] [int] NULL,
	[opisk_vah2_koulala] [int] NULL,
	[haku_amm] [int] NULL,
	[haku_amk] [int] NULL,
	[haku_yo] [int] NULL,
	[eihaku_kk_eiopisk] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk] [int] NULL,
	[haku_kk_eiopisk_kk_eiopisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_amk_eiopisk_kk] [int] NULL,
	[haku_yo_eiopisk_kk] [int] NULL,
	[haku_amkyo_eiopisk_kk] [int] NULL,
	[opisk_kk] [int] NULL,
	[opisk_kk_eiopisk_ta] [int] NULL,
	[opisk_kk_opisk_ta] [int] NULL,
	[opisk_vain_amk] [int] NULL,
	[opisk_vain_yo] [int] NULL,
	[opisk_amkyo] [int] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]