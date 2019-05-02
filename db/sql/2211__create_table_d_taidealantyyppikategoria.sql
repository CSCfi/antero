USE [ANTERO]
GO

/****** Object:  Table [dw].[d_taidealantyyppikategoria]    Script Date: 2.5.2019 22:43:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_taidealantyyppikategoria]') AND type in (N'U'))

CREATE TABLE [dw].[d_taidealantyyppikategoria](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[taidealantyyppikategoria_koodi] [varchar](3) NOT NULL,
	[taidealantyyppikategoria_nimi_fi] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_sv] [varchar](100) NULL,
	[taidealantyyppikategoria_nimi_en] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[jarjestys_taidealantyyppikategoria_koodi]  AS (case when [taidealantyyppikategoria_koodi]=(-1) then '99999' else CONVERT([varchar](10),[taidealantyyppikategoria_koodi]) end),
 CONSTRAINT [PK_D_TAIDEALANTYYPPIKATEGORIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]








