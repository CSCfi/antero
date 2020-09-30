USE [ANTERO]
GO
/****** Object:  Table [sa].[rahoitusmalli_amk]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_amk](
	[avain] [varchar](250) NOT NULL,
	[alkaa] [int] NOT NULL,
	[paattyy] [int] NOT NULL,
	[taso1_fi] [varchar](250) NOT NULL,
	[taso2_fi] [varchar](250) NOT NULL,
	[taso3_fi] [varchar](250) NOT NULL,
	[tietojen_viive] [int] NOT NULL,
	[rahoitusosuus] [float] NOT NULL,
	[taso1_jarjestys] [int] NOT NULL,
	[taso2_jarjestys] [int] NOT NULL,
	[taso3_jarjestys] [int] NOT NULL,
	[kommentti] [varchar](250) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[rahoitusmalli_amk_painot]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_amk_painot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_amk_painot](
	[avain] [varchar](50) NOT NULL,
	[tarkenne_selite] [varchar](50) NOT NULL,
	[tarkenne_arvo] [varchar](10) NOT NULL,
	[paino] [float] NOT NULL,
	[alkaa] [int] NOT NULL,
	[paattyy] [char](10) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[rahoitusmalli_amk_tutkintotavoitteet]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_amk_tutkintotavoitteet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_amk_tutkintotavoitteet](
	[korkeakoulu] [varchar](50) NULL,
	[tutkinnon_taso] [varchar](50) NULL,
	[rahoitusmalliala] [varchar](250) NULL,
	[alkaa] [int] NULL,
	[paattyy] [int] NULL,
	[tavoite] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[rahoitusmalli_yo]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_yo](
	[avain] [varchar](250) NOT NULL,
	[alkaa] [int] NOT NULL,
	[paattyy] [int] NOT NULL,
	[taso1_fi] [varchar](250) NOT NULL,
	[taso2_fi] [varchar](250) NOT NULL,
	[taso3_fi] [varchar](250) NOT NULL,
	[tietojen_viive] [int] NOT NULL,
	[rahoitusosuus] [float] NOT NULL,
	[taso1_jarjestys] [int] NOT NULL,
	[taso2_jarjestys] [int] NOT NULL,
	[taso3_jarjestys] [int] NOT NULL,
	[kommentti] [varchar](250) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[rahoitusmalli_yo_painot]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_yo_painot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_yo_painot](
	[avain] [varchar](50) NULL,
	[tarkenne_selite] [varchar](50) NULL,
	[tarkenne_arvo] [varchar](10) NULL,
	[paino] [float] NULL,
	[alkaa] [int] NULL,
	[paattyy] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[rahoitusmalli_yo_tutkintotavoitteet]    Script Date: 29.9.2020 13:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_yo_tutkintotavoitteet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_yo_tutkintotavoitteet](
	[korkeakoulu] [varchar](50) NULL,
	[tutkinnon_taso] [varchar](50) NULL,
	[rahoitusmalliala] [varchar](250) NULL,
	[alkaa] [int] NULL,
	[paattyy] [int] NULL,
	[tavoite] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
