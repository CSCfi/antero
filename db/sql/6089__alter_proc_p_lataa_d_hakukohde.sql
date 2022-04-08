USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_hakukohde]    Script Date: 8.4.2022 13:53:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_hakukohde] AS

IF NOT EXISTS (SELECT * FROM dw.d_hakukohde WHERE id=-1) 

BEGIN

	SET identity_INSERT dw.d_hakukohde on;
	  	
	INSERT dw.d_hakukohde (
		id
		,oid
		,selite_fi
		,selite_sv
		,selite_en
		,kaksoistutkinto
		,source
		)

	SELECT
	-1,
	koodi,
	nimi,
	nimi_sv,
	nimi_en,
	koodi,
	'etl: p_lataa_d_hakukohde'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
	;
  
	SET identity_INSERT dw.d_hakukohde off;

END 

ELSE 

BEGIN

	UPDATE d SET
	oid = s.koodi,
	selite_fi = s.nimi,
	selite_sv = s.nimi_sv,
	selite_en = s.nimi_en,
	kaksoistutkinto = s.koodi,
	source = 'etl: p_lataa_d_hakukohde'
	FROM dw.d_hakukohde d
	join sa.sa_koodistot s on s.koodi=d.oid
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
END
	
MERGE dw.d_hakukohde AS target
USING (

	SELECT DISTINCT
		 hakukohdeOid
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
		,coalesce(hk2.kaksoisTutkinto,0) as kaksoistutkinto
		,hk.tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_hakukohteet hk
	left join sa.koulutustarjonta_hakukohde hk2 on hk2.oid = hk.hakukohdeOid

	UNION ALL

	SELECT DISTINCT
		 hakukohdeOid
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
		,case when coalesce(toinenAsteOnkoKaksoistutkinto, 'False') = 'True' then 1
		 else 0 end as kaksoistutkinto
		,UPPER(hk.tila) as tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_kouta_hakukohteet hk

) AS src ON target.oid = src.hakukohdeOid

WHEN MATCHED AND src.tila IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		UPDATE
		SET selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,kaksoistutkinto = src.kaksoistutkinto
			,target.source = src.source

WHEN MATCHED AND src.tila NOT IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		DELETE

WHEN NOT MATCHED AND src.tila IN ('JULKAISTU', 'ARKISTOITU')
	THEN
		INSERT (
			 oid
			,selite_fi
			,selite_sv
			,selite_en
			,kaksoistutkinto
			,source
			)
		VALUES (
			 src.hakukohdeOid
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.kaksoistutkinto
			,src.source
			);




GO

USE [ANTERO]