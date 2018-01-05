USE [ANTERO]
GO
/****** Object:  Table [dw].[d_tutkinnon_aloitussykli_kk]    Script Date: 5.1.2018 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_tutkinnon_aloitussykli_kk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_tutkinnon_aloitussykli_kk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys_koodi] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_tutkinnon_aloitussykli_kk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_tutkinnon_taso_kk]    Script Date: 5.1.2018 14:57:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_tutkinnon_taso_kk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_tutkinnon_taso_kk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys_koodi] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_tutkinnon_taso_kk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_aloitussykli_kk__loadtime__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_aloitussykli_kk] ADD  CONSTRAINT [DF__d_tutkinnon_aloitussykli_kk__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_aloitussykli_kk__username__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_aloitussykli_kk] ADD  CONSTRAINT [DF__d_tutkinnon_aloitussykli_kk__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_taso_kk__loadtime__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_taso_kk] ADD  CONSTRAINT [DF__d_tutkinnon_taso_kk__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_taso_kk__username__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_taso_kk] ADD  CONSTRAINT [DF__d_tutkinnon_taso_kk__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
END


