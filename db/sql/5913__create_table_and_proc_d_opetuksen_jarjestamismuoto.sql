USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opetuksen_jarjestamismuoto]    Script Date: 21.2.2022 20:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opetuksen_jarjestamismuoto]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_opetuksen_jarjestamismuoto](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_opetuksen_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opetuksen_jarjestamismuoto_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opetuksen_jarjestamismuoto] ADD  CONSTRAINT [DF_d_opetuksen_jarjestamismuoto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opetuksen_jarjestamismuoto_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opetuksen_jarjestamismuoto] ADD  CONSTRAINT [DF_d_opetuksen_jarjestamismuoto_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opetuksen_jarjestamismuoto]    Script Date: 21.2.2022 20:33:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_opetuksen_jarjestamismuoto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_opetuksen_jarjestamismuoto] AS' 
END
GO






ALTER PROCEDURE [dw].[p_lataa_d_opetuksen_jarjestamismuoto] AS


IF (SELECT count(1) FROM dw.d_opetuksen_jarjestamismuoto WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_opetuksen_jarjestamismuoto
		
	SET IDENTITY_INSERT dw.d_opetuksen_jarjestamismuoto ON

	INSERT dw.d_opetuksen_jarjestamismuoto (
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
		9,
		'etl: p_lataa_d_opetuksen_jarjestamismuoto'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_opetuksen_jarjestamismuoto OFF
END

ELSE BEGIN
	UPDATE d
		SET
			koodi = s.koodi,
			selite_fi = s.nimi,
			selite_sv = s.nimi_sv,
			selite_en = s.nimi_en,
			jarjestys = 99,
			loadtime = getdate(),
			username = suser_name(),
			source = 'etl: p_lataa_d_opetuksen_jarjestamismuoto'
		FROM dw.d_opetuksen_jarjestamismuoto d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


MERGE dw.d_opetuksen_jarjestamismuoto AS target
USING (
	SELECT 
		koodi
		,nimi
		,nimi_sv
		,nimi_en
		,jarjestys = koodi
		,'etl: p_lataa_d_opetuksen_jarjestamismuoto' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opetuksenjarjestamismuoto'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
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

