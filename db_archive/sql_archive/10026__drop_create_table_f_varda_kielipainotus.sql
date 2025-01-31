USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_kielipainotus] DROP CONSTRAINT [DF__f_varda_kielipainotus__username]
GO

ALTER TABLE [dw].[f_varda_kielipainotus] DROP CONSTRAINT [DF__f_varda_kielipainotus__loadtime]
GO

/****** Object:  Table [dw].[f_varda_kielipainotus]    Script Date: 19.8.2024 12:31:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_kielipainotus]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_kielipainotus]
GO

/****** Object:  Table [dw].[f_varda_kielipainotus]    Script Date: 19.8.2024 12:31:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_kielipainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_kielikoodistoopetushallinto_id] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_kielipainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_kielipainotus] ADD  CONSTRAINT [DF__f_varda_kielipainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_kielipainotus] ADD  CONSTRAINT [DF__f_varda_kielipainotus__username]  DEFAULT (suser_name()) FOR [username]
GO


