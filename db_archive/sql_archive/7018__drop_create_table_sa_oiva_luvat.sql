
USE ANTERO
GO

DROP TABLE IF EXISTS [sa].[sa_oiva_luvat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_oiva_luvat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lupaId] [varchar](255) NULL,
	[diaarinumero] [varchar](50) NULL,
	[jarjestajaYtunnus] [varchar](30) NULL,
	[jarjestajaOid] [varchar](100) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[paatospvm] [date] NULL,
	[koulutustyyppi] [int] NULL,
	[koulutusmuodonPaasivunOtsikko] [nvarchar](255) NULL,
	[ministeri] [nvarchar](100) NULL,
	[esittelija] [nvarchar](100) NULL,
	[paatos_old_id] [int] NULL,
	[ministeri_nimike] [nvarchar](50) NULL,
	[esittelija_nimike] [nvarchar](50) NULL,
	[koulutustehtava_old_id] [int] NULL,
	[maksu] [bit] NULL,
	[paatoskierros_id] [varchar](40) NULL,
	[lupatila_id] [varchar](40) NULL,
	[asiatyyppi_id] [varchar](40) NULL,
	[kirje] [nvarchar](4000) NULL,
	[luoja] [nvarchar](255) NULL,
	[luontipvm] [datetime] NULL,
	[paivittaja] [nvarchar](255) NULL,
	[paivityspvm] [datetime] NULL,
	[edellinen_lupa_id] [varchar](40) NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[loadtime] [datetime2](4) NOT NULL,
 CONSTRAINT [PK__sa_oiva_luvat] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_oiva_luvat] ADD  CONSTRAINT [DF__sa_oiva_luvat__username]  DEFAULT (suser_name()) FOR [username]
GO
