USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_kv_liikkuvuus]    Script Date: 22.3.2024 12:30:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_korkeakoulutus_kv_liikkuvuus]') AND type in (N'U'))
DROP TABLE [dw].[api_korkeakoulutus_kv_liikkuvuus]
GO

/****** Object:  Table [dw].[api_korkeakoulutus_kv_liikkuvuus]    Script Date: 22.3.2024 12:30:25 ******/
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
	[koulutusasteTaso1] [nvarchar](200) NULL,
	[koulutusasteTaso2] [nvarchar](200) NULL,
	[koulutusalaTaso1] [nvarchar](200) NULL,
	[koulutusalaTaso2] [nvarchar](200) NULL,
	[koulutusalaTaso3] [nvarchar](200) NULL,
	[okmOhjauksenAla] [varchar](100) NULL,
	[liikkuvuudenSuunta] [nvarchar](100) NULL,
	[liikkuvuudenKesto] [nvarchar](100) NULL,
	[liikkuvuusjaksotLkm] [int] NULL,
	[kooditKorkeakoulu] [varchar](20) NULL,
	[kooditKoulutusnimike] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [ANTERO]