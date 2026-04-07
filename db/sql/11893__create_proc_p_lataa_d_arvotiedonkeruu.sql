USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvotiedonkeruu]    Script Date: 16.3.2026 10.17.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvotiedonkeruu] AS

if not exists (select * from dw.d_arvotiedonkeruu where id=-1) begin
set identity_insert dw.d_arvotiedonkeruu on;

insert into dw.d_arvotiedonkeruu(
   id
  ,[source]
  ,[kyselyid]
  ,[kysely_fi]
  ,[kysely_sv]
  ,[kysely_en]
  ,[kyselytyyppi]
  ,kyselypohja_tarkenne_fi
  ,kyselypohja_tarkenne_sv
  ,kyselypohja_tarkenne_en
  ,kyselypohja_tarkenne_amis_fi
  ,kyselypohja_tarkenne_amis_sv
  ,kyselypohja_tarkenne_amis_en
  ,vuosi
)

SELECT distinct
   -1
  ,[source]
  ,koodi
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,nimi
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,nimi
  ,nimi_sv
  ,nimi_en
  ,-1
FROM sa.sa_koodistot
  where koodisto='vipunenmeta'
  and koodi='-1'
  ;
set identity_insert dw.d_arvotiedonkeruu off;
end

MERGE dw.d_arvotiedonkeruu AS target
USING (

	SELECT DISTINCT
		kyselyid,
		COALESCE(nimi_fi,nimi_sv,nimi_en) kysely_fi,
		COALESCE(nimi_sv,nimi_fi,nimi_en) kysely_sv,
		COALESCE(nimi_en,nimi_fi,nimi_sv) kysely_en,
		kyselytyyppi as kyselytyyppi,
		kyselypohja_tarkenne_fi =
			CASE 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Aloittaneet' 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_osia_suorittaneet%' THEN 'Tutkinnon osia suorittaneet'
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_suorittaneet%' THEN 'Koko tutkinnon suorittaneet'
				WHEN k.tiedonkeruu like '%avop-yamk%' THEN 'YAMK'
				WHEN k.tiedonkeruu like '%avop-amk%' THEN 'AMK'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-maisterit%' THEN 'URASEURANTA-MAISTERI'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-tohtorit%' THEN 'URASEURANTA-TOHTORI'
				WHEN k.kyselytyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN k.kyselytyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE k.kyselytyyppi
			END 
		,kyselypohja_tarkenne_sv = 
			CASE 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Inlett' 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_osia_suorittaneet%' THEN 'Avlagt en examensdel eller examensdelar'
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_suorittaneet%' THEN 'Avlagt hela examen'
				WHEN k.tiedonkeruu like '%avop-yamk%' THEN 'Högre YH-examen'
				WHEN k.tiedonkeruu like '%avop-amk%' THEN 'YH-examen'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-maisterit%' THEN 'Magister'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-tohtorit%' THEN 'Doktor'
				WHEN k.kyselytyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN k.kyselytyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE k.kyselytyyppi
			END 
		,kyselypohja_tarkenne_en =
			CASE 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Started' 
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_osia_suorittaneet%' THEN 'Completed a vocational qualification unit(s)'
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon_suorittaneet%' THEN 'Completed a vocational qualification in full'
				WHEN k.tiedonkeruu like '%avop-yamk%' THEN 'Higher UAS qualificatio'
				WHEN k.tiedonkeruu like '%avop-amk%' THEN 'UAS qualification'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-maisterit%' THEN 'Master'
				WHEN k.tiedonkeruu like '%yo-uraseuranta-tohtorit%' THEN 'Doctor'
				WHEN k.kyselytyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN k.kyselytyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE k.kyselytyyppi
			END 
		,kyselypohja_tarkenne_amis_fi =
			CASE 		
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Aloituskysely'			
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon%' THEN 'Päättökysely'
			END
		,kyselypohja_tarkenne_amis_sv = 
			CASE 		
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Startenkät'			
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon%' THEN 'Slutenkät'
			END
		,kyselypohja_tarkenne_amis_en =
			CASE 	
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-aloittaneet%' THEN 'Initial stage questionnaire'			
				WHEN k.tiedonkeruu like '%ammatillisen-opiskelijapalaute-tutkinnon%' THEN 'Final stage questionnaire'
			END
		,RIGHT(k.tiedonkeruu,4) as vuosi,
		'ETL: p_lataa_d_arvotiedonkeruu' AS source
	FROM Arvo_SA.sa.sa_arvo_v2_kyselyt k
	WHERE k.kyselyid is not null

	UNION ALL

	SELECT DISTINCT
		kyselyid,
		COALESCE(kysely_fi,kysely_sv,kysely_en) kysely_fi,
		COALESCE(kysely_sv,kysely_fi,kysely_en) kysely_sv,
		COALESCE(kysely_en,kysely_fi,kysely_sv) kysely_en,
		tyyppi as kyselytyyppi,
		kyselypohja_tarkenne_fi =
			CASE 
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Aloittaneet' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Tutkinnon osia suorittaneet'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Koko tutkinnon suorittaneet'
				WHEN kyselypohja_tarkenne like '%maisteri%' THEN 'URASEURANTA-MAISTERI'
				WHEN kyselypohja_tarkenne like '%tohtori%' THEN 'URASEURANTA-TOHTORI'
				WHEN tyyppi = 'avop' and (kyselypohja_nimi like '%YAMK%' or kyselypohja_tarkenne = 'yamk') THEN 'YAMK'
				WHEN tyyppi = 'avop' THEN 'AMK'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_sv = 
			CASE 
				WHEN kyselypohja_tarkenne  = 'aloittaneet' THEN 'Inlett' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Avlagt en examensdel eller examensdelar'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Avlagt hela examen'
				WHEN tyyppi = 'avop' and (kyselypohja_nimi like '%YAMK%' or kyselypohja_tarkenne = 'yamk') then 'Högre YH-examen'
				WHEN tyyppi = 'avop' then 'YH-examen'
				WHEN kyselypohja_tarkenne  = 'AMK' THEN 'YH-examen'
				WHEN kyselypohja_tarkenne  = 'YAMK' THEN 'Högre YH-examen'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_en =
			CASE 
				WHEN kyselypohja_tarkenne  = 'aloittaneet' THEN 'Started' 
				WHEN kyselypohja_tarkenne  = 'tutkinnon_osia_suorittaneet' THEN 'Completed a vocational qualification unit(s)'
				WHEN kyselypohja_tarkenne  = 'tutkinnon_suorittaneet' THEN 'Completed a vocational qualification in full'
				WHEN tyyppi = 'avop' and (kyselypohja_nimi like '%YAMK%' or kyselypohja_tarkenne = 'yamk') then 'Higher UAS qualification'
				WHEN tyyppi = 'avop' then 'UAS qualification'
				WHEN kyselypohja_tarkenne  = 'AMK' THEN 'UAS qualification'
				WHEN kyselypohja_tarkenne  = 'YAMK' THEN 'Higher UAS qualification'
				WHEN tyyppi = 'tyopaikkakysely' THEN 'Työelämäpalaute: työpaikkakysely' --työpaikkakyselyllä 2023 uusi nimi, varmistetaan suodatusten pysyvyys
				WHEN tyyppi = 'tyopaikkaohjaajakysely' THEN 'Työelämäpalaute: työpaikkaohjaajan kysely' --varmistetaan suodatusten pysyvyys
				ELSE coalesce(kyselypohja_tarkenne, kyselypohja_nimi)
			END 
		,kyselypohja_tarkenne_amis_fi =
			CASE 		
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Aloituskysely'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Päättökysely'
			END
		,kyselypohja_tarkenne_amis_sv = 
			CASE 		
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Startenkät'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Slutenkät'
			END
		,kyselypohja_tarkenne_amis_en =
			CASE 	
				WHEN kyselypohja_tarkenne = 'aloittaneet' THEN 'Initial stage questionnaire'			
				WHEN kyselypohja_tarkenne in ('tutkinnon_osia_suorittaneet','tutkinnon_suorittaneet') THEN 'Final stage questionnaire'
			END
		,kyselykerta_vuosi as vuosi,
		'ETL: p_lataa_d_avopkyselykerta' AS source
	FROM Arvo_SA.sa.sa_arvo_kyselykerrat kk
	WHERE NOT EXISTS (
		SELECT TOP 1 * FROM Arvo_SA.sa.sa_arvo_v2_kyselyt k
		WHERE k.kyselyid = kk.kyselyid
	)
	
) AS src

ON target.kyselyid = src.kyselyid --AND target.kyselykerta=src.kyselykerta AND target.kysely_fi=src.kysely_fi

WHEN MATCHED THEN

	UPDATE SET
		target.[kyselyid] = src.kyselyid,
		target.[kysely_fi] = src.kysely_fi,
		target.[kysely_sv] = src.kysely_sv,
		target.[kysely_en] = src.kysely_en,
		target.[kyselytyyppi] = src.kyselytyyppi,
		target.kyselypohja_tarkenne_fi = src.kyselypohja_tarkenne_fi,
		target.kyselypohja_tarkenne_sv = src.kyselypohja_tarkenne_sv,
		target.kyselypohja_tarkenne_en = src.kyselypohja_tarkenne_en,
		target.kyselypohja_tarkenne_amis_fi = src.kyselypohja_tarkenne_amis_fi,
		target.kyselypohja_tarkenne_amis_sv = src.kyselypohja_tarkenne_amis_sv,
		target.kyselypohja_tarkenne_amis_en = src.kyselypohja_tarkenne_amis_en,
		target.vuosi = src.vuosi,
		target.source = src.source

WHEN NOT MATCHED BY source AND id != '-1' THEN DELETE

WHEN NOT MATCHED BY target THEN

	  INSERT (
		kyselyid,
		kysely_fi,
		kysely_sv,
		kysely_en,
		kyselytyyppi,
		kyselypohja_tarkenne_fi,
		kyselypohja_tarkenne_sv,
		kyselypohja_tarkenne_en,
		kyselypohja_tarkenne_amis_fi,
		kyselypohja_tarkenne_amis_sv,
		kyselypohja_tarkenne_amis_en,
		vuosi,
		source
	  )
	  VALUES (
		src.kyselyid, src.kysely_fi, src.kysely_sv, src.kysely_en
		,src.kyselytyyppi
		,src.kyselypohja_tarkenne_fi,kyselypohja_tarkenne_sv,kyselypohja_tarkenne_en
		,src.kyselypohja_tarkenne_amis_fi,kyselypohja_tarkenne_amis_sv,kyselypohja_tarkenne_amis_en
		,src.vuosi,
		src.source
	);

GO


