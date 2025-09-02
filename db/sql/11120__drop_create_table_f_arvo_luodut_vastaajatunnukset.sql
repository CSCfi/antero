USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_luodut_vastaajatunnukset]    Script Date: 1.9.2025 17.42.05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_luodut_vastaajatunnukset]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_luodut_vastaajatunnukset]
GO

/****** Object:  Table [dw].[f_arvo_luodut_vastaajatunnukset]    Script Date: 1.9.2025 17.42.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_luodut_vastaajatunnukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kyselyid] [int] NOT NULL,
	[kyselykertaid] [int] NOT NULL,
	[oppilaitoskoodi] [varchar](30) NULL,
	[ytunnus] [varchar](30) NULL,
	[tutkintokoodi] [varchar](30) NULL,
	[kuukausi] [date] NOT NULL,
	[vastaajatunnukset_lkm] [int] NOT NULL,
	[tyonantaja] [nchar](9) NULL,
	[sopimustyyppi] [varchar](50) NULL,
	[oppisopimuksen_perusta] [nchar](2) NULL,
	[jaksojen_kesto] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_arvo_luodut_vastaajatunnukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__f_arvo_luodut_vastaajatunnukset__username]  DEFAULT (suser_sname()) FOR [username]
GO
