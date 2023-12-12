USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_oef_ammatti]    Script Date: 12.12.2023 12:45:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[d_oef_ammatti]
GO

CREATE TABLE [dbo].[d_oef_ammatti](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oef_ammattiryhma1_koodi] [nvarchar](20) NULL,
	[oef_ammattiryhma1] [nvarchar](250) NULL,
	[oef_ammattiryhma1_SV] [nvarchar](250) NULL,
	[oef_ammattiryhma1_EN] [nvarchar](250) NULL,
	[oef_ammattiryhma2_koodi] [nvarchar](20) NULL,
	[oef_ammattiryhma2] [nvarchar](250) NULL,
	[oef_ammattiryhma2_SV] [nvarchar](250) NULL,
	[oef_ammattiryhma2_EN] [nvarchar](250) NULL,
	[oef_ammatti_koodi] [nvarchar](20) NULL,
	[oef_ammatti] [nvarchar](250) NULL,
	[oef_ammatti_SV] [nvarchar](250) NULL,
	[oef_ammatti_EN] [nvarchar](250) NULL,
	[jarjestys_ammattiryhma1] [nvarchar](50) NULL,
	[jarjestys_ammattiryhma2] [nvarchar](50) NULL,
	[jarjestys_ammatti] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_oef_ammatti] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO


