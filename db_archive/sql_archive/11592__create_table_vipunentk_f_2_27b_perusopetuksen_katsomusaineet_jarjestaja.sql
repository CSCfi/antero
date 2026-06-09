USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]    Script Date: 19.1.2026 13.12.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]') AND type in (N'U'))
CREATE TABLE [dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[jarjestaja] [nvarchar](10) NULL,
	[jarjestaja_id] [int] NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta_id] [int] NULL,
	[vuosiluokat] [varchar](5) NOT NULL,
	[vuosiluokat_id] [int] NULL,
	[katsomusaine] [varchar](5) NULL,
	[katsomusaine_id] [int] NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


