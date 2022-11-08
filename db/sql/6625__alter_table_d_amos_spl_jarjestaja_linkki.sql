USE [ANTERO]
GO

ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki] DROP CONSTRAINT [DF_d_amos_spl_jarjestaja_linkki_username]
GO

ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki] DROP CONSTRAINT [DF_d_amos_spl_jarjestaja_linkki_loadtime]
GO

/****** Object:  Table [dw].[d_amos_spl_jarjestaja_linkki]    Script Date: 8.11.2022 15:52:07 ******/
DROP TABLE [dw].[d_amos_spl_jarjestaja_linkki]
GO

/****** Object:  Table [dw].[d_amos_spl_jarjestaja_linkki]    Script Date: 8.11.2022 15:52:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_amos_spl_jarjestaja_linkki](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid_avain] [varchar](max) NULL,
	[ytunnus_avain] [varchar](20) NULL,
	[oid_amos_spl] [varchar](200) NULL,
	[ytunnus_amos_spl] [varchar](10) NULL,
	[nimi_amos_spl] [nvarchar](255) NULL,
	[sisaltyy_amos_spl] [int] NOT NULL,
	[kunta_koodi] [varchar](5) NULL,
	[nimi_ennen_fuusiota] [nvarchar](255) NULL,
	[voimaan_alkaen] [date] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](50) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_amos_spl_organisaatio_linkki] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki] ADD  CONSTRAINT [DF_d_amos_spl_jarjestaja_linkki_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_amos_spl_jarjestaja_linkki] ADD  CONSTRAINT [DF_d_amos_spl_jarjestaja_linkki_username]  DEFAULT (suser_sname()) FOR [username]