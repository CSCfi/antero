USE [Arvo_SA]
GO

DROP TABLE IF EXISTS [sa].[sa_arvo_tiedonkeruut]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [sa].[sa_arvo_tiedonkeruut](
	(
		[id] [bigint] IDENTITY(1,1) NOT NULL,
	  tunniste VARCHAR(200) NULL,
	  vuosi INT,
	  tarkenne VARCHAR(200),
	  kasittelyajan_paattymispvm DATETIME,
	  loadtime DATETIME,
	  source VARCHAR(300),
	  username VARCHAR(150)
	)
	;
 CONSTRAINT [PK__sa_arvo_tiedonkeruut] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [sa].[sa_arvo_tiedonkeruut] ADD  CONSTRAINT [DF__sa_arvo_tiedonkeruut__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_tiedonkeruut] ADD  CONSTRAINT [DF__sa_arvo_tiedonkeruut__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
