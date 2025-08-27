USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 14.40.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_amos_kustannuskysely_yhdistelma] AS

/*
Tämä proseduuri lataa dimensioon d_amos_kustannuskysely_yhdistelma kustannuskysely lomakkeiden sekä suoritepäätöksen osalta ammatillisen koulutuksen kustannuskysely-raporttiin kustannukset ja rahoitus
tarvittavan koodiston. 
Tämän dimension tiedot yhdistetään seuraavista kolmesta koodistosta ja dimensiosta:
Järjestäjäkohtaiset tiedot lomake K92 [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto]
Seurantaryhmäkohtaiset tiedot lomake K12 [sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto]
Suoritepäätöksestä myönnetty rahoitus [ANTERO].[dw].[d_amos_suoritepaatokset_lukumaaratieto]
*/

IF NOT EXISTS (SELECT * FROM dw.d_amos_kustannuskysely_yhdistelma WHERE id = -1)

BEGIN
	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_yhdistelma ON;

	INSERT INTO dw.d_amos_kustannuskysely_yhdistelma (
		 [id]
		,[koodi]
		,[selite]
		,[taso1]
		,[taso2]
		,[taso3]
		,[taso4]
		,[taso5]
		,[lomake]
		,[summatieto]
		,[kerroin]
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
		,nimi
		,nimi
		,nimi
		,nimi
		,koodi
		,koodi
		,GETDATE()
		,SUSER_NAME()
		,'etl: p_lataa_d_amos_kustannuskysely_yhdistelma'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1'

	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_yhdistelma OFF;
END
ELSE BEGIN

	UPDATE d
	SET
		[koodi] = s.koodi
		,[selite] = s.nimi
		,[taso1] = s.nimi
		,[taso2] = s.nimi
		,[taso3] = s.nimi
		,[taso4] = s.nimi
		,[taso5] = s.nimi
		,[lomake]= s.nimi
		,[summatieto] = s.koodi
		,[kerroin]= s.koodi
		,[loadtime] = GETDATE()
		,[username] = SUSER_NAME()
		,[source] = 'etl: p_lataa_d_amos_kustannuskysely_yhdistelma'
	FROM dw.d_amos_kustannuskysely_yhdistelma d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
END

MERGE dw.d_amos_kustannuskysely_yhdistelma AS target
USING (
-- Järjestäjäkohtaiselta lomakkeelta tulevien tietojen koodisto mukana vain valtionosuudella ja muulla kuin valtionosuudella rahoitettu toiminta 
	SELECT 
		[koodi]
		,[selite] = ltrim(rtrim([selite]))
		,[taso1] = 
			case taso1
				when 'Tulot (ei sisällä alv:a)' then 'Tulo'
				else 'Kustannus'
			end
		,[taso2] = ltrim(rtrim([taso0]))
		,[taso3]=
			case taso1
				when 'Muut menot (ei sisällä alv:a)' then 'Järjestäjäkohtaiset muut menot'
				else  ltrim(rtrim([taso1]))
			end 
		,[taso4] = 
			case taso2
				when 'josta Ely-keskusten hankkima työvoimakoulutus' then 'Muu julkisrahoitteinen toiminta (mm. opetus- ja kulttuuritoimi, muu kuin ylläoleva kohdat E1.1, E1.2 ja E2 sekä E8)'
				else ltrim(rtrim([taso2]))
			end
		,[taso5] = 
			case taso2
				when 'Muu julkisrahoitteinen toiminta (mm. opetus- ja kulttuuritoimi, muu kuin ylläoleva kohdat E1.1, E1.2 ja E2 sekä E8)' then 'Muu julkisrahoitteinen toiminta (Ei sisällä E7.1 Ely keskusten hankkima työvoimakoulutus)'
				when 'josta Ely-keskusten hankkima työvoimakoulutus' then 'josta Ely-keskusten hankkima työvoimakoulutus'
				else ltrim(rtrim([taso3]))
			end
		,[lomake] ='K92'
		,[summatieto]
		,[kerroin] = 
			case taso1
				when 'Tulot (ei sisällä alv:a)' then 1
				else -1
			end
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_yhdistelma'
	 FROM [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto] t
	 WHERE taso0 like '%valtionosuudella%'

	 UNION ALL

 -- Seurantaryhmä kohtaisen lomakkeen koodisto poislukien koodit, jotka esiintyvät jo edellisessä järjestäjäkohtaisessa
	 SELECT 
		[koodi]
		,[selite] = ltrim(rtrim([selite]))
		,[taso1] = ltrim(rtrim([taso0]))
		,[taso2] = 'Valtionosuudella rahoitettava toiminta'
		,[taso3] = 
			case taso1
				when 'Muut menot (ei sisällä alv:a)' then 'Opetuksen muut menot (sis. koul.korv)'
				when 'Koulutuskorvaukset oppisopimuskoulutuksessa' then 'Opetuksen muut menot (sis. koul.korv)'
				when 'Muiden kuin rakennus-investointien poistot (ei sis.alv:a)' then 'Opetuksen poistot'
				when 'Opiskelijamaksut, vain omaehtoinen koulutus (at, eat, muu amm. koulutus)' then 'Opiskelijamaksut'
				when 'Työnantajamaksut, vain henkilöstökoulutus' then 'Työnantajamaksut henkilöstökoulutus'
				else ltrim(rtrim([taso1]))
			end
		,[taso4] = ltrim(rtrim([taso2]))
		,[taso5] = NULL
		,[lomake]= 'K12'
		,[summatieto]
		,[kerroin]= 
			case taso0 
				when 'Tulo' then 1
				else -1
			end
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_yhdistelma'
	 FROM [sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto] s
	 WHERE not exists (select koodi from [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto] where koodi=s.koodi)

	 UNION ALL

 -- Suoritepäätöksestä rahoitusosuuksien tiedot perus-, suoritus-, ja vaikuttavuusrahoitus
	 SELECT
		 [koodi]= [selite_fi]
		,[selite] = ltrim(rtrim([selite_fi]))
		,[taso1] = 'Tulo'
		,[taso2] = 'Valtionosuudella rahoitettava toiminta'
		,[taso3] = 'Valtionosuusrahoitus'
		,[taso4] = ltrim(rtrim([rahoitusosuus_fi]))
		,[taso5] = NULL
		,[lomake]= 'SuorP'
		,[summatieto]=0
		,[kerroin]= 1
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_yhdistelma'
		FROM [ANTERO].[dw].[d_amos_suoritepaatokset_lukumaaratieto] sp
	 WHERE koodi in (9, 15, 30)
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE SET
		koodi = src.koodi
		,selite = src.selite
		,taso1 = src.taso1
		,taso2 = src.taso2
		,taso3 = src.taso3
		,taso4 = src.taso4
		,taso5 = src.taso5
		,lomake=src.lomake
		,summatieto = src.summatieto
		,kerroin= src.kerroin
		,loadtime = src.loadtime
		,username = src.username
		,source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		 [koodi]
		,[selite]
		,[taso1]
		,[taso2]
		,[taso3]
		,[taso4]
		,[taso5]
		,[lomake]
		,[summatieto]
		,[kerroin]
		,[loadtime]
		,[username]
		,[source]
	)

	VALUES (
		 src.koodi
		,src.selite
		,src.taso1
		,src.taso2
		,src.taso3
		,src.taso4
		,src.taso5
		,src.lomake
		,src.summatieto
		,src.kerroin
		,src.loadtime
		,src.username
		,src.source
	)

WHEN NOT MATCHED BY source AND target.id != -1 THEN delete
;