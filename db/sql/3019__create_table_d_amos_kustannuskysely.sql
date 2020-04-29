USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_seurantaryhma]    Script Date: 26.4.2020 13:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_kustannuskysely_seurantaryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_kustannuskysely_seurantaryhma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [char](5) NOT NULL,
	[selite] [varchar](250) NOT NULL,
	[taso1] [varchar](250) NOT NULL,
	[taso2] [varchar](250) NULL,
	[taso3] [varchar](250) NULL,
	[summatieto] [int] NOT NULL,
	[source] [varchar](250) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_tili]    Script Date: 26.4.2020 13:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_kustannuskysely_tili]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_kustannuskysely_tili](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nchar](10) NOT NULL,
	[selite] [varchar](250) NOT NULL,
	[taso0] [varchar](250) NOT NULL,
	[taso1] [varchar](250) NOT NULL,
	[taso2] [varchar](250) NULL,
	[taso3] [varchar](250) NULL,
	[taso4] [varchar](250) NULL,
	[taso5] [varchar](250) NULL,
	[taso_alin] [varchar](250) NOT NULL,
	[summatieto] [int] NOT NULL,
	[source] [varchar](250) NOT NULL
) ON [PRIMARY]
END
