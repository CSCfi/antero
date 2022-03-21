USE [ANTERO]
GO

/****** Object:  View [dbo].[v_f_tab_otv_korkeakoulut_yliopisto]    Script Date: 17.1.2020 13:21:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_vaka_organisaatiot]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_vaka_organisaatiot]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_vaka_organisaatiot]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_vaka_organisaatiot](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid] [nvarchar](100) NULL,
	[parentOid] [varchar](100) NULL,
	[parentOidPath] [nvarchar](300) NULL,
	[nimi_fi] [nvarchar](300) NULL,
	[nimi_en] [nvarchar](300) NULL,
	[nimi_sv] [nvarchar](300) NULL,
	[paikkojenLukumaara] [int] NULL,
	[opetuskieli] [nvarchar](100) NULL,
	[toimintamuoto] [nvarchar](100) NULL,
	[kotipaikkaUri] [nvarchar](100) NULL,
	[muutKotipaikatUris] [nvarchar](100) NULL,
	[maaUri] [nvarchar](100) NULL,
	[kayntiosoite_osoite] [nvarchar](100) NULL,
	[kayntiosoite_postinumero] [nvarchar](100) NULL,
	[kayntiosoite_postitoimipaikka] [nvarchar](100) NULL,
	[kasvatusopillinenJarjestelma] [nvarchar](100) NULL,
	[kayntisoite_osoitetyyppi] [nvarchar](100) NULL,
	[postiosoite_osoite] [nvarchar](100) NULL,
	[postiosoite_postinumero] [nvarchar](100) NULL,
	[postiosoite_postitoimipaikka] [nvarchar](100) NULL,
	[postiosoite_osoitetyyppi] [nvarchar](100) NULL,
	[alkupvm] [datetime] NULL,
	[lakkautuspvm] [datetime] NULL,
	[status] [nvarchar](100) NULL,
	[source] [nvarchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [nvarchar](100) NULL,
 CONSTRAINT [PK__sa_vaka_organisaatiot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

GO

ALTER TABLE [sa].[sa_vaka_organisaatiot] ADD  CONSTRAINT [DF_sa_vaka_organisaatiot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_vaka_organisaatiot] ADD  CONSTRAINT [DF_sa_vaka_organisaatiot_username]  DEFAULT (suser_sname()) FOR [username]
GO
