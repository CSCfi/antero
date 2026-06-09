USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_tase_ja_tunnusluvut]    Script Date: 22.12.2025 7.16.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




























ALTER PROCEDURE [dw].[p_lataa_d_amos_tase_ja_tunnusluvut] AS

/*

*/

IF NOT EXISTS (SELECT * FROM dw.d_amos_tase_ja_tunnusluvut WHERE id = -1)

BEGIN
	SET IDENTITY_INSERT dw.d_amos_tase_ja_tunnusluvut ON;

	INSERT INTO dw.d_amos_tase_ja_tunnusluvut (
		 [id]
		,[koodi]
		,[sarake]
		,[lomake]
		,[taso0]
		,[loadtime]
		,[username]
		,[source]
	)
	SELECT
		koodi
		,koodi
		,nimi
		,nimi
		,nimi
		,GETDATE()
		,SUSER_NAME()
		,'etl: p_lataa_d_amos_tase_ja_tunnusluvut'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1'

	SET IDENTITY_INSERT dw.d_amos_tase_ja_tunnusluvut OFF;
END
ELSE BEGIN

	UPDATE d
	SET
		[koodi] = s.koodi
		,[sarake] = s.nimi
		,[lomake]= s.nimi
		,[taso0] = s.nimi
		,[loadtime] = GETDATE()
		,[username] = SUSER_NAME()
		,[source] = 'etl: p_lataa_d_amos_tase_ja_tunnusluvut'
	FROM dw.d_amos_tase_ja_tunnusluvut d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
END

MERGE dw.d_amos_tase_ja_tunnusluvut AS target
USING (
-- Järjestäjäkohtaiselta lomakkeelta tulevien tietojen koodisto 
	SELECT 
		[koodi],
			CASE
				WHEN taso0 = 'Valtionosuudella rahoitettava toiminta' and taso1 != 'Poistot (ei sisällä alv:a)' THEN 'toimintakulut'
				WHEN taso0 = 'Valtionosuudella rahoitettava toiminta' and taso1 = 'Poistot (ei sisällä alv:a)' THEN 'poistot'
				WHEN taso0 = 'Investoinnit' THEN 'investoinnit'
				WHEN taso1 = 'Tase' and taso2 = 'Vastaavaa' THEN 'rahoitusomaisuus'
				WHEN selite = 'Vastattavaa yhteensä,' THEN 'vastattavaa'
				WHEN selite = 'Oma pääoma yhteensä, vastattavaa' THEN 'oma_paaoma'
				WHEN selite ='Tilikauden voitto (tappio), vastattavaa' THEN 'ylialijaama'
				WHEN selite ='Poistoero ja vapaaehtoiset varaukset, vastattavaa' THEN 'poistoero'
				WHEN selite = 'Edellisten tilikausien voitto (tappio), vastattavaa' THEN 'edel_ylialijaama'
				WHEN selite = 'Vieras pääoma yhteensä, vastattavaa' THEN 'vieras_paaoma'
				WHEN selite = 'Lyhytaikainen vieras pääoma yhteensä, vastattavaa' THEN 'lyhyt_vieras_paaoma'
				WHEN selite = 'Rahastot tai muu vastaava oma pääoma, vastattavaa' THEN 'arvonkorotusrahastot'
				WHEN selite = 'Rahoitustuotot (sis. korko- ja muut tuotot)' THEN 'rahoitustuotot'
				WHEN selite = 'Rahoituskulut' THEN 'rahoituskulut'
				ELSE selite
			end AS sarake
		,[lomake] ='K92'
		,[taso0] = taso0
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_yhdistelma'
	 FROM [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto] t
	 WHERE koodi in ('k00m1', 'k00m2', 'k00x1', 'f2tl0', 'f3tl0', 'e411m2', 'e491m2', 'b123te0', 'b124te0', 'b125te0', 'b212te0', 'b213te0', 'b215te0', 'b216te0', 'b210te0', 'b220te0', 'b2220te0', 'b20te0')

	 UNION ALL

 -- Seurantaryhmä kohtaisen lomakkeen koodisto 
	 SELECT 
		[koodi],
			CASE
				WHEN taso0 = 'Kustannus' and taso1 != 'Muiden kuin rakennus-investointien poistot (ei sis.alv:a)' THEN 'toimintakulut'
				WHEN taso0 = 'Kustannus' and taso1 = 'Muiden kuin rakennus-investointien poistot (ei sis.alv:a)' THEN 'poistot'
				WHEN taso0 = 'Tulo' THEN 'toimintatuotot'
				ELSE selite
			end AS sarake
		,[lomake]= 'K12'
		,[taso0] = taso0
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_tase_ja_tunnusluvut'
	 FROM [sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto] s
	 WHERE summatieto=1

	 UNION ALL

 -- Suoritepäätöksestä rahoitusosuuksien tiedot perus-, suoritus-, ja vaikuttavuusrahoitus
	 SELECT
		 [koodi]= [selite_fi]
		,[sarake] = 'vos_rahoitus'
		,[lomake]= 'SuorP'
		,[taso0] = 'Suoritepaatos'
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_tase_ja_tunnusluvut'
		FROM [ANTERO].[dw].[d_amos_suoritepaatokset_lukumaaratieto] sp
	 WHERE koodi in (31)
) AS src ON target.koodi = src.koodi and target.lomake = src.lomake

WHEN MATCHED THEN
	UPDATE SET
		koodi = src.koodi
		,sarake = src.sarake
		,lomake = src.lomake
		,taso0 = src.taso0
		,loadtime = src.loadtime
		,username = src.username
		,source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		 [koodi]
		,[sarake]
		,[lomake]
		,[taso0]
		,[loadtime]
		,[username]
		,[source]
	)

	VALUES (
		 src.koodi
		,src.sarake
		,src.lomake
		,src.taso0
		,src.loadtime
		,src.username
		,src.source
	)

WHEN NOT MATCHED BY source AND target.id != -1 THEN delete
;