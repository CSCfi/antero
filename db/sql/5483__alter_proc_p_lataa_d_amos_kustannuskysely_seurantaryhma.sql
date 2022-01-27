--USE [ANTERO_31102021]
USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]    Script Date: 25.1.2022 14:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma] AS

TRUNCATE TABLE dw.d_amos_kustannuskysely_seurantaryhma

set identity_insert dw.d_amos_kustannuskysely_seurantaryhma on;

INSERT INTO dw.d_amos_kustannuskysely_seurantaryhma (
	 [id]
    ,[koodi]
    ,[selite]
    ,[taso1]
    ,[taso2]
    ,[taso3]
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
	,0
	,'ETL: p_lataa_d_amos_kustannuskysely_seurantaryhma'
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'

set identity_insert dw.d_amos_kustannuskysely_seurantaryhma off;

INSERT INTO dw.d_amos_kustannuskysely_seurantaryhma ( 
     [koodi]
    ,[selite]
    ,[taso1]
    ,[taso2]
    ,[taso3]
	,[summatieto]
    ,[source]
)

SELECT 
	[koodi]
	,[selite]
	,[taso0]
	,[taso1]
	,[taso2]
	,[summatieto]
	,'ETL: p_lataa_d_amos_kustannuskysely_seurantaryhma'
 FROM [sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto]

