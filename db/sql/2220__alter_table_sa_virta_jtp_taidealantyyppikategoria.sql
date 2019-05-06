USE [ANTERO]
GO

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] DROP CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__username]
GO

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] DROP CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__loadtime]
GO

/****** Object:  Table [sa].[sa_virta_jtp_taidealantyyppikategoria]    Script Date: 4.5.2019 1:13:19 ******/
DROP TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria]
GO

/****** Object:  Table [sa].[sa_virta_jtp_taidealantyyppikategoria]    Script Date: 4.5.2019 1:13:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[julkaisunTunnus] [nvarchar](30) NULL,
	[taidealanTyyppiKategoria] [int] NULL,
	[lkm] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_virta_jtp_taidealantyyppikategoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] ADD  CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] ADD  CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__username]  DEFAULT (suser_name()) FOR [username]



