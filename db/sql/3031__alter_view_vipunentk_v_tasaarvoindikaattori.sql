USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_tasaarvoindikaattori]    Script Date: 29.4.2020 19:14:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_tasaarvoindikaattori] AS

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
				   end
	  
	  ,[OKM ohjauksen ala] = coalesce(alat.OKM_ohjauksen_ala, f.[Koodit OKM ohjauksen ala])
	  ,[Koodit OKM ohjauksen ala]
	  ,[Järjestys OKM ohjauksen ala] = coalesce(alat.jarjestys_OKM_ohjauksen_ala, 0)

	  ,[n]

      ,[SES]
      ,[SES: 0]
      ,[SES: 1]
      ,[SES: 2]
      ,[SES: 3]
      ,[Sukupuoli]
      ,[Sukupuoli: nainen]
      ,[Sukupuoli: mies]
      ,[Kuntaryhmä]
      ,[Kuntaryhmä: maaseutumaiset]
      ,[Kuntaryhmä: taajaan asutut]
      ,[Kuntaryhmä: kaupunkimaiset]
      ,[SES (vakioitu)]
      ,[SES: 0 (vakioitu)]
      ,[SES: 1 (vakioitu)]
      ,[SES: 2 (vakioitu)]
      ,[SES: 3 (vakioitu)]
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