USE [ANTERO]

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='dw' and TABLE_NAME='erikoistumiskoulutus')

BEGIN
CREATE TABLE [dw].[d_erikoistumiskoulutus ](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[erikoistumiskoulutus _koodi] [varchar](3) NOT NULL,
	[erikoistumiskoulutus _nimi_fi] [varchar](100) NOT NULL,
	[erikoistumiskoulutus _nimi_sv] [varchar](100) NOT NULL,
	[erikoistumiskoulutus _nimi_en] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_erikoistumiskoulutus _koodi]  AS (case when [erikoistumiskoulutus _koodi]=(-1) then '99999' else CONVERT([varchar](10),[erikoistumiskoulutus _koodi]) end),
 CONSTRAINT [PK_D_erikoistumiskoulutus ] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END

GO

ALTER TABLE [dw].[d_erikoistumiskoulutus ] ADD  CONSTRAINT [DF__d_erikoistumiskoulutus __loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_erikoistumiskoulutus ] ADD  CONSTRAINT [DF__d_erikoistumiskoulutus __username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO
