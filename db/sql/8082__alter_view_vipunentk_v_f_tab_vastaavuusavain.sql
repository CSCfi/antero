USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_vastaavuusavain]    Script Date: 21.9.2023 13:26:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   VIEW [dbo].[v_f_tab_vastaavuusavain] AS

SELECT
	Tilastovuosi,
	lkm,
	[Ammattiryhmä 1. taso],
	[Ammattiryhmä 2. taso],
	Koulutusaste,
	[Koulutusala, taso 1],
	[Koulutusala, taso 2],
	[Koulutusala, taso 3],
	CASE WHEN Koulutusaste = 'Tuntematon' OR  koulutusta_jarjestetaan = 1 THEN 'Kyllä' ELSE 'Ei' END as 'Koulutusta järjestetään'
FROM VipunenTK.dbo.f_vastaavuusavain f


GO

USE [ANTERO]