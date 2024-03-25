USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_kv_liikkuvuus]    Script Date: 25.3.2024 8:34:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_korkeakoulutus_kv_liikkuvuus]') AND type in (N'U'))
DROP TABLE [dw].[api_korkeakoulutus_kv_liikkuvuus]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_kv_liikkuvuus]    Script Date: 25.3.2024 8:34:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_korkeakoulutus_kv_liikkuvuus](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[sektori] [nvarchar](60) NULL,
	[sukupuoli] [nvarchar](100) NULL,
	[korkeakoulu] [nvarchar](500) NULL,
	[koulutusnimike] [nvarchar](200) NULL,
	[koulutusaste_taso_1] [nvarchar](200) NULL,
	[koulutusaste_taso_2] [nvarchar](200) NULL,
	[koulutusala_taso_1] [nvarchar](200) NULL,
	[koulutusala_taso_2] [nvarchar](200) NULL,
	[koulutusala_taso_3] [nvarchar](200) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[liikkuvuuden_suunta] [nvarchar](100) NULL,
	[liikkuvuuden_kesto] [nvarchar](100) NULL,
	[liikkuvuuden_tyyppi] [nvarchar](100) NULL,
	[liikkuvuusjaksot_lkm] [int] NULL,
	[koodit_korkeakoulu] [varchar](20) NULL,
	[koodit_koulutusnimike] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [ANTERO]