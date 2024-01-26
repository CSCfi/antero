USE [ANTERO]
GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] DROP CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__username]
GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] DROP CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__loadtime]
GO

/****** Object:  Table [dw].[f_arvo_luodut_vastaajatunnukset]    Script Date: 25.10.2022 22:27:37 ******/
DROP TABLE [dw].[f_arvo_luodut_vastaajatunnukset]
GO

/****** Object:  Table [dw].[f_arvo_luodut_vastaajatunnukset]    Script Date: 25.10.2022 22:27:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_luodut_vastaajatunnukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kyselykertaid] [int] NOT NULL,
	[oppilaitoskoodi] [varchar](30) NULL,
	[ytunnus] [varchar](30) NULL,
	[tutkintokoodi] [varchar](30) NULL,
	[kuukausi] [date] NOT NULL,
	[vastaajatunnukset_lkm] [int] NOT NULL,
	[tyonantaja] [nchar](9) NULL,
	[sopimustyyppi] [varchar](50) NULL,
	[oppisopimuksen_perusta] [nchar](2) NULL,
	[rahoitusryhma] [nchar](2) NULL,
	[jaksojen_kesto] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_luodut_vastaajatunnukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__username]  DEFAULT (suser_sname()) FOR [username]
GO


