USE [ANTERO]
GO
/****** Object:  Table [sa].[rahoitusmalli_tutkintojen_rahoitusrajat]    Script Date: 29.9.2020 13:28:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[rahoitusmalli_tutkintojen_rahoitusrajat]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[rahoitusmalli_tutkintojen_rahoitusrajat](
	[rahoitusvuosi] [int] NULL,
	[avain] [varchar](50) NOT NULL,
	[oppilaitos_koodi] [varchar](20) NULL,
	[organisaatio_fi] [nvarchar](255) NULL,
	[rahoitusala] [nvarchar](255) NULL,
	[tutk_ka] [float] NULL,
	[tavoite] [int] NULL,
	[ylittyy] [int] NOT NULL,
	[rahoitusraja] [int] NOT NULL,
	[rahoitusraja_alakohtainen] [int] NOT NULL,
	[sektori] [varchar](3) NOT NULL,
	[source] [nvarchar](255) NULL
) ON [PRIMARY]
END