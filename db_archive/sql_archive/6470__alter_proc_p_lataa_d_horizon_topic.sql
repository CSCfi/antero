USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_topic]    Script Date: 23.9.2022 14:35:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_topic]
AS
IF NOT EXISTS (SELECT * FROM dw.d_horizon_topic WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_horizon_topic ON;

	  INSERT INTO dw.d_horizon_topic (
		id, topic_id, topic_koodi, Topic, [call], rcn, loadtime, username, source
	  )
	SELECT
		-1,
		'ÖÖ','ÖÖ', 'Missing data', 'ÖÖ', -1,
		loadtime = getdate(),
		username = suser_name(),
		'ETL: p_lataa_d_horizon_topic'
	  ;

	  SET IDENTITY_INSERT dw.d_horizon_topic OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			topic_id = s.topic_id, 
			topic_koodi = s.code, 
			Topic = s.title, 
			[call] = s.[call], 
			rcn = s.rcn,
			loadtime = getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_horizon_topic'
		FROM dw.d_horizon_topic d
		JOIN sa.sa_horizon_topics s ON d.topic_id = s.topic_id

		;
	END

MERGE dw.d_horizon_topic AS target
USING (
	SELECT DISTINCT
	  topic_id, 
	  code as topic_koodi, 
      title as Topic, 
	  [call], 
	  rcn,
	  source = 'ETL: p_lataa_d_horizon_topic'
	FROM ANTERO.sa.sa_horizon_topics
	WHERE topic_id is not null
	) AS src
	ON target.topic_id = src.topic_id
WHEN MATCHED
	THEN
		UPDATE
		SET  
			 topic_id = src.topic_id, 
			 topic_koodi = src.topic_koodi, 
			 Topic = src.Topic, 
			 [call] = src.[call], 
			 rcn = src.rcn,
			 target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				topic_id, topic_koodi, Topic, [call], rcn, source
				)
		VALUES (
				src.topic_id, src.topic_koodi, src.Topic, src.[call], src.rcn,  src.source
				)

WHEN NOT MATCHED BY source and id != '-1' and (select count(*) from sa.sa_horizon_topics) > 0 THEN DELETE
;


GO


USE [ANTERO]