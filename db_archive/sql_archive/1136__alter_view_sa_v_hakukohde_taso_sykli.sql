USE [ANTERO]
GO

/****** Object:  View [sa].[v_hakukohde_taso_sykli]    Script Date: 5.1.2018 15:19:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [sa].[v_hakukohde_taso_sykli] as 

SELECT distinct
	HakukohdeOID as hakukohde_oid
	,hakukohteen_tutkinnon_taso_kk
	,hakukohteen_tutkinnon_taso_kk_sykli
FROM [ANTERO].[sa].[sa_odw_hakeneet]


