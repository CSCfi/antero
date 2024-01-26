USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_horizon]    Script Date: 14.7.2023 9:08:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_horizon] AS

TRUNCATE TABLE dw.f_horizon
INSERT INTO dw.f_horizon (	
	organisation_id,
	d_horizon_projekti_id,
	d_horizon_organisaatiotyyppi_id,
	d_horizon_maa_id,
	d_horizon_ohjelma_id,
	d_horizon_rahoitusohjelma_id,
	d_horizon_topic_id,
	d_horizon_pilari_id,
	endOfParticipation,
	[name],
	shortName,
	[role],
	ecContribution,
	[loadtime],
	[username],
	[source]
)

SELECT
	sa.id as organisation_id,
	coalesce(d1.id, '-1') as d_horizon_projekti_id,
	coalesce(d2.id, '-1') as d_horizon_organisaatiotyyppi_id,
	coalesce(d3.id, '-1') as d_horizon_maa_id,
	coalesce(d4.id, '-1') as d_horizon_ohjelma_id,
	coalesce(d5.id, '-1') as d_horizon_rahoitusohjelma_id,
	coalesce(d6.id, '-1') as d_horizon_topic_id,
	coalesce(d7.id, '-1') as d_horizon_pilari_id,
	sa.endOfParticipation,
	sa.[name],
	sa.shortName,
	sa.[role],
	cast(replace(ecContribution,',','.') as float) as ecContribution,
	getdate() as loadtime,
	suser_name() as username,
	'ETL: p_lataa_f_horizon' as 'source'
FROM [ANTERO].[sa].[sa_horizon_organisaatioiden_rahoitus] sa
LEFT JOIN ANTERO.dw.d_horizon_projektit d1 on d1.project_id =  sa.projectID
LEFT JOIN ANTERO.dw.d_horizon_organisaatiotyyppikoodit d2 on d2.organisaatiotyyppi_koodi =  sa.activityType
LEFT JOIN ANTERO.dw.d_horizon_maakoodit d3 on d3.eu_koodi =  sa.country
LEFT JOIN ANTERO.dw.d_horizon_ohjelma d4 on d4.ohjelma_koodi =  substring(d1.programme, 1, case when charindex(';', d1.programme) = 0 then len(d1.programme) else charindex(';', d1.programme) - 1 end)
LEFT JOIN ANTERO.dw.d_horizon_rahoitusohjelma d5 on CONVERT(VARBINARY(30),LTRIM(RTRIM(d5.rahoitusohjelma_koodi))) =  CONVERT(VARBINARY(30),LTRIM(RTRIM(d1.fundingScheme)))
LEFT JOIN ANTERO.dw.d_horizon_topic d6 on d6.topic_koodi =  d1.topics
LEFT JOIN ANTERO.dw.d_horizon_pilari d7 on d7.ohjelma_koodi = LEFT(substring(d4.ohjelma_koodi,charindex('_',d4.ohjelma_koodi)+1, len(d4.ohjelma_koodi)), LEN(d7.ohjelma_koodi))

GO

USE [ANTERO]
