USE [ANTERO]
GO

ALTER TABLE [dw].[d_hakukohde] DROP CONSTRAINT [DF_d_hakukohde_username]
GO

ALTER TABLE [dw].[d_hakukohde] DROP CONSTRAINT [DF_d_hakukohde_loadtime]
GO

/****** Object:  Table [dw].[d_hakukohde]    Script Date: 12.10.2022 15:05:34 ******/
DROP TABLE [dw].[d_hakukohde]
GO

/****** Object:  Table [dw].[d_hakukohde]    Script Date: 12.10.2022 15:05:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_hakukohde](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[kaksoistutkinto] [int] NULL,
	[ammatillinen_perustutkinto_erityisopetuksena] [int] NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_hakukohde__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]