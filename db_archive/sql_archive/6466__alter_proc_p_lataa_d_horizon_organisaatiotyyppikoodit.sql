USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit]    Script Date: 23.9.2022 14:25:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_organisaatiotyyppikoodit]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_organisaatiotyyppikoodit WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_organisaatiotyyppikoodit ON;

	  INSERT INTO dw.d_horizon_organisaatiotyyppikoodit (
		id, organisaatiotyyppi_koodi, Organisaatiotyyppi, loadtime, username, source
	  )
	SELECT
		-1,
		'ÖÖÖ','Missing data',
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_organisaatiotyyppikoodit'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_organisaatiotyyppikoodit OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			organisaatiotyyppi_koodi = s.Code,
			Organisaatiotyyppi = s.Title,
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_organisaatiotyyppikoodit'
		FROM dw.d_horizon_organisaatiotyyppikoodit d
		JOIN sa.sa_horizon_organisaatiotyypit s ON d.organisaatiotyyppi_koodi = s.Code

		;
	END

MERGE dw.d_horizon_organisaatiotyyppikoodit AS target
USING (
	SELECT DISTINCT
	   Code as organisaatiotyyppi_koodi
      ,Title as Organisaatiotyyppi
	  ,source = 'ETL: p_lataa_d_horizon_organisaatiotyyppikoodit'
	FROM ANTERO.sa.sa_horizon_organisaatiotyypit
	WHERE Code is not null
	) AS src
	ON target.organisaatiotyyppi_koodi = src.organisaatiotyyppi_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET  
			 organisaatiotyyppi_koodi = src.organisaatiotyyppi_koodi
			,Organisaatiotyyppi = src.Organisaatiotyyppi
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				organisaatiotyyppi_koodi, Organisaatiotyyppi, source
				)
		VALUES (
				src.organisaatiotyyppi_koodi, src.Organisaatiotyyppi,  src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_organisaatiotyypit) > 0 THEN DELETE
;

GO


USE [ANTERO]