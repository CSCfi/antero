USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]    Script Date: 19.1.2026 13.12.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]') AND type in (N'U'))
CREATE TABLE [dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta_id] [int] NULL,
	[vuosiluokat] [varchar](10) NULL,
	[vuosiluokat_id] [int] NULL,
	[katsomusaine] [varchar](5) NULL,
	[katsomusaine_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


