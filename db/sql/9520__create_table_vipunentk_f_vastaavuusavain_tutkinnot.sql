USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain_tutkinnot]    Script Date: 19.1.2024 10:41:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_vastaavuusavain_tutkinnot]') AND type in (N'U'))
DROP TABLE [dbo].[f_vastaavuusavain_tutkinnot]
GO

/****** Object:  Table [dbo].[f_vastaavuusavain_tutkinnot]    Script Date: 19.1.2024 10:41:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_vastaavuusavain_tutkinnot](
	[tilastovuosi] [nvarchar](4) NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[ika_int] [int] NULL,
	[tutkinnot] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]