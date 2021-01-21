USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]    Script Date: 8.1.2021 11:05:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]') AND type in (N'U'))

BEGIN

CREATE TABLE [dbo].[f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat](
	[tilastovuosi] [nvarchar](4) NULL,
	[tyovoima] [nvarchar](15) NULL,
	[sukupuoli_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[ammattiluokitus_2001_id] [int] NULL,
	[ammattiluokitus_2001] [nvarchar](10) NULL,
	[ammattiluokitus_2010_id] [int] NULL,
	[ammattiluokitus_2010] [nvarchar](10) NULL,
	[ikaryhma_id] [int] NULL,
	[ikaryhma] [nvarchar](8) NULL,
	[koulutusaste_taso2_id] [int] NULL,
	[koulutusaste_taso2] [nvarchar](15) NULL,
	[koulutusala_taso2_id] [int] NULL,
	[koulutusala_taso2] [nvarchar](20) NULL,
	[koulutusaste_2002_id] [int] NULL,
	[koulutusaste_2002] [nvarchar](15) NULL,
	[koulutusala_2002_id] [int] NULL,
	[koulutusala_2002] [nvarchar](15) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](20) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

END

GO


USE [ANTERO]