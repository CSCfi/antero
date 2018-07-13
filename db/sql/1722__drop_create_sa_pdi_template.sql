USE [ANTERO]
GO

GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_pdi_template')
BEGIN
DROP TABLE [sa].[sa_pdi_template]
END
GO

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_pdi_template')
BEGIN


CREATE TABLE [sa].[sa_pdi_template](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[row] [int] NULL,
	[resource] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL

	CONSTRAINT [PK__sa_pdi_template] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
END


ALTER TABLE [sa].[sa_pdi_template] ADD  CONSTRAINT [DF__sa_pdi_template__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_pdi_template] ADD  CONSTRAINT [DF__sa_pdi_template__username]  DEFAULT (suser_name()) FOR [username]
GO
