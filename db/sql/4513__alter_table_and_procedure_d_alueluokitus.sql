USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_alueluokitus]    Script Date: 26.3.2021 15:37:47 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_alueluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_alueluokitus] DROP CONSTRAINT IF EXISTS [DF__d_alueluokitus__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_alueluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_alueluokitus] DROP CONSTRAINT IF EXISTS [DF__d_alueluokitus__loadtime]
GO
/****** Object:  Table [dw].[d_alueluokitus]    Script Date: 26.3.2021 15:37:47 ******/
DROP TABLE IF EXISTS [dw].[d_alueluokitus]
GO
/****** Object:  Table [dw].[d_alueluokitus]    Script Date: 26.3.2021 15:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_alueluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_alueluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[alueluokitus_avain] [varchar](50) NOT NULL,
	[kunta_koodi] [varchar](3) NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[voimassa] [int] NULL,
	[kunta_fi] [nvarchar](200) NOT NULL,
	[kunta_sv] [nvarchar](200) NOT NULL,
	[kunta_en] [nvarchar](200) NOT NULL,
	[maakunta_koodi] [varchar](2) NULL,
	[maakunta_fi] [nvarchar](200) NULL,
	[maakunta_sv] [nvarchar](200) NULL,
	[maakunta_en] [nvarchar](200) NULL,
	[avi_koodi] [varchar](2) NULL,
	[avi_fi] [nvarchar](60) NULL,
	[avi_sv] [nvarchar](60) NULL,
	[avi_en] [nvarchar](60) NULL,
	[ely_koodi] [varchar](2) NULL,
	[ely_fi] [nvarchar](60) NULL,
	[ely_sv] [nvarchar](60) NULL,
	[ely_en] [nvarchar](60) NULL,
	[kielisuhde_koodi] [varchar](5) NULL,
	[kielisuhde_fi] [nvarchar](60) NULL,
	[kielisuhde_sv] [nvarchar](60) NULL,
	[kielisuhde_en] [nvarchar](60) NULL,
	[seutukunta_koodi] [varchar](5) NULL,
	[seutukunta_fi] [nvarchar](60) NULL,
	[seutukunta_sv] [nvarchar](60) NULL,
	[seutukunta_en] [nvarchar](60) NULL,
	[kuntaryhma_koodi] [varchar](5) NULL,
	[kuntaryhma_fi] [nvarchar](60) NULL,
	[kuntaryhma_sv] [nvarchar](60) NULL,
	[kuntaryhma_en] [nvarchar](60) NULL,
	[vanha_kunta_fi] [nvarchar](200) NULL,
	[vanha_kunta_sv] [nvarchar](200) NULL,
	[vanha_kunta_en] [nvarchar](200) NULL,
	[jarjestys_kunta_koodi]  AS (case when [kunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kunta_koodi]) end),
	[jarjestys_avi_koodi]  AS (case when [avi_koodi]=(-1) then '99999' else CONVERT([varchar](10),[avi_koodi]) end),
	[jarjestys_ely_koodi]  AS (case when [ely_koodi]=(-1) then '99999' else CONVERT([varchar](10),[ely_koodi]) end),
	[jarjestys_kielisuhde_koodi]  AS (case when [kielisuhde_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kielisuhde_koodi]) end),
	[jarjestys_kuntaryhma_koodi]  AS (case when [kuntaryhma_koodi]=(-1) then '99999' else CONVERT([varchar](10),[kuntaryhma_koodi]) end),
	[jarjestys_maakunta_koodi]  AS (case when [maakunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[maakunta_koodi]) end),
	[jarjestys_seutukunta_koodi]  AS (case when [seutukunta_koodi]=(-1) then '99999' else CONVERT([varchar](10),[seutukunta_koodi]) end),
 CONSTRAINT [PK__d_alueluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_alueluokitus__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_alueluokitus__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_alueluokitus] ADD  CONSTRAINT [DF__d_alueluokitus__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_alueluokitus]    Script Date: 26.3.2021 15:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_alueluokitus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_alueluokitus] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_alueluokitus] AS

if not exists (select * from dw.d_alueluokitus where id='-1') 
begin
	set identity_insert dw.d_alueluokitus on;

	insert into dw.d_alueluokitus (
		id,alueluokitus_avain,
		kunta_koodi,alkupvm,loppupvm,voimassa,
		kunta_fi,kunta_sv,kunta_en,
		maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
		avi_koodi,avi_fi,avi_sv,avi_en,
		ely_koodi,ely_fi,ely_sv,ely_en,
		kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
		seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
		kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
		vanha_kunta_fi,vanha_kunta_sv,vanha_kunta_en,
		source
	)
	select
		-1,koodi,
		koodi,'1900-01-01','9999-12-31',1,
		nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		nimi,nimi_sv,nimi_en,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta' and koodi='-1';
	
	set identity_insert dw.d_alueluokitus off;
end 

else begin
	update d set 
		alueluokitus_avain=s.koodi,
		kunta_koodi=s.koodi, alkupvm='1900-01-01', loppupvm='9999-12-31', voimassa=1,
		kunta_fi=s.nimi, kunta_sv=s.nimi_sv, kunta_en=s.nimi_en,
		maakunta_koodi=s.koodi, maakunta_fi=s.nimi, maakunta_sv=s.nimi_sv, maakunta_en=s.nimi_en,
		avi_koodi=s.koodi, avi_fi=s.nimi, avi_sv=s.nimi_sv, avi_en=s.nimi_en,
		ely_koodi=s.koodi, ely_fi=s.nimi, ely_sv=s.nimi_sv, ely_en=s.nimi_en,
		kielisuhde_koodi=s.koodi, kielisuhde_fi=s.nimi, kielisuhde_sv=s.nimi_sv, kielisuhde_en=s.nimi_en,
		seutukunta_koodi=s.koodi, seutukunta_fi=s.nimi, seutukunta_sv=s.nimi_sv, seutukunta_en=s.nimi_en,
		kuntaryhma_koodi=s.koodi, kuntaryhma_fi=s.nimi, kuntaryhma_sv=s.nimi_sv, kuntaryhma_en=s.nimi_en,
		vanha_kunta_fi=s.nimi,vanha_kunta_sv=s.nimi_sv,vanha_kunta_en=s.nimi_en,
		source=s.source
	from dw.d_alueluokitus d
	join sa.sa_koodistot s on s.koodi=d.alueluokitus_avain
	where s.koodisto='vipunenmeta' and s.koodi='-1';
end


MERGE dw.d_alueluokitus AS target
USING (
  SELECT DISTINCT
    'kunta_'+koodi AS avain,
    koodi,
	alkupvm,
	loppupvm,
	CASE WHEN loppupvm is null or loppupvm > getdate() then 1 else 0 end AS voimassa,
    COALESCE(tk.kunta, nimi, nimi_sv, nimi_en) AS nimi,
    COALESCE(tk.kunta_sv, tk.kunta, nimi_sv, nimi, nimi_en) AS nimi_sv,
    COALESCE(tk.kunta_en, tk.kunta, nimi_en, nimi, nimi_sv) AS nimi_en,
    maakuntakoodi,
    COALESCE(maakuntanimi, maakuntanimi_sv, maakuntanimi_en) AS maakuntanimi,
    COALESCE(maakuntanimi_sv, maakuntanimi, maakuntanimi_en) AS maakuntanimi_sv,
    COALESCE(maakuntanimi_en, maakuntanimi, maakuntanimi_sv) AS maakuntanimi_en,
    avikoodi,
    COALESCE(avinimi, avinimi_sv, avinimi_en) AS avinimi,
    COALESCE(avinimi_sv, avinimi, avinimi_en) AS avinimi_sv,
    COALESCE(avinimi_en, avinimi, avinimi_sv) AS avinimi_en,
    elykoodi,
    COALESCE(elynimi, elynimi_sv, elynimi_en) AS elynimi,
    COALESCE(elynimi_sv, elynimi, elynimi_en) AS elynimi_sv,
    COALESCE(elynimi_en, elynimi, elynimi_sv) AS elynimi_en,
    kielisuhdekoodi,
    COALESCE(kielisuhdenimi, kielisuhdenimi_sv, kielisuhdenimi_en) AS kielisuhdenimi,
    COALESCE(kielisuhdenimi_sv, kielisuhdenimi, kielisuhdenimi_en) AS kielisuhdenimi_sv,
    COALESCE(kielisuhdenimi_en, kielisuhdenimi, kielisuhdenimi_sv) AS kielisuhdenimi_en,
    seutukuntakoodi,
    COALESCE(seutukuntanimi, seutukuntanimi_sv, seutukuntanimi_en) AS seutukuntanimi,
    COALESCE(seutukuntanimi_sv, seutukuntanimi, seutukuntanimi_en) AS seutukuntanimi_sv,
    COALESCE(seutukuntanimi_en, seutukuntanimi, seutukuntanimi_sv) AS seutukuntanimi_en,
    kuntaryhmakoodi,
    COALESCE(kuntaryhmanimi, kuntaryhmanimi_sv, kuntaryhmanimi_en) AS kuntaryhmanimi,
    COALESCE(kuntaryhmanimi_sv, kuntaryhmanimi, kuntaryhmanimi_en) AS kuntaryhmanimi_sv,
    COALESCE(kuntaryhmanimi_en, kuntaryhmanimi, kuntaryhmanimi_sv) AS kuntaryhmanimi_en,
	COALESCE(nimi, nimi_sv, nimi_en) AS vanha_nimi,
    COALESCE(nimi_sv, nimi, nimi_en) AS vanha_nimi_sv,
    COALESCE(nimi_en, nimi, nimi_sv) AS vanha_nimi_en,
    source
  FROM sa.sa_alueluokitus sa
  LEFT JOIN VipunenTK.dbo.d_alueluokitus tk on tk.alueluokitus_avain=sa.koodi
) AS src ON target.alueluokitus_avain = src.avain

WHEN MATCHED THEN
  UPDATE SET
	alkupvm=src.alkupvm, loppupvm=src.loppupvm, voimassa=src.voimassa,
    kunta_fi=src.nimi, kunta_sv=src.nimi_sv, kunta_en=src.nimi_en,
    maakunta_koodi=src.maakuntakoodi, maakunta_fi=src.maakuntanimi, maakunta_sv=src.maakuntanimi_sv, maakunta_en=src.maakuntanimi_en,
    avi_koodi=src.avikoodi, avi_fi=src.avinimi, avi_sv=src.avinimi_sv, avi_en=src.avinimi_en,
    ely_koodi=src.elykoodi, ely_fi=src.elynimi, ely_sv=src.elynimi_sv, ely_en=src.elynimi_en,
    kielisuhde_koodi=src.kielisuhdekoodi, kielisuhde_fi=src.kielisuhdenimi, kielisuhde_sv=src.kielisuhdenimi_sv, kielisuhde_en=src.kielisuhdenimi_en,
    seutukunta_koodi=src.seutukuntakoodi, seutukunta_fi=src.seutukuntanimi, seutukunta_sv=src.seutukuntanimi_sv, seutukunta_en=src.seutukuntanimi_en,
    kuntaryhma_koodi=src.kuntaryhmakoodi, kuntaryhma_fi=src.kuntaryhmanimi, kuntaryhma_sv=src.kuntaryhmanimi_sv, kuntaryhma_en=src.kuntaryhmanimi_en,
	vanha_kunta_fi=src.vanha_nimi,vanha_kunta_sv=src.vanha_nimi_sv,vanha_kunta_en=src.vanha_nimi_en,
    target.source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		alueluokitus_avain,
		kunta_koodi,alkupvm,loppupvm,voimassa,
		kunta_fi,kunta_sv,kunta_en,
		maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
		avi_koodi,avi_fi,avi_sv,avi_en,
		ely_koodi,ely_fi,ely_sv,ely_en,
		kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
		seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
		kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
		vanha_kunta_fi,vanha_kunta_sv,vanha_kunta_en,
		source
	)
	VALUES (
		src.avain,
		src.koodi, src.alkupvm, src.loppupvm, src.voimassa,
		src.nimi, src.nimi_sv, src.nimi_en,
		src.maakuntakoodi, src.maakuntanimi, src.maakuntanimi_sv, src.maakuntanimi_en,
		src.avikoodi, src.avinimi, src.avinimi_sv, src.avinimi_en,
		src.elykoodi, src.elynimi, src.elynimi_sv, src.elynimi_en,
		src.kielisuhdekoodi, src.kielisuhdenimi, src.kielisuhdenimi_sv, src.kielisuhdenimi_en,
		src.seutukuntakoodi, src.seutukuntanimi, src.seutukuntanimi_sv, src.seutukuntanimi_en,
		src.kuntaryhmakoodi, src.kuntaryhmanimi, src.kuntaryhmanimi_sv, src.kuntaryhmanimi_en,
		src.vanha_nimi, src.vanha_nimi_sv, src.vanha_nimi_en,
		src.source
	);

IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kunta_koodi')

BEGIN
  	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kunta_koodi AS case when kunta_koodi = -1 then '99999' else cast(kunta_koodi as varchar(10))
    END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_avi_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_avi_koodi AS case when avi_koodi = -1 then '99999' else cast(avi_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_ely_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_ely_koodi AS case when ely_koodi = -1 then '99999' else cast(ely_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kielisuhde_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kielisuhde_koodi AS case when kielisuhde_koodi = -1 then '99999' else cast(kielisuhde_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kuntaryhma_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kuntaryhma_koodi AS case when kuntaryhma_koodi = -1 then '99999' else cast(kuntaryhma_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_maakunta_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_maakunta_koodi AS case when maakunta_koodi = -1 then '99999' else cast(maakunta_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_seutukunta_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_seutukunta_koodi AS case when seutukunta_koodi = -1 then '99999' else cast(seutukunta_koodi as varchar(10))
	END
END;
