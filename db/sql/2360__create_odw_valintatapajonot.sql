USE ANTERO
CREATE TABLE [sa].[sa_odw_valintatapajono](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL CONSTRAINT [DF__sa_odw_valintatapajono__loadtime]  DEFAULT (getdate()),
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL CONSTRAINT [DF__sa_odw_valintatapajono__username]  DEFAULT (suser_name()),
	[HenkiloOID] [nvarchar](255) NULL,
	[HakuOID] [nvarchar](255) NULL,
	[HakukohdeOID] [nvarchar](255) NULL,
	[JonoNimi] [nvarchar](255) NULL,
	[Kokonaispisteet] [decimal](12,2) NULL			
 CONSTRAINT [PK__sa_odw_valintatapajono] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO