USE [ANTERO]
GO

/****** Object:  Table [dw].[f_amk_julkaisut_f_i_tieteenalat]    Script Date: 7.6.2023 12:02:47 ******/
DROP TABLE IF EXISTS [dw].[f_amk_julkaisut_f_i_tieteenalat]
GO

/****** Object:  Table [dw].[f_amk_julkaisut_f_i_tieteenalat]    Script Date: 7.6.2023 12:02:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amk_julkaisut_f_i_tieteenalat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_tieteenala_1_id] [int] NOT NULL,
	[d_tieteenala_2_id] [int] NOT NULL,
	[julkaisunTunnus] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_amk_julkaisut_f_i_tieteenalat__3213E83F02841AF9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_amk_julkaisut_f_i_tieteenalat] ADD  CONSTRAINT [DF_f_amk_julkaisut_f_i_tieteenalat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_julkaisut_f_i_tieteenalat] ADD  CONSTRAINT [DF_f_amk_julkaisut_f_i_tieteenalat_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]