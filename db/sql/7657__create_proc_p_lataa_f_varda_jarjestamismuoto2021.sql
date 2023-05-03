USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto2021]    Script Date: 3.5.2023 12:30:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dw].[p_lataa_f_varda_jarjestamismuoto2021]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

--TRUNCATE TABLE dw.f_varda_jarjestamismuoto

WHILE @alkuVuosi <= 2021 --YEAR(getdate())

BEGIN

	INSERT INTO dw.f_varda_jarjestamismuoto (
		tilastovuosi,
		d_varda_jarjestamismuoto_id_jm01,
		d_varda_jarjestamismuoto_id_jm02,
		d_varda_jarjestamismuoto_id_jm03,
		d_varda_jarjestamismuoto_id_jm04,
		d_varda_jarjestamismuoto_id_jm05,
		alkamis_pvm,
		paattymis_pvm,
		toimipaikka_id,
		tilastovuosi_toimipaikka_oid,
		source
	)

	SELECT
		@alkuVuosi as tilastovuosi,
		d1a.id as d_varda_jarjestamismuoto_id_jm01,
		d1b.id as d_varda_jarjestamismuoto_id_jm02,
		d1c.id as d_varda_jarjestamismuoto_id_jm03,
		d1d.id as d_varda_jarjestamismuoto_id_jm04,
		d1e.id as d_varda_jarjestamismuoto_id_jm05,
		s.alkamis_pvm,
	    Case
			WHEN s.paattymis_pvm = '' THEN '9999-01-01'
			ELSE CAST(s.paattymis_pvm as date)
		END as paattymis_pvm,
		s.toimipaikka_id,
		concat(@alkuVuosi, '_', s.organisaatio_oid) as tilastovuosi_toimipaikka_oid,
		'p_lataa_f_varda_jarjestamismuoto' as source
	  FROM varda_sa.sa.sa_varda_toimipaikka2021 s
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1a on d1a.koodi = 'jm01' and lower(s.jarjestamismuoto_koodi) like '%jm01%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1b on d1b.koodi = 'jm02' and lower(s.jarjestamismuoto_koodi) like '%jm02%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1c on d1c.koodi = 'jm03' and lower(s.jarjestamismuoto_koodi) like '%jm03%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1d on d1d.koodi = 'jm04' and lower(s.jarjestamismuoto_koodi) like '%jm04%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1e on d1e.koodi = 'jm05' and lower(s.jarjestamismuoto_koodi) like '%jm05%'
	  WHERE s.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (s.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or s.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END




GO


