USE [ANTERO]

IF  EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_uraseuranta')

BEGIN
ALTER TABLE sa.sa_arvo_uraseuranta DROP  CONSTRAINT DF__sa_arvo_uraseuranta__loadtime
;
ALTER TABLE sa.sa_arvo_uraseuranta DROP  CONSTRAINT DF__sa_arvo_uraseuranta__username
;
DROP TABLE sa.sa_arvo_uraseuranta
END
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_uraseuranta')

BEGIN
CREATE TABLE sa.sa_arvo_uraseuranta
  (
  [kyselyid] [int] NULL,
	[koulutustoimija] [varchar](1000) NULL,
	[kysely_fi] [varchar](1000) NULL,
	[kysely_sv] [varchar](1000) NULL,
	[kysely_en] [varchar](1000) NULL,
	[kyselykertaid] [int] NULL,
	[kyselykerta] [varchar](1000) NULL,
	[kysymysryhmaid] [int] NULL,
	[kysymysryhma_fi] [varchar](1000) NULL,
	[kysymysryhma_sv] [varchar](1000) NULL,
	[kysymysryhma_en] [varchar](1000) NULL,
	[valtakunnallinen] [bit] NULL,
	[kysymysryhma_jarjestys] [int] NULL,
	[kysymysid] [int] NULL,
	[jarjestys] [varchar](10) NULL,
	[jarjestys2] [varchar](10) NULL,
	[vastaustyyppi] [varchar](1000) NULL,
	[kysymys_fi] [varchar](1000) NULL,
	[kysymys_sv] [varchar](1000) NULL,
	[kysymys_en] [varchar](1000) NULL,
	[jatkokysymys] [bit] NULL,
	[jatkokysymys_kysymysid] [varchar](1000) NULL,
	[vastausid] [int] NULL,
	[numerovalinta] [int] NULL,
	[vapaateksti] [varchar](1000) NULL,
	[monivalintavaihtoehto_fi] [varchar](1000) NULL,
	[monivalintavaihtoehto_sv] [varchar](1000) NULL,
	[monivalintavaihtoehto_en] [varchar](1000) NULL,
	[vaihtoehto] [bit] NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnus] [varchar](1000) NULL,
	[valmistavan_koulutuksen_jarjestaja] [varchar](1000) NULL,
	[valmistavan_koulutuksen_oppilaitos] [varchar](1000) NULL,
	[tutkintotunnus] [varchar](1000) NULL,
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
	[taustatiedot.kirjoilla_olo_kuukausia] [int] NULL
  , loadtime DATETIME
  , username VARCHAR(100)
  , source VARCHAR(100)
  )

ALTER TABLE sa.sa_arvo_uraseuranta ADD  CONSTRAINT DF__sa_arvo_uraseuranta__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_arvo_uraseuranta ADD  CONSTRAINT DF__sa_arvo_uraseuranta__username  DEFAULT (suser_name()) FOR username
;

END
