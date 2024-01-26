USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_vastaavuusavain]    Script Date: 19.9.2023 14:14:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_f_tab_vastaavuusavain] AS

SELECT
	Tilastovuosi,
	lkm,
	[Ammattiryhmä 1. taso],
	[Ammattiryhmä 2. taso],
	Koulutusaste,
	[Koulutusala, taso 1],
	[Koulutusala, taso 2],
	[Koulutusala, taso 3]
FROM VipunenTK.dbo.f_vastaavuusavain f

GO

USE [ANTERO]