USE [VipunenTK]
GO
/****** Object:  Table [dbo].[f_AVL_oppimaaran_suorittaneet]    Script Date: 24.4.2018 13:58:35 ******/
DROP TABLE IF EXISTS [dbo].[f_AVL_oppimaaran_suorittaneet]
GO
/****** Object:  Table [dbo].[f_AVL_oppimaaran_suorittaneet]    Script Date: 24.4.2018 13:58:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_AVL_oppimaaran_suorittaneet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_AVL_oppimaaran_suorittaneet](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilastovuosi_date] [date] NULL,
	[sukupuoli_avain] [varchar](2) NOT NULL,
	[sukupuoli_id] [int] NOT NULL,
	[oppilaitos_avain] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NOT NULL,
	[oppilaitoksensijaintikunta_avain] [nvarchar](3) NULL,
	[oppilaitoksensijainti_id] [int] NOT NULL,
	[opiskelijoiden_lkm] [int] NULL,
	[aineisto] [nvarchar](8) NULL,
	[laatu_id] [int] NOT NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]