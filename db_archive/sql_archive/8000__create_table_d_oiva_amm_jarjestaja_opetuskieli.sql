USE [ANTERO]
GO



/****** Object:  Table [dw].[d_oiva_amm_jarjestaja_opetuskieli]    Script Date: 31.8.2023 18:22:02 ******/
DROP TABLE IF EXISTS [dw].[d_oiva_amm_jarjestaja_opetuskieli]
GO

/****** Object:  Table [dw].[d_oiva_amm_jarjestaja_opetuskieli]    Script Date: 31.8.2023 18:22:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oiva_amm_jarjestaja_opetuskieli](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[opetuskieli_koodi] [varchar](10) NULL,
	[opetuskieli_fi] [varchar](50) NULL,
	[opetuskieli_sv] [nvarchar](50) NULL,
	[opetuskieli_en] [nvarchar](50) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](50) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_oiva_amm_jarjestaja_opetuskieli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_oiva_amm_jarjestaja_opetuskieli] ADD  CONSTRAINT [DF_d_oiva_amm_jarjestaja_opetuskieli_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oiva_amm_jarjestaja_opetuskieli] ADD  CONSTRAINT [DF_d_oiva_amm_jarjestaja_opetuskieli_username]  DEFAULT (suser_sname()) FOR [username]
GO
