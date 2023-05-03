USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_jarjestamismuoto] DROP CONSTRAINT [DF__f_varda_jarjestamismuoto__username]
GO

ALTER TABLE [dw].[f_varda_jarjestamismuoto] DROP CONSTRAINT [DF__f_varda_jarjestamismuoto__loadtime]
GO

/****** Object:  Table [dw].[f_varda_jarjestamismuoto]    Script Date: 3.5.2023 12:14:57 ******/
DROP TABLE [dw].[f_varda_jarjestamismuoto]
GO

/****** Object:  Table [dw].[f_varda_jarjestamismuoto]    Script Date: 3.5.2023 12:14:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm01] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm02] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm03] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm04] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm05] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
GO


