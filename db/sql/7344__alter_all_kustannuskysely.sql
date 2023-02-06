USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]    Script Date: 6.2.2023 11:44:58 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 6.2.2023 11:44:58 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_amos_kustannuskysely_tili]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]    Script Date: 6.2.2023 11:44:58 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
DROP VIEW IF EXISTS [dw].[v_amos_kustannuskysely_tili]
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
DROP TABLE IF EXISTS [dw].[d_amos_kustannuskysely_tili]
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_seurantaryhmat]    Script Date: 6.2.2023 11:44:58 ******/
DROP VIEW IF EXISTS [dw].[v_amos_kustannuskysely_seurantaryhmat]
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_seurantaryhma]    Script Date: 6.2.2023 11:44:58 ******/
DROP TABLE IF EXISTS [dw].[d_amos_kustannuskysely_seurantaryhma]
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_seurantaryhma]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_kustannuskysely_seurantaryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_kustannuskysely_seurantaryhma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [char](5) NOT NULL,
	[selite] [varchar](250) NOT NULL,
	[taso1] [varchar](250) NOT NULL,
	[taso2] [varchar](250) NULL,
	[taso3] [varchar](250) NULL,
	[summatieto] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](250) NOT NULL,
	[source] [varchar](250) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_seurantaryhmat]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_kustannuskysely_seurantaryhmat]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dw].[v_amos_kustannuskysely_seurantaryhmat] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Seurantaryhmä, taso 1] = d2.taso1
	,[Seurantaryhmä, taso 2] = d2.taso2
	,[Seurantaryhmä, taso 3] = d2.taso3
	,[Tutkintotyyppi] = case when d5.koodi=''muu'' then ''Muu ammatillinen koulutus'' else d3.tutkintotyypin_ryhma_fi end
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Kustannusryhmä] = d5.selite_fi
	,[Omistajatyyppi]
	,[Oppisopimuskoulutus] = d6.kytkin_fi
	,[Vankilaopetus] = d7.kytkin_fi
	,[Koodit Tutkintotyypin ryhmä] = d3.tutkintotyypin_ryhma_koodi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[euroa]
	,[ov_op_avain] = CONCAT(f.vuosi, d1.organisaatio_koodi, d3.tutkintotyypin_ryhma_koodi, d4.koulutusalataso1_koodi, d5.koodi, d6.kytkin_koodi, d7.kytkin_koodi)
FROM dw.f_amos_kustannuskysely_seurantaryhmat f
left join dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
left join dw.d_amos_kustannuskysely_seurantaryhma d2 on d2.id=f.d_amos_seurantaryhma_id
left join dw.d_koulutusluokitus d3 on d3.id=f.d_koulutusluokitus_tutkintotyypin_ryhma_id
left join dw.d_koulutusluokitus d4 on d4.id=f.d_koulutusluokitus_koulutusala_taso1_id
left join dw.d_ammatillisen_tutkinnon_kustannusryhma d5 on d5.id=f.d_ammatillisen_tutkinnon_kustannusryhma_id
left join dw.d_kytkin d6 on d6.id=f.d_kytkin_oppisopimuskoulutus_id
left join dw.d_kytkin d7 on d7.id=f.d_kytkin_vankilaopetus_id



' 
GO
/****** Object:  Table [dw].[d_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_kustannuskysely_tili]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_kustannuskysely_tili](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](50) NOT NULL,
	[selite] [varchar](250) NOT NULL,
	[taso0] [varchar](250) NOT NULL,
	[taso1] [varchar](250) NOT NULL,
	[taso2] [varchar](250) NULL,
	[taso3] [varchar](250) NULL,
	[taso4] [varchar](250) NULL,
	[taso5] [varchar](250) NULL,
	[taso_alin] [varchar](250) NOT NULL,
	[summatieto] [int] NOT NULL,
	[yksikko] [varchar](50) NULL,
	[taso0_jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dw].[v_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_kustannuskysely_tili]'))
EXEC dbo.sp_executesql @statement = N'






CREATE VIEW [dw].[v_amos_kustannuskysely_tili] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Taso 0] = d2.taso0
	,[Taso 1] = d2.taso1
	,[Taso 2] = d2.taso2
	,[Taso 3] = d2.taso3
	,[Taso 4] = d2.taso4
	,[Taso 5] = d2.taso5
	,[Taso, alin] = d2.taso_alin
	,[Omistajatyyppi] = f.omistajatyyppi_nimi
	,[Koulutuksen järjestäjän maakunta] = d3.maakunta_fi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[jarj_taso0] = d2.taso0_jarjestys
	,[tili_jarjestys] = case when d2.taso5 = '''' then ''999'' else CONCAT(d2.id,''_'',d2.koodi) end
	--
	,[avain] = CONCAT(f.vuosi, d1.organisaatio_koodi)
	,d2.[yksikko]
	,[maara_euroa]
FROM dw.f_amos_kustannuskysely_jarjestajakohtainen f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_amos_kustannuskysely_tili d2 on d2.id = f.d_amos_tili_id
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = d1.kunta_koodi




' 
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_seurantaryhma]    Script Date: 6.2.2023 11:44:58 ******/
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


IF NOT EXISTS (SELECT * FROM dw.d_amos_kustannuskysely_seurantaryhma WHERE id = -1)

BEGIN
	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_seurantaryhma ON;

	INSERT INTO dw.d_amos_kustannuskysely_seurantaryhma (
		 [id]
		,[koodi]
		,[selite]
		,[taso1]
		,[taso2]
		,[taso3]
		,[summatieto]
		,[loadtime]
		,[username]
		,[source]
	)
	SELECT
		-1
		,'-1'
		,nimi
		,nimi
		,nimi
		,nimi
		,koodi
		,GETDATE()
		,SUSER_NAME()
		,'ETL: p_lataa_d_amos_kustannuskysely_seurantaryhma'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1'

	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_seurantaryhma OFF;
END
ELSE BEGIN

	UPDATE d
	SET
		 [koodi] = s.koodi
		,[selite] = s.nimi
		,[taso1] = s.nimi
		,[taso2] = s.nimi
		,[taso3] = s.nimi
		,[summatieto] = s.koodi
		,[loadtime] = GETDATE()
		,[username] = SUSER_NAME()
		,[source] = 'ETL: p_lataa_d_amos_kustannuskysely_seurantaryhma'
	FROM dw.d_amos_kustannuskysely_seurantaryhma d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
END

MERGE dw.d_amos_kustannuskysely_seurantaryhma AS target
USING (
	SELECT 
		 [koodi]
		,[selite] = ltrim(rtrim([selite]))
		,[taso1] = ltrim(rtrim([taso0]))
		,[taso2] = ltrim(rtrim([taso1]))
		,[taso3] = ltrim(rtrim([taso2]))
		,[summatieto]
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_seurantaryhma'
	 FROM [sa].[sa_amos_kustannuskysely_seurantaryhma_koodisto]
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE SET
		koodi = src.koodi
		,selite = src.selite
		,taso1 = src.taso1
		,taso2 = src.taso2
		,taso3 = src.taso3
		,summatieto = src.summatieto
		,loadtime = src.loadtime
		,username = src.username
		,source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		 [koodi]
		,[selite]
		,[taso1]
		,[taso2]
		,[taso3]
		,[summatieto]
		,[loadtime]
		,[username]
		,[source]
	)

	VALUES (
		 src.koodi
		,src.selite
		,src.taso1
		,src.taso2
		,src.taso3
		,src.summatieto
		,src.loadtime
		,src.username
		,src.source
	)

WHEN NOT MATCHED BY source AND target.id != -1 THEN delete
;

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_kustannuskysely_tili]    Script Date: 6.2.2023 11:44:58 ******/
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


IF NOT EXISTS (SELECT * FROM dw.d_amos_kustannuskysely_tili WHERE id = -1)

BEGIN
	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_tili ON;

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
		,[yksikko]
		,[taso0_jarjestys]
		,[loadtime]
		,[username]
		,[source]
	)
	SELECT
		koodi
		,koodi
		,nimi
		,nimi
		,nimi
		,nimi
		,nimi
		,nimi
		,nimi
		,nimi
		,koodi
		,nimi
		,99
		,GETDATE()
		,SUSER_NAME()
		,'etl: p_lataa_d_amos_kustannuskysely_tili'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1'

	SET IDENTITY_INSERT dw.d_amos_kustannuskysely_tili OFF;
END
ELSE BEGIN

	UPDATE d
	SET
		[koodi] = s.koodi
		,[selite] = s.nimi
		,[taso0] = s.nimi
		,[taso1] = s.nimi
		,[taso2] = s.nimi
		,[taso3] = s.nimi
		,[taso4] = s.nimi
		,[taso5] = s.nimi
		,[taso_alin] = s.nimi
		,[summatieto] = s.koodi
		,[yksikko] = s.nimi
		,[taso0_jarjestys] = 99
		,[loadtime] = GETDATE()
		,[username] = SUSER_NAME()
		,[source] = 'etl: p_lataa_d_amos_kustannuskysely_tili'
	FROM dw.d_amos_kustannuskysely_tili d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
END

MERGE dw.d_amos_kustannuskysely_tili AS target
USING (
	SELECT 
		[koodi]
		,[selite] = ltrim(rtrim([selite]))
		,[taso0] = ltrim(rtrim([taso0]))
		,[taso1] = ltrim(rtrim([taso1]))
		,[taso2] = ltrim(rtrim([taso2]))
		,[taso3] = ltrim(rtrim([taso3]))
		,[taso4] = ltrim(rtrim([taso4]))
		,[taso5] = ltrim(rtrim([taso5]))
		,[taso_alin]  = ltrim(rtrim([taso_alin]))
		,[summatieto]
		,[yksikko]
		,[taso0_jarjestys] =
			case taso0
				when 'Valtionosuudella rahoitettava toiminta' then 1
				when 'Josta-tyyppiset lisätiedot valtionosuusjärjestelmän kustannuksista, tiedot sisältyvät joko seurantaryhmäkohtaisiin tai järjestäjäkohtaisiin tietoihin tai kohtaan E2 silloin kun kysymyksessä on koulutuksen myynti' then 2
				when 'Koulutuksen järjestäjän muu kuin valtionosuudella rahoitettu toiminta' then 3
				when 'Tuloslaskelmatiedot' then 4
				when 'Arvonlisäverot' then 5
				when 'Investoinnit' then 6
				when 'Tase-erät' then 7
				when 'Ammatillisen koulutuksen järjestäjän oman henkilöstön ja ostopalvelujen tuottama opetus- ja ohjaustuntimäärä h/vuosi' then 8
				else 9
			end
		,loadtime = GETDATE()
		,username = SUSER_NAME()
		,source = 'ETL: p_lataa_d_amos_kustannuskysely_tili'
	 FROM [sa].[sa_amos_kustannuskysely_tase_tuloslaskelma_rahoitus_koodisto]
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE SET
		koodi = src.koodi
		,selite = src.selite
		,taso0 = src.taso0
		,taso1 = src.taso1
		,taso2 = src.taso2
		,taso3 = src.taso3
		,taso4 = src.taso4
		,taso5 = src.taso5
		,taso_alin = src.taso_alin
		,taso0_jarjestys = src.taso0_jarjestys
		,summatieto = src.summatieto
		,yksikko = src.yksikko
		,loadtime = src.loadtime
		,username = src.username
		,source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		 [koodi]
		,[selite]
		,[taso0]
		,[taso1]
		,[taso2]
		,[taso3]
		,[taso4]
		,[taso5]
		,[taso_alin]
		,[taso0_jarjestys]
		,[summatieto]
		,[yksikko]
		,[loadtime]
		,[username]
		,[source]
	)

	VALUES (
		 src.koodi
		,src.selite
		,src.taso0
		,src.taso1
		,src.taso2
		,src.taso3
		,src.taso4
		,src.taso5
		,src.taso_alin
		,src.taso0_jarjestys
		,src.summatieto
		,src.yksikko
		,src.loadtime
		,src.username
		,src.source
	)

WHEN NOT MATCHED BY source AND target.id != -1 THEN delete
;

GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS


EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet

EXEC dw.p_lataa_d_amos_kustannuskysely_tili

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)
SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_tili
			WHERE summatieto = 0 and koodi != '-1'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')


SET @query = '
	TRUNCATE TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen

	INSERT INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

	SELECT
		 vuosi
		,d_organisaatioluokitus_id = coalesce(d2.id,-1)
		,d_amos_tili_id = coalesce(d1.id,-1)
		,omistajatyyppi_nimi
		,maara_euroa


	FROM (

		SELECT DISTINCT
	
			 [vuosi]
			,[ytunnus]
			,[omistajatyyppi_koodi] = LEFT(omistaja,1)
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]
   
		FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] sa
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols + ')
		) tilinpaatos

		WHERE maara_euroa != 0

	) Q

	LEFT JOIN dw.d_amos_kustannuskysely_tili d1 ON d1.koodi = Q.tilitunnus
	LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus

	WHERE d1.Summatieto = 0
'

EXEC (@query)
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]    Script Date: 6.2.2023 11:44:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat] AS

EXEC dw.p_lataa_d_amos_kustannuskysely_seurantaryhma

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_seurantaryhma
			WHERE summatieto = 0 and koodi != '-1'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

SET @query = '
	TRUNCATE TABLE dw.f_amos_kustannuskysely_seurantaryhmat

	INSERT INTO dw.f_amos_kustannuskysely_seurantaryhmat

	SELECT 
		 [vuosi]
		,[d_organisaatioluokitus_id] = coalesce(d1.id,-1)
		,[d_amos_seurantaryhma_id] = coalesce(d2.id,-1)
		,[d_kytkin_oppisopimuskoulutus_id] = coalesce(d3.id,-1)
		,[d_kytkin_vankilaopetus_id] = coalesce(d4.id,-1)
		,[d_ammatillisen_tutkinnon_kustannusryhma_id] = coalesce(d5.id,-1)
		,[d_koulutusluokitus_tutkintotyypin_ryhma_id] = coalesce(d6.id,-1)
		,[d_koulutusluokitus_koulutusala_taso1_id] = coalesce(d7.id,-1)
		,[omistajatyyppi]
		,[euroa]

	FROM (

		SELECT distinct
			 [vuosi]
			,[jarjestaja_koodi] = [ytunnus]
			,[Koulutuksen järjestäjä] = SUBSTRING(ytunnus_nimi,11,LEN(ytunnus_nimi))
			,[seurantaryhma]
			,[tutk_johtava] = CASE LEFT(cast(seuranta as varchar(5)),1) WHEN 1 THEN 1 ELSE 0 END
			,[oppisopimus] = CASE WHEN seurantaryhma like ''%12%'' THEN 1 ELSE 0 END
			,[vankilaopetus] = CASE WHEN seurantaryhma like ''%15%'' THEN 1 ELSE 0 END
			,[koulutusala1_koodi] = CASE WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''99'' ELSE SUBSTRING(cast(seuranta as varchar(5)),2,2) END
			,[kustannusryhma_koodi] = 
				CASE
					WHEN seuranta_nimi like ''%valma%'' or seuranta_nimi like ''%telma%'' THEN ''vt''
					WHEN seuranta_nimi like ''%opiskeluvalmiuksia tukevat opinnot%'' THEN ''ot''
					WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''muu''
					ELSE SUBSTRING(cast(seuranta as varchar(5)),4,1)
				END
			,[tutkintotyyppi_koodi] = 
				CASE 
					WHEN [ttyyppi]=1 THEN ''02'' 
					WHEN [ttyyppi]=2 THEN ''08'' 
					WHEN seuranta_nimi like ''%valma%'' or seuranta_nimi like ''%telma%'' THEN ''09''
					WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''-1''
					ELSE ''09''
				END
			,[omistajatyyppi_koodi] = LEFT(omistaja,1)
			,[Omistajatyyppi] = SUBSTRING(omistaja,3,LEN(omistaja))

			,[euroa]
   
		FROM [sa].[sa_amos_kustannuskysely_seurantaryhmat] sa1
		UNPIVOT (
			[euroa] FOR [seurantaryhma]
			IN (' + @cols + ')
		) seur_ryhma
		LEFT JOIN sa.sa_amos_kustannuskysely_seurantaryhma_koodisto sa2 ON sa2.Koodi = seur_ryhma.seurantaryhma
		WHERE sa2.Summatieto = 0 AND euroa != 0

	) Q

	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.jarjestaja_koodi
	LEFT JOIN dw.d_amos_kustannuskysely_seurantaryhma d2 on d2.koodi = Q.seurantaryhma
	LEFT JOIN dw.d_kytkin d3 on d3.kytkin_koodi = Q.oppisopimus
	LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = Q.vankilaopetus
	LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d5 on d5.koodi = Q.kustannusryhma_koodi
	LEFT JOIN (
		select 
			id
			,tutkintotyypin_ryhma_koodi 
		from (
			select 
				id
				,tutkintotyypin_ryhma_koodi
				,r_nro = row_number() over (partition by tutkintotyypin_ryhma_koodi order by id)
			from dw.d_koulutusluokitus
		) q where r_nro=1
	) d6 on d6.tutkintotyypin_ryhma_koodi = Q.tutkintotyyppi_koodi

	LEFT JOIN (
		select 
			id
			,koulutusalataso1_koodi 
		from (
			select 
				id
				,koulutusalataso1_koodi
				,r_nro = row_number() over (partition by koulutusalataso1_koodi order by id)
			from dw.d_koulutusluokitus
		) q where r_nro=1
	) d7 on d7.koulutusalataso1_koodi = Q.koulutusala1_koodi
'

EXEC (@query)

