USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] DROP CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__username]
GO

ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] DROP CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__loadtime]
GO

/****** Object:  Table [dw].[f_varda_vakajarjestajat_toimipaikat]    Script Date: 19.8.2024 12:32:15 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_vakajarjestajat_toimipaikat]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_vakajarjestajat_toimipaikat]
GO

/****** Object:  Table [dw].[f_varda_vakajarjestajat_toimipaikat]    Script Date: 19.8.2024 12:32:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_vakajarjestajat_toimipaikat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[toimipaikka_id] [nvarchar](255) NOT NULL,
	[vakajarjestaja_oid] [nvarchar](255) NULL,
	[vakajarjestaja_id] [int] NULL,
	[d_alueluokitus_vakajarjestaja_kunta_id] [int] NULL,
	[toimipaikka_oid] [nvarchar](255) NULL,
	[d_alueluokitus_toimipaikka_kunta_id] [int] NOT NULL,
	[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id] [int] NOT NULL,
	[d_varda_toimipaikka_toimintamuoto_id] [int] NOT NULL,
	[d_varda_yritysluokitus_id] [int] NOT NULL,
	[d_varda_toimipaikkaluokitus_id] [int] NULL,
	[d_varda_varhaiskasvatuspaikkaluokitus_id] [int] NULL,
	[d_organisaatioluokitus_vakajarjestaja_id] [int] NOT NULL,
	[varhaiskasvatuspaikat] [int] NULL,
	[d_yritysmuoto_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_vakajarjestajat_toimipaikat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] ADD  CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_vakajarjestajat_toimipaikat] ADD  CONSTRAINT [DF__f_varda_vakajarjestajat_toimipaikat__username]  DEFAULT (suser_name()) FOR [username]
GO


