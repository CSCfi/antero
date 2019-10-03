--
--  create table d_amk_tehtavaryhma
--
USE [ANTERO]

IF NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA='dw'
	AND TABLE_NAME='d_amk_tehtavaryhma')

BEGIN

CREATE TABLE [dw].[d_amk_tehtavaryhma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koodi]  AS (case when [koodi]=('-1') then '999' else CONVERT([varchar](10),[koodi]) end),
 CONSTRAINT [PK__d_amk_tehtavaryhma] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

GO

ALTER TABLE [dw].[d_amk_tehtavaryhma] ADD  CONSTRAINT [DF_d_amk_tehtavaryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_amk_tehtavaryhma] ADD  CONSTRAINT [DF_d_amk_tehtavanryhma_username]  DEFAULT (suser_sname()) FOR [username]
GO
