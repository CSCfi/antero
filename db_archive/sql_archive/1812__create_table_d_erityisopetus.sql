USE ANTERO

IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_erityisopetus')
BEGIN
ALTER TABLE [dw].[d_erityisopetus] DROP CONSTRAINT [DF__d_erityisopetus__username];
ALTER TABLE [dw].[d_erityisopetus] DROP CONSTRAINT [DF__d_erityisopetus__loadtime];
DROP TABLE [dw].[d_erityisopetus]
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_erityisopetus')
BEGIN

CREATE TABLE [dw].[d_erityisopetus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[erityisopetus_koodi] [varchar](3) NOT NULL,
	[erityisopetus_nimi_fi] [varchar](100) NOT NULL,
	[erityisopetus_nimi_sv] [varchar](100) NOT NULL,
	[erityisopetus_nimi_en] [varchar](100) NOT NULL,
	[alkupvm] [date] NOT NULL,
	[loppupvm][date] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_erityisopetus_koodi]  AS (case when [erityisopetus_koodi]=(-1) then '99999' else CONVERT([varchar](10),[erityisopetus_koodi]) end),
 CONSTRAINT [PK_d_erityisopetus] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dw].[d_erityisopetus] ADD  CONSTRAINT [DF__d_erityisopetus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_erityisopetus] ADD  CONSTRAINT [DF__d_erityisopetus__username]  DEFAULT (suser_sname()) FOR [username]
GO
