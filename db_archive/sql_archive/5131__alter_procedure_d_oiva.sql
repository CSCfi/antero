USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]    Script Date: 22.11.2021 14:24:36 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oivakoulutukset]    Script Date: 22.11.2021 14:24:36 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_oivakoulutukset]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]') AND type in (N'U'))
ALTER TABLE [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] DROP CONSTRAINT IF EXISTS [DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]') AND type in (N'U'))
ALTER TABLE [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] DROP CONSTRAINT IF EXISTS [DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivakoulutukset]') AND type in (N'U'))
ALTER TABLE [dw].[d_oivakoulutukset] DROP CONSTRAINT IF EXISTS [DF_d_oivakoulutukset_username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivakoulutukset]') AND type in (N'U'))
ALTER TABLE [dw].[d_oivakoulutukset] DROP CONSTRAINT IF EXISTS [DF_d_oivakoulutukset_loadtime]
GO
/****** Object:  Table [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]    Script Date: 22.11.2021 14:24:36 ******/
DROP TABLE IF EXISTS [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]
GO
/****** Object:  Table [dw].[d_oivakoulutukset]    Script Date: 22.11.2021 14:24:36 ******/
DROP TABLE IF EXISTS [dw].[d_oivakoulutukset]
GO
/****** Object:  Table [dw].[d_oivakoulutukset]    Script Date: 22.11.2021 14:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivakoulutukset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_oivakoulutukset](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodisto] [varchar](255) NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_oivakoulutukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]    Script Date: 22.11.2021 14:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oivakoulutukset_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oivakoulutukset] ADD  CONSTRAINT [DF_d_oivakoulutukset_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oivakoulutukset_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oivakoulutukset] ADD  CONSTRAINT [DF_d_oivakoulutukset_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] ADD  CONSTRAINT [DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] ADD  CONSTRAINT [DF_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oivakoulutukset]    Script Date: 22.11.2021 14:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_oivakoulutukset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_oivakoulutukset] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_oivakoulutukset]
AS
IF (
		SELECT count(1)
		FROM dw.d_oivakoulutukset
		WHERE koodi = '-1'
		) = 0
BEGIN

	set identity_insert dw.d_oivakoulutukset on

	INSERT dw.d_oivakoulutukset (
		id
		,koodisto
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		nimi,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		'ööö',
		'etl: p_lataa_d_oivakoulutukset'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_oivakoulutukset off
END


ELSE 

	BEGIN

	UPDATE d SET
		koodisto = s.nimi,
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 'ööö',
		source = 'etl: p_lataa_d_oivakoulutukset'
	FROM dw.d_oivakoulutukset d
	join sa.sa_koodistot s on s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	
	END


MERGE dw.d_oivakoulutukset AS target
USING (
	SELECT 
		koodisto
		,koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys=lower(left(nimi,3))
		,'etl: p_lataa_d_oivakoulutukset' AS source
	FROM sa.sa_koodistot
	where koodisto IN ('ammatilliseentehtavaanvalmistavakoulutus','kuljettajakoulutus','oivatyovoimakoulutus','koulutus')
	and ((koodisto = 'koulutus' and koodi in ('999901','999902','999903')) or koodisto != 'koulutus')
	
) AS src
ON target.koodi = src.koodi and target.koodisto = src.koodisto

WHEN MATCHED
	THEN
		UPDATE
		SET  selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,jarjestys = src.jarjestys
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodisto
			,koodi
			,selite_fi
			,selite_sv
			,selite_en
			,jarjestys
			,source
			)
		VALUES (
			src.koodisto
			,src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.jarjestys
			,src.source
			);





GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]    Script Date: 22.11.2021 14:24:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat]
AS
IF (
		SELECT count(1)
		FROM dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat
		WHERE koodi = '-1'
		) = 0
BEGIN

	set identity_insert dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat on

	INSERT dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		'ööö',
		'etl: p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat off
END


ELSE 

	BEGIN

	UPDATE d SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 'ööö',
		source = 'etl: p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat'
	FROM dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat d
	join sa.sa_koodistot s on s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	
	END


MERGE dw.d_oivamuutoikeudetvelvollisuudetehdotjatehtavat AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys = lower(left(nimi,3))
		,'etl: p_lataa_d_oivamuutoikeudetvelvollisuudetehdotjatehtavat' AS source
	FROM sa.sa_koodistot
	where koodisto = 'oivamuutoikeudetvelvollisuudetehdotjatehtavat'
	
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,jarjestys = src.jarjestys
			,target.source = src.source
WHEN NOT MATCHED
	THEN
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
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.jarjestys
			,src.source
			);
