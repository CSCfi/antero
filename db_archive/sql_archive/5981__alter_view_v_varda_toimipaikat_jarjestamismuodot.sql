USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_toimipaikat_jarjestamismuodot]    Script Date: 3.3.2022 15.28.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER   VIEW [dw].[v_varda_toimipaikat_jarjestamismuodot] AS

-- jm01
	  select
	  jm.tilastovuosi, jm.toimipaikka_id, jm.tilastovuosi_toimipaikka_oid, CONCAT(jm.tilastovuosi,jm.toimipaikka_id) as tilastovuosi_toimipaikkaID
	  , jd.nimi_fi as jarjestamismuoto_fi, jd.nimi_en as jarjestamismuoto_en, jd.nimi_sv as jarjestamismuoto_sv, jarj_nro
	  FROM ANTERO.dw.f_varda_jarjestamismuoto jm
	  left join dw.d_varda_jarjestamismuoto jd on jm.d_varda_jarjestamismuoto_id_jm01=jd.id
	  where
	  d_varda_jarjestamismuoto_id_jm01 is not null
	  and tilastovuosi = 2021
	  
	  union

	  --jm02
	  select
	  jm.tilastovuosi, jm.toimipaikka_id, jm.tilastovuosi_toimipaikka_oid, CONCAT(jm.tilastovuosi,jm.toimipaikka_id) as tilastovuosi_toimipaikkaID
	  , jd.nimi_fi as jarjestamismuoto_fi, jd.nimi_en as jarjestamismuoto_en, jd.nimi_sv as jarjestamismuoto_sv, jarj_nro
	  FROM ANTERO.dw.f_varda_jarjestamismuoto jm
	  left join dw.d_varda_jarjestamismuoto jd on jm.d_varda_jarjestamismuoto_id_jm02=jd.id
	  where
	  d_varda_jarjestamismuoto_id_jm02 is not null
	  and tilastovuosi = 2021

	  union

	  --jm03
	  	  select
	  jm.tilastovuosi, jm.toimipaikka_id, jm.tilastovuosi_toimipaikka_oid, CONCAT(jm.tilastovuosi,jm.toimipaikka_id) as tilastovuosi_toimipaikkaID
	  , jd.nimi_fi as jarjestamismuoto_fi, jd.nimi_en as jarjestamismuoto_en, jd.nimi_sv as jarjestamismuoto_sv, jarj_nro
	  FROM ANTERO.dw.f_varda_jarjestamismuoto jm
	  left join dw.d_varda_jarjestamismuoto jd on jm.d_varda_jarjestamismuoto_id_jm03=jd.id
	  where
	  d_varda_jarjestamismuoto_id_jm03 is not null
	  and tilastovuosi = 2021

	  union

	  --jm04
	  	  select
	  jm.tilastovuosi, jm.toimipaikka_id, jm.tilastovuosi_toimipaikka_oid, CONCAT(jm.tilastovuosi,jm.toimipaikka_id) as tilastovuosi_toimipaikkaID
	  , jd.nimi_fi as jarjestamismuoto_fi, jd.nimi_en as jarjestamismuoto_en, jd.nimi_sv as jarjestamismuoto_sv, jarj_nro
	  FROM ANTERO.dw.f_varda_jarjestamismuoto jm
	  left join dw.d_varda_jarjestamismuoto jd on jm.d_varda_jarjestamismuoto_id_jm04=jd.id
	  where
	  d_varda_jarjestamismuoto_id_jm04 is not null
	  and tilastovuosi = 2021

	  union

	  --jm05
	  	  select
	  jm.tilastovuosi, jm.toimipaikka_id, jm.tilastovuosi_toimipaikka_oid, CONCAT(jm.tilastovuosi,jm.toimipaikka_id) as tilastovuosi_toimipaikkaID
	  , jd.nimi_fi as jarjestamismuoto_fi, jd.nimi_en as jarjestamismuoto_en, jd.nimi_sv as jarjestamismuoto_sv, jarj_nro
	  FROM ANTERO.dw.f_varda_jarjestamismuoto jm
	  left join dw.d_varda_jarjestamismuoto jd on jm.d_varda_jarjestamismuoto_id_jm05=jd.id
	  where
	  d_varda_jarjestamismuoto_id_jm05 is not null
	  and tilastovuosi = 2021


GO


