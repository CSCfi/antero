USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]    Script Date: 16.1.2026 17.18.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta]') AND type in (N'U'))
CREATE TABLE [dbo].[f_2_27a_perusopetuksen_katsomusaineet_maakunta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[kmaak] [nvarchar](2) NULL,
	[vuosiluokat] [varchar](10) NULL,
	[aine] [varchar](5) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]
GO


