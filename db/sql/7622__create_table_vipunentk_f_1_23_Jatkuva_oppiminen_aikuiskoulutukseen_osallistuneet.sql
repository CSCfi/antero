USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet]    Script Date: 24.4.2023 12:07:55 ******/
DROP TABLE IF EXISTS [dbo].[f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet]
GO

/****** Object:  Table [dbo].[f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet]    Script Date: 24.4.2023 12:07:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet](
	[tilv] [varchar](4) NULL,
	[ikar6] [varchar](2) NULL,
	[d_ikar6_id] [int] NULL,
	[sp] [varchar](1) NULL,
	[d_sp_id] [int] NULL,
	[tilvaskunryh] [varchar](1) NULL,
	[d_tilvaskunryh_id] [int] NULL,
	[kaste_t0] [varchar](1) NULL,
	[soseh] [varchar](1) NULL,
	[d_soseh_id] [int] NULL,
	[ptoim1r9h] [varchar](2) NULL,
	[d_ptoim1r9h_id] [int] NULL,
	[psaajah] [varchar](1) NULL,
	[d_psaajah_id] [int] NULL,
	[tutk] [varchar](1) NULL,
	[eitutk] [varchar](1) NULL,
	[ammko] [varchar](1) NULL,
	[heko] [varchar](1) NULL,
	[muuko] [varchar](1) NULL,
	[painoaku] [decimal](18, 8) NULL
) ON [PRIMARY]

GO


