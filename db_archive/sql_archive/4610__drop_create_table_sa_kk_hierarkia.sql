USE [ANTERO]
GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_kk_alayksikkohierarkia')
BEGIN
	DROP TABLE [sa].[sa_kk_alayksikkohierarkia];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_kk_alayksikkohierarkia')
BEGIN

CREATE TABLE [sa].[sa_kk_alayksikkohierarkia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[korkeakoulu] [varchar](255) NULL,
	[oppilaitoskoodi] [varchar](30) NULL,
	[oid] [varchar](255) NULL,
	[nimi_fi] [varchar](300) NULL,
	[nimi_sv] [varchar](300) NULL,
	[nimi_en] [varchar](300) NULL,
	[parentoid] [varchar](255) NULL,
	[hierarkiataso] [bigint] NULL,
	[isLeaf] [int] NULL,
	[parentOidPath] [varchar](1000) NULL,
	[oid_0] [varchar](255) NULL,
	[oid_1] [varchar](255) NULL,
	[oid_2] [varchar](255) NULL,
	[oid_3] [varchar](255) NULL,
	[oid_4] [varchar](255) NULL,
	[source] [varchar](500) NULL,
	[username] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	CONSTRAINT [PK__sa_kk_alayksikkohierarkia] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_kk_alayksikkohierarkia] ADD  CONSTRAINT [DF__sa_kk_alayksikkohierarkia__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_kk_alayksikkohierarkia] ADD  CONSTRAINT [DF__sa_kk_alayksikkohierarkia__username]  DEFAULT (suser_name()) FOR [username]
GO
