USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_tasaarvoindikaattori]    Script Date: 8.4.2020 15:50:35 ******/
DROP VIEW IF EXISTS [dbo].[v_tasaarvoindikaattori]
GO

/****** Object:  View [dbo].[v_tasaarvoindikaattori]    Script Date: 8.4.2020 15:50:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v_tasaarvoindikaattori] AS

WITH alat as 
(
	SELECT DISTINCT OKM_ohjauksen_ala_koodi, OKM_ohjauksen_ala, jarjestys_OKM_ohjauksen_ala
	FROM d_koulutusluokitus
)

SELECT [Tilastovuosi]
	  ,[Tilastovuodet] = cast(Tilastovuosi - 2 as nvarchar) + '–' + cast(Tilastovuosi as nvarchar)

	  ,[Sektori] = case Sektori 
					when 'AMK' then 'Ammattikorkeakoulutus'
					when 'YO' then 'Yliopistokoulutus'
					else Sektori
				   end
	  
	  ,[OKM ohjauksen ala] = coalesce(alat.OKM_ohjauksen_ala, f.[Koodit OKM ohjauksen ala])
	  ,[Koodit OKM ohjauksen ala]
	  ,[Järjestys OKM ohjauksen ala] = coalesce(alat.jarjestys_OKM_ohjauksen_ala, '000')

	  ,[n]

      ,[SES]
      ,[SES: 0-2]
      ,[SES: 3-4]
      ,[SES: 5-6]
      ,[Sukupuoli]
      ,[Sukupuoli: nainen]
      ,[Sukupuoli: mies]
      ,[Kuntaryhmä]
      ,[Kuntaryhmä: maaseutumaiset]
      ,[Kuntaryhmä: taajaan asutut]
      ,[Kuntaryhmä: kaupunkimaiset]
      ,[SES (vakioitu)]
      ,[SES: 0-2 (vakioitu)]
      ,[SES: 3-4 (vakioitu)]
      ,[SES: 5-6 (vakioitu)]
      ,[Sukupuoli (vakioitu)]
      ,[Sukupuoli: nainen (vakioitu)]
      ,[Sukupuoli: mies (vakioitu)]
      ,[Kuntaryhmä (vakioitu)]
      ,[Kuntaryhmä: maaseutumaiset (vakioitu)]
      ,[Kuntaryhmä: taajaan asutut (vakioitu)]
      ,[Kuntaryhmä: kaupunkimaiset (vakioitu)]

  FROM [VipunenTK].[dbo].[tasaarvoindikaattori] f
  LEFT JOIN alat on alat.OKM_ohjauksen_ala_koodi = f.[Koodit OKM ohjauksen ala]








GO


USE [ANTERO]