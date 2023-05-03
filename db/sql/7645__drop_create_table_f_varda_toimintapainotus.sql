USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_toimintapainotus] DROP CONSTRAINT [DF__f_varda_toimintapainotus__username]
GO

ALTER TABLE [dw].[f_varda_toimintapainotus] DROP CONSTRAINT [DF__f_varda_toimintapainotus__loadtime]
GO

/****** Object:  Table [dw].[f_varda_toimintapainotus]    Script Date: 3.5.2023 12:16:25 ******/
DROP TABLE [dw].[f_varda_toimintapainotus]
GO

/****** Object:  Table [dw].[f_varda_toimintapainotus]    Script Date: 3.5.2023 12:16:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_toimintapainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_toiminnallinenpainotus_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_toimintapainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_varda_toimintapainotus] ADD  CONSTRAINT [DF__f_varda_toimintapainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_toimintapainotus] ADD  CONSTRAINT [DF__f_varda_toimintapainotus__username]  DEFAULT (suser_name()) FOR [username]
GO


