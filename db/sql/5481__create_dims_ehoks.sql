USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistavat]    Script Date: 27.1.2022 17:25:27 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_osaamisen_hankkimistavat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistapa]    Script Date: 27.1.2022 17:25:27 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_osaamisen_hankkimistapa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistavat]') AND type in (N'U'))
ALTER TABLE [dw].[d_osaamisen_hankkimistavat] DROP CONSTRAINT IF EXISTS [DF_d_osaamisen_hankkimistavat_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistavat]') AND type in (N'U'))
ALTER TABLE [dw].[d_osaamisen_hankkimistavat] DROP CONSTRAINT IF EXISTS [DF_d_osaamisen_hankkimistavat_loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistapa]') AND type in (N'U'))
ALTER TABLE [dw].[d_osaamisen_hankkimistapa] DROP CONSTRAINT IF EXISTS [DF_d_osaamisen_hankkimistapa_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistapa]') AND type in (N'U'))
ALTER TABLE [dw].[d_osaamisen_hankkimistapa] DROP CONSTRAINT IF EXISTS [DF_d_osaamisen_hankkimistapa_loadtime]
GO
/****** Object:  Table [dw].[d_osaamisen_hankkimistavat]    Script Date: 27.1.2022 17:25:27 ******/
DROP TABLE IF EXISTS [dw].[d_osaamisen_hankkimistavat]
GO
/****** Object:  Table [dw].[d_osaamisen_hankkimistapa]    Script Date: 27.1.2022 17:25:27 ******/
DROP TABLE IF EXISTS [dw].[d_osaamisen_hankkimistapa]
GO
/****** Object:  Table [dw].[d_osaamisen_hankkimistapa]    Script Date: 27.1.2022 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistapa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_osaamisen_hankkimistapa](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](50) NOT NULL,
	[selite_fi] [varchar](100) NOT NULL,
	[selite_sv] [varchar](100) NOT NULL,
	[selite_en] [varchar](100) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_osaamisen_hankkimistapa__3213E83F19F4479D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_osaamisen_hankkimistavat]    Script Date: 27.1.2022 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisen_hankkimistavat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_osaamisen_hankkimistavat](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](250) NOT NULL,
	[selite_fi] [varchar](250) NULL,
	[selite_sv] [varchar](250) NULL,
	[selite_en] [varchar](250) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_osaamisen_hankkimistavat__3213E83F19F4479D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_osaamisen_hankkimistapa_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisen_hankkimistapa] ADD  CONSTRAINT [DF_d_osaamisen_hankkimistapa_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_osaamisen_hankkimistapa_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisen_hankkimistapa] ADD  CONSTRAINT [DF_d_osaamisen_hankkimistapa_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_osaamisen_hankkimistavat_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisen_hankkimistavat] ADD  CONSTRAINT [DF_d_osaamisen_hankkimistavat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_osaamisen_hankkimistavat_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisen_hankkimistavat] ADD  CONSTRAINT [DF_d_osaamisen_hankkimistavat_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistapa]    Script Date: 27.1.2022 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_osaamisen_hankkimistapa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistapa] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistapa] AS


IF (
	SELECT count(1)
	FROM dw.d_osaamisen_hankkimistapa
	WHERE koodi = '-1'
) = 0

BEGIN

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistapa ON;
	INSERT INTO dw.d_osaamisen_hankkimistapa (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_osaamisen_hankkimistapa'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1';

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistapa OFF;

END

ELSE
BEGIN
		
	UPDATE d
	SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 9,
		loadtime = getdate(),
		username = suser_name(),
		source = 'etl: p_lataa_d_osaamisen_hankkimistapa'
	FROM dw.d_osaamisen_hankkimistapa d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END

MERGE dw.d_osaamisen_hankkimistapa AS target

USING (
	SELECT 
		koodi
		,selite_fi = case when koodi = 'oppilaitosmuotoinenkoulutus' then 'Koulutuksen järjestäjän oppimisympäristö' else nimi end
		,selite_sv = nimi_sv
		,selite_en = nimi_en
		,jarjestys = case when koodi like 'oppil%' then 1 when koodi like 'koul%' then 2 else 3 end
		,'etl: p_lataa_d_osaamisen_hankkimistapa' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'osaamisenhankkimistapa'
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE
	SET selite_fi = src.selite_fi
		,selite_sv = src.selite_sv
		,selite_en = src.selite_en
		,jarjestys = src.jarjestys
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
	)
	VALUES (
		src.koodi
		,src.selite_fi
		,src.selite_sv
		,src.selite_en
		,src.jarjestys
		,src.source
);



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisen_hankkimistavat]    Script Date: 27.1.2022 17:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_osaamisen_hankkimistavat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistavat] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_d_osaamisen_hankkimistavat] AS


IF (
	SELECT count(1)
	FROM dw.d_osaamisen_hankkimistavat
	WHERE koodi = '-1'
) = 0

BEGIN

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistavat ON;
	INSERT INTO dw.d_osaamisen_hankkimistavat (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		999999,
		'etl: p_lataa_d_osaamisen_hankkimistavat'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	AND koodi='-1';

	SET IDENTITY_INSERT dw.d_osaamisen_hankkimistavat OFF;

END

ELSE
BEGIN
		
	UPDATE d
	SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 999999,
		loadtime = getdate(),
		username = suser_name(),
		source = 'etl: p_lataa_d_osaamisen_hankkimistavat'
	FROM dw.d_osaamisen_hankkimistavat d
	JOIN sa.sa_koodistot s ON s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


/* Osaamistapojen eri kombinaatioiden muodostaminen taulun dw.d_osaamisen_hankkimistapa pohjalta */
DECLARE @query nvarchar(max)
DECLARE @code as nvarchar(max)
DECLARE @sort as nvarchar(max)
DECLARE @value as nvarchar(max)
DECLARE @c_joins as nvarchar(max)
DECLARE @l_joins as nvarchar(max)
DECLARE @c_apply as nvarchar(max)
DECLARE @where as nvarchar(max)
DECLARE @select as nvarchar(max)
DECLARE @select_coll as nvarchar(max)

SET @code = 'concat('''''
SET @sort = 'cast(concat('''''
SET @value = 'lower(concat('
SET @c_joins = ''
SET @l_joins = ''
SET @c_apply = ''
SET @where = 'WHERE 1=1'
SET @select = ''

DECLARE @i as int
SET @i = 1

WHILE @i <= (SELECT count(*) FROM dw.d_osaamisen_hankkimistapa WHERE koodi != '-1')
BEGIN

	
	SET @code = @code + (case when @i > 1 then ',''_''' else '' end) + ',k' + cast(@i as char(1)) + '.koodi'
	SET @sort = @sort + ',k' + cast(@i as char(1)) + '.jarjestys'
	SET @l_joins = @l_joins + char(10) + 'LEFT JOIN dw.d_osaamisen_hankkimistapa d' + cast(@i as char(1)) + ' on d' + cast(@i as char(1)) + '.koodi=k' +  cast(@i as char(1)) + '.koodi'
	SET @c_apply = char(10) + 'CROSS APPLY (select selite_fi = reverse(lower(' + replace(replace(replace(@code,'koodi','selite_fi'),'k','d'),',''_'',',','', '',') + ')))) ca'

	IF @i > 1
	BEGIN 
		SET @value = 'reverse(stuff(ca.selite_fi,charindex('' ,'',ca.selite_fi),2,'' aj ''))'
		SET @c_joins = @c_joins + char(10) + 'CROSS JOIN kys k' + cast(@i as char(1))
		SET @where = @where + ' and k' + cast(@i-1 as char(1)) + '.jarjestys < k' + cast(@i as char(1)) + '.jarjestys'
	END
	ELSE BEGIN
		SET @value = 'lower(concat(''vain '',d1.selite_fi))'
	END

	SET @select = 
			@select 
			+ (case when @i>1 then char(10) + char(10) + 'UNION ALL' + char(10) + char(10) else '' end) 
			+ 'SELECT koodi = ' + @code + '), jarjestys = ' + @sort + ') as int), selite_fi = ' + @value + ' FROM kys k1 ' + @c_joins + @l_joins + @c_apply + char(10) + @where

	SET @i = @i + 1
END


CREATE TABLE #temp_oht (koodi varchar(250), jarjestys int, selite_fi varchar(250));

SET @query = 
'
	WITH kys as (
		SELECT distinct
			koodi
			,jarjestys
			,selite_fi
		FROM dw.d_osaamisen_hankkimistapa 
		WHERE koodi != ''-1''
	)

	SELECT 
		*	
	FROM (' 
		
		+ @select + 

	') q

	ORDER BY jarjestys

'

--PRINT(@select)
INSERT INTO #temp_oht
EXEC SP_EXECUTESQL @query;

/*  */

MERGE dw.d_osaamisen_hankkimistavat AS target

USING (
	SELECT 
		koodi = koodi
		,jarjestys = jarjestys
		,selite_fi = selite_fi
		,'etl: p_lataa_d_osaamisen_hankkimistavat' AS source
	FROM #temp_oht
) AS src ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE SET 
		koodi = src.koodi
		,jarjestys = src.jarjestys
		,selite_fi = src.selite_fi
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,jarjestys
		,selite_fi
		,source
	)
	VALUES (
		src.koodi
		,src.jarjestys
		,src.selite_fi
		,src.source
);


UPDATE dw.d_osaamisen_hankkimistavat
SET selite_fi = upper(left(selite_fi,1)) + substring(selite_fi,2,len(selite_fi)-1)


DROP TABLE IF EXISTS #temp_oht


GO
