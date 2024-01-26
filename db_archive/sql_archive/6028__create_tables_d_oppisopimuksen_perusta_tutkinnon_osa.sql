USE [ANTERO]
GO
/****** Object:  Table [dw].[d_oppisopimuksen_perusta]    Script Date: 10.3.2022 9:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oppisopimuksen_perusta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_oppisopimuksen_perusta](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koodi] [int] NULL,
 CONSTRAINT [PK__d_oppisopimuksen_perusta__3213E83F19F4479D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_tutkinnon_osa]    Script Date: 10.3.2022 9:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_tutkinnon_osa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_tutkinnon_osa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](6) NOT NULL,
	[selite_fi] [nvarchar](250) NOT NULL,
	[selite_sv] [nvarchar](250) NOT NULL,
	[selite_en] [nvarchar](250) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_tutkinnon_osa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oppisopimuksen_perusta_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oppisopimuksen_perusta] ADD  CONSTRAINT [DF_d_oppisopimuksen_perusta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_oppisopimuksen_perusta_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oppisopimuksen_perusta] ADD  CONSTRAINT [DF_d_oppisopimuksen_perusta_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_osa__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_osa] ADD  CONSTRAINT [DF__d_tutkinnon_osa__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_tutkinnon_osa__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_tutkinnon_osa] ADD  CONSTRAINT [DF__d_tutkinnon_osa__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oppisopimuksen_perusta]    Script Date: 10.3.2022 9:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_oppisopimuksen_perusta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_oppisopimuksen_perusta] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_oppisopimuksen_perusta]
AS
IF (
		SELECT count(1)
		FROM dw.d_oppisopimuksen_perusta
		WHERE koodi = '-1'
		) = 0
	BEGIN

	  SET IDENTITY_INSERT dw.d_oppisopimuksen_perusta ON;
	  INSERT INTO dw.d_oppisopimuksen_perusta (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys_koodi
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_oppisopimuksen_perusta'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1';

	SET IDENTITY_INSERT dw.d_oppisopimuksen_perusta OFF;
	END
ELSE
	BEGIN
		UPDATE d
			SET
				koodi = s.koodi,
				selite_fi=s.nimi,
				selite_sv=s.nimi_sv,
				selite_en=s.nimi_en,
				jarjestys_koodi=9,
				loadtime =getdate(),
				username = suser_name(),
				source = 'etl: p_lataa_d_oppisopimuksen_perusta'
			FROM dw.d_oppisopimuksen_perusta d
			JOIN sa.sa_koodistot s ON s.koodi=d.koodi
			WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_oppisopimuksen_perusta AS target
USING (
	SELECT koodi
		,selite_fi = nimi
		,selite_sv = nimi_sv
		,selite_en = nimi_en
		,jarjestys_koodi = koodi
		,'etl: p_lataa_d_oppisopimuksen_perusta' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'oppisopimuksenperusta'
	) AS src
	ON target.koodi = src.koodi

WHEN MATCHED THEN
	UPDATE
	SET selite_fi = src.selite_fi
		,selite_sv = src.selite_sv
		,selite_en = src.selite_en
		,jarjestys_koodi = src.jarjestys_koodi
		,target.source = src.source
		,target.loadtime = GETDATE()
		,target.username = SUSER_NAME()

WHEN NOT MATCHED THEN
	INSERT (
		koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys_koodi
		,source
		)
	VALUES (

		src.koodi
		,src.selite_fi
		,src.selite_sv
		,src.selite_en
		,src.jarjestys_koodi
		,src.source
		);


IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_oppisopimuksen_perusta' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
    ALTER TABLE dw.d_oppisopimuksen_perusta ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
		END
END


GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_tutkinnon_osa]    Script Date: 10.3.2022 9:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_tutkinnon_osa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_tutkinnon_osa] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_tutkinnon_osa] AS

if not exists (select * from dw.d_tutkinnon_osa where id=-1) 
begin
	set identity_insert dw.d_tutkinnon_osa on;
	insert into dw.d_tutkinnon_osa (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		source
	)
	select
		-1,
		koodi,nimi,nimi_sv,nimi_en,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
	;
  set identity_insert dw.d_tutkinnon_osa off;

end 
else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		d.source = s.source
	from dw.d_tutkinnon_osa d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
end


MERGE dw.d_tutkinnon_osa AS target
USING (
	SELECT
		koodiarvo
		,nimi
		,nimi_sv
		,nimi_en
		,source --= 'ETL: p_lataa_d_tutkinnon_osa'
	FROM (
		SELECT 
			koodiarvo
			,COALESCE(nimi_fi, nimi_sv) AS nimi
			,COALESCE(nimi_sv, nimi_fi) AS nimi_sv
			,COALESCE(nimi_fi, nimi_sv) AS nimi_en
			,rnk = row_number() over (partition by koodiarvo order by (case when nimi_sv is null then 1 else 0 end))
			,source
		FROM Koski_SA.sa.sa_eperusteet_tutkinnonosat
		WHERE tila = 'valmis'
	) Q
	WHERE rnk = 1
) AS src
ON target.koodi = src.koodiarvo

WHEN MATCHED THEN
	UPDATE SET
		selite_fi = src.nimi,
		selite_sv = src.nimi_sv,
		selite_en = src.nimi_en,
		target.source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		source
	)
	VALUES (
		src.koodiarvo, src.nimi, src.nimi_sv, src.nimi_en,
		src.source
	)
;
  
--DELETE FROM dw.d_tutkinnon_osa where dw.d_tutkinnon_osa.tutkinnon_osa_koodi =3								
