USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_kotiopetus]    Script Date: 30.7.2025 8.00.26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_kotiopetus]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_kotiopetus]
GO

/****** Object:  Table [dw].[f_koski_kotiopetus]    Script Date: 30.7.2025 8.00.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_kotiopetus](
	[tilastovuosi] [int] NULL,
	[tilastopaiva_20_9] [int] NULL,
	[master_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](50) NULL,
	[d_alueluokitus_opetuksen_jarjestajan_kunta_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kalenteri_id] [int] NULL,
	[loadtime] [date] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO


