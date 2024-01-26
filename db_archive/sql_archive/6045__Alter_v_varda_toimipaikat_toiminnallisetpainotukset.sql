USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_toimipaikat_toiminnallisetpainotukset]    Script Date: 17.3.2022 16:50:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER   VIEW [dw].[v_varda_toimipaikat_toiminnallisetpainotukset] AS

	    select  topa.tilastovuosi,
		topa.tilastovuosi_toimipaikka_oid,
		tp.toimipaikka_oid,

		toim.nimi_fi as toiminnallinenpainotus_fi,
		toim.nimi_en as toiminnallinenpainotus_en,
		toim.nimi_sv as toiminnallinenpainotus_sv,
		toim.jarj_nro,
		concat(topa.tilastovuosi,topa.toimipaikka_id) as tilastovuosi_toimipaikkaID

  
	  --faktat
	  FROM dw.f_varda_toimintapainotus topa
	  left join dw.f_varda_vakajarjestajat_toimipaikat tp on tp.toimipaikka_id = topa.toimipaikka_id and tp.tilastovuosi = topa.tilastovuosi

	  --dimensiot
	  left join dw.d_varda_toiminnallinenpainotus toim on toim.id = topa.d_varda_toiminnallinenpainotus_id

	  where topa.tilastovuosi = 2021



GO


