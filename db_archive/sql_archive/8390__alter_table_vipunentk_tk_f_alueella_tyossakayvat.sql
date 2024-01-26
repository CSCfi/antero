USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_alueella_tyossakayvat]    Script Date: 14.12.2023 11:06:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_alueella_tyossakayvat]
GO

CREATE TABLE [dbo].[f_alueella_tyossakayvat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](8) NULL,
	[laatu_id] [int] NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[lkm] [int] NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[mitenna_ammatti_id] [int] NOT NULL,
	[amm2010_oef1] [nvarchar](20) NULL,
	[amm2010_oef2] [nvarchar](20) NULL,
	[oef_ammatti_id] [int] NOT NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[mitenna_toimiala_id] [int] NOT NULL,
	[tol2008_oef] [nvarchar](10) NULL,
	[oef_toimiala_id] [int] NOT NULL,
	[sp] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aikielir1] [nvarchar](10) NULL,
	[aikielir1_id] [int] NOT NULL,
	[ikar1] [nvarchar](10) NULL,
	[ikar1_koodi] [nvarchar](10) NOT NULL,
	[ika_id] [int] NOT NULL,
	[opmast] [nvarchar](10) NULL,
	[koulutusaste_id] [int] NOT NULL,
	[koulutusaste_taso2] [nvarchar](10) NULL,
	[koulutusaste_taso2_id] [int] NOT NULL,
	[tutklaja] [nvarchar](10) NULL,
	[tutkintolaji_id] [int] NOT NULL,
	[opmopa] [nvarchar](10) NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[opintoala_id] [int] NOT NULL,
	[koulutusala_taso2] [nvarchar](10) NULL,
	[koulutusala_taso2_id] [int] NOT NULL,
	[tilvasmaak] [varchar](2) NULL,
	[asuinmaakunta_historia_id] [int] NULL,
	[asuinmaakunta_id] [int] NULL,
	[tsekt] [nvarchar](10) NULL,
	[tyonantajasektori_id] [int] NOT NULL,
	[tmaak] [nvarchar](10) NULL,
	[tyomaakunta_historia_id] [int] NULL,
	[tyomaakunta_id] [int] NULL,
	[sose] [nvarchar](10) NULL,
	[sosioekonominen_asema_id] [int] NOT NULL
) ON [PRIMARY]

GO


