USE ANTERO
CREATE TABLE [sa].[sa_odw_yoarvosanat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_odw_yoarvosanat__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_odw_yoarvosanat__username]  DEFAULT (suser_name()),
	[HenkiloOID] [nvarchar](255) NULL,
	[Tila] [nvarchar](255) NULL,
	[Valmistumispaivamaara] [nvarchar](255) NULL,
	[ArvosanaUuid] [nvarchar](255) NULL,
	[Arvosana] [nvarchar](255) NULL,
	[Pisteet] [nvarchar](255) NULL,
	[Aine] [nvarchar](255) NULL,
	[Koetunnus] [nvarchar](255) NULL,
	[Aineyhdistelmarooli] [nvarchar](255) NULL,
	[Valinnainen] [int] NULL,
	[Lisatieto] [nvarchar](255) NULL,
	[Myonnetty] [nvarchar](255) NULL,
	[ArvosanaAsteikko] [nvarchar](255) NULL,
 CONSTRAINT [PK__sa_odw_yoarvosanat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO