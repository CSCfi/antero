USE [VipunenTK]
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 12.6.2018 17:58:11 ******/
DROP TABLE [dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 12.6.2018 17:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat](
	[tilv] [int] NULL,
	[lahde_id] [int] NULL,
	[alvv] [int] NULL,
	[oppilaitoksen_taustatiedot_id] [int] NULL,
	[alueluokitus_id] [int] NULL,
	[suorv] [int] NULL,
	[suoritettu_tutkinto_id] [int] NULL,
	[tarkastelujakso_id] [int] NULL,
	[koulutusala_taso1_id] [int] NULL,
	[suoritettu_koulutusala_taso1_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]
