USE [Arvo_SA]
GO

DROP TABLE IF EXISTS [sa].[sa_virta_kohteet_taustatiedot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [sa].[sa_virta_kohteet_taustatiedot](
  [id]	[bigint] IDENTITY(0,1) NOT NULL,
  [vastaajaid] [bigint] NULL,
	[valmistumisajankohta] [varchar](100) NULL,
	[valintavuosi] [varchar](100) NULL,
	[valmistumisvuosi] [varchar](100) NULL,
	[tutkintomuoto] [varchar](100) NULL,
	[tutkinnon_taso] [varchar](100) NULL,
	[sukupuoli] [varchar](100) NULL,
	[paaaine] [varchar](250) NULL,
	[laajuus] [varchar](100) NULL,
	[lasnaolo_lukukausia] [varchar](100) NULL,
	[koulutusalakoodi] [varchar](100) NULL,
	[kirjoilla_olo_kuukausia] [varchar](100) NULL,
	[kansalaisuus] [varchar](100) NULL,
	[ika_valmistuessa] [varchar](100) NULL,
	[asuinkuntakoodi] [varchar](100) NULL,
	[asteikko] [varchar](100) NULL,
	[arvosana] [varchar](100) NULL,
	[aidinkieli] [varchar](100) NULL,
	[vastaajatunnusid] [varchar](15) NULL,
	[koulutustoimija] [varchar](100) NULL,
	[taustatiedot] [varchar](max) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](150) NULL,
	[source] [varchar](150) NULL,

 CONSTRAINT [PK__sa_virta_kohteet_taustatiedot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_kohteet_taustatiedot] ADD  CONSTRAINT [DF_sa_virta_kohteet_taustatiedot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_kohteet_taustatiedot] ADD  CONSTRAINT [DF_sa_virta_kohteet_taustatiedot_username]  DEFAULT (suser_sname()) FOR [username]
GO
