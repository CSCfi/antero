USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_maakoodit]    Script Date: 23.9.2022 14:21:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_maakoodit]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_maakoodit WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_maakoodit ON;

	  INSERT INTO dw.d_horizon_maakoodit (
		id, eu_koodi, iso_koodi, Maa, loadtime, username, source
	  )
	SELECT
		-1,
		'ÖÖ','ÖÖ', 'Missing data',
		loadtime =getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_maakoodit'

	  ;

	  SET IDENTITY_INSERT dw.d_horizon_maakoodit OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			eu_koodi=case when s.eu_koodi = 'NULL' then NULL else s.eu_koodi end,
			iso_koodi=case when s.isoCode = 'NULL' then NULL else s.isoCode end,
			Maa=s.name,
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_maakoodit'
		FROM dw.d_horizon_maakoodit d
		JOIN sa.sa_horizon_maakoodit s ON s.eu_koodi = d.eu_koodi and s.isoCode = d.iso_koodi

		;
	END

MERGE dw.d_horizon_maakoodit AS target
USING (
	SELECT DISTINCT
		case when eu_koodi = 'NULL' then NULL else eu_koodi end as eu_koodi,
		case when isoCode = 'NULL' then NULL else isoCode end as iso_koodi,
		[name] as Maa,
		source = 'ETL: p_lataa_d_horizon_maakoodit'
	FROM ANTERO.sa.sa_horizon_maakoodit
	WHERE eu_koodi is not null
	) AS src
	ON target.eu_koodi = src.eu_koodi and target.iso_koodi = src.iso_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  eu_koodi = src.eu_koodi
			,iso_koodi = src.iso_koodi
			,Maa = src.Maa
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				eu_koodi, iso_koodi, Maa, source
				)
		VALUES (
				src.eu_koodi, src.iso_koodi, src.Maa, src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_maakoodit) > 0 THEN DELETE
;


GO

USE [ANTERO]