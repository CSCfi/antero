USE ANTERO

IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_majoitus')
BEGIN
ALTER TABLE [dw].[d_majoitus] DROP CONSTRAINT [DF__d_majoitus__username];
ALTER TABLE [dw].[d_majoitus] DROP CONSTRAINT [DF__d_majoitus__loadtime];
DROP TABLE [dw].[d_majoitus]
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_majoitus')
BEGIN

CREATE TABLE [dw].[d_majoitus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[majoitus_koodi] [varchar](3) NOT NULL,
	[majoitus_nimi_fi] [varchar](100) NOT NULL,
	[majoitus_nimi_sv] [varchar](100) NOT NULL,
	[majoitus_nimi_en] [varchar](100) NOT NULL,
	[alkupvm] [date] NOT NULL,
	[loppupvm][date] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_majoitus_koodi]  AS (case when [majoitus_koodi]=(-1) then '99999' else CONVERT([varchar](10),[majoitus_koodi]) end),
 CONSTRAINT [PK_d_majoitus] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[d_majoitus] ADD  CONSTRAINT [DF__d_majoitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_majoitus] ADD  CONSTRAINT [DF__d_majoitus__username]  DEFAULT (suser_sname()) FOR [username]
GO
