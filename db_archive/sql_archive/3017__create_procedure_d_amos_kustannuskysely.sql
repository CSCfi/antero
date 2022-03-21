USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]    Script Date: 26.4.2020 13:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma] AS' 
END
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
 FROM [ANTERO].[sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto]


GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_tili]    Script Date: 26.4.2020 13:27:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_kustannuskysely_tili]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_kustannuskysely_tili] AS' 
END
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
 FROM [ANTERO].[sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto]

