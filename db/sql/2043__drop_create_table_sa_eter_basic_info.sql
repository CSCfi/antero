USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_basic_info')
BEGIN
	DROP TABLE [sa].[sa_eter_basic_info];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_basic_info')
BEGIN
CREATE TABLE [sa].[sa_eter_basic_info](
	[_id] [varchar](24) NOT NULL,
	[BAS.ETERIDYEAR] [varchar](11) NULL,
	[BAS.ETERID] [varchar](6) NULL,
	[BAS.NATID] [varchar](14) NULL,
	[BAS.INSTNAMEENGL] [varchar](121) NULL,
	[BAS.INSTNAME] [varchar](603) NULL,
	[BAS.REFYEAR] [bigint] NULL,
	[BAS.INSTCAT] [varchar](233) NULL,
	[BAS.COUNTRY] [varchar](2) NULL,
	[BAS.INSTCATSTAND.v] [varchar](2) NULL,
	[BAS.INSTCATSTAND.code] [varchar](2) NULL,
	[BAS.NAMEFORCAMP] [varchar](35) NULL,
	[BAS.NOTESFORCAMP] [varchar](185) NULL,
	[BAS.LEGALYEAR.v] [varchar](4) NULL,
	[BAS.LEGALYEAR.code] [varchar](2) NULL,
	[BAS.ANCESTYEAR.code] [varchar](2) NULL,
	[BAS.ANCESTYEAR.v] [varchar](4) NULL,
	[BAS.UNIHOSPID] [varchar](76) NULL,
	[BAS.NOTESUNIHOSP] [varchar](311) NULL,
	[BAS.NOTESINSTNAME] [varchar](238) NULL,
	[BAS.LEGALSTAT.v] [varchar](2) NULL,
	[BAS.LEGALSTAT.code] [varchar](2) NULL,
	[BAS.FORCAMP.v] [varchar](5) NULL,
	[BAS.FORCAMP.code] [varchar](2) NULL,
	[BAS.NOTESINSTCAT] [varchar](160) NULL,
	[BAS.NOTESFOUNDYEAR] [varchar](239) NULL,
	[BAS.FOUNDYEAR.v] [varchar](4) NULL,
	[BAS.FOUNDYEAR.code] [varchar](2) NULL,
	[BAS.UNIHOSP.v] [varchar](5) NULL,
	[BAS.UNIHOSP.code] [varchar](2) NULL,
	[BAS.NOTESWEBSITE] [varchar](130) NULL,
	[BAS.ACRONYM] [varchar](58) NULL,
	[BAS.NOTESANCESTYEAR] [varchar](211) NULL,
	[BAS.INSTCATENGL] [varchar](61) NULL,
	[BAS.WEBSITE] [varchar](107) NULL,
	[BAS.FORCAMPCOUNTRY] [varchar](6) NULL,
	[BAS.NOTESLEGALYEAR] [varchar](220) NULL,
	[BAS.UNIHOSPNAME] [varchar](723) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_basic_info] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_basic_info] ADD  CONSTRAINT [DF__sa_eter_basic_info]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO