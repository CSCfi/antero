USE [VipunenTK_lisatiedot]
GO

CREATE TABLE [dbo].[Haku_valinta_kandi-maisteri](
	[I_sykli_kandi] [nchar](6) NOT NULL,
	[I_sykli_maisteri] [nchar](6) NOT NULL
) ON [PRIMARY]

GO
USE [ANTERO]