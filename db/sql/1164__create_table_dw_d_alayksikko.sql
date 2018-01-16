IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw'
   AND TABLE_NAME='d_alayksikko') BEGIN

CREATE TABLE [dw].[d_alayksikko](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NULL,
	[organisaatio] [nvarchar](20) NULL,
	[alayksikko_koodi] [nvarchar](20) NULL,
	[alayksikko_nimi] [nvarchar](200) NULL,
 CONSTRAINT [PK__d_alayksikko] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END