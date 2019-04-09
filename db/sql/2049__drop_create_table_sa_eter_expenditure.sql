USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_expenditure')
BEGIN
	DROP TABLE [sa].[sa_eter_expenditure];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_expenditure')
BEGIN

CREATE TABLE [sa].[sa_eter_expenditure](
	[_id] [varchar](24) NOT NULL,
	[EXP.CURRPERSON.EURO.code] [varchar](2) NULL,
	[EXP.CURRPERSON.EURO.v] [varchar](16) NULL,
	[EXP.CURRPERSON.PPP.code] [varchar](2) NULL,
	[EXP.CURRPERSON.PPP.v] [varchar](17) NULL,
	[EXP.CURRPERSON.NC.code] [varchar](2) NULL,
	[EXP.CURRPERSON.NC.v] [varchar](16) NULL,
	[EXP.CURRNONPERSON.NC.code] [varchar](2) NULL,
	[EXP.CURRNONPERSON.NC.v] [varchar](16) NULL,
	[EXP.CURRNONPERSON.PPP.code] [varchar](2) NULL,
	[EXP.CURRNONPERSON.PPP.v] [varchar](16) NULL,
	[EXP.CURRNONPERSON.EURO.code] [varchar](2) NULL,
	[EXP.CURRNONPERSON.EURO.v] [varchar](16) NULL,
	[EXP.FLAGCURRUNCL.v] [varchar](2) NULL,
	[EXP.FLAGCURRUNCL.r] [varchar](2) NULL,
	[EXP.CURRUNCL.EURO.code] [varchar](2) NULL,
	[EXP.CURRUNCL.EURO.v] [varchar](17) NULL,
	[EXP.CURRUNCL.NC.code] [varchar](2) NULL,
	[EXP.CURRUNCL.NC.v] [varchar](17) NULL,
	[EXP.CURRUNCL.PPP.code] [varchar](2) NULL,
	[EXP.CURRUNCL.PPP.v] [varchar](17) NULL,
	[EXP.CAPITAL.NC.code] [varchar](2) NULL,
	[EXP.CAPITAL.NC.v] [varchar](12) NULL,
	[EXP.CAPITAL.PPP.code] [varchar](2) NULL,
	[EXP.CAPITAL.PPP.v] [varchar](17) NULL,
	[EXP.CAPITAL.EURO.code] [varchar](2) NULL,
	[EXP.CAPITAL.EURO.v] [varchar](16) NULL,
	[EXP.NOTES] [varchar](244) NULL,
	[EXP.CURRTOTAL.PPP.code] [varchar](2) NULL,
	[EXP.CURRTOTAL.PPP.v] [varchar](17) NULL,
	[EXP.CURRTOTAL.EURO.code] [varchar](2) NULL,
	[EXP.CURRTOTAL.EURO.v] [varchar](16) NULL,
	[EXP.CURRTOTAL.NC.code] [varchar](2) NULL,
	[EXP.CURRTOTAL.NC.v] [varchar](16) NULL,
	[EXP.FLAGCAPITAL.v] [varchar](20) NULL,
	[EXP.FLAGCAPITAL.r] [varchar](2) NULL,
	[EXP.FLAGCURRPERSON.v] [varchar](43) NULL,
	[EXP.FLAGCURRPERSON.r] [varchar](2) NULL,
	[EXP.FLAGCURRNONPERSON.v] [varchar](19) NULL,
	[EXP.FLAGCURRNONPERSON.r] [varchar](2) NULL,
	[EXP.FLAGCURRTOTAL.v] [varchar](5) NULL,
	[EXP.FLAGCURRTOTAL.r] [varchar](2) NULL,
	[EXP.ACCSYSTEM.code] [varchar](2) NULL,
	[EXP.ACCSYSTEM.v] [varchar](2) NULL,
	[RES.R_n_DEXP.NC.code] [varchar](2) NULL,
	[RES.R_n_DEXP.NC.v] [varchar](16) NULL,
	[RES.R_n_DEXP.PPP.code] [varchar](2) NULL,
	[RES.R_n_DEXP.PPP.v] [varchar](16) NULL,
	[RES.R_n_DEXP.EURO.code] [varchar](2) NULL,
	[RES.R_n_DEXP.EURO.v] [varchar](16) NULL,
	[RES.FLAGR_n_DEXP.v] [varchar](2) NULL,
	[RES.FLAGR_n_DEXP.r] [varchar](2) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_expenditure] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_expenditure] ADD  CONSTRAINT [DF__sa_eter_expenditure]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO