USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amk_rahoitusmalliala]    Script Date: 29.9.2020 13:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amk_rahoitusmalliala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amk_rahoitusmalliala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alkaa] [int] NULL,
	[paattyy] [int] NULL,
	[koodi] [int] NULL,
	[selite_fi] [varchar](500) NULL,
	[selite_sv] [varchar](500) NULL,
	[selite_en] [varchar](500) NULL,
	[jarjestys] [int] NULL,
	[source] [varchar](500) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_rahoitusmalli_amk]    Script Date: 29.9.2020 13:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_rahoitusmalli_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_rahoitusmalli_amk](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL,
	[username] [varchar](250) NULL,
 CONSTRAINT [PK__d_rahoitusmalli_amk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_rahoitusmalli_yo]    Script Date: 29.9.2020 13:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_rahoitusmalli_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_rahoitusmalli_yo](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NULL,
	[username] [varchar](250) NULL,
 CONSTRAINT [PK__d_rahoitusmalli_yo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_yo_rahoitusmalliala]    Script Date: 29.9.2020 13:30:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_yo_rahoitusmalliala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_yo_rahoitusmalliala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alkaa] [int] NULL,
	[paattyy] [int] NULL,
	[koodi] [int] NULL,
	[selite_fi] [varchar](500) NULL,
	[selite_sv] [varchar](500) NULL,
	[selite_en] [varchar](500) NULL,
	[jarjestys] [int] NULL,
	[source] [varchar](500) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusmalli_amk_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusmalli_amk] ADD  CONSTRAINT [DF_d_rahoitusmalli_amk_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusmalli_amk_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusmalli_amk] ADD  CONSTRAINT [DF_d_rahoitusmalli_amk_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusmalli_yo_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusmalli_yo] ADD  CONSTRAINT [DF_d_rahoitusmalli_yo_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusmalli_yo_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusmalli_yo] ADD  CONSTRAINT [DF_d_rahoitusmalli_yo_username]  DEFAULT (suser_sname()) FOR [username]
END
