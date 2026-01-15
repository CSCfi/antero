USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[jarjestaja]    Script Date: 14.1.2026 17.11.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jarjestaja]') AND type in (N'U'))
CREATE TABLE [dbo].[jarjestaja](
	[id] [int] NULL,
	[koulutuksen_jarjestajakoodi] [varchar](10) NULL,
	[alkaa] [datetime2](7) NULL,
	[paattyy] [int] NULL,
	[tilv] [nvarchar](4) NULL,
	[korvaavakoodi] [varchar](10) NULL,
	[koulutuksen_jarjestajaselite] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_SV] [nvarchar](255) NULL,
	[koulutuksen_jarjestajaselite_EN] [nvarchar](255) NULL,
	[omistajatyyppikoodi] [varchar](2) NULL,
	[omistajatyyppiselite] [nvarchar](250) NULL,
	[omistajatyyppiselite_SV] [nvarchar](250) NULL,
	[omistajatyyppiselite_EN] [nvarchar](250) NULL,
	[koulutuksen_jarjestajan_kielikoodi] [varchar](2) NULL,
	[koulutuksen_jarjestajan_kieliselite] [nvarchar](250) NULL,
	[koulutuksen_jarjestajan_kieliselite_SV] [nvarchar](250) NULL,
	[koulutuksen_jarjestajan_kieliselite_EN] [nvarchar](250) NULL,
	[sijaintikuntakoodi] [varchar](3) NULL,
	[jarjestys] [nvarchar](255) NULL,
	[jarjestys_omistajatyyppi] [nvarchar](5) NULL,
	[jarjestys_koulutuksen_jarjestajan_kieli] [nvarchar](5) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL
) ON [PRIMARY]
GO


