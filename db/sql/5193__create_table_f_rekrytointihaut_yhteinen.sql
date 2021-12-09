USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[f_rekrytointihaut_yhteinen]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_rekrytointihaut_yhteinen](
	[Tilastovuosi] [nvarchar](4) NULL,
	[d_korkeakoulu_id] [bigint] NULL,
	[koodi_sektori] [nvarchar](3) NULL,
	[Hakunumero] [nvarchar](100) NULL,
	[d_kutsuhaku_id] [nvarchar](5) NULL,
	[d_kansainvalinen_haku_id] [nvarchar](5) NULL,
	[d_yhteisprofessuuri_id] [nvarchar](5) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kansalaisuus_suomi_id] [nvarchar](5) NULL,
	[d_kansalaisuus_maanosa_id] [nvarchar](5) NULL,
	[hakijat] [nvarchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](74) NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]

GO

USE [ANTERO]
