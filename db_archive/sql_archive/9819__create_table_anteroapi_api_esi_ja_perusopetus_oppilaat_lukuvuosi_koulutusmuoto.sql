USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]    Script Date: 29.4.2024 10:49:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]') AND type in (N'U'))
DROP TABLE [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]
GO

/****** Object:  Table [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]    Script Date: 29.4.2024 10:49:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto](
	[defaultorder] [bigint] NOT NULL,
	[lukuvuosi] [nvarchar](10) NULL,
	[koulutusmuoto] [nvarchar](200) NULL,
	[opetuksen_jarjestaja] [nvarchar](255) NULL,
	[oppilaat_lkm] [int] NULL,
	[koodit_opetuksen_jarjestaja] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [ANTERO]