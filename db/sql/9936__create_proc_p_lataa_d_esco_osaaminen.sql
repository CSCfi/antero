USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_esco_osaaminen]    Script Date: 11.6.2024 12:31:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_esco_osaaminen]
AS
IF NOT EXISTS (SELECT * FROM dw.d_esco_osaaminen WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_esco_osaaminen ON;

	  INSERT INTO dw.d_esco_osaaminen (
		id,koodit_osaaminen
		,koodit_osaaminen_taso1,osaaminen_taso1_fi,osaaminen_taso1_sv,osaaminen_taso1_en
		,koodit_osaaminen_taso2,osaaminen_taso2_fi,osaaminen_taso2_sv,osaaminen_taso2_en
		,koodit_osaaminen_taso3,osaaminen_taso3_fi,osaaminen_taso3_sv,osaaminen_taso3_en
		,koodit_osaaminen_taso4,osaaminen_taso4_fi,osaaminen_taso4_sv,osaaminen_taso4_en
		,koodit_ryhma,ryhma_fi,ryhma_sv,ryhma_en
		,source, loadtime, username
	  )
	SELECT
		-1,koodi,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_esco_osaaminen',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_esco_osaaminen OFF;

	END 
	
	ELSE

	BEGIN

	SET IDENTITY_INSERT dw.d_esco_osaaminen OFF;

	END

MERGE dw.d_esco_osaaminen AS target
USING (
	SELECT * FROM (
		SELECT 
			s2.koodi as koodit_osaaminen,
			s2.koodi as koodit_osaaminen_taso1,
			dbo.capitalize(s2.osaaminen_fi) as osaaminen_taso1_fi,
			dbo.capitalize(s2.osaaminen_sv) as osaaminen_taso1_sv,
			dbo.capitalize(s2.osaaminen_en) as osaaminen_taso1_en,
			NULL as koodit_osaaminen_taso2,
			NULL as osaaminen_taso2_fi,
			NULL as osaaminen_taso2_sv,
			NULL as osaaminen_taso2_en,
			NULL as koodit_osaaminen_taso3,
			NULL as osaaminen_taso3_fi,
			NULL as osaaminen_taso3_sv,
			NULL as osaaminen_taso3_en,
			NULL as koodit_osaaminen_taso4,
			NULL as osaaminen_taso4_fi,
			NULL as osaaminen_taso4_sv,
			NULL as osaaminen_taso4_en,
			s1.koodi as koodit_ryhma,
			dbo.capitalize(s1.osaaminen_fi) as ryhma_fi,
			dbo.capitalize(s1.osaaminen_sv) as ryhma_sv,
			dbo.capitalize(s1.osaaminen_en) as ryhma_en,
			'ETL: p_lataa_d_esco_osaaminen' AS source
		FROM [ANTERO].[sa].[sa_esco_osaamiset] s1
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s2 on s1.koodi = s2.parent_koodi
		WHERE s1.parent_koodi is null AND s2.koodi is not null

		UNION ALL

		SELECT 
			s3.koodi as koodit_osaaminen,
			s2.koodi as koodit_osaaminen_taso1,
			dbo.capitalize(s2.osaaminen_fi) as osaaminen_taso1_fi,
			dbo.capitalize(s2.osaaminen_sv) as osaaminen_taso1_sv,
			dbo.capitalize(s2.osaaminen_en) as osaaminen_taso1_en,
			s3.koodi as koodit_osaaminen_taso2,
			dbo.capitalize(s3.osaaminen_fi) as osaaminen_taso2_fi,
			dbo.capitalize(s3.osaaminen_sv) as osaaminen_taso2_sv,
			dbo.capitalize(s3.osaaminen_en) as osaaminen_taso2_en,
			NULL as koodit_osaaminen_taso3,
			NULL as osaaminen_taso3_fi,
			NULL as osaaminen_taso3_sv,
			NULL as osaaminen_taso3_en,
			NULL as koodit_osaaminen_taso4,
			NULL as osaaminen_taso4_fi,
			NULL as osaaminen_taso4_sv,
			NULL as osaaminen_taso4_en,
			s1.koodi as koodit_ryhma,
			dbo.capitalize(s1.osaaminen_fi) as ryhma_fi,
			dbo.capitalize(s1.osaaminen_sv) as ryhma_sv,
			dbo.capitalize(s1.osaaminen_en) as ryhma_en,
			'ETL: p_lataa_d_esco_osaaminen' AS source
		FROM [ANTERO].[sa].[sa_esco_osaamiset] s1
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s2 on s1.koodi = s2.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s3 on s2.koodi = s3.parent_koodi
		WHERE s1.parent_koodi is null AND s2.koodi is not null AND s3.parent_koodi is not null

		UNION ALL

		SELECT 
			s4.koodi as koodit_osaaminen,
			s2.koodi as koodit_osaaminen_taso1,
			dbo.capitalize(s2.osaaminen_fi) as osaaminen_taso1_fi,
			dbo.capitalize(s2.osaaminen_sv) as osaaminen_taso1_sv,
			dbo.capitalize(s2.osaaminen_en) as osaaminen_taso1_en,
			s3.koodi as koodit_osaaminen_taso2,
			dbo.capitalize(s3.osaaminen_fi) as osaaminen_taso2_fi,
			dbo.capitalize(s3.osaaminen_sv) as osaaminen_taso2_sv,
			dbo.capitalize(s3.osaaminen_en) as osaaminen_taso2_en,
			s4.koodi as koodit_osaaminen_taso3,
			dbo.capitalize(s4.osaaminen_fi) as osaaminen_taso3_fi,
			dbo.capitalize(s4.osaaminen_sv) as osaaminen_taso3_sv,
			dbo.capitalize(s4.osaaminen_en) as osaaminen_taso3_en,
			NULL as koodit_osaaminen_taso4,
			NULL as osaaminen_taso4_fi,
			NULL as osaaminen_taso4_sv,
			NULL as osaaminen_taso4_en,
			s1.koodi as koodit_ryhma,
			dbo.capitalize(s1.osaaminen_fi) as ryhma_fi,
			dbo.capitalize(s1.osaaminen_sv) as ryhma_sv,
			dbo.capitalize(s1.osaaminen_en) as ryhma_en,
			'ETL: p_lataa_d_esco_osaaminen' AS source
		FROM [ANTERO].[sa].[sa_esco_osaamiset] s1
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s2 on s1.koodi = s2.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s3 on s2.koodi = s3.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s4 on s3.koodi = s4.parent_koodi
		WHERE s1.parent_koodi is null AND s2.koodi is not null AND s3.parent_koodi is not null and s4.parent_koodi is not null

		UNION ALL

		SELECT 
			s5.koodi as koodit_osaaminen,
			s2.koodi as koodit_osaaminen_taso1,
			dbo.capitalize(s2.osaaminen_fi) as osaaminen_taso1_fi,
			dbo.capitalize(s2.osaaminen_sv) as osaaminen_taso1_sv,
			dbo.capitalize(s2.osaaminen_en) as osaaminen_taso1_en,
			s3.koodi as koodit_osaaminen_taso2,
			dbo.capitalize(s3.osaaminen_fi) as osaaminen_taso2_fi,
			dbo.capitalize(s3.osaaminen_sv) as osaaminen_taso2_sv,
			dbo.capitalize(s3.osaaminen_en) as osaaminen_taso2_en,
			s4.koodi as koodit_osaaminen_taso3,
			dbo.capitalize(s4.osaaminen_fi) as osaaminen_taso3_fi,
			dbo.capitalize(s4.osaaminen_sv) as osaaminen_taso3_sv,
			dbo.capitalize(s4.osaaminen_en) as osaaminen_taso3_en,
			s5.koodi as koodit_osaaminen_taso4,
			dbo.capitalize(s5.osaaminen_fi) as osaaminen_taso4_fi,
			dbo.capitalize(s5.osaaminen_sv) as osaaminen_taso4_sv,
			dbo.capitalize(s5.osaaminen_en) as osaaminen_taso4_en,
			s1.koodi as koodit_ryhma,
			dbo.capitalize(s1.osaaminen_fi) as ryhma_fi,
			dbo.capitalize(s1.osaaminen_sv) as ryhma_sv,
			dbo.capitalize(s1.osaaminen_en) as ryhma_en,
			'ETL: p_lataa_d_esco_osaaminen' AS source
		FROM [ANTERO].[sa].[sa_esco_osaamiset] s1
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s2 on s1.koodi = s2.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s3 on s2.koodi = s3.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s4 on s3.koodi = s4.parent_koodi
		LEFT JOIN [ANTERO].[sa].[sa_esco_osaamiset] s5 on s4.koodi = s5.parent_koodi
		WHERE s1.parent_koodi is null AND s2.koodi is not null AND s3.parent_koodi is not null and s4.parent_koodi is not null and s5.parent_koodi is not null

	) f
) AS src ON target.koodit_osaaminen = src.koodit_osaaminen
WHEN MATCHED
	THEN
		UPDATE
		SET target.koodit_osaaminen = src.koodit_osaaminen,
			target.koodit_osaaminen_taso1 = src.koodit_osaaminen_taso1,
			target.osaaminen_taso1_fi = src.osaaminen_taso1_fi,
			target.osaaminen_taso1_sv = src.osaaminen_taso1_sv,
			target.osaaminen_taso1_en = src.osaaminen_taso1_en,
			target.koodit_osaaminen_taso2 = src.koodit_osaaminen_taso2,
			target.osaaminen_taso2_fi = src.osaaminen_taso2_fi,
			target.osaaminen_taso2_sv = src.osaaminen_taso2_sv,
			target.osaaminen_taso2_en = src.osaaminen_taso2_en,
			target.koodit_osaaminen_taso3 = src.koodit_osaaminen_taso3,
			target.osaaminen_taso3_fi = src.osaaminen_taso3_fi,
			target.osaaminen_taso3_sv = src.osaaminen_taso3_sv,
			target.osaaminen_taso3_en = src.osaaminen_taso3_en,
			target.koodit_osaaminen_taso4 = src.koodit_osaaminen_taso4,
			target.osaaminen_taso4_fi = src.osaaminen_taso4_fi,
			target.osaaminen_taso4_sv = src.osaaminen_taso4_sv,
			target.osaaminen_taso4_en = src.osaaminen_taso4_en,
			target.koodit_ryhma = src.koodit_ryhma,
			target.ryhma_fi = src.ryhma_fi,
			target.ryhma_sv = src.ryhma_sv,
			target.ryhma_en = src.ryhma_en,
			target.source = src.source
			
WHEN NOT MATCHED
	THEN
		INSERT (
				koodit_osaaminen,koodit_osaaminen_taso1,osaaminen_taso1_fi,osaaminen_taso1_sv,osaaminen_taso1_en,
				koodit_osaaminen_taso2,osaaminen_taso2_fi,osaaminen_taso2_sv,osaaminen_taso2_en,
				koodit_osaaminen_taso3,osaaminen_taso3_fi,osaaminen_taso3_sv,osaaminen_taso3_en,
				koodit_osaaminen_taso4,osaaminen_taso4_fi,osaaminen_taso4_sv,osaaminen_taso4_en,
				koodit_ryhma,ryhma_fi,ryhma_sv,ryhma_en,source
				)
		VALUES (
				src.koodit_osaaminen,src.koodit_osaaminen_taso1,src.osaaminen_taso1_fi,src.osaaminen_taso1_sv,src.osaaminen_taso1_en,
				src.koodit_osaaminen_taso2,src.osaaminen_taso2_fi,src.osaaminen_taso2_sv,src.osaaminen_taso2_en,
				src.koodit_osaaminen_taso3,src.osaaminen_taso3_fi,src.osaaminen_taso3_sv,src.osaaminen_taso3_en,
				src.koodit_osaaminen_taso4,src.osaaminen_taso4_fi,src.osaaminen_taso4_sv,src.osaaminen_taso4_en,
				src.koodit_ryhma,src.ryhma_fi,src.ryhma_sv,src.ryhma_en,src.source
				);

GO

USE [ANTERO]