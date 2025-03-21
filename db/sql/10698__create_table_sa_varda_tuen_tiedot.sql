USE [Varda_SA]
GO

ALTER TABLE [sa].[sa_varda_tuen_tiedot] DROP CONSTRAINT [DF__sa_varda_tuen_tiedot_username]
GO

ALTER TABLE [sa].[sa_varda_tuen_tiedot] DROP CONSTRAINT [DF__sa_varda_tuen_tiedot_imp_created]
GO

/****** Object:  Table [sa].[sa_varda_tuen_tiedot]    Script Date: 21.3.2025 11.49.59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_tuen_tiedot]') AND type in (N'U'))
DROP TABLE [sa].[sa_varda_tuen_tiedot]
GO


SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_varda_tuen_tiedot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[organisaatio_oid] [varchar](255) NULL,
	[tilastointi_pvm] [datetime] NULL,
	[yksityinen_jarjestaja] [int] NULL,
	[tuentaso_koodi] [varchar](5) NULL,
	[ikaryhma_koodi] [varchar](5) NULL,
	[tukipaatosmaara] [int] NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL,
 CONSTRAINT [PK__sa_varda_tuen_tiedot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_varda_tuen_tiedot] ADD  CONSTRAINT [DF__sa_varda_tuen_tiedot_imp_created]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_varda_tuen_tiedot] ADD  CONSTRAINT [DF__sa_varda_tuen_tiedot_username]  DEFAULT (suser_sname()) FOR [username]
GO
