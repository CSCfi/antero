USE [ANTERO]
GO

/****** Object:  Table [dw].[d_taidealantyyppikategoria]    Script Date: 2.5.2019 16:49:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_taidealantyyppikategoria](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[taidealantyyppikategoria_koodi] [varchar](3) NOT NULL,
	[taidealantyyppikategoria_nimi_fi] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_sv] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_en] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_taidealantyyppikategoria_koodi]  AS (case when [taidealantyyppikategoria_koodi]=(-1) then '99999' else CONVERT([varchar](10),[taidealantyyppikategoria_koodi]) end),
 CONSTRAINT [PK_D_TAIDEALANTYYPPIKATEGORIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_taidealantyyppikategoria] ADD  CONSTRAINT [DF__d_taidealantyyppikategoria__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_taidealantyyppikategoria] ADD  CONSTRAINT [DF__d_taidealantyyppikategoria__username__531856C7]  DEFAULT (suser_sname()) FOR [username]



