USE [ANTERO]
GO

GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_oiva_opiskelijavuodet')
BEGIN
DROP TABLE [dw].[d_organisaation_alayksikot]
END
GO

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_oiva_opiskelijavuodet')
BEGIN


CREATE TABLE [dw].[f_oiva_opiskelijavuodet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_id] [int] NULL,
	[arvo] [int] NULL,
	[oid] [nvarchar](50) NULL,
	[ytunnus] [nvarchar](9) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_oiva_opiskelijavuodet] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_oiva_opiskelijavuodet] ADD  CONSTRAINT [DF__f_oiva_opiskelijavuodet__loadtime]  DEFAULT (getdate()) FOR [loadtime]


ALTER TABLE [dw].[f_oiva_opiskelijavuodet] ADD  CONSTRAINT [DF__f_oiva_opiskelijavuodet__username]  DEFAULT (suser_name()) FOR [username]
GO
