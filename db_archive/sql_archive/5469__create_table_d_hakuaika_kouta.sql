USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_yo_keskiarvo]    Script Date: 20.1.2022 14:36:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dw].[d_hakuaika_kouta] 
GO

CREATE TABLE [dw].[d_hakuaika_kouta](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[hakuaikaId] [varchar](255) NULL,
	[alkuPvm] [date] NULL,
	[loppuPvm] [date] NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[haku_oid] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[selite2_fi] [varchar](100) NULL,
	[selite2_sv] [varchar](100) NULL,
	[selite2_en] [varchar](100) NULL,
	[jarjestys2] [int] NULL,
 CONSTRAINT [PK__d_hakuaika_kouta__3213E83FFE0FF40] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_hakuaika_kouta] ADD  CONSTRAINT [DF_d_hakuaika_kouta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_hakuaika_kouta] ADD  CONSTRAINT [DF_d_hakuaika_kouta_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]