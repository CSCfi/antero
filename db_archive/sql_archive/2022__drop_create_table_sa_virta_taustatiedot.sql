USE [ARVO_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_taustatiedot')
BEGIN
	DROP TABLE [sa].[sa_virta_taustatiedot];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_taustatiedot')

BEGIN
CREATE TABLE [sa].[sa_virta_taustatiedot](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnusid] [int] NULL,
	[taustatiedot] [varchar](max) NULL,
	[valmistumisajankohta] [varchar](100) NULL,
	[valintavuosi] [varchar](100) NULL,
	[valmistumisvuosi] [varchar](100) NULL,
	[tutkintomuoto] [varchar](100) NULL,
	[tutkinnon_taso] [varchar](100) NULL,
	[sukupuoli] [varchar](100) NULL,
	[paaaine] [varchar](500) NULL,
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
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,

 CONSTRAINT [PK__sa_virta_taustatiedot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_virta_taustatiedot] ADD  CONSTRAINT [DF__sa_virta_taustatiedot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_taustatiedot] ADD  CONSTRAINT [DF__sa_virta_taustatiedot__username]  DEFAULT (suser_name()) FOR [username]
GO
USE [ANTERO]
