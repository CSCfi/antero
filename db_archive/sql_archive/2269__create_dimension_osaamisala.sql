USE [ANTERO]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_osaamisala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_osaamisala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](5) NOT NULL,
	[selite_fi] [nvarchar](200) NOT NULL,
	[selite_sv] [nvarchar](200) NULL,
	[selite_en] [nvarchar](200) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_osaamisala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_osaamisala__loadtime__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisala] ADD  CONSTRAINT [DF__d_osaamisala__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_osaamisala__username__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_osaamisala] ADD  CONSTRAINT [DF__d_osaamisala__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_osaamisala]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_osaamisala] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_osaamisala] AS

IF (
		SELECT count(1)
		FROM dw.d_osaamisala
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_osaamisala
	set identity_insert dw.d_osaamisala on
	INSERT dw.d_osaamisala (
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
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		'9999',
		source
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  
	set identity_insert dw.d_osaamisala off
END

ELSE 

BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = '9999',
		source = s.source
	  FROM dw.d_osaamisala d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
END


MERGE dw.d_osaamisala AS target

USING (

	SELECT distinct
		   koodi = osaamisala_koodi
		  ,selite_fi = nimi_fi
		  ,selite_sv = nimi_sv
		  ,selite_en = nimi_en
		  ,jarjestys = '1'
          ,source = 'Koski_SA.sa.sa_eperusteet_osaamisalat'
	  FROM [Koski_SA].[sa].[sa_eperusteet_osaamisalat]

) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
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
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.jarjestys
			,src.source
		);


