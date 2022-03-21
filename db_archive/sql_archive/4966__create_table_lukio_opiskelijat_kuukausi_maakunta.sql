USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[lukio_opiskelijat_kuukausi_maakunta]') AND type in (N'U'))
BEGIN

CREATE TABLE [api].[lukio_opiskelijat_kuukausi_maakunta](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppilaitoksenMaakunta] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](30) NULL,
	[aidinkieli] [nvarchar](30) NULL,
	[ika] [nvarchar](30) NULL,
	[kansalaisuus] [nvarchar](30) NULL,
	[uudetOpiskelijatLkm] [int] NULL,
	[opiskelijatLkm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END