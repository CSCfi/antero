USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_oiva_koulutusluvat]    Script Date: 27.1.2021 14:19:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_oiva_koulutusluvat]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_oiva_koulutusluvat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[jarjestajaYtunnus] [varchar](250) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[asianumero] [varchar](250) NULL,
	[koulutustyyppi] [varchar](max) NULL,
	[laajaOppisopimuskoulutus] [varchar](250) NULL,
	[oppilaitostyyppi] [varchar](250) NULL,
	[source] [varchar](250) NULL,
	[loadtime] [date] NULL,
	[username] [varchar](250) NULL,
 CONSTRAINT [PK__sa_oiva_koulutusluvat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_koulutusluvat__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_koulutusluvat] ADD  CONSTRAINT [DF__sa_oiva_koulutusluvat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_oiva_koulutusluvat__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_oiva_koulutusluvat] ADD  CONSTRAINT [DF__sa_oiva_koulutusluvat__username]  DEFAULT (suser_name()) FOR [username]
END

