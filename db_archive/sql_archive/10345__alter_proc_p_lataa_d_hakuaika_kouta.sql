USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_hakuaika_kouta]    Script Date: 31.10.2024 8:41:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_hakuaika_kouta] AS


IF (
	SELECT count(1)
	FROM dw.d_hakuaika_kouta
	WHERE hakuaikaId = '-1'
) = 0

BEGIN
	TRUNCATE TABLE dw.d_hakuaika_kouta

	set identity_insert dw.d_hakuaika_kouta on

	INSERT dw.d_hakuaika_kouta (
		id
		,hakuaikaId
		,alkuPvm
		,loppuPvm
		,selite_fi
		,selite_sv
		,selite_en
		,selite2_fi
		,selite2_sv
		,selite2_en
		,jarjestys2
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
		nimi,
		nimi_sv,
		nimi_en,
		9,
		koodi,
		'etl: p_lataa_d_hakuaika_kouta'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
	;
	set identity_insert dw.d_hakuaika_kouta off
END

ELSE

BEGIN

	UPDATE d 
	SET
		hakuaikaId = s.koodi
		,alkuPvm = NULL
		,loppuPvm = NULL
		,selite_fi = s.nimi
		,selite_sv = s.nimi_sv
		,selite_en = s.nimi_en
		,selite2_fi = s.nimi
		,selite2_sv = s.nimi_sv
		,selite2_en = s.nimi_en
		,jarjestys2 = 9
		,haku_oid = s.koodi
		,source = 'etl: p_lataa_d_hakuaika_kouta'
	FROM dw.d_hakuaika_kouta d
	join sa.sa_koodistot s on s.koodi=d.id
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
END


MERGE dw.d_hakuaika_kouta AS target
USING (
	
	SELECT DISTINCT
	     hakuaikaId = NULL
		,alkuPvm = a.alku
		,loppuPvm = a.loppu
		,nimi_fi = 
			case
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%ensimmäinen yhteishaku%' then 'Haku 1 / Hakuaika 1'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%toinen yhteishaku%' then 'Haku 2 / Hakuaika 2'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%syksy%' then 'Syksyn yhteishaku'
				else coalesce(nimi_fi,nimi_sv,nimi_en) 
			end
		,nimi_sv =
			case
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%ensimmäinen yhteishaku%' then 'Ansökan 1 / Ansökningstid 1'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%toinen yhteishaku%' then 'Ansökan 2 / Ansökningstid 2'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%syksy%' then 'Höstens gemensamma ansökan'
				else coalesce(nimi_sv,nimi_fi,nimi_en) 
			end
		,nimi_en = 
			case
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%ensimmäinen yhteishaku%' then 'Application 1 / Application period 1'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%toinen yhteishaku%' then 'Application 2 / Application period 2'
				when d.hakutyyppi_koodi = '01' and d.hakutapa_koodi = '01' and korkeakouluhaku = 1 and nimi_fi like '%syksy%' then 'Autumn joint application'
				else coalesce(nimi_en,nimi_fi,nimi_sv) 
			end
		,kh.hakuOid as haku_oid
		,UPPER(tila) as tila
		,'etl: p_lataa_d_hakuaika_kouta' AS source
	FROM sa.sa_kouta_haku kh
	LEFT JOIN ANTERO.dw.d_haku d on d.haku_oid = kh.hakuOid
	OUTER APPLY (
		SELECT 
			sa.HakuOid,
			MIN(sa.HakuaikaAlku) as alku,
			MAX(sa.HakuaikaLoppu) as loppu
		FROM ANTERO.sa.sa_odw_hakeneet sa
		WHERE sa.HakuOid = kh.hakuOid
		GROUP BY sa.HakuOid
	) a
	WHERE UPPER(tila) in ('JULKAISTU','ARKISTOITU')

) AS src
ON target.haku_oid= src.haku_oid

WHEN MATCHED AND src.tila in ('JULKAISTU','ARKISTOITU')
	THEN
		UPDATE
		SET alkuPvm = src.AlkuPvm
			,loppuPvm = src.loppuPvm
			,selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,haku_oid = src.haku_oid
			,target.source = src.source

WHEN MATCHED AND src.tila not in ('JULKAISTU','ARKISTOITU')
	THEN
		DELETE
	
WHEN NOT MATCHED AND src.tila in ('JULKAISTU','ARKISTOITU')
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

/*--hakukohdekohtaiset hakuajat odw:n datasta	
INSERT INTO dw.d_hakuaika_kouta (
	hakuaikaId
	,alkuPvm
	,loppuPvm
	,haku_oid
	,source
)

SELECT distinct
	sa.hakuaikaId
	,HakuaikaAlku as alkuPvm
	,HakuaikaLoppu as loppuPvm
	,hakuOid as haku_oid
	,'etl: p_lataa_d_hakuaika_kouta' AS source
FROM sa.sa_odw_hakeneet sa	
LEFT JOIN dw.d_hakuaika d on d.hakuaikaId = sa.hakuaikaId
WHERE d.hakuaikaId is null */

UPDATE d1
SET 
	selite2_fi = 
		case 
			when d2.hakutapa_koodi = '01' and d2.hakutyyppi_koodi = '01' and d2.haun_nimi_fi like 'Korkeakoulujen kevään%' then d1.selite_fi
			when d1.selite_fi = 'Syksyn yhteishaku' then d1.selite_fi
			else 'Muu kuin kevään yhteishaun varsinainen haku'
		end
	,selite2_sv = 
		case 
			when d2.hakutapa_koodi = '01' and d2.hakutyyppi_koodi = '01' and d2.haun_nimi_fi like 'Korkeakoulujen kevään%' then d1.selite_sv
			when d1.selite_fi = 'Syksyn yhteishaku' then d1.selite_sv
			else 'Annan än gemensam ansökan (egentlig) på våren'
		end
	,selite2_en = 
		case 
			when d2.hakutapa_koodi = '01' and d2.hakutyyppi_koodi = '01' and d2.haun_nimi_fi like 'Korkeakoulujen kevään%' then d1.selite_en
			when d1.selite_fi = 'Syksyn yhteishaku' then d1.selite_en
			else 'Other than primary application round of joint application in spring'
		end
	,jarjestys2 =
		case 
			when d2.hakutapa_koodi = '01' and d2.hakutyyppi_koodi = '01' and d2.haun_nimi_fi like 'Korkeakoulujen kevään%' then right(d1.selite_fi,1)
			when d1.selite_fi = 'Syksyn yhteishaku' then 3
			else 4
		end
FROM dw.d_hakuaika_kouta d1
LEFT JOIN dw.d_haku d2 on d2.haku_oid = d1.haku_oid
WHERE d1.id != -1


GO


