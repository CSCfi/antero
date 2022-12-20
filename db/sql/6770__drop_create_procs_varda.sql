USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_toimintapainotus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_kielipainotus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_jarjestamismuoto]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_f_varda_huoltajatiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_tuntimaara_asteikko]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_d_varda_tuntimaara_asteikko]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_toimipaikkaluokitus]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_d_varda_toimipaikkaluokitus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 20.12.2022 10:26:51 ******/
DROP PROCEDURE [dw].[p_lataa_d_varda_maksuluokka]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_maksuluokka]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dw].[p_lataa_d_varda_maksuluokka] AS

DECLARE @i as int
DECLARE @vuosi as int
SET @vuosi = 2020
DECLARE @iMax as int

TRUNCATE TABLE dw.d_varda_maksuluokka

INSERT INTO [dw].[d_varda_maksuluokka] (
		[koodi],
		[tilastovuosi],
		[yritystyyppi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		-1,
		NULL,
		NULL,
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		999,
		'p_lataa_d_varda_maksuluokka'
	)

WHILE @vuosi <= YEAR(getdate())

BEGIN

	SET @iMax = (SELECT max(cast(round(s.asiakasmaksu,0) as int)) FROM varda_sa.sa.sa_varda_maksutieto s where alkamis_pvm <= cast(concat(@vuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@vuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30'))

	SET @i = 0

	WHILE @i <= @iMax

	BEGIN

		INSERT INTO [dw].[d_varda_maksuluokka] (
			[koodi],
			[tilastovuosi],
			[yritystyyppi],
			[nimi_fi],
			[nimi_sv],
			[nimi_en],
			jarjestys,
			[source]
		)
		VALUES 
		(
			@i,
			@vuosi,
			'Kunta',
			CASE WHEN @i < 27 THEN 'Maksu 0 €' WHEN @i < 288 THEN 'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä' ELSE 'Enimmäismaksu' END,
			CASE WHEN @i < 27 THEN 'Avgift 0 €' WHEN @i < 288 THEN 'Klientavgift mellan den lägsta debiterade och den maximala avgiften' ELSE 'Högsta avgift' END,
			CASE WHEN @i < 27 THEN 'Maksu 0 €' WHEN @i < 288 THEN 'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä' ELSE 'Enimmäismaksu' END,
			CASE WHEN @i < 27 THEN 1 WHEN @i < 288 THEN 2 ELSE 3 END,
			'p_lataa_d_varda_maksuluokka'
		),
		(
			@i,
			@vuosi,
			'Yksityinen',
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Yli 500 €' END,
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Över 500 €' END,
			CASE WHEN @i < 291 THEN '0-290 €' WHEN @i < 401 THEN '291-400 €' WHEN @i < 501 THEN '401-500 €' ELSE 'Over 500 €' END,
			CASE WHEN @i < 291 THEN 4 WHEN @i < 401 THEN 5 WHEN @i < 501 THEN 6 ELSE 7 END,
			'p_lataa_d_varda_maksuluokka'
		)

		SET @i = @i + 1
	
	END

	SET @vuosi = @vuosi + 1

END










GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_toimipaikkaluokitus]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_d_varda_toimipaikkaluokitus] AS

DECLARE @i as int
SET @i = 1

DECLARE @iMax as int
SET @iMax = (SELECT MAX( lkm) FROM (
				SELECT 
					s.vakajarjestaja_id, 
					count(distinct s.toimipaikka_id) as lkm 
				FROM varda_sa.sa.sa_varda_toimipaikka s group by s.vakajarjestaja_id 
			 )s)

TRUNCATE TABLE dw.d_varda_toimipaikkaluokitus

INSERT INTO [dw].[d_varda_toimipaikkaluokitus] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		-1,
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		9999,
		'p_lataa_d_varda_toimipaikkaluokitus'
	)

WHILE @i <= @iMax

BEGIN

	INSERT INTO [dw].[d_varda_toimipaikkaluokitus] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		@i,
		CASE WHEN @i = 1 THEN '1 toimipaikka' WHEN @i < 4 THEN '2-3 toimipaikkaa' WHEN @i < 11 THEN '4-10 toimipaikkaa' WHEN @i < 21 THEN '11-20 toimipaikkaa' ELSE 'Yli 20 toimipaikkaa' END,
		CASE WHEN @i = 1 THEN 'Ett verksamhetsställe'  WHEN @i < 4 THEN '2-3 verksamhetsställen' WHEN @i < 11 THEN '4-10 verksamhetsställen' WHEN @i < 21 THEN '11-20 verksamhetsställen' ELSE 'Över 20 verksamhetsställen' END,
		CASE WHEN @i = 1 THEN '1 toimipaikka' WHEN @i < 4 THEN '2-3 toimipaikkaa' WHEN @i < 11 THEN '4-10 toimipaikkaa' WHEN @i < 21 THEN '11-20 toimipaikkaa' ELSE 'Yli 20 toimipaikkaa' END,
		CASE WHEN @i = 1 THEN 1 WHEN @i < 4 THEN 2 WHEN @i < 11 THEN 3 WHEN @i < 21 THEN 4 ELSE 5 END,
		'p_lataa_d_varda_toimipaikkaluokitus'
	)

	SET @i = @i + 1

END
     








GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_tuntimaara_asteikko]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_d_varda_tuntimaara_asteikko] AS

DECLARE @i as int
SET @i = 0

DECLARE @iMax as int
SET @iMax = (select cast(round(max(cast(tuntimaara_viikossa as float)),0) as int) from varda_sa.sa.sa_varda_varhaiskasvatuspaatos)

TRUNCATE TABLE dw.d_varda_tuntimaara_asteikko

INSERT INTO [dw].[d_varda_tuntimaara_asteikko] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		-1,
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		9999,
		'p_lataa_d_varda_tuntimaara_asteikko'
	)

WHILE @i <= @iMax

BEGIN

	INSERT INTO [dw].[d_varda_tuntimaara_asteikko] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarjestys,
		[source]
	)
	VALUES (
		@i,
		CASE WHEN @i < 25 THEN 'Alle 25 h' WHEN @i < 36 THEN '25 - 35 h' ELSE 'Yli 35 h' END,
		CASE WHEN @i < 25 THEN 'Under 25 h' WHEN @i < 36 THEN '25 - 35 h' ELSE 'Över 35 h' END,
		CASE WHEN @i < 25 THEN 'Under 25 h' WHEN @i < 36 THEN '25 - 35 h' ELSE 'Over 35 h' END,
		CASE WHEN @i < 25 THEN 1 WHEN @i < 36 THEN 2 ELSE 3 END,
		'p_lataa_d_varda_tuntimaara_asteikko'
	)

	SET @i = @i + 1

END
     










GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_d_varda_varhaiskasvatuspaikkaluokitus] AS

DECLARE @i as int
SET @i = 0

DECLARE @iMax as int
SET @iMax = (SELECT MAX(varhaiskasvatuspaikat) FROM Varda_SA.sa.sa_varda_toimipaikka)

TRUNCATE TABLE dw.d_varda_varhaiskasvatuspaikkaluokitus

INSERT INTO [dw].[d_varda_varhaiskasvatuspaikkaluokitus] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarj_nro,
		[source]
	)
	VALUES (
		-1,
		'Tieto puuttuu',
		'Information saknas',
		'Missing data',
		999,
		'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'
	)

WHILE @i <= @iMax

BEGIN

	INSERT INTO [dw].[d_varda_varhaiskasvatuspaikkaluokitus] (
		[koodi],
		[nimi_fi],
		[nimi_sv],
		[nimi_en],
		jarj_nro,
		[source]
	)
	VALUES (
		@i,
		CASE WHEN @i < 25 THEN 'Alle 25' WHEN @i < 50 THEN '25 - 49' WHEN @i < 100 THEN '50 - 99' WHEN @i < 150 THEN '100 - 149' WHEN @i < 200 THEN '150 - 199' WHEN @i < 250 THEN '200 - 249' ELSE '250 tai yli' END,
		CASE WHEN @i < 25 THEN 'Mindre än 25' WHEN @i < 50 THEN '25 - 49' WHEN @i < 100 THEN '50 - 99' WHEN @i < 150 THEN '100 - 149' WHEN @i < 200 THEN '150 - 199' WHEN @i < 250 THEN '200 - 249' ELSE '250 eller mer' END,
		CASE WHEN @i < 25 THEN 'Less than 25' WHEN @i < 50 THEN '25 - 49' WHEN @i < 100 THEN '50 - 99' WHEN @i < 150 THEN '100 - 149' WHEN @i < 200 THEN '150 - 199' WHEN @i < 250 THEN '200 - 249' ELSE '250 or more' END,
		CASE WHEN @i < 25 THEN 1 WHEN @i < 50 THEN 2 WHEN @i < 100 THEN 3 WHEN @i < 150 THEN 4 WHEN @i < 200 THEN 5 WHEN @i < 250 THEN 6 ELSE 7 END,
		'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus'
	)

	SET @i = @i + 1

END
     







GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dw].[p_lataa_f_varda_huoltajatiedot]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

TRUNCATE TABLE dw.f_varda_huoltajatiedot

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN

	INSERT INTO dw.f_varda_huoltajatiedot (
		tilastovuosi,
		[maksutieto_id],
        [lapsi_id],
		henkilo_id,
        [yksityinen_jarjestaja],
        [d_maksun_peruste_id],
		[d_maksun_luokka_id],
        [palveluseteli_arvo],
        [asiakasmaksu],
        [perheen_koko],
        [alkamis_pvm],
        [paattymis_pvm],
		cum_sum,
        [source]
	)

	SELECT
		@alkuVuosi as tilastovuosi,
		s1.maksutieto_id,
		s1.lapsi_id,
		s2.henkilo_id * 50 as henkilo_id,
		yksityinen_jarjestaja,
		coalesce(d1.id, '-1') as d_maksun_peruste_id,
		coalesce(d2.id, '-1') as d_maksun_luokka_id,
		palveluseteli_arvo,
		asiakasmaksu,
		perheen_koko,
		CAST(s1.alkamis_pvm as date) as alkamis_pvm,
		CASE
			WHEN paattymis_pvm < '1900-12-30' THEN '9999-01-01'
			ELSE CAST(paattymis_pvm as date)
		END as paattymis_pvm,
		cum_sum.cum_sum as cum_sum,
		'p_lataa_varda_huoltajatiedot' as source
	FROM varda_sa.sa.sa_varda_maksutieto s1
	INNER JOIN varda_sa.sa.sa_varda_lapsi s2 on s2.lapsi_id = s1.lapsi_id
	LEFT JOIN (
		SELECT DISTINCT * FROM (
			SELECT 
				s.maksutieto_id,
				CASE
					WHEN upper(s3.jarjestamismuoto_koodi) in ('JM01','JM02','JM03') THEN 1
					ELSE 2
				END as jarjestamismuoto,
				s3.alkamis_pvm,
				alkamis_pvm_max = MAX(s3.alkamis_pvm) OVER (PARTITION BY s.maksutieto_id)
			FROM [Varda_SA].[sa].[sa_varda_maksutieto] s
			LEFT JOIN [Varda_SA].[sa].[sa_varda_lapsi] s2 on s2.lapsi_id = s.lapsi_id
			LEFT JOIN [Varda_SA].[sa].[sa_varda_varhaiskasvatuspaatos] s3 on s3.lapsi_id = s.lapsi_id
			--WHERE s.alkamis_pvm >= s3.alkamis_pvm
		) s
		WHERE s.alkamis_pvm = s.alkamis_pvm_max
	) s3 on s3.maksutieto_id = s1.maksutieto_id
	LEFT JOIN dw.d_varda_maksunperuste d1 on d1.koodi = UPPER(s1.maksun_peruste_koodi)
	OUTER APPLY (
		SELECT
			cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar) as max_maksu1,
			cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar) as max_maksu2,
			len(cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar)) as len_maksu1,
			len(cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar)) as len_maksu2
		FROM dw.d_varda_maksuluokka d0
		WHERE d0.tilastovuosi = @alkuVuosi and d0.yritystyyppi = 'Kunta'
	)o1
	LEFT JOIN dw.d_varda_maksuluokka d2 on d2.koodi = case when (left(s1.asiakasmaksu,o1.len_maksu1) = o1.max_maksu1 or left(s1.asiakasmaksu,o1.len_maksu2) = o1.max_maksu2) and s3.jarjestamismuoto = '2' then cast(floor(s1.asiakasmaksu) as int) else cast(round(s1.asiakasmaksu,0) as int) end and replace(replace(s3.jarjestamismuoto, '2' , 'Yksityinen'), '1', 'Kunta') = d2.yritystyyppi and d2.tilastovuosi = @alkuVuosi
	OUTER APPLY (
		SELECT
			m.lapsi_id,
			m.cum_sum
		FROM (
			SELECT 
				s0.lapsi_id, 
				sum(cast(asiakasmaksu as float) * (DATEDIFF(month, case when s0.alkamis_pvm < cast(concat(@alkuVuosi, '-01-01') as date) then cast(concat(@alkuVuosi, '-01-01') as date) else s0.alkamis_pvm end, case when s0.paattymis_pvm < cast(concat(@alkuVuosi, '-12-31') as date) then s0.paattymis_pvm else cast(concat(@alkuVuosi, '-12-31') as date) end) + 1)) as cum_sum
			FROM Varda_SA.sa.sa_varda_maksutieto s0
			WHERE alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30')
			GROUP BY s0.lapsi_id
		) m
		WHERE m.lapsi_id = s1.lapsi_id
	) cum_sum
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30')

SET @alkuVuosi =  @alkuVuosi + 1

END




GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_f_varda_jarjestamismuoto]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

TRUNCATE TABLE dw.f_varda_jarjestamismuoto

WHILE @alkuVuosi <= YEAR(getdate())

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
	  FROM varda_sa.sa.sa_varda_toimipaikka s
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1a on d1a.koodi = 'jm01' and lower(s.jarjestamismuoto_koodi) like '%jm01%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1b on d1b.koodi = 'jm02' and lower(s.jarjestamismuoto_koodi) like '%jm02%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1c on d1c.koodi = 'jm03' and lower(s.jarjestamismuoto_koodi) like '%jm03%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1d on d1d.koodi = 'jm04' and lower(s.jarjestamismuoto_koodi) like '%jm04%'
	  LEFT JOIN dw.d_varda_jarjestamismuoto d1e on d1e.koodi = 'jm05' and lower(s.jarjestamismuoto_koodi) like '%jm05%'
	  WHERE s.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (s.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or s.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_f_varda_kielipainotus]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

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
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (s1.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or s1.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_f_varda_toimintapainotus]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

TRUNCATE TABLE dw.f_varda_toimintapainotus

WHILE @alkuVuosi <= YEAR(getdate())

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
	FROM varda_sa.sa.sa_varda_toimintapainotus s1
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s2 on s2.toimipaikka_id = s1.toimipaikka_id
	LEFT JOIN dw.d_varda_toiminnallinenpainotus d1 on d1.koodi = UPPER(s1.toimintapainotus_koodi)
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (s1.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or s1.paattymis_pvm = '')

SET @alkuVuosi =  @alkuVuosi + 1

END



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

TRUNCATE TABLE ANTERO.dw.f_varda_vakajarjestajat_toimipaikat

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN
	-- Faktataulun lataus

	INSERT INTO ANTERO.dw.f_varda_vakajarjestajat_toimipaikat ( 
		tilastovuosi,
		[toimipaikka_id],
		[vakajarjestaja_oid],
		vakajarjestaja_id,
        d_alueluokitus_vakajarjestaja_kunta_id,
        [toimipaikka_oid],
        [d_alueluokitus_toimipaikka_kunta_id],
        [d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id],
        [d_varda_toimipaikka_toimintamuoto_id],
		[d_varda_yritysluokitus_id],
		d_varda_toimipaikkaluokitus_id,
		d_varda_varhaiskasvatuspaikkaluokitus_id,
		d_organisaatioluokitus_vakajarjestaja_id,
        [varhaiskasvatuspaikat],
		d_yritysmuoto_id,
        [alkamis_pvm],
        [paattymis_pvm],
        [source]
	)

	SELECT 
		CASE
			WHEN s2.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and s2.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) THEN @alkuVuosi
			ELSE NULL 
		END as tilastovuosi,
	    s2.toimipaikka_id as toimipaikka_id,
		s.organisaatio_oid as vakajarjestaja_oid,
		s.vakajarjestaja_id as vakajarjestaja_id,
        coalesce(d1.id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id,
        s2.organisaatio_oid as toimipaikka_oid,
        coalesce(d2.id, '-1') as d_alueluokitus_toimipaikka_kunta_id,
        coalesce(d3.id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id,
        coalesce(d4.id, '-1') as d_varda_toimipaikka_toimintamuoto_id,
        coalesce(d5.id, '-1') as d_varda_yritysluokitus_id,
		coalesce(oa.id, '-1') as d_varda_toimipaikkaluokitus_id,
		coalesce(d7.id, '-1') as d_varda_varhaiskasvatuspaikkaluokitus_id,
		coalesce(d6.id, '-1') as d_organisaatioluokitus_vakajarjestaja_id,
		s2.varhaiskasvatuspaikat,
		   --pitää miettiä, mitä dimensiota käytetään ja tehdä tarvittaessa lataus, jossa myös ryhmittely. JS 12.5.2022
		   /*Case WHEN yritysmuoto = 'OSAKEYHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Osakeyhtiö')
				 WHEN yritysmuoto = 'KOMMANDIITTIYHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Kommandiittiyhtiö')
				 WHEN yritysmuoto = 'SAATIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Säätiö')
				 WHEN yritysmuoto = 'PAIKALLISYHTEISO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Paikallisyhteisö')
				 WHEN yritysmuoto = 'YKSITYINEN_ELINKEINONHARJOITTAJA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Yksityinen elinkeinonharjoittaja')
				 WHEN yritysmuoto = 'ORTODOKSINEN_KIRKKO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ortodoksinen kirkko')
				 WHEN yritysmuoto = 'OSUUSKUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Osuuskunta')
				 WHEN yritysmuoto = 'USKONNOLLINEN_YHDYSKUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Uskonnollinen yhdyskunta')
				 WHEN yritysmuoto = 'MUU_YHDISTYS' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Muu yhdistys')
				 WHEN yritysmuoto = 'EI_YRITYSMUOTOA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ei yritysmuotoa')
				 WHEN yritysmuoto = 'KUNTA' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Kunta')
				 WHEN yritysmuoto = 'AVOIN_YHTIO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Avoin yhtiö')
				 WHEN yritysmuoto = 'EV_LUT_KIRKKO' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Ev.lut.kirkko')
				 WHEN yritysmuoto = 'AATTEELLINEN_YHDISTYS' THEN (select id from dw.d_yritysmuoto where nimi_fi = 'Aatteellinen yhdistys')
				 ELSE*/ 
				 --end 
		-1 as d_yritysmuoto_id,
		s2.alkamis_pvm,
        s2.paattymis_pvm as paattymis_pvm,
        'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source
	FROM varda_sa.sa.sa_varda_vakajarjestaja s
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s2 on s2.vakajarjestaja_id = s.vakajarjestaja_id
	LEFT JOIN dw.d_alueluokitus d1 on d1.kunta_koodi = s.kunta_koodi
	LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = s2.kunta_koodi
	LEFT JOIN dw.d_varda_kasvatusopillinenjarjestelma d3 on d3.koodi = s2.kasvatusopillinen_jarjestelma_koodi
	LEFT JOIN dw.d_varda_toimintamuoto d4 on d4.koodi = s2.toimintamuoto_koodi
	INNER JOIN dw.d_varda_yritysluokitus d5 on d5.koodi = s.yritysmuoto --ei haluta mm. kuolinpesiä mukaan. AK 30.8.2022
	LEFT JOIN dw.d_organisaatioluokitus d6 on d6.organisaatio_oid = s.organisaatio_oid
	LEFT JOIN dw.d_varda_varhaiskasvatuspaikkaluokitus d7 on d7.koodi = s2.varhaiskasvatuspaikat
	OUTER APPLY (
		SELECT d0.id FROM (
			SELECT 
				s0.vakajarjestaja_id, 
				COUNT(DISTINCT s02.organisaatio_oid) as lkm FROM varda_sa.sa.sa_varda_vakajarjestaja s0
			INNER JOIN varda_sa.sa.sa_varda_toimipaikka s02 on s02.vakajarjestaja_id = s0.vakajarjestaja_id
			WHERE s02.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and s02.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date)
			GROUP BY s0.vakajarjestaja_id) lkm
		LEFT JOIN [dw].[d_varda_toimipaikkaluokitus] d0 on d0.koodi = lkm.lkm
		WHERE lkm.vakajarjestaja_id = s.vakajarjestaja_id
	) oa
	WHERE s2.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and s2.paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date)
		
SET @alkuVuosi =  @alkuVuosi + 1

END



GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]    Script Date: 20.12.2022 10:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dw].[p_lataa_f_varda_vakasuhteet_vakapaatokset]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

TRUNCATE TABLE dw.f_varda_vakasuhteet_vakapaatokset

WHILE @alkuVuosi <= YEAR(getdate())

BEGIN
	-- Faktataulun lataus

	INSERT INTO dw.f_varda_vakasuhteet_vakapaatokset (
		 tilastovuosi
		,[henkilo_id]
		,lapsi_id
		,[d_alueluokitus_kotikunta]
		,[henkilo_syntyma_pvm]
		,d_ikaryhma_id
		,[d_kieli_aidinkieli]
		,[d_sukupuoli]
		,[vakajarjestaja_id]
		,d_varda_yritysluokitus_id
		,[vakapaatos_alkamis_pvm]
		,[vakapaatos_hakemus_pvm]
		,[vakapaatos_paattymis_pvm]
		,[d_jarjestamismuoto_id_vakapaatos]
		,[d_kytkin_vakapaatos_vuorohoito]
		,[d_varda_kytkin_vakapaatos_kokopaivainen_vaka]
		,[d_varda_kytkin_vakapaatos_paivittainen_vaka]
		,[d_kytkin_vakapaatos_pikakasittely]
		,[vakapaatos_tuntimaara_viikossa]
		,d_tuntimaara_asteikko_id
		,[vakasuhde_id]
		,[vakasuhde_alkamis_pvm]
		,[vakasuhde_paattymis_pvm]
		,[vakasuhde_toimipaikka_id]
		,source
 )

	SELECT
		@alkuVuosi as tilastovuosi,
        s.henkilo_id * 50 as henkilo_id,
		s2.lapsi_id,
		coalesce(d2.id, '-1') as d_alueluokitus_kotikunta,
		s.syntyma_pvm as henkilo_syntyma_pvm,
		coalesce(d11.id, '-1') d_ikaryhma_id,
		coalesce(d3.id, '-1') as d_kieli_aidinkieli,
		d1.id as d_sukupuoli,
		CASE 
			WHEN (s2.vakatoimija_id IS NULL or s2.vakatoimija_id = 0) and s2.oma_organisaatio_id is null THEN s5.vakajarjestaja_id
	  		WHEN (s2.vakatoimija_id IS NULL or s2.vakatoimija_id = 0) and s2.oma_organisaatio_id is not null THEN s2.oma_organisaatio_id
			ELSE s2.vakatoimija_id
		END as vakajarjestaja_id,
		d9.id as d_varda_yritysluokitus_id,
		s3.alkamis_pvm as vakapaatos_alkamis_pvm,
		s3.hakemus_pvm as vakapaatos_hakemus_pvm,
		s3.paattymis_pvm as vakapaatos_paattymis_pvm,
		d4.id as d_jarjestamismuoto_id_vakapaatos,
		coalesce(d5.id ,'-1') as d_kytkin_vakapaatos_vuorohoito,
		coalesce(d6.id ,'-1') as d_varda_kytkin_vakapaatos_kokopaivainen_vaka,
		coalesce(d7.id ,'-1') as d_varda_kytkin_vakapaatos_paivittainen_vaka,
		coalesce(d8.id ,'-1') as d_kytkin_vakapaatos_pikakasittely,
		cast(s3.tuntimaara_viikossa as float) as vakapaatos_tuntimaara_viikossa,
	    coalesce(d10.id, '-1') as d_tuntimaara_asteikko_id,
		s4.varhaiskasvatussuhde_id as vakasuhde_id,
		s4.alkamis_pvm as vakasuhde_alkamis_pvm,
		s4.paattymis_pvm as vakasuhde_paattymis_pvm,
		s4.toimipaikka_id as vakasuhde_toimipaikka_id,
		'p_lataa_varda_vakapaatokset_ja_suhteet' as source
	FROM varda_sa.sa.sa_varda_henkilo s
	INNER JOIN varda_sa.sa.sa_varda_lapsi s2 on s2.henkilo_id = s.henkilo_id
	INNER JOIN varda_sa.sa.sa_varda_varhaiskasvatuspaatos s3 on s3.lapsi_id = s2.lapsi_id
	INNER JOIN varda_sa.sa.sa_varda_varhaiskasvatussuhde s4 on s4.varhaiskasvatuspaatos_id = s3.varhaiskasvatuspaatos_id
	INNER JOIN varda_sa.sa.sa_varda_toimipaikka s5 on s5.toimipaikka_id = s4.toimipaikka_id
	INNER JOIN varda_sa.sa.sa_varda_vakajarjestaja s6 on s5.vakajarjestaja_id = s6.vakajarjestaja_id
	LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s.sukupuoli_koodi
	LEFT JOIN dw.d_alueluokitus d2 on d2.kunta_koodi = s.kotikunta_koodi
	LEFT JOIN dw.d_varda_kielikoodistoopetushallinto d3 on d3.koodi = upper(s.aidinkieli_koodi)
	LEFT JOIN dw.d_varda_jarjestamismuoto d4 on d4.koodi = upper(s3.jarjestamismuoto_koodi)
	LEFT JOIN dw.d_kytkin d5 on d5.kytkin_koodi = replace(replace(s3.vuorohoito_kytkin,'f',0),'t',1)
	LEFT JOIN dw.d_varda_kytkin d6 on d6.kytkin_koodi = replace(replace(s3.kokopaivainen_vaka_kytkin,'f',0),'t',1) and d6.kytkin_luokka = 'vakapaatos_kokopaivainen_vaka'
	LEFT JOIN dw.d_varda_kytkin d7 on d7.kytkin_koodi = replace(replace(s3.paivittainen_vaka_kytkin,'f',0),'t',1) and d7.kytkin_luokka = 'vakapaatos_paivittainen_vaka'
	LEFT JOIN dw.d_kytkin d8 on d8.kytkin_koodi = replace(replace(s3.pikakasittely_kytkin,'f',0),'t',1)
	INNER JOIN dw.d_varda_yritysluokitus d9 on d9.koodi = s6.yritysmuoto
	OUTER APPLY (
		SELECT
			cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar) as max_tunti1,
			cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar) as max_tunti2,
			len(cast(max(case when jarjestys = 1 then cast(d0.koodi as int) else null end) as varchar)) as len_tunti1,
			len(cast(max(case when jarjestys = 2 then cast(d0.koodi as int) else null end) as varchar)) as len_tunti2
		FROM dw.d_varda_tuntimaara_asteikko d0
	)o1
	LEFT JOIN dw.d_varda_tuntimaara_asteikko d10 on d10.koodi = case when left(s3.tuntimaara_viikossa,o1.len_tunti1) = o1.max_tunti1 then cast(floor(s3.tuntimaara_viikossa) as int) when left(s3.tuntimaara_viikossa,o1.len_tunti2) = o1.max_tunti2 then cast(ceiling(s3.tuntimaara_viikossa) as int) else cast(round(s3.tuntimaara_viikossa,0) as int) end
	LEFT JOIN dw.d_ika d11 on d11.ika_avain = DATEDIFF(year,s.syntyma_pvm, cast(concat(@alkuVuosi,'-12-31') as date))
	WHERE 
	(s4.paattymis_pvm > s5.paattymis_pvm and s4.alkamis_pvm <= cast(concat(@alkuVuosi,'-12-31') as date) and s5.paattymis_pvm >= cast(concat(@alkuVuosi,'-12-31') as date))
	OR
	(s4.paattymis_pvm <= s5.paattymis_pvm and s4.alkamis_pvm <= cast(concat(@alkuVuosi,'-12-31') as date) and s4.paattymis_pvm >= cast(concat(@alkuVuosi,'-12-31') as date))
	
SET @alkuVuosi =  @alkuVuosi + 1

END





GO
