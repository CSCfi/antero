USE [ANTERO]
GO

/****** Object:  Table [dw].[d_hakukohde_ovara]    Script Date: 4.2.2026 9.00.28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_hakukohde]') AND type in (N'U'))
DROP TABLE [dw].[d_hakukohde]
DROP TABLE IF EXISTS [dw].[d_hakukohde_ovara]
GO

/****** Object:  Table [dw].[d_hakukohde_ovara]    Script Date: 4.2.2026 9.00.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_hakukohde](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid] [varchar](255) NOT NULL,
	[selite_fi] [varchar](max) NULL,
	[selite_sv] [varchar](max) NULL,
	[selite_en] [varchar](max) NULL,
	[kaksoistutkinto] [int] NULL,
	[ammatillinen_perustutkinto_erityisopetuksena] [int] NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_hakukohde__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_username]  DEFAULT (suser_sname()) FOR [username]