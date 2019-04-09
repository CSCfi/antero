
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_korkeakoulu_koodi_historia]    Script Date: 1.4.2019 9:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [sa].[p_lataa_sa_korkeakoulu_koodi_historia] as

TRUNCATE TABLE sa.sa_korkeakoulu_koodi_historia

INSERT INTO sa.sa_korkeakoulu_koodi_historia


SELECT  s1.koodi
	   ,s2.koodi
		,COALESCE(s1.nimi, s1.nimi_sv, s1.nimi_en) as vanha_nimi
		,COALESCE(s2.nimi, s2.nimi_sv, s2.nimi_en)
  		,s1.alkupvm
  		,s1.loppupvm
		,getdate()
		,'p_lataa_sa_korkeakoulu_koodi_historia'
		,suser_sname()
		FROM sa.sa_organisaatioluokitus s1
		LEFT JOIN sa.sa_organisaatioluokitus s2 ON s2.koodi =  CASE s1.koodi
			  WHEN '02506' THEN '10118'
			  WHEN '02474' THEN '10065'
			  WHEN '02468' THEN '10056'
			  WHEN '02503' THEN '10056'
			  WHEN '02608' THEN '10118'
			  WHEN '02506' THEN '10118'
			  WHEN '02505' THEN '10108'
			  WHEN '02538' THEN '10108'
			  WHEN '02508' THEN '10066'
			  WHEN '02466' THEN '02630'
			  WHEN '02624' THEN '10065'
			  WHEN '02625' THEN '10066'
			  WHEN '01908' THEN '01901'
			  WHEN '01902' THEN '10089'
			  WHEN '01917' THEN '10088'
			  WHEN '01916' THEN '10088'
			  WHEN '01907' THEN '10076'
			  WHEN '01909' THEN '10076'
			  WHEN '01911' THEN '10089'
			  WHEN '01741' THEN '10076'
			  WHEN '01742' THEN '10103'
			  WHEN '01740' THEN '10103'
			  WHEN '01717' THEN '10103'
			  WHEN '01915' THEN '10122'
			  WHEN '01905' THEN '10122'


		   END
		where s1.oppilaitostyyppi in ('41','42')
		and s1.loppupvm is not null
		order by s1.oppilaitostyyppi, vanha_nimi
--LUT special case
INSERT INTO sa.sa_korkeakoulu_koodi_historia
select -- id	korkeakoulun_koodi	korkeakoulun_nykyinen_tunnus	nimi_fi	vanha_nimi	alkupvm	loppupvm	loadtime	source	username
	s3.koodi, s3.koodi, 'Lappeenrannan-Lahden teknillinen yliopisto', 'Lappeenrannan teknillinen yliopisto', s3.alkupvm,s3.loppupvm
		,getdate(), 'p_lataa_sa_korkeakoulu_koodi_historia', suser_sname()FROM sa.sa_organisaatioluokitus s3 where s3.koodi = '01914'
