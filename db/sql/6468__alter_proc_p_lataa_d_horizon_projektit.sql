USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_projektit]    Script Date: 23.9.2022 14:29:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_projektit]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_projektit WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_projektit ON;

	  INSERT INTO dw.d_horizon_projektit (
		id, [acronym], [call], [coordinator],
	[coordinatorCountry], [ecMaxContribution], [endDate], [frameworkProgramme], [fundingScheme],
	[project_id], [objective], [programme], [startDate], [status], [title], [topics], [totalCost], [rcn], 
	loadtime, username, [source])
	SELECT
		-1,
		'ÖÖ','ÖÖ', 'Missing data', 'ÖÖ', 0, NULL, 'ÖÖ', 'ÖÖ', -1, 'ÖÖ', 'ÖÖ', NULL, 'Missing data', 'Missing data', 'ÖÖ', 0, -1,
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_projektit'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_projektit OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			[acronym] = s.acronym, 
			[call] = s.[call], 
			[coordinator] = s.coordinator,
			[coordinatorCountry] = s.coordinatorCountry, 
			[ecMaxContribution] = s.ecMaxContribution, 
			[endDate] = s.endDate, 
			[frameworkProgramme] = s.frameworkProgramme, 
			[fundingScheme] = s.fundingScheme,
			[project_id] = s.id, 
			[objective] = s.objective, 
			[programme] = s.programme, 
			[startDate] = s.startDate, 
			[status] = s.[status], 
			[title] = s.title, 
			[topics] = s.topics, 
			[totalCost] = s.totalCost, 
			[rcn] = s.[X.U.FEFF.rcn],
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_projektit'
		FROM dw.d_horizon_projektit d
		JOIN sa.sa_horizon_projektit s ON d.project_id = s.id

		;
	END

MERGE dw.d_horizon_projektit AS target
USING (
	SELECT DISTINCT
	  [acronym], 
	  [call], 
	  [coordinator],
	  [coordinatorCountry], 
	  [ecMaxContribution], 
	  [endDate], 
      [frameworkProgramme], 
	  [fundingScheme],
	  id as project_id, 
	  [objective], 
	  [programme], 
	  [startDate], 
	  [status], 
	  [title], 
	  [topics], 
	  [totalCost], 
	  [X.U.FEFF.rcn] as rcn,
	  source = 'ETL: p_lataa_d_horizon_projektit'
	FROM ANTERO.sa.sa_horizon_projektit
	WHERE id is not null
	) AS src
	ON target.project_id = src.project_id
WHEN MATCHED
	THEN
		UPDATE
		SET  
			[acronym] = src.acronym, 
			[call] = src.[call], 
			[coordinator] = src.coordinator,
			[coordinatorCountry] = src.coordinatorCountry, 
			[ecMaxContribution] = src.ecMaxContribution, 
			[endDate] = src.endDate, 
			[frameworkProgramme] = src.frameworkProgramme, 
			[fundingScheme] = src.fundingScheme,
			[project_id] = src.project_id, 
			[objective] = src.objective, 
			[programme] = src.programme, 
			[startDate] = src.startDate, 
			[status] = src.[status], 
			[title] = src.title, 
			[topics] = src.topics, 
			[totalCost] = src.totalCost, 
			[rcn] = src.[rcn],
			target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				[acronym], [call], [coordinator],
	[coordinatorCountry], [ecMaxContribution], [endDate], [frameworkProgramme], [fundingScheme],
	[project_id], [objective], [programme], [startDate], [status], [title], [topics], [totalCost], [rcn], source
				)
		VALUES (
				src.[acronym], src.[call], src.[coordinator],
	src.[coordinatorCountry], src.[ecMaxContribution], src.[endDate], src.[frameworkProgramme], src.[fundingScheme],
	src.[project_id], src.[objective], src.[programme], src.[startDate], src.[status], src.[title], src.[topics], src.[totalCost], src.[rcn],  src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_projektit) > 0 THEN DELETE
;


GO

USE [ANTERO]