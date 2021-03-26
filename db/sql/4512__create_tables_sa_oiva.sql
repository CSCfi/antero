USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_maaraykset]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_maaraykset] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_maaraykset__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_maaraykset]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_maaraykset] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_maaraykset__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_luvat]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_luvat] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_luvat__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_luvat]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_luvat] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_luvat__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_alimaaraykset]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_alimaaraykset] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_alimaaraykset__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_alimaaraykset]') AND type in (N'U'))
ALTER TABLE [sa].[sa_oiva_alimaaraykset] DROP CONSTRAINT IF EXISTS [DF__sa_oiva_alimaaraykset__username]
GO
/****** Object:  Table [sa].[sa_oiva_maaraykset]    Script Date: 26.3.2021 14:55:23 ******/
DROP TABLE IF EXISTS [sa].[sa_oiva_maaraykset]
GO
/****** Object:  Table [sa].[sa_oiva_luvat]    Script Date: 26.3.2021 14:55:23 ******/
DROP TABLE IF EXISTS [sa].[sa_oiva_luvat]
GO
/****** Object:  Table [sa].[sa_oiva_alimaaraykset]    Script Date: 26.3.2021 14:55:23 ******/
DROP TABLE IF EXISTS [sa].[sa_oiva_alimaaraykset]
GO
/****** Object:  Table [sa].[sa_oiva_alimaaraykset]    Script Date: 26.3.2021 14:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_alimaaraykset]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_oiva_alimaaraykset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[alimaaraysId] [varchar](255) NULL,
	[koodisto] [varchar](50) NULL,
	[koodiarvo] [varchar](50) NULL,
	[kohde_tunniste] [varchar](50) NULL,
	[maaraystyyppi_tunniste] [varchar](50) NULL,
	[maaraysId] [varchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[loadtime] [datetime2](4) NOT NULL,
 CONSTRAINT [PK__sa_oiva_alimaaraykset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_oiva_luvat]    Script Date: 26.3.2021 14:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_luvat]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_oiva_luvat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lupaId] [varchar](255) NULL,
	[diaarinumero] [varchar](50) NULL,
	[jarjestajaYtunnus] [varchar](30) NULL,
	[jarjestajaOid] [varchar](100) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[paatospvm] [date] NULL,
	[koulutustyyppi] [int] NULL,
	[ministeri] [nvarchar](100) NULL,
	[esittelija] [nvarchar](100) NULL,
	[paatos_old_id] [int] NULL,
	[ministeri_nimike] [nvarchar](50) NULL,
	[esittelija_nimike] [nvarchar](50) NULL,
	[koulutustehtava_old_id] [int] NULL,
	[maksu] [bit] NULL,
	[paatoskierros_id] [varchar](40) NULL,
	[lupatila_id] [varchar](40) NULL,
	[asiatyyppi_id] [varchar](40) NULL,
	[kirje] [nvarchar](4000) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipvm] [datetime] NULL,
	[paivittaja] [nvarchar](255) NULL,
	[paivityspvm] [datetime] NULL,
	[edellinen_lupa_id] [varchar](40) NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[loadtime] [datetime2](4) NOT NULL,
 CONSTRAINT [PK__sa_oiva_luvat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_oiva_maaraykset]    Script Date: 26.3.2021 14:55:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_maaraykset]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_oiva_maaraykset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodisto] [varchar](100) NULL,
	[koodiarvo] [nvarchar](100) NULL,
	[arvo] [varchar](100) NULL,
	[kohde_tunniste] [varchar](100) NULL,
	[maaraystyyppi_tunniste] [varchar](50) NULL,
	[maaraysId] [varchar](100) NULL,
	[lupaId] [varchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[loadtime] [datetime2](4) NOT NULL,
 CONSTRAINT [PK__sa_oiva_maaraykset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_alimaaraykset__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_alimaaraykset] ADD  CONSTRAINT [DF__sa_oiva_alimaaraykset__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_alimaaraykset__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_alimaaraykset] ADD  CONSTRAINT [DF__sa_oiva_alimaaraykset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_luvat__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_luvat] ADD  CONSTRAINT [DF__sa_oiva_luvat__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_luvat__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_luvat] ADD  CONSTRAINT [DF__sa_oiva_luvat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_maaraykset__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_maaraykset] ADD  CONSTRAINT [DF__sa_oiva_maaraykset__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_maaraykset__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_maaraykset] ADD  CONSTRAINT [DF__sa_oiva_maaraykset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END
