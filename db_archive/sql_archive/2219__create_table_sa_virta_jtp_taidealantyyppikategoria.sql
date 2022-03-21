USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_jtp_taidealantyyppikategoria]    Script Date: 4.5.2019 0:31:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_jtp_taidealantyyppikategoria'
) BEGIN
DROP TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_jtp_taidealantyyppikategoria]') AND type in (N'U')
	)
BEGIN


CREATE TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[julkaisunTunnus] [nvarchar](30) NULL,
	[taidealanTyyppiKategoria] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[username] [nvarchar](128) NOT NULL,
CONSTRAINT [PK__sa_virta_jtp_taidealantyyppikategoria] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] ADD  CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_jtp_taidealantyyppikategoria] ADD  CONSTRAINT [DF__sa_virta_jtp_taidealantyyppikategoria__username]  DEFAULT (suser_name()) FOR [username]






