USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_organisaatio_v3]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_organisaatio_v3]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[organisaatio_v3]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_organisaatio_v3](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[organisaation_koodi] [varchar](30) NOT NULL,
	[oid] [nvarchar](100) NULL,
	[parentoid] [nvarchar](100) NULL,
	[ytunnus] [nvarchar](25) NULL,
	[tyypit] [nvarchar](300) NULL,
	[yritysmuoto] [nvarchar](100) NULL,
	[nimi_fi] [nvarchar](500) NULL,
	[nimi_sv] [nvarchar](500) NULL,
	[nimi_en] [nvarchar](500) NULL,
	[status] [nvarchar](30) NULL,
	[ytjpaivitysPvm] [datetime] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_sa_organisaatio_v3] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_organisaatio_v3] ADD  CONSTRAINT [DF__sa_organisaatio_v3__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_organisaatio_v3] ADD  CONSTRAINT [DF__sa_organisaatio_v3__username]  DEFAULT (suser_sname()) FOR [username]
GO
