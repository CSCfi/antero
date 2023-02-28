USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[f_amos_pohjakoulutus_TK_K1_12c]
GO

/****** Object:  Table [dw].[f_amos_pohjakoulutus_TK_K1_12c]    Script Date: 28.2.2023 14:32:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_pohjakoulutus_TK_K1_12c](
	[Tilastovuosi] [varchar](4) NULL,
	[Koodit Koulutuksen järjestäjä] [varchar](10) NULL,
	[Koulutuksen järjestäjä] [nvarchar](255) NULL,
	[Ikä tutkinnon suorittamisvuoden lopussa] [varchar](15) NOT NULL,
	[ei_pohjakoul_pt_kr1] [int] NULL,
	[ei_pohjakoul_pt_kr2] [int] NULL,
	[ei_pohjakoul_pt_kr3] [int] NULL,
	[ei_pohjakoul_pt_kr4] [int] NULL,
	[ei_pohjakoul_pt_kr5] [int] NULL,
	[ei_pohjakoul_at_eat_kr1] [int] NULL,
	[ei_pohjakoul_at_eat_kr2] [int] NULL,
	[ei_pohjakoul_at_eat_kr3] [int] NULL,
	[ei_pohjakoul_at_eat_kr4] [int] NULL,
	[ei_pohjakoul_at_eat_kr5] [int] NULL,
	[pohjakoul_pt_kr1] [int] NULL,
	[pohjakoul_pt_kr2] [int] NULL,
	[pohjakoul_pt_kr3] [int] NULL,
	[pohjakoul_pt_kr4] [int] NULL,
	[pohjakoul_pt_kr5] [int] NULL,
	[pohjakoul_at_eat_kr1] [int] NULL,
	[pohjakoul_at_eat_kr2] [int] NULL,
	[pohjakoul_at_eat_kr3] [int] NULL,
	[pohjakoul_at_eat_kr4] [int] NULL,
	[pohjakoul_at_eat_kr5] [int] NULL,
	[luontipvm] [date] NULL,
	[jarj_ika] [varchar](1) NOT NULL
) ON [PRIMARY]

GO


