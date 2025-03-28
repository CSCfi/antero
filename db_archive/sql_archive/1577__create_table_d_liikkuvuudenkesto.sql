﻿USE [ANTERO]
GO

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_liikkuvuudenkesto') begin

CREATE TABLE [dw].[d_liikkuvuudenkesto](
	[id] [int] IDENTITY(-1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[liikkuvuudenkesto_koodi] [varchar](5) NOT NULL,
	[liikkuvuudenkesto_fi] [nvarchar](100) NOT NULL,
	[liikkuvuudenkesto_sv] [nvarchar](100) NOT NULL,
	[liikkuvuudenkesto_en] [nvarchar](100) NOT NULL,
	[liikkuvuudenpituus_fi] [nvarchar](100) NOT NULL,
	[liikkuvuudenpituus_en] [nvarchar](100) NOT NULL,
	[liikkuvuudenpituus_sv] [nvarchar](100) NOT NULL,
	[jarjestys_liikkuvuudenkesto_koodi]  AS (case when [liikkuvuudenkesto_koodi]=(-1) then '99999' else CONVERT([varchar](10),[liikkuvuudenkesto_koodi]) end),
 CONSTRAINT [PK__d_liikkuvuudenkesto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_liikkuvuudenkesto] ADD  CONSTRAINT [DF__d_liikkuvuudenkesto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

;

ALTER TABLE [dw].[d_liikkuvuudenkesto] ADD  CONSTRAINT [DF__d_liikkuvuudenkesto__username]  DEFAULT (suser_sname()) FOR [username]

;

END


