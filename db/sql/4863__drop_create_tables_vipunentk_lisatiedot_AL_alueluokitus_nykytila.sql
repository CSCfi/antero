USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[AL_alueluokitus_kunta_nykytila]    Script Date: 10.9.2021 19:47:18 ******/
DROP TABLE IF EXISTS [dbo].[AL_alueluokitus_kunta_nykytila]
GO

DROP TABLE IF EXISTS [dbo].[AL_koulutuksen_jarjestaja_nykytila]
GO

DROP TABLE IF EXISTS [dbo].[AL_koulutusluokitus_nykytila]
GO


/****** Object:  Table [dbo].[AL_alueluokitus_kunta_nykytila]    Script Date: 10.9.2021 19:47:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[AL_alueluokitus_kunta_nykytila](
	[alueluokitus_koodi] [nvarchar](10) NOT NULL,
	[alueluokitus_koodi_nykytila] [nvarchar](3) NULL
) ON [PRIMARY]

CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20210910-182524] ON [dbo].[AL_alueluokitus_kunta_nykytila]
(
	[alueluokitus_koodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


CREATE TABLE [dbo].[AL_koulutuksen_jarjestaja_nykytila](
	[koulutuksen_jarjestajakoodi] [nvarchar](10) NULL,
	[koulutuksen_jarjestajakoodi_nykytila] [varchar](10) NULL
) ON [PRIMARY]

CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20210910-182525] ON [dbo].[AL_koulutuksen_jarjestaja_nykytila]
(
	[koulutuksen_jarjestajakoodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


CREATE TABLE [dbo].[AL_koulutusluokitus_nykytila](
	[koulutus_koodi] [nvarchar](20) NOT NULL,
	[koulutus_koodi_nykytila] [nvarchar](6) NULL
) ON [PRIMARY]

CREATE UNIQUE CLUSTERED INDEX [ClusteredIndex-20210910-182526] ON [dbo].[AL_koulutusluokitus_nykytila]
(
	[koulutus_koodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO