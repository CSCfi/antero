USE [Koski_SA]
GO
/****** Object:  Table [dbo].[kustannusryhma_osasuoritus]    Script Date: 7.7.2022 13:04:39 ******/
DROP TABLE IF EXISTS [dbo].[kustannusryhma_osasuoritus]
GO
/****** Object:  Table [dbo].[kustannusryhma_osasuoritus]    Script Date: 7.7.2022 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kustannusryhma_osasuoritus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[kustannusryhma_osasuoritus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[voimassaoloalkaa] [datetime] NULL,
	[voimassaololoppuu] [datetime] NULL,
	[siirtymapaattyy] [datetime] NULL,
	[tutkinnonosa_koodi] [int] NULL,
	[tutkinnonosa_nimi_fi] [varchar](300) NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[tutkinto_nimi_fi] [varchar](1000) NULL,
	[osaamisala_koodi] [int] NULL,
	[osaamisala_nimi_fi] [varchar](300) NULL,
 CONSTRAINT [PK_kustannusryhma_osasuoritus] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE ANTERO