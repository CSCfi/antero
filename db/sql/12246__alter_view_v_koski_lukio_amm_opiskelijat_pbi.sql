USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_amm_opiskelijat_pbi]    Script Date: 8.10.2026 8.43.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_koski_lukio_amm_opiskelijat_pbi] as

SELECT 
	[Tilastovuosi]
    ,[Tilastokuukausi]
    ,[pv_kk]
    ,[Koulutuksen järjestäjä]
    ,[Oppilaitos]
    ,[Oppilaitoksen opetuskieli]
    ,[Toimipisteen maakunta]
    ,[Toimipisteen kunta]
    ,[Oppilaitoksen maakunta]
    ,[Oppilaitoksen kunta]
    ,[Koulutuksen järjestäjän maakunta]
    ,[Koulutuksen järjestäjän kunta]
    ,[Toimipiste]
    ,[Toimipisteen postinumero]
    ,[Toimipisteen katuosoite]
    ,[Oppilaitoksen postinumero]
    ,[Oppilaitoksen katuosoite]
    ,[Koulutuksen järjestäjän postinumero]
    ,[Koulutuksen järjestäjän katuosoite]
    ,[Lukion opetussuunnitelma]
    ,[Tutkintotyyppi]
    ,[Tutkinto/koulutus]
    ,[Suorituksen tyyppi]
    ,[Työvoimakoulutus (ammatillinen)]
    ,[Oppisopimuskoulutus (ammatillinen)]
    ,[Koulutusala, taso 1]
    ,[Koulutusala, taso 2]
    ,[Koulutusala, taso 3]
    ,[Opiskelijan ikä]
    ,[Lukio-/ammatillisen koulutuksen järjestäjä]
    ,CAST(HASHBYTES('SHA2_256', vs.salt + oppija_oid) as varchar) as oppija_oid
    ,[opiskelijat]
    ,[opiskelija_20_9]
    ,[raportti]
FROM ANTERO.dw.f_koski_lukio_amm_opiskelijat_pbi
LEFT JOIN ANTERO.dbo.view_salt vs on vs.[view] = 'v_koski_lukio_amm_opiskelijat_pbi'