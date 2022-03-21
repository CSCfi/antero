USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_haku_ja_valinta_korkea_aste_valintatapajonot]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_haku_ja_valinta_korkea_aste_valintatapajonot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_oid] [varchar](255) NULL,
	[haku_oid] [varchar](255) NULL,
	[d_hakukohde_id] [varchar](255) NULL,
	[d_valintatapajono_id] [int] NULL,
	[valintatapajono_nimi] [varchar](250) NULL,
	[kokonaispisteet] [decimal](12, 2) NULL,
	[paatelty] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL)
 ON [PRIMARY]

END

GO

USE [ANTERO]


