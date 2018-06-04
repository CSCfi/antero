USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_hakuaika]    Script Date: 4.6.2018 14:49:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_hakuaika]
AS
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
	VALUES (
		N'-1'
		,N'-1'
		,N'1900-01-01'
		,N'2099-12-31'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'etl: p_lataa_d_hakuaika'
		)
	set identity_insert dw.d_hakuaika off
END

MERGE dw.d_hakuaika AS target
USING (
	SELECT hakuaikaId
		,alkuPvm
		,loppuPvm
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
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