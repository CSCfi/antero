USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 19.8.2024 12:38:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER   PROCEDURE [dw].[p_lataa_f_varda_kielipainotus]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2022 --2020

TRUNCATE TABLE dw.f_varda_kielipainotus

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN

	INSERT INTO dw.f_varda_kielipainotus (
		tilastovuosi,
		d_varda_kielikoodistoopetushallinto_id,
		alkamis_pvm,
		paattymis_pvm,
		toimipaikka_id,
		tilastovuosi_toimipaikka_oid,
		source
	)

	SELECT
		@alkuVuosi as tilastovuosi,
		coalesce(d1.id, '-1') as d_varda_kielikoodistoopetushallinto_id,
		s1.alkamis_pvm,
		Case 
			WHEN s1.paattymis_pvm = '' THEN '9999-01-01'
			ELSE cast(s1.paattymis_pvm as date)
		END as paattymis_pvm,
		s2.toimipaikka_id,
		concat(@alkuVuosi, '_', s2.organisaatio_oid) as tilastovuosi_toimipaikka_oid,
		'p_lataa_f_varda_kielipainotus' as source
	FROM varda_sa.sa.sa_varda_kielipainotus s1
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s2 on s2.toimipaikka_id = s1.toimipaikka_id
	LEFT JOIN  dw.d_varda_kielikoodistoopetushallinto d1 on d1.koodi = UPPER(s1.kielipainotus_koodi)
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (coalesce(s1.paattymis_pvm, '9999-12-31') >= cast(concat(@alkuVuosi, '-12-31') as date) or s1.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END




GO


