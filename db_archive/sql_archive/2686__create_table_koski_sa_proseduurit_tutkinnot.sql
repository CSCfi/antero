USE [Koski_SA]
GO
/****** Object:  Table [sa].[proseduuri_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 18:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[proseduuri_tutkinnot_ja_tutkinnonosat]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[proseduuri_tutkinnot_ja_tutkinnonosat](
	[proseduuri] [varchar](max) NOT NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[kesto] [char](8) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE [ANTERO]