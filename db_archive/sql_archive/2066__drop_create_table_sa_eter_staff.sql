USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_staff')
BEGIN
	DROP TABLE [sa].[sa_eter_staff];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_staff')
BEGIN


CREATE TABLE [sa].[sa_eter_staff](
	[_id] [varchar](24) NOT NULL,
	[STA.ACAHCMEN.code] [varchar](2) NULL,
	[STA.ACAHCMEN.v] [varchar](16) NULL,
	[STA.ACAHCGENUNCL.code] [varchar](2) NULL,
	[STA.ACAHCGENUNCL.v] [varchar](17) NULL,
	[STA.ACAHCFOR.code] [varchar](2) NULL,
	[STA.ACAHCFOR.v] [varchar](18) NULL,
	[STA.FLAGACACITIZ.v] [varchar](2) NULL,
	[STA.FLAGACACITIZ.r] [varchar](2) NULL,
	[STA.ACAHCFOE02.code] [varchar](2) NULL,
	[STA.ACAHCFOE02.v] [varchar](4) NULL,
	[STA.ACAHCFOE04.code] [varchar](2) NULL,
	[STA.ACAHCFOE04.v] [varchar](4) NULL,
	[STA.ACAHCFOE07.code] [varchar](2) NULL,
	[STA.ACAHCFOE07.v] [varchar](4) NULL,
	[STA.ACAHCFOE09.code] [varchar](2) NULL,
	[STA.ACAHCFOE09.v] [varchar](4) NULL,
	[STA.FLAGACAFOE.v] [varchar](4) NULL,
	[STA.FLAGACAFOE.r] [varchar](2) NULL,
	[STA.FLAGTOTACAHC.v] [varchar](51) NULL,
	[STA.FLAGTOTACAHC.r] [varchar](2) NULL,
	[STA.PROFGENUNCL.code] [varchar](2) NULL,
	[STA.PROFGENUNCL.v] [varchar](2) NULL,
	[STA.FLAGPROF.v] [varchar](6) NULL,
	[STA.FLAGPROF.r] [varchar](2) NULL,
	[STA.NONACAFTE.code] [varchar](2) NULL,
	[STA.NONACAFTE.v] [varchar](16) NULL,
	[STA.NONACAHC.code] [varchar](2) NULL,
	[STA.NONACAHC.v] [varchar](16) NULL,
	[STA.TOTALFTE.code] [varchar](2) NULL,
	[STA.TOTALFTE.v] [varchar](16) NULL,
	[STA.TOTALHC.code] [varchar](2) NULL,
	[STA.TOTALHC.v] [varchar](16) NULL,
	[STA.FLAGACAFTETOTAL.v] [varchar](5) NULL,
	[STA.FLAGACAFTETOTAL.r] [varchar](2) NULL,
	[STA.ACAHCNAT.code] [varchar](2) NULL,
	[STA.ACAHCNAT.v] [varchar](16) NULL,
	[STA.ACAHCFOE01.code] [varchar](2) NULL,
	[STA.ACAHCFOE01.v] [varchar](4) NULL,
	[STA.ACAHCFOE06.code] [varchar](2) NULL,
	[STA.ACAHCFOE06.v] [varchar](3) NULL,
	[STA.ACAHCFOEUNCL.code] [varchar](2) NULL,
	[STA.ACAHCFOEUNCL.v] [varchar](4) NULL,
	[STA.PROFWOMEN.code] [varchar](2) NULL,
	[STA.PROFWOMEN.v] [varchar](8) NULL,
	[STA.NOTESACA] [varchar](317) NULL,
	[STA.NOTESNONACA] [varchar](212) NULL,
	[STA.NOTESTOTAL] [varchar](233) NULL,
	[STA.ACAHCWOMEN.code] [varchar](2) NULL,
	[STA.ACAHCWOMEN.v] [varchar](16) NULL,
	[STA.ACAHCCITUNCL.code] [varchar](2) NULL,
	[STA.ACAHCCITUNCL.v] [varchar](8) NULL,
	[STA.ACAHCFOE03.code] [varchar](2) NULL,
	[STA.ACAHCFOE03.v] [varchar](4) NULL,
	[STA.ACAHCFOE08.code] [varchar](2) NULL,
	[STA.ACAHCFOE08.v] [varchar](4) NULL,
	[STA.TOTACAHC.code] [varchar](2) NULL,
	[STA.TOTACAHC.v] [varchar](16) NULL,
	[STA.PROFTOTAL.code] [varchar](2) NULL,
	[STA.PROFTOTAL.v] [varchar](8) NULL,
	[STA.FLAGNONACAFTE.v] [varchar](5) NULL,
	[STA.FLAGNONACAFTE.r] [varchar](2) NULL,
	[STA.FLAGTOTALFTE.v] [varchar](6) NULL,
	[STA.FLAGTOTALFTE.r] [varchar](2) NULL,
	[STA.ACAFTETOTAL.code] [varchar](2) NULL,
	[STA.ACAFTETOTAL.v] [varchar](16) NULL,
	[STA.FLAGACAGENDER.v] [varchar](5) NULL,
	[STA.FLAGACAGENDER.r] [varchar](2) NULL,
	[STA.ACAHCFOE00.code] [varchar](2) NULL,
	[STA.ACAHCFOE00.v] [varchar](3) NULL,
	[STA.ACAHCFOE05.code] [varchar](2) NULL,
	[STA.ACAHCFOE05.v] [varchar](4) NULL,
	[STA.ACAHCFOE10.code] [varchar](2) NULL,
	[STA.ACAHCFOE10.v] [varchar](3) NULL,
	[STA.PROFMEN.code] [varchar](2) NULL,
	[STA.PROFMEN.v] [varchar](8) NULL,
	[STA.INCLPHDSTUD.code] [varchar](2) NULL,
	[STA.INCLPHDSTUD.v] [varchar](5) NULL,
	[STA.FLAGNONACAHC.v] [varchar](9) NULL,
	[STA.FLAGNONACAHC.r] [varchar](2) NULL,
	[STA.FLAGTOTALHC.v] [varchar](9) NULL,
	[STA.FLAGTOTALHC.r] [varchar](2) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_staff] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_staff] ADD  CONSTRAINT [DF__sa_eter_staff]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO