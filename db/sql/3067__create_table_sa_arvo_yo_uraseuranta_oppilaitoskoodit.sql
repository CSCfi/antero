USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_yo_uraseuranta_oppilaitoskoodit]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_arvo_yo_uraseuranta_oppilaitoskoodit](
	[Vastaajatunnus] [varchar](100) NULL,
	[Oppilaitoskoodi] [varchar](100) NULL
) ON [PRIMARY]

END