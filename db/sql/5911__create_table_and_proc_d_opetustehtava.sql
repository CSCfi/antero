USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opetustehtava]    Script Date: 21.2.2022 20:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opetustehtava]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_opetustehtava](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[selite2_fi] [varchar](255) NULL,
	[selite2_sv] [varchar](255) NULL,
	[selite2_en] [varchar](255) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_opetustehtava] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opetustehtava_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opetustehtava] ADD  CONSTRAINT [DF_d_opetustehtava_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opetustehtava_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opetustehtava] ADD  CONSTRAINT [DF_d_opetustehtava_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opetustehtava]    Script Date: 21.2.2022 20:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_opetustehtava]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_opetustehtava] AS' 
END
GO





ALTER PROCEDURE [dw].[p_lataa_d_opetustehtava] AS


IF (SELECT count(1) FROM dw.d_opetustehtava WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_opetustehtava
		
	SET IDENTITY_INSERT dw.d_opetustehtava ON

	INSERT dw.d_opetustehtava (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,selite2_fi
		,selite2_sv
		,selite2_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_opetustehtava'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_opetustehtava OFF
END

ELSE BEGIN
	UPDATE d
		SET
			koodi = s.koodi,
			selite_fi = s.nimi,
			selite_sv = s.nimi_sv,
			selite_en = s.nimi_en,
			selite2_fi = s.nimi,
			selite2_sv = s.nimi_sv,
			selite2_en = s.nimi_en,
			jarjestys = 99,
			loadtime = getdate(),
			username = suser_name(),
			source = 'etl: p_lataa_d_opetustehtava'
		FROM dw.d_opetustehtava d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


MERGE dw.d_opetustehtava AS target
USING (
	SELECT 
		koodi
		,nimi
		,nimi_sv
		,nimi_en
		,nimi2 = 
			case
				when nimi = 'kaksivuotinen esiopetus (5- ja 6-vuotiaat)' then 'kaksivuotinen esiopetus (5- ja 6-vuotiaat) (kielikoulut)'
				when (nimi like '%kehitysvammaisille%' or nimi like '%kehitysvammaiset%') and (nimi like '%es-%' or nimi like '%perusopetus%') then 'esi- ja perusopetus pidennetyn oppivelvollisuuden oppilaille'
				when nimi in ('perusopetus muille kuin oppivelvollisille','Aikuisten perusopetus') then 'aikuisten perusopetus'
				when (nimi like '%kehitysvammaisille%' or nimi like '%kehitysvammaiset%') and nimi like '%lisäopetus%' then 'lisäopetus pidennetyn oppivelvollisuuden piirissä olleille oppilaille '
				when nimi = 'kaksivuotinen esikoulu' then 'kaksivuotinen esikoulu (Helsingin eurooppalainen koulu)'
				when nimi = 'alakoulu vuosiluokat 1–5' then 'alakoulu vuosiluokat 1–5  (Helsingin eurooppalainen koulu)'
				when nimi = 'yläkoululukio vuosiluokat 1–7' then 'yläkoululukio vuosiluokat 1–7  (Helsingin eurooppalainen koulu)'
				when nimi = 'erityisopetus' then null
				else nimi
			end
		,nimi2_sv = nimi_sv
		,nimi2_en = nimi_en
		,jarjestys = koodi
		,'etl: p_lataa_d_opetustehtava' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opetustehtava'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET 
			selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,selite2_fi = src.nimi2
			,selite2_sv = src.nimi2_sv
			,selite2_en = src.nimi2_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,selite2_fi
			,selite2_sv
			,selite2_en
			,jarjestys
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.nimi2
			,src.nimi2_sv
			,src.nimi2_en
			,src.jarjestys
			,src.source
			);


