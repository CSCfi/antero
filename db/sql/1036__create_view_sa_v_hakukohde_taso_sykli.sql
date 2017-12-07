USE [ANTERO]
GO

/****** Object:  View [sa].[v_hakukohde_taso_sykli]    Script Date: 7.12.2017 17:48:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [sa].[v_hakukohde_taso_sykli] as 

SELECT distinct
	HakukohdeOID as hakukohde_oid
	,case hakukohteen_tutkinnon_taso_kk when 'Tuntematon' then 'Tieto puuttuu' else hakukohteen_tutkinnon_taso_kk end as hakukohteen_tutkinnon_taso_kk
	,case hakukohteen_tutkinnon_taso_kk_sykli when 'Tuntematon' then 'Tieto puuttuu' else hakukohteen_tutkinnon_taso_kk_sykli end as hakukohteen_tutkinnon_taso_kk_sykli
FROM [ANTERO].[sa].[sa_odw_hakeneet]
--where koulutusaste in (1,2)






