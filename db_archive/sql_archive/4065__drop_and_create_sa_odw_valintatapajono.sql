USE [ANTERO]
GO

ALTER TABLE [sa].[sa_odw_valintatapajono] DROP CONSTRAINT [DF__sa_odw_valintatapajono__username]
GO

ALTER TABLE [sa].[sa_odw_valintatapajono] DROP CONSTRAINT [DF__sa_odw_valintatapajono__loadtime]
GO

/****** Object:  Table [sa].[sa_odw_valintatapajono]    Script Date: 28.10.2020 9:26:02 ******/
DROP TABLE [sa].[sa_odw_valintatapajono]
GO

/****** Object:  Table [sa].[sa_odw_valintatapajono]    Script Date: 28.10.2020 9:26:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_odw_valintatapajono](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[HenkiloOID] [nvarchar](255) NULL,
	[HakuOID] [nvarchar](255) NULL,
	[HakukohdeOID] [nvarchar](255) NULL,
	[JonoNimi] [nvarchar](255) NULL,
	[Kokonaispisteet] [decimal](12, 2) NULL,
	[JonoTyyppi] [nvarchar](255) NULL,
	[HakukohdeAlinLaskettuValintapistemaara] [decimal](12, 2) NULL,
    [ValintatapaJononAlinHyvaksyttyPistemaara] [decimal](12, 2) NULL,
 CONSTRAINT [PK__sa_odw_valintatapajono] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_odw_valintatapajono] ADD  CONSTRAINT [DF__sa_odw_valintatapajono__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_odw_valintatapajono] ADD  CONSTRAINT [DF__sa_odw_valintatapajono__username]  DEFAULT (suser_name()) FOR [username]
GO


