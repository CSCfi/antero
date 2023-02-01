USE ANTERO
GO

DROP TABLE IF EXISTS [sa].[sa_koodistot_suomi_fi]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koodistot_suomi_fi](
[id] [bigint] IDENTITY(1,1) NOT NULL,
[koodisto] [nvarchar](2550) NOT NULL,
[koodi] [nvarchar](100) NOT NULL,
[nimi] [nvarchar](500) NULL,
[nimi_sv] [nvarchar](500) NULL,
[nimi_en] [nvarchar](500) NULL,
[alkupvm] [date] NULL,
[loppupvm] [date] NULL,
[loadtime] [datetime2](4) NOT NULL,
[source] [nvarchar](255) NULL,
[username] [nvarchar](255) NOT NULL,
CONSTRAINT [PK__sa_koodistot_suomi_fi] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koodistot_suomi_fi] ADD  CONSTRAINT [DF__sa_koodistot_suomi_fi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_koodistot_suomi_fi] ADD  CONSTRAINT [DF__sa_koodistot_suomi_fi__username]  DEFAULT (suser_name()) FOR [username]
GO
