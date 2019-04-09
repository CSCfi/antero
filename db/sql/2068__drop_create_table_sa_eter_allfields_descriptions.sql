USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_allfields_descriptions')
BEGIN
	DROP TABLE [sa].[sa_eter_allfields_descriptions];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_allfields_descriptions')
BEGIN


CREATE TABLE [sa].[sa_eter_allfields_descriptions](
	[_id] [int] NOT NULL,
	[groupName] [varchar](31) NULL,
	[description] [varchar](4) NULL,
	[fields.fullTextSearch] [bit] NULL,
	[fields.accessRights] [bigint] NULL,
	[fields.package] [varchar](4) NULL,
	[fields.fieldId] [varchar](29) NULL,
	[fields.fieldName] [varchar](87) NULL,
	[fields.xlsId] [varchar](28) NULL,
	[fields.fieldType] [varchar](8) NULL,
	[fields.fieldNr] [bigint] NULL,
	[fields.createdAt] [varchar](24) NULL,
	[fields.updatedAt] [varchar](24) NULL,
	[fields.id] [varchar](24) NULL,
	[fields.description] [varchar](92) NULL,
	[fields.codesForFlags] [varchar](2) NULL,
	[fields.codesForValues] [varchar](7) NULL,
	[fields.codesForSPSSExport] [varchar](7) NULL,
	[fields.codesForSTATAExport] [varchar](8) NULL,
	[fields.fieldSubType] [varchar](4) NULL,
	[fields.isCalculated] [varchar](4) NULL,
	[fields.formula] [varchar](114) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_allfields_descriptions] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_allfields_descriptions] ADD  CONSTRAINT [DF__sa_eter_allfields_descriptions]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO