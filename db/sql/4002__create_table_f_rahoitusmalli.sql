USE [ANTERO]
GO
/****** Object:  Table [dw].[f_rahoitusmalli_amk]    Script Date: 29.9.2020 13:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_rahoitusmalli_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_rahoitusmalli_amk](
	[rahoitusvuosi] [int] NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_rahoitusmalli_amk_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_amk_rahoitusmalliala_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_kytkin_tutkintojen_rahoitusraja_ylittyy_id] [int] NULL,
	[lkm] [float] NOT NULL,
	[paino] [float] NULL,
	[paino_tutkinnot_rahoitusraja] [float] NULL,
	[paino_rahoitusala_ka] [float] NULL,
	[tutkintoraja] [int] NULL,
	[tutkintoraja_alakohtainen] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_rahoitusmalli_yo]    Script Date: 29.9.2020 13:32:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_rahoitusmalli_yo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_rahoitusmalli_yo](
	[rahoitusvuosi] [int] NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_rahoitusmalli_yo_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_yo_rahoitusmalliala_id] [int] NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_kytkin_tutkintojen_rahoitusraja_ylittyy_id] [int] NULL,
	[lkm] [float] NOT NULL,
	[paino] [float] NULL,
	[paino_tutkinnot_rahoitusraja] [float] NULL,
	[paino_rahoitusala_ka] [float] NULL,
	[tutkintoraja] [int] NULL,
	[tutkintoraja_alakohtainen] [int] NULL
) ON [PRIMARY]
END
