USE [ANTERO]
GO

/****** Object:  Table [dw].[d_taidealantyyppikategoria]    Script Date: 4.5.2023 10:02:22 ******/
DROP TABLE IF EXISTS [dw].[d_taidealantyyppikategoria]
GO

/****** Object:  Table [dw].[d_taidealantyyppikategoria]    Script Date: 4.5.2023 10:02:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_taidealantyyppikategoria](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[taidealantyyppikategoria_koodi] [varchar](3) NOT NULL,
	[taidealantyyppikategoria_nimi_fi] [varchar](100) NOT NULL,
	[taidealantyyppikategoria_nimi_sv] [varchar](100) NULL,
	[taidealantyyppikategoria_nimi_en] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[jarjestys_taidealantyyppikategoria_koodi] [varchar](3) NOT NULL,
 CONSTRAINT [PK_D_TAIDEALANTYYPPIKATEGORIA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]