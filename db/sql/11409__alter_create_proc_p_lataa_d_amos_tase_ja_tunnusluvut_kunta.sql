USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_tase_ja_tunnusluvut_kunta]    Script Date: 29.10.2025 13.01.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

























CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_amos_tase_ja_tunnusluvut_kunta] AS

/*

*/


IF NOT EXISTS (SELECT * FROM dw.d_amos_tase_ja_tunnusluvut_kunta WHERE id = -1)

BEGIN
	SET IDENTITY_INSERT dw.d_amos_tase_ja_tunnusluvut_kunta ON;

	INSERT INTO dw.d_amos_tase_ja_tunnusluvut_kunta (
		 [id]
		,[koodi]
		,[tunnusluku]
		,[sarake]
		,[versio]
		,[vuosi]
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
		,koodi
		,GETDATE()
		,SUSER_NAME()
		,'etl: p_lataa_d_amos_tase_ja_tunnusluvut_kunta'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1'

	SET IDENTITY_INSERT dw.d_amos_tase_ja_tunnusluvut_kunta OFF;
END
ELSE BEGIN

	UPDATE d
	SET
		[koodi] = s.koodi
		,[tunnusluku]= s.nimi
		,[sarake] = s.nimi
		,[versio]= s.nimi
		,[vuosi] = s.koodi
		,[loadtime] = GETDATE()
		,[username] = SUSER_NAME()
		,[source] = 'etl: p_lataa_d_amos_tase_ja_tunnusluvut_kunta'
	FROM dw.d_amos_tase_ja_tunnusluvut_kunta d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
END

;WITH Taksonomiat(versio, vuosi, tunnusluku, sarake) AS (
	SELECT q.versio, q.vuosi, a.tunnusluku, a.sarake
	FROM (SELECT DISTINCT SUBSTRING(taksonomia, 1, 11) AS versio,
					SUBSTRING(taksonomia, 13, 4) AS vuosi
		FROM [sa].[sa_kuntatalous])q
	CROSS JOIN [sa].[sa_kuntatalous_taksonomiat_aputaulu] a)

MERGE dw.d_amos_tase_ja_tunnusluvut_kunta AS target
USING (

	SELECT 
		 [koodi] = kt.solutunniste
		,[tunnusluku] = t.tunnusluku
		,[sarake] = t.sarake
		,[versio] = t.versio
		,[vuosi] = t.vuosi
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_tase_ja_tunnusluvut_kunta'
	 FROM Taksonomiat t
	 JOIN sa.sa_kuntatalous_taksonomiat kt on t.tunnusluku = kt.tunnusluku and t.versio = kt.versio and t.vuosi = YEAR(kt.tekninen_versio)
	 WHERE kt.entrypoint = 'KKNR' and kt.sektori= 'Ulkoiset'
	
) AS src ON target.koodi = src.koodi and target.versio = src.versio and target.vuosi=src.vuosi

WHEN MATCHED THEN
	UPDATE SET
		koodi = src.koodi
		,tunnusluku=src.tunnusluku
		,sarake = src.sarake
		,versio = src.versio
		,vuosi = src.vuosi
		,loadtime = src.loadtime
		,username = src.username
		,source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		 [koodi]
		,[tunnusluku]
		,[sarake]
		,[versio]
		,[vuosi]
		,[loadtime]
		,[username]
		,[source]
	)

	VALUES (
		 src.koodi
		,src.tunnusluku
		,src.sarake
		,src.versio
		,src.vuosi
		,src.loadtime
		,src.username
		,src.source
	)

WHEN NOT MATCHED BY source AND target.id != -1 THEN delete
;


