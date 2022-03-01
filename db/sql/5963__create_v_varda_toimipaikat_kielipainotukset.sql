USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_toimipaikat_kielipainotukset]    Script Date: 1.3.2022 11.05.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE or alter VIEW [dw].[v_varda_toimipaikat_kielipainotukset] AS

	    select kp.tilastovuosi,
        kp.tilastovuosi_toimipaikka_oid as tilastovuosi_toimipaikka_oid,
		tp.toimipaikka_oid,
		coalesce(kk.nimi_fi, 'tuntematon') as kielipainotus_fi,
		coalesce(kk.nimi_en, 'Other') as kielipainotus_en,
		coalesce(kk.nimi_sv, 'okänt') as kielipainotus_sv,
		concat(kp.tilastovuosi,kp.toimipaikka_id) as tilastovuosi_toimipaikkaID
  
	  --faktat
	  FROM dw.f_varda_kielipainotus kp
	  left join dw.f_varda_vakajarjestajat_toimipaikat tp on tp.toimipaikka_id = kp.toimipaikka_id and kp.tilastovuosi = tp.tilastovuosi

	  --dimensiot
	  left join dw.d_varda_kielikoodistoopetushallinto kk on kk.id = kp.d_varda_kielikoodistoopetushallinto_id

	  where kp.tilastovuosi = 2021



