USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]    Script Date: 16.1.2026 17.18.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja]') AND type in (N'U'))
CREATE TABLE [dbo].[f_2_27b_perusopetuksen_katsomusaineet_jarjestaja](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[jarj] [nvarchar](10) NULL,
	[kmaak] [nvarchar](2) NULL,
	[vuosiluokat] [varchar](5) NOT NULL,
	[aine] [varchar](2) NOT NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


