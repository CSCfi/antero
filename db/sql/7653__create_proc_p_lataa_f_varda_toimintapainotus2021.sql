USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus2021]    Script Date: 3.5.2023 12:32:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dw].[p_lataa_f_varda_toimintapainotus2021]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

--TRUNCATE TABLE dw.f_varda_toimintapainotus

WHILE @alkuVuosi <= 2021 --YEAR(getdate())

BEGIN

	INSERT INTO dw.f_varda_toimintapainotus (
		tilastovuosi,
		d_varda_toiminnallinenpainotus_id,
		alkamis_pvm,
		paattymis_pvm,
		toimipaikka_id,
		tilastovuosi_toimipaikka_oid,
		source
	)

	SELECT
		@alkuVuosi as tilastovuosi,
		coalesce(d1.id, '-1') as d_varda_toiminnallinenpainotus_id,
		s1.alkamis_pvm,
	    CASE 
			WHEN s1.paattymis_pvm = '' THEN '9999-01-01'
		    ELSE cast(s1.paattymis_pvm as date) 
		END as paattymis_pvm,
		s2.toimipaikka_id,
		concat(@alkuVuosi, '_', s2.organisaatio_oid) as tilastovuosi_toimipaikka_oid,
		'p_lataa_f_varda_toimintapainotus' as source
	FROM varda_sa.sa.sa_varda_toimintapainotus2021 s1
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka2021 s2 on s2.toimipaikka_id = s1.toimipaikka_id
	LEFT JOIN dw.d_varda_toiminnallinenpainotus d1 on d1.koodi = UPPER(s1.toimintapainotus_koodi)
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (s1.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or s1.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END





GO


