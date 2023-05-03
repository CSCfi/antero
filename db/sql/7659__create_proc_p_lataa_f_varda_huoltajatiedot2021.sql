USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot2021]    Script Date: 3.5.2023 12:29:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE  [dw].[p_lataa_f_varda_huoltajatiedot2021]
AS

DECLARE @alkuVuosi as int

SET @alkuVuosi = 2020

--TRUNCATE TABLE dw.f_varda_huoltajatiedot

WHILE @alkuVuosi <= 2021 --YEAR(getdate())

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
		cum_sum_asiakasmaksu,
		cum_sum_palveluseteli_arvo,
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
		cum_sum.cum_sum_asiakasmaksu,
		cum_sum.cum_sum_palveluseteli_arvo,
		'p_lataa_varda_huoltajatiedot' as source
	FROM varda_sa.sa.sa_varda_maksutieto2021 s1
	INNER JOIN varda_sa.sa.sa_varda_lapsi2021 s2 on s2.lapsi_id = s1.lapsi_id
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
			FROM [Varda_SA].[sa].[sa_varda_maksutieto2021] s
			LEFT JOIN [Varda_SA].[sa].[sa_varda_lapsi2021] s2 on s2.lapsi_id = s.lapsi_id
			LEFT JOIN [Varda_SA].[sa].[sa_varda_varhaiskasvatuspaatos2021] s3 on s3.lapsi_id = s.lapsi_id
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
			m.cum_sum_asiakasmaksu,
			m.cum_sum_palveluseteli_arvo
		FROM (
			SELECT 
				s0.lapsi_id 
				,cum_sum_asiakasmaksu = sum(cast(asiakasmaksu as float) * (DATEDIFF(month, case when s0.alkamis_pvm < cast(concat(@alkuVuosi, '-01-01') as date) then cast(concat(@alkuVuosi, '-01-01') as date) else s0.alkamis_pvm end, case when s0.paattymis_pvm < cast(concat(@alkuVuosi, '-12-31') as date) then s0.paattymis_pvm else cast(concat(@alkuVuosi, '-12-31') as date) end) + 1)) 
				,cum_sum_palveluseteli_arvo = sum(cast(palveluseteli_arvo as float) * (DATEDIFF(month, case when s0.alkamis_pvm < cast(concat(@alkuVuosi, '-01-01') as date) then cast(concat(@alkuVuosi, '-01-01') as date) else s0.alkamis_pvm end, case when s0.paattymis_pvm < cast(concat(@alkuVuosi, '-12-31') as date) then s0.paattymis_pvm else cast(concat(@alkuVuosi, '-12-31') as date) end) + 1)) 
			FROM Varda_SA.sa.sa_varda_maksutieto2021 s0
			WHERE alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30')
			GROUP BY s0.lapsi_id
		) m
		WHERE m.lapsi_id = s1.lapsi_id
	) cum_sum
	WHERE s1.alkamis_pvm <= cast(concat(@alkuVuosi, '-12-31') as date) and (paattymis_pvm >= cast(concat(@alkuVuosi, '-12-31') as date) or paattymis_pvm < '1900-12-30')

SET @alkuVuosi =  @alkuVuosi + 1

END






GO


