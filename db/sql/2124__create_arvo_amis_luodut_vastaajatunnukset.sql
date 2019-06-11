USE [ANTERO]
GO
/****** Object:  Table [dw].[f_arvo_luodut_vastaajatunnukset]    Script Date: 26.2.2019 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_luodut_vastaajatunnukset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_luodut_vastaajatunnukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kyselykertaid] [int] NOT NULL,
	[oppilaitoskoodi] [varchar](30) NOT NULL,
	[tutkintokoodi] [varchar](30) NOT NULL,
	[kuukausi] [date] NOT NULL,
	[vastaajatunnukset_lkm] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_luodut_vastaajatunnukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_luodut_vastaajatunnukset__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_luodut_vastaajatunnukset__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__username]  DEFAULT (suser_sname()) FOR [username]
END