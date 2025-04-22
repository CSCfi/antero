USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma]    Script Date: 22.4.2025 7.47.58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma]') AND type in (N'U'))
DROP TABLE [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma]
GO

/****** Object:  Table [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma]    Script Date: 22.4.2025 7.47.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[koodi] [varchar](10) NULL,
	[selite_fi] [varchar](50) NULL,
	[selite_sv] [nvarchar](50) NULL,
	[selite_en] [nvarchar](50) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](150) NULL,
	[username] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma] ADD  CONSTRAINT [DF_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma] ADD  CONSTRAINT [DF_d_oiva_epo_erityinen_maailmankatsomus_tai_kasvatusopillinen_jarjestelma_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]