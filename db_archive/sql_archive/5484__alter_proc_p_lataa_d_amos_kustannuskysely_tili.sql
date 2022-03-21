--USE [ANTERO_31102021]
USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_tili]    Script Date: 25.1.2022 14:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_amos_kustannuskysely_tili] AS

TRUNCATE TABLE dw.d_amos_kustannuskysely_tili

set identity_insert dw.d_amos_kustannuskysely_tili on;

INSERT INTO dw.d_amos_kustannuskysely_tili (
	 [id]
    ,[koodi]
    ,[selite]
    ,[taso0]
    ,[taso1]
    ,[taso2]
    ,[taso3]
    ,[taso4]
    ,[taso5]
    ,[taso_alin]
    ,[summatieto]
    ,[source]
)

SELECT
	-1
	,'-1'
	,nimi
	,nimi
	,nimi
	,nimi
	,nimi
	,nimi
	,nimi
	,nimi
	,0
	,'ETL: p_lataa_d_amos_kustannuskysely_tili'
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'

set identity_insert dw.d_amos_kustannuskysely_tili off;

INSERT INTO dw.d_amos_kustannuskysely_tili ( 
     [koodi]
    ,[selite]
    ,[taso0]
    ,[taso1]
    ,[taso2]
    ,[taso3]
    ,[taso4]
    ,[taso5]
    ,[taso_alin]
    ,[summatieto]
    ,[source]
)

SELECT 
	[koodi]
	,[selite]
	,[taso0]
	,[taso1]
	,[taso2]
	,[taso3]
	,[taso4]
	,[taso5]
	,[taso_alin]
	,[summatieto]
	,'ETL: p_lataa_d_amos_kustannuskysely_tili'
 FROM [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto]

