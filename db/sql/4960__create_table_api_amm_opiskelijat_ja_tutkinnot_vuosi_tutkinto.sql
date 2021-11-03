USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[tutkinto] [nvarchar](200) NULL,
	[koulutuksenJarjestaja] [nvarchar](255) NULL,
	[uudetOpiskelijatLkm] [int] NULL,
	[opiskelijatLkm] [int] NULL,
	[tutkinnonSuorittaneetLkm] [int] NULL,
	[koodiKoulutuksenJarjestaja] [varchar](50) NULL,
	[koodiTutkinto] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]