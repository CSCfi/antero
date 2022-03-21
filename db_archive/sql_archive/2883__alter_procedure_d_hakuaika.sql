USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_hakuaika]    Script Date: 13.3.2020 16:26:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_hakuaika] AS

--vuodesta 2020 alkaen korkeakoulujen kevään yhteishaussa on kaksi hakua (aiemman kahden hakuajan sijaan). Hakuihin linkitettyjen hakuaikojen selitteet muutetaan vastaaviksi kuin aiemmin, jos ovat nulleja.
--hakuaikaId:t luetaan kahteen tauluun, joita käytetään mergessä

DECLARE @hakuaikaId1 TABLE(id VARCHAR(100))
DECLARE @hakuaikaId2 TABLE(id VARCHAR(100))

INSERT INTO @hakuaikaId1 SELECT distinct HakuaikaId FROM [sa].[sa_odw_hakeneet] sa JOIN dw.d_haku d on d.haku_oid = sa.HakuOid where d.haun_nimi_fi like '%ensimmäinen yhteishaku'
INSERT INTO @hakuaikaId2 SELECT distinct HakuaikaId FROM [sa].[sa_odw_hakeneet] sa JOIN dw.d_haku d on d.haku_oid = sa.HakuOid where d.haun_nimi_fi like '%toinen yhteishaku'


IF (
		SELECT count(1)
		FROM dw.d_hakuaika
		WHERE hakuaikaId = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_hakuaika
	set identity_insert dw.d_hakuaika on
	INSERT dw.d_hakuaika (
		id
		,hakuaikaId
		,alkuPvm
		,loppuPvm
		,selite_fi
		,selite_sv
		,selite_en
		,haku_oid
		,source
		)
	SELECT
		koodi,
		koodi,
		NULL,
		NULL,
		nimi,
		nimi_sv,
		nimi_en,
		koodi,
		'etl: p_lataa_d_hakuaika'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
	;
	set identity_insert dw.d_hakuaika off
END

ELSE

BEGIN

	UPDATE d SET
	hakuaikaId = s.koodi
	,alkuPvm = NULL
	,loppuPvm = NULL
	,selite_fi = s.nimi
	,selite_sv = s.nimi_sv
	,selite_en = s.nimi_en
	,haku_oid = s.koodi
	,source = 'etl: p_lataa_d_hakuaika'
	FROM dw.d_hakuaika d
	join sa.sa_koodistot s on s.koodi=d.id
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
END


MERGE dw.d_hakuaika AS target
USING (
	

	SELECT hakuaikaId
		,alkuPvm
		,loppuPvm
		,nimi_fi = 
			case
				when nimi_fi = 'Hakuaika 1' or (nimi_fi is null and hakuaikaId in (SELECT * FROM @hakuaikaId1)) then 'Haku 1 / Hakuaika 1'
				when nimi_fi = 'Hakuaika 2' or (nimi_fi is null and hakuaikaId in (SELECT * FROM @hakuaikaId2)) then 'Haku 2 / Hakuaika 2'
				else coalesce(nimi_fi,nimi_sv,nimi_en) 
			end
		,nimi_sv =
			case
				when nimi_fi = 'Hakuaika 1' or (nimi_sv is null and hakuaikaId in (SELECT * FROM @hakuaikaId1)) then 'Ansökan 1 / Ansökningstid 1'
				when nimi_fi = 'Hakuaika 2' or (nimi_sv is null and hakuaikaId in (SELECT * FROM @hakuaikaId2)) then 'Ansökan 2 / Ansökningstid 2'
				else coalesce(nimi_sv,nimi_fi,nimi_en) 
			end
		,nimi_en = 
			case
				when nimi_fi = 'Hakuaika 1' or (nimi_sv is null and hakuaikaId in (SELECT * FROM @hakuaikaId1)) then 'Application 1 / Application period 1'
				when nimi_fi = 'Hakuaika 2' or (nimi_sv is null and hakuaikaId in (SELECT * FROM @hakuaikaId2)) then 'Application 2 / Application period 2'
				else coalesce(nimi_en,nimi_fi,nimi_sv) 
			end
		,hakuOid as haku_oid
		,tila
		,'etl: p_lataa_d_hakuaika' AS source
	FROM sa.sa_hakuajat

) AS src
ON target.hakuaikaId = src.hakuaikaId

WHEN MATCHED AND src.tila = 'JULKAISTU'
	THEN
		UPDATE
		SET alkuPvm = src.AlkuPvm
			,loppuPvm = src.loppuPvm
			,selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,haku_oid = src.haku_oid
			,target.source = src.source

WHEN MATCHED AND src.tila <> 'JULKAISTU'
	THEN
		DELETE
	
WHEN NOT MATCHED AND src.tila = 'JULKAISTU'
	THEN
		INSERT (
			hakuaikaId
			,alkuPvm
			,loppuPvm
			,selite_fi
			,selite_sv
			,selite_en
			,haku_oid
			,source
			)
		VALUES (
			src.hakuaikaId
			,src.alkuPvm
			,src.loppuPvm
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.haku_oid
			,src.source
			);
	
--hakukohdekohtaiset hakuajat odw:n datasta	
INSERT INTO dw.d_hakuaika (
	hakuaikaId
	,alkuPvm
	,loppuPvm
	,selite_fi
	,selite_sv
	,selite_en
	,haku_oid
	,source
)

SELECT distinct
	sa.hakuaikaId
	,HakuaikaAlku as alkuPvm
	,HakuaikaLoppu as loppuPvm
	,nimi_fi = null
	,nimi_sv = null
	,nimi_en = null
	,hakuOid as haku_oid
	,'etl: p_lataa_d_hakuaika' AS source
FROM sa.sa_odw_hakeneet sa	
LEFT JOIN dw.d_hakuaika d on d.hakuaikaId = sa.hakuaikaId
WHERE d.hakuaikaId is null
