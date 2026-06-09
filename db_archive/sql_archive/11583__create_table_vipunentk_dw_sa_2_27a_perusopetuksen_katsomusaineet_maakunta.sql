USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]    Script Date: 16.1.2026 17.01.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]') AND type in (N'U'))
CREATE TABLE [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[kmaak] [nvarchar](2) NULL,
	[ov16] [int] NULL,
	[ov79] [int] NULL,
	[ovaik] [int] NULL,
	[aev] [int] NULL,
	[aor] [int] NULL,
	[aka] [int] NULL,
	[ais] [int] NULL,
	[aju] [int] NULL,
	[aad] [int] NULL,
	[aba] [int] NULL,
	[abu] [int] NULL,
	[ahe] [int] NULL,
	[akr] [int] NULL,
	[amu] [int] NULL,
	[aet] [int] NULL,
	[aem] [int] NULL,
	[amo] [int] NULL,
	[atp] [int] NULL,
	[aky] [int] NULL,
	[yev] [int] NULL,
	[yor] [int] NULL,
	[yka] [int] NULL,
	[yis] [int] NULL,
	[yju] [int] NULL,
	[yad] [int] NULL,
	[yba] [int] NULL,
	[ybu] [int] NULL,
	[yhe] [int] NULL,
	[ykr] [int] NULL,
	[ymu] [int] NULL,
	[yet] [int] NULL,
	[yem] [int] NULL,
	[ymo] [int] NULL,
	[ytp] [int] NULL,
	[yky] [int] NULL,
	[uev] [int] NULL,
	[uor] [int] NULL,
	[uka] [int] NULL,
	[uis] [int] NULL,
	[uju] [int] NULL,
	[uad] [int] NULL,
	[uba] [int] NULL,
	[ubu] [int] NULL,
	[uhe] [int] NULL,
	[ukr] [int] NULL,
	[umu] [int] NULL,
	[uet] [int] NULL,
	[uem] [int] NULL,
	[umo] [int] NULL,
	[utp] [int] NULL,
	[uky] [int] NULL,
	[luontipvm] [date] NULL,
	[tietolahde] [nvarchar](20) NULL
) ON [PRIMARY]
GO


