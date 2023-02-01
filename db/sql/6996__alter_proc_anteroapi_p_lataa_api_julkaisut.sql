USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_julkaisut]    Script Date: 31.1.2023 11:55:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_julkaisut] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_julkaisut_esilataus
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[julkaisunTunnus],[Koodit Sektori],[Sektori],[Sektor],[Sector],[Koodit Organisaatio],[Organisaatio],[OrganisationSV],
				[OrganisationEN],[Koodit Ammattikorkeakoulu],[Ammattikorkeakoulu],[Koodit Yliopisto],[Yliopisto],[Koodit Julkaisufoorumitaso],
				[Julkaisufoorumitaso],[JulkaisufoorumitasoSV],[JulkaisufoorumitasoEN],[Koodit Julkaisufoorumitaso 2011-2014],[Julkaisufoorumitaso 2011-2014],
				[Julkaisufoorumitaso 2011-2014SV],[Julkaisufoorumitaso 2011-2014EN],[Koodit Julkaisufoorumitaso 2015->],[Julkaisufoorumitaso 2015->],
				[Julkaisufoorumitaso 2015->SV],[Julkaisufoorumitaso 2015->EN],[Koodit Julkaisun pääluokka],[Julkaisun pääluokka],[Julkaisun pääluokkaSV],
				[Julkaisun pääluokkaEN],[Koodit Julkaisutyyppi],[Julkaisutyyppi],[JulkaisutyyppiSV],[JulkaisutyyppiEN],[Koodit Julkaisun kansainvälisyys],
				[Julkaisun kansainvälisyys],[Julkaisun kansainvälisyysSV],[Julkaisun kansainvälisyysEN],[Koodit Kansainvälinen yhteisjulkaisu],
				[Kansainvälinen yhteisjulkaisu],[Kansainvälinen yhteisjulkaisuSV],[Kansainvälinen yhteisjulkaisuEN],[Koodit Päätieteenala],[Päätieteenala],
				[PäätieteenalaSV],[PäätieteenalaEN],[Koodit Tieteenala],[Tieteenala],[TieteenalaSV],[TieteenalaEN],[Koodit OKM ohjauksen ala],
				[OKM ohjauksen ala],[OKM ohjauksen alaSV],[OKM ohjauksen alaEN],[Koodit Koulutusala 95],[Koulutusala 95],[Utbildningsområde 95],
				[Field of education 95],[Koodit Koulutusala 02],[Koulutusala 02],[Utbildningsområde 02],[Field of education 02],[Yhteisjulk. yliop. sairaanhoitopiiri],
				[Yhteisjulk. valtion sektoritutkimuslaitos],[Yhteisjulk. muu kotim. tutkimusorganisaatio],[Yhteisjulkaisu yrityksen kanssa],[Julkaisu rinnakkaistallennettu],
				[Koodit Avoin saatavuus],[Avoin saatavuus],[JufoTunnus],[lukumaara]
		from [dw].[api_julkaisut] s
		except
		select	[Tilastovuosi],[julkaisunTunnus],[Koodit Sektori],[Sektori],[Sektor],[Sector],[Koodit Organisaatio],[Organisaatio],[OrganisationSV],
				[OrganisationEN],[Koodit Ammattikorkeakoulu],[Ammattikorkeakoulu],[Koodit Yliopisto],[Yliopisto],[Koodit Julkaisufoorumitaso],
				[Julkaisufoorumitaso],[JulkaisufoorumitasoSV],[JulkaisufoorumitasoEN],[Koodit Julkaisufoorumitaso 2011-2014],[Julkaisufoorumitaso 2011-2014],
				[Julkaisufoorumitaso 2011-2014SV],[Julkaisufoorumitaso 2011-2014EN],[Koodit Julkaisufoorumitaso 2015->],[Julkaisufoorumitaso 2015->],
				[Julkaisufoorumitaso 2015->SV],[Julkaisufoorumitaso 2015->EN],[Koodit Julkaisun pääluokka],[Julkaisun pääluokka],[Julkaisun pääluokkaSV],
				[Julkaisun pääluokkaEN],[Koodit Julkaisutyyppi],[Julkaisutyyppi],[JulkaisutyyppiSV],[JulkaisutyyppiEN],[Koodit Julkaisun kansainvälisyys],
				[Julkaisun kansainvälisyys],[Julkaisun kansainvälisyysSV],[Julkaisun kansainvälisyysEN],[Koodit Kansainvälinen yhteisjulkaisu],
				[Kansainvälinen yhteisjulkaisu],[Kansainvälinen yhteisjulkaisuSV],[Kansainvälinen yhteisjulkaisuEN],[Koodit Päätieteenala],[Päätieteenala],
				[PäätieteenalaSV],[PäätieteenalaEN],[Koodit Tieteenala],[Tieteenala],[TieteenalaSV],[TieteenalaEN],[Koodit OKM ohjauksen ala],
				[OKM ohjauksen ala],[OKM ohjauksen alaSV],[OKM ohjauksen alaEN],[Koodit Koulutusala 95],[Koulutusala 95],[Utbildningsområde 95],
				[Field of education 95],[Koodit Koulutusala 02],[Koulutusala 02],[Utbildningsområde 02],[Field of education 02],[Yhteisjulk. yliop. sairaanhoitopiiri],
				[Yhteisjulk. valtion sektoritutkimuslaitos],[Yhteisjulk. muu kotim. tutkimusorganisaatio],[Yhteisjulkaisu yrityksen kanssa],[Julkaisu rinnakkaistallennettu],
				[Koodit Avoin saatavuus],[Avoin saatavuus],[JufoTunnus],[lukumaara]
		from [api].[julkaisut]) s ) > 0)
		or
		((select count(*) from [api].[julkaisut]) <> (select count(*) from [dw].[api_julkaisut])))
		and
		(select count(*) from [dw].[api_julkaisut]) > 0)

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
	
	TRUNCATE TABLE [api].[julkaisut]
	
	INSERT INTO AnteroAPI.api.julkaisut
		(
       [Tilastovuosi]
      ,[julkaisunTunnus]
      ,[Koodit Sektori]
      ,[Sektori]
      ,[Sektor]
      ,[Sector]
      ,[Koodit Organisaatio]
      ,[Organisaatio]
      ,[OrganisationSV]
      ,[OrganisationEN]
      ,[Koodit Ammattikorkeakoulu]
      ,[Ammattikorkeakoulu]
      ,[Koodit Yliopisto]
      ,[Yliopisto]
      ,[Koodit Julkaisufoorumitaso]
      ,[Julkaisufoorumitaso]
      ,[JulkaisufoorumitasoSV]
      ,[JulkaisufoorumitasoEN]
      ,[Koodit Julkaisufoorumitaso 2011-2014]
      ,[Julkaisufoorumitaso 2011-2014]
      ,[Julkaisufoorumitaso 2011-2014SV]
      ,[Julkaisufoorumitaso 2011-2014EN]
      ,[Koodit Julkaisufoorumitaso 2015->]
      ,[Julkaisufoorumitaso 2015->]
      ,[Julkaisufoorumitaso 2015->SV]
      ,[Julkaisufoorumitaso 2015->EN]
      ,[Koodit Julkaisun pääluokka]
      ,[Julkaisun pääluokka]
      ,[Julkaisun pääluokkaSV]
      ,[Julkaisun pääluokkaEN]
      ,[Koodit Julkaisutyyppi]
      ,[Julkaisutyyppi]
      ,[JulkaisutyyppiSV]
      ,[JulkaisutyyppiEN]
      ,[Koodit Julkaisun kansainvälisyys]
      ,[Julkaisun kansainvälisyys]
      ,[Julkaisun kansainvälisyysSV]
      ,[Julkaisun kansainvälisyysEN]
      ,[Koodit Kansainvälinen yhteisjulkaisu]
      ,[Kansainvälinen yhteisjulkaisu]
      ,[Kansainvälinen yhteisjulkaisuSV]
      ,[Kansainvälinen yhteisjulkaisuEN]
      ,[Koodit Päätieteenala]
      ,[Päätieteenala]
      ,[PäätieteenalaSV]
      ,[PäätieteenalaEN]
      ,[Koodit Tieteenala]
      ,[Tieteenala]
      ,[TieteenalaSV]
      ,[TieteenalaEN]
      ,[Koodit OKM ohjauksen ala]
      ,[OKM ohjauksen ala]
      ,[OKM ohjauksen alaSV]
      ,[OKM ohjauksen alaEN]
      ,[Koodit Koulutusala 95]
      ,[Koulutusala 95]
      ,[Utbildningsområde 95]
      ,[Field of education 95]
      ,[Koodit Koulutusala 02]
      ,[Koulutusala 02]
      ,[Utbildningsområde 02]
      ,[Field of education 02]
      ,[Yhteisjulk. yliop. sairaanhoitopiiri]
      ,[Yhteisjulk. valtion sektoritutkimuslaitos]
      ,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
      ,[Yhteisjulkaisu yrityksen kanssa]
      ,[Julkaisu rinnakkaistallennettu]
      ,[Koodit Avoin saatavuus]
      ,[Avoin saatavuus]
      ,[JufoTunnus]
      ,[lukumaara]
	  ,[tietojoukko_paivitetty_pvm])

	SELECT 
		 [Tilastovuosi]
		,[julkaisunTunnus]
		,[Koodit Sektori]
		,[Sektori]
		,[Sektor]
		,[Sector]
		,[Koodit Organisaatio]
		,[Organisaatio]
		,[OrganisationSV]
		,[OrganisationEN]
		,[Koodit Ammattikorkeakoulu]
		,[Ammattikorkeakoulu]
		,[Koodit Yliopisto]
		,[Yliopisto]
		,[Koodit Julkaisufoorumitaso]
		,[Julkaisufoorumitaso]
		,[JulkaisufoorumitasoSV]
		,[JulkaisufoorumitasoEN]
		,[Koodit Julkaisufoorumitaso 2011-2014]
		,[Julkaisufoorumitaso 2011-2014]
		,[Julkaisufoorumitaso 2011-2014SV]
		,[Julkaisufoorumitaso 2011-2014EN]
		,[Koodit Julkaisufoorumitaso 2015->]
		,[Julkaisufoorumitaso 2015->]
		,[Julkaisufoorumitaso 2015->SV]
		,[Julkaisufoorumitaso 2015->EN]
		,[Koodit Julkaisun pääluokka]
		,[Julkaisun pääluokka]
		,[Julkaisun pääluokkaSV]
		,[Julkaisun pääluokkaEN]
		,[Koodit Julkaisutyyppi]
		,[Julkaisutyyppi]
		,[JulkaisutyyppiSV]
		,[JulkaisutyyppiEN]
		,[Koodit Julkaisun kansainvälisyys]
		,[Julkaisun kansainvälisyys]
		,[Julkaisun kansainvälisyysSV]
		,[Julkaisun kansainvälisyysEN]
		,[Koodit Kansainvälinen yhteisjulkaisu]
		,[Kansainvälinen yhteisjulkaisu]
		,[Kansainvälinen yhteisjulkaisuSV]
		,[Kansainvälinen yhteisjulkaisuEN]
		,[Koodit Päätieteenala]
		,[Päätieteenala]
		,[PäätieteenalaSV]
		,[PäätieteenalaEN]
		,[Koodit Tieteenala]
		,[Tieteenala]
		,[TieteenalaSV]
		,[TieteenalaEN]
		,[Koodit OKM ohjauksen ala]
		,[OKM ohjauksen ala]
		,[OKM ohjauksen alaSV]
		,[OKM ohjauksen alaEN]
		,[Koodit Koulutusala 95]
		,[Koulutusala 95]
		,[Utbildningsområde 95]
		,[Field of education 95]
		,[Koodit Koulutusala 02]
		,[Koulutusala 02]
		,[Utbildningsområde 02]
		,[Field of education 02]
		,[Yhteisjulk. yliop. sairaanhoitopiiri]
		,[Yhteisjulk. valtion sektoritutkimuslaitos]
		,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
		,[Yhteisjulkaisu yrityksen kanssa]
		,[Julkaisu rinnakkaistallennettu]
		,[Koodit Avoin saatavuus]
		,[Avoin saatavuus]
		,[JufoTunnus]
		,lukumaara
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM anteroapi.dw.api_julkaisut

END

IF ((select count(*) from [dw].[api_julkaisut]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]