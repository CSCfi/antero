USE [ANTERO]
GO

GO
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot')
BEGIN
DROP TABLE [dw].[d_organisaation_alayksikot]
END
GO

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot')
BEGIN


CREATE TABLE [dw].[d_organisaation_alayksikot](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vuosi] [int] NULL,
	[korkeakoulu_koodi] [nvarchar](10) NULL,
	[alayksikko_koodi] [nvarchar](100) NULL,
	[alayksikko_nimi] [nvarchar](100) NULL,
	[alayksikko_nimi_sv] [nvarchar](150) NULL,
	[alayksikko_nimi_en] [nvarchar](150) NULL,
	[paayksikko_koodi] [nvarchar](100) NULL,
	[jarjestys_korkeakoulu_koodi]  AS (case when [korkeakoulu_koodi]='-1' then 'ZZZ' else CONVERT([nvarchar](100),[korkeakoulu_koodi]) end),
	[jarjestys_paayksikko_koodi]  AS (case when [paayksikko_koodi]='-1' then 'ZZZ' else CONVERT([nvarchar](100),[paayksikko_koodi]) end),
	[jarjestys_alayksikko_koodi]  AS (case when [alayksikko_koodi]='-1' then 'ZZZ' else CONVERT([nvarchar](100),[alayksikko_koodi]) end),
	[source] [varchar](100) NULL,
	[loadtime] [datetime],
	[username] [varchar](100) NULL,
 CONSTRAINT [PK__d_organisaation_alayksikot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO


ALTER TABLE [dw].[d_organisaation_alayksikot] ADD  CONSTRAINT [DF__d_organisaation_alayksikot__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_organisaation_alayksikot] ADD  CONSTRAINT [DF__d_organisaation_alayksikot_username]  DEFAULT (suser_sname()) FOR [username]
GO 
