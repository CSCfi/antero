USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita]    Script Date: 13.10.2025 13.01.09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita]') AND type in (N'U'))
DROP TABLE [sa].[sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita]
GO

/****** Object:  Table [sa].[sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita]    Script Date: 13.10.2025 13.01.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_tuva_koulutuksen_jarjestajat_ilman_opiskelijoita](
	[tilastovuosi] [int] NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[loadtime] [date] NULL,
) ON [PRIMARY]
GO


