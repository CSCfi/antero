--
--  create table sa_suorat_koodistot_arvo_vastaukset
--
USE ANTERO
IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='sa'
	AND TABLE_NAME='sa_suorat_koodistot_arvo_vastaukset')

BEGIN

CREATE TABLE [sa].[sa_suorat_koodistot_arvo_vastaukset]
 (
	[koodi] [int] NULL,
	[selite_FI] [varchar](200) NULL,
	[selite_SV] [varchar](200) NULL,
	[selite_EN] [varchar](200) NULL,
	[vastaustyyppi] [varchar](100) NULL,
	[kysymysryhmaid] [int] NULL,
	[vuosi] [varchar](5) NULL,
	[lataaja] [varchar](100) NULL,
	[latausaika] [datetime] NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
END
