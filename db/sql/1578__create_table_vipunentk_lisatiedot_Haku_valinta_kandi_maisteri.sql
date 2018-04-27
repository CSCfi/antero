USE [VipunenTK_lisatiedot]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Haku_valinta_kandi-maisteri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Haku_valinta_kandi_maisteri](
	[I_sykli_kandi] [nchar](6) NOT NULL,
	[I_sykli_maisteri] [nchar](6) NOT NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]