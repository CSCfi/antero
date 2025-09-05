USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oef_osaaminen]    Script Date: 5.9.2025 7.20.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_d_oef_osaaminen]
AS
IF NOT EXISTS (SELECT * FROM dw.d_oef_osaaminen WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_oef_osaaminen ON;

	  INSERT INTO dw.d_oef_osaaminen (
		 id,koodi
		,osaaminen_fi,osaaminen_sv,osaaminen_en
		,source, loadtime, username
	  )
	SELECT
		-1,'9999',
		nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_oef_osaaminen',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_oef_osaaminen OFF;

	END 
	
	ELSE

	BEGIN

	SET IDENTITY_INSERT dw.d_oef_osaaminen OFF;

	END

MERGE dw.d_oef_osaaminen AS target
USING (
	SELECT
		s1.koodi,
		s1.nimi as osaaminen_fi,
		s1.nimi_sv as osaaminen_sv,
		s1.nimi_en as osaaminen_en,
		'ETL: p_lataa_d_oef_osaaminen' as source
	FROM ANTERO.sa.sa_koodistot  s1
	WHERE s1.koodisto = 'oefosaamisluokitus'

) AS src ON target.koodi = src.koodi 
WHEN MATCHED
	THEN
		UPDATE
		SET target.koodi = src.koodi,
			target.osaaminen_fi = src.osaaminen_fi,
			target.osaaminen_sv = src.osaaminen_sv,
			target.osaaminen_en = src.osaaminen_en,
			target.source = src.source
			
WHEN NOT MATCHED
	THEN
		INSERT (
				koodi,osaaminen_fi,osaaminen_sv,osaaminen_en,
				source
				)
		VALUES (
				src.koodi,src.osaaminen_fi,src.osaaminen_sv,src.osaaminen_en,
				src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_koodistot where koodisto = 'oefosaamisluokitus') > 0 THEN DELETE;

GO


