USE [ANTERO]
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_uraseuranta')

BEGIN
ALTER TABLE [sa].[sa_uraseuranta] DROP CONSTRAINT [DF__sa_uraseuranta__username]
ALTER TABLE [sa].[sa_uraseuranta] DROP CONSTRAINT [DF__sa_uraseuranta__loadtime]
DROP TABLE [sa].[sa_uraseuranta]
END


USE [ANTERO]
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_uraseuranta')

BEGIN
CREATE TABLE [sa].[sa_uraseuranta](
	[kyselyid] [int] NULL,
	[koulutustoimija] [text] NULL,
	[kysely_fi] [text] NULL,
	[kysely_sv] [text] NULL,
	[kysely_en] [text] NULL,
	[kyselykertaid] [int] NULL,
	[kyselykerta] [text] NULL,
	[kysymysryhmaid] [int] NULL,
	[kysymysryhma_fi] [text] NULL,
	[kysymysryhma_sv] [text] NULL,
	[kysymysryhma_en] [text] NULL,
	[valtakunnallinen] [bit] NULL,
	[kysymysryhma_jarjestys] [int] NULL,
	[kysymysid] [int] NULL,
	[jarjestys] [real] NULL,
	[vastaustyyppi] [text] NULL,
	[kysymys_fi] [text] NULL,
	[kysymys_sv] [text] NULL,
	[kysymys_en] [text] NULL,
	[jatkokysymys] [bit] NULL,
	[jatkokysymys_kysymysid] [text] NULL,
	[vastausid] [int] NULL,
	[numerovalinta] [int] NULL,
	[vapaateksti] [text] NULL,
	[monivalintavaihtoehto_fi] [text] NULL,
	[monivalintavaihtoehto_sv] [text] NULL,
	[monivalintavaihtoehto_en] [text] NULL,
	[vaihtoehto] [bit] NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnus] [text] NULL,
	[valmistavan_koulutuksen_jarjestaja] [text] NULL,
	[valmistavan_koulutuksen_oppilaitos] [text] NULL,
	[tutkintotunnus] [text] NULL,
	[taustatiedot.laajuus] [text] NULL,
	[taustatiedot.paaaine] [text] NULL,
	[taustatiedot.arvosana] [text] NULL,
	[taustatiedot.asteikko] [text] NULL,
	[taustatiedot.sukupuoli] [int] NULL,
	[taustatiedot.aidinkieli] [text] NULL,
	[taustatiedot.kansalaisuus] [text] NULL,
	[taustatiedot.valintavuosi] [int] NULL,
	[taustatiedot.tutkinnon_taso] [int] NULL,
	[taustatiedot.asuinkunta_koodi] [text] NULL,
	[taustatiedot.ika_valmistuessa] [int] NULL,
	[taustatiedot.koulutusalakoodi] [text] NULL,
	[taustatiedot.valmistumisvuosi] [int] NULL,
	[taustatiedot.lasnaolo_lukukausia] [text] NULL,
	[taustatiedot.valmistumisajankohta] [text] NULL,
	[taustatiedot.kirjoilla_olo_kuukausia] [int] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

GO

ALTER TABLE [sa].[sa_uraseuranta] ADD  CONSTRAINT [DF__sa_uraseuranta__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_uraseuranta] ADD  CONSTRAINT [DF__sa_uraseuranta__username]  DEFAULT (suser_name()) FOR [username]
GO
