USE [ANTERO]
GO

/****** Object:  View [sa].[v_hakukohde_taso_sykli]    Script Date: 5.1.2018 17:34:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER view [sa].[v_hakukohde_taso_sykli] as 

SELECT distinct
	HakukohdeOID as hakukohde_oid
	,case when hakukohteen_tutkinnon_taso_kk = '5' and hk.selite_fi not like 'Ammatillinen%' then '-1' else hakukohteen_tutkinnon_taso_kk end as hakukohteen_tutkinnon_taso_kk
	,case when hakukohteen_tutkinnon_taso_kk_sykli = '6' and hk.selite_fi not like 'Ammatillinen%' then '-1' else hakukohteen_tutkinnon_taso_kk_sykli end as hakukohteen_tutkinnon_taso_kk_sykli
FROM [ANTERO].[sa].[sa_odw_hakeneet] h
left join dw.d_hakukohde hk on hk.oid=h.HakukohdeOID
