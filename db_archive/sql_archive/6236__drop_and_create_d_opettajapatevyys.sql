USE [ANTERO]
GO

ALTER TABLE [dw].[d_opettajapatevyys] DROP CONSTRAINT [DF__d_opettajapatevyys__username]
GO

ALTER TABLE [dw].[d_opettajapatevyys] DROP CONSTRAINT [DF__d_opettajapatevyys__loadtime]
GO

ALTER TABLE [dw].[d_opettajapatevyys] DROP CONSTRAINT [DF_d_opettajapatevyys_jarjestys2_koodi]
GO

ALTER TABLE [dw].[d_opettajapatevyys] DROP CONSTRAINT [DF_d_opettajapatevyys_yli_asetuksen]
GO

ALTER TABLE [dw].[d_opettajapatevyys] DROP CONSTRAINT [DF_d_opettajapatevyys_selite2_fi]
GO

/****** Object:  Table [dw].[d_opettajapatevyys]    Script Date: 30.5.2022 10:44:13 ******/
DROP TABLE [dw].[d_opettajapatevyys]
GO

/****** Object:  Table [dw].[d_opettajapatevyys]    Script Date: 30.5.2022 10:44:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_opettajapatevyys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](20) NULL,
	[selite_fi] [nvarchar](550) NULL,
	[selite_sv] [nvarchar](550) NULL,
	[selite_en] [nvarchar](550) NULL,
	[selite2_fi] [nvarchar](550) NULL,
	[selite2_sv] [nvarchar](550) NULL,
	[selite2_en] [nvarchar](550) NULL,
	[patevyyksien_maara] [varchar](50) NULL,
	[aineenopettajan_pedagogiset] [int] NULL,
	[ammatillinen] [int] NULL,
	[erityislastentarhanopettaja] [int] NULL,
	[erityisopettaja] [int] NULL,
	[opinto_ohjaaja] [int] NULL,
	[monialaiset_opinnot] [int] NULL,
	[varhaiskasvatuksen_ammatilliset_valmiudet] [int] NULL,
	[ammatillinen_opettajakoulutus] [int] NULL,
	[ammatillinen_erityisopettajakoulutus] [int] NULL,
	[ammatillinen_opinto_ohjaajakoulutus] [int] NULL,
	[ruotsinkielinen_ammatillinen_opettajankoulutus] [int] NULL,
	[opettajan_pedagogiset_opinnot] [int] NULL,
	[luovien_alojen_opettaja] [int] NULL,
	[amk] [int] NULL,
	[yo] [int] NULL,
	[yli_asetuksen] [int] NULL,
	[jarjestys_koodi] [int] NULL,
	[jarjestys2_koodi] [varchar](50) NULL,
	[jarjestys3_koodi] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
 CONSTRAINT [PK_d_opettajapatevyys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF_d_opettajapatevyys_selite2_fi]  DEFAULT (N'Muu') FOR [selite2_fi]
GO

ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF_d_opettajapatevyys_yli_asetuksen]  DEFAULT ((0)) FOR [yli_asetuksen]
GO

ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF_d_opettajapatevyys_jarjestys2_koodi]  DEFAULT ('ÖÖ') FOR [jarjestys2_koodi]
GO

ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF__d_opettajapatevyys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF__d_opettajapatevyys__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]