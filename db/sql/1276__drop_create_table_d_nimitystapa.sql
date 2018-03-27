USE [ANTERO]
GO

ALTER TABLE [dw].[d_nimitystapa] DROP CONSTRAINT [DF__d_nimitystapa__username]
GO

ALTER TABLE [dw].[d_nimitystapa] DROP CONSTRAINT [DF__d_nimitystapa__loadtime]
GO

/****** Object:  Table [dw].[d_nimitystapa]    Script Date: 2.3.2018 8:39:31 ******/
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_nimitystapa')
BEGIN
DROP TABLE [dw].[d_nimitystapa]
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_nimitystapa')
BEGIN

CREATE TABLE [dw].[d_nimitystapa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[koodi] [varchar](5) NULL,
	[selite_fi] [varchar](50) NULL,
	[selite_sv] [varchar](50) NULL,
	[selite_en] [varchar](50) NULL,
	[selite2016_fi] [varchar](50) NULL,
	[selite2016_sv] [varchar](50) NULL,
	[selite2016_en] [varchar](50) NULL,
 CONSTRAINT [PK__d_nimitystapa] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[d_nimitystapa] ADD  CONSTRAINT [DF__d_nimitystapa__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_nimitystapa] ADD  CONSTRAINT [DF__d_nimitystapa__username]  DEFAULT (suser_sname()) FOR [username]
GO
