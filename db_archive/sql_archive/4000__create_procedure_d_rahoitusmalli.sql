USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amk_rahoitusmalliala]    Script Date: 29.9.2020 13:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amk_rahoitusmalliala]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amk_rahoitusmalliala] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_amk_rahoitusmalliala] AS

TRUNCATE TABLE dw.d_amk_rahoitusmalliala

set identity_INSERT dw.d_amk_rahoitusmalliala on;

INSERT INTO dw.d_amk_rahoitusmalliala (id,alkaa,paattyy,koodi,selite_fi,selite_sv,selite_en,jarjestys,source)

SELECT
	-1
	,'1900'
	,'9999'
	,-1
	,nimi
	,nimi_sv
	,nimi_en
	,99
	,'ETL: p_lataa_d_amk_rahoitusmalliala'
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'

set identity_INSERT dw.d_amk_rahoitusmalliala off;

INSERT INTO dw.d_amk_rahoitusmalliala (alkaa,paattyy,koodi,selite_fi,selite_sv,selite_en,jarjestys,source)

SELECT distinct 
	alkaa = 2017
	,paattyy = 9999
	,Ammattikorkeakoulut_tutkintotavoitteet_koodi
	,RTRIM(Ammattikorkeakoulut_tutkintotavoitteet)
	,Ammattikorkeakoulut_tutkintotavoitteet_SV
	,Ammattikorkeakoulut_tutkintotavoitteet_EN
	,Ammattikorkeakoulut_tutkintotavoitteet_koodi
	,'ETL: p_lataa_d_amk_rahoitusmalliala'
FROM VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala
WHERE Ammattikorkeakoulut_tutkintotavoitteet_koodi not in (998,999)

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_rahoitusmalli_amk]    Script Date: 29.9.2020 13:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_rahoitusmalli_amk]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_rahoitusmalli_amk] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_rahoitusmalli_amk] AS


if not exists (select * from dw.d_rahoitusmalli_amk where id=-1) 

begin
	set identity_insert dw.d_rahoitusmalli_amk on;
	insert into dw.d_rahoitusmalli_amk (
		 [id]
		,[avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	)
	select
		-1
		,nimi
		,'1900'
		,'9999'
		,nimi
		,nimi
		,nimi
		,koodi
		,koodi
		,'99'
		,'99'
		,'99'
		,source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
	;
	set identity_insert dw.d_rahoitusmalli_amk off;
end 

else begin
	update d
	set
		 [avain] = s.nimi
		,[alkaa] = '1900'
		,[paattyy] = '9999'
		,[taso1_fi] = s.nimi
		,[taso2_fi] = s.nimi
		,[taso3_fi] = s.nimi
		,[tietojen_viive] = s.koodi
		,[rahoitusosuus] = s.koodi
		,[taso1_jarjestys] = '99'
		,[taso2_jarjestys] = '99'
		,[taso3_jarjestys] = '99'
		,d.source=s.source
	from dw.d_rahoitusmalli_amk d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1';
end

MERGE dw.d_rahoitusmalli_amk AS target
USING (
	SELECT
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source = 'etl: p_lataa_d_rahoitusmalli_amk'
	FROM sa.rahoitusmalli_amk
) AS src
ON target.avain = src.avain and target.alkaa = src.alkaa

WHEN MATCHED THEN
	UPDATE SET
		 [avain] = src.avain
		,[alkaa] = src.alkaa
		,[paattyy] = src.paattyy
		,[taso1_fi] = src.taso1_fi
		,[taso2_fi] = src.taso2_fi
		,[taso3_fi] = src.taso3_fi
		,[tietojen_viive] = src.tietojen_viive
		,[rahoitusosuus] = src.rahoitusosuus
		,[taso1_jarjestys] = src.taso1_jarjestys
		,[taso2_jarjestys] = src.taso2_jarjestys
		,[taso3_jarjestys] = src.taso3_jarjestys
		,target.source = src.source

WHEN NOT MATCHED BY SOURCE THEN DELETE

WHEN NOT MATCHED BY TARGET THEN
	INSERT (
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	)
	 VALUES (
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	);
  




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_rahoitusmalli_yo]    Script Date: 29.9.2020 13:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_rahoitusmalli_yo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_rahoitusmalli_yo] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_rahoitusmalli_yo] AS


if not exists (select * from dw.d_rahoitusmalli_yo where id=-1) 

begin
	set identity_insert dw.d_rahoitusmalli_yo on;
	insert into dw.d_rahoitusmalli_yo (
		 [id]
		,[avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	)
	select
		-1
		,nimi
		,'1900'
		,'9999'
		,nimi
		,nimi
		,nimi
		,koodi
		,koodi
		,'99'
		,'99'
		,'99'
		,source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
	;
	set identity_insert dw.d_rahoitusmalli_yo off;
end 

else begin
	update d
	set
		 [avain] = s.nimi
		,[alkaa] = '1900'
		,[paattyy] = '9999'
		,[taso1_fi] = s.nimi
		,[taso2_fi] = s.nimi
		,[taso3_fi] = s.nimi
		,[tietojen_viive] = s.koodi
		,[rahoitusosuus] = s.koodi
		,[taso1_jarjestys] = '99'
		,[taso2_jarjestys] = '99'
		,[taso3_jarjestys] = '99'
		,d.source=s.source
	from dw.d_rahoitusmalli_yo d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1';
end

MERGE dw.d_rahoitusmalli_yo AS target
USING (
	SELECT
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source = 'etl: p_lataa_d_rahoitusmalli_yo'
	FROM sa.rahoitusmalli_yo
) AS src
ON target.avain = src.avain and target.alkaa = src.alkaa

WHEN MATCHED THEN
	UPDATE SET
		 [avain] = src.avain
		,[alkaa] = src.alkaa
		,[paattyy] = src.paattyy
		,[taso1_fi] = src.taso1_fi
		,[taso2_fi] = src.taso2_fi
		,[taso3_fi] = src.taso3_fi
		,[tietojen_viive] = src.tietojen_viive
		,[rahoitusosuus] = src.rahoitusosuus
		,[taso1_jarjestys] = src.taso1_jarjestys
		,[taso2_jarjestys] = src.taso2_jarjestys
		,[taso3_jarjestys] = src.taso3_jarjestys
		,target.source = src.source

WHEN NOT MATCHED BY SOURCE THEN DELETE

WHEN NOT MATCHED BY TARGET THEN
	INSERT (
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	)
	 VALUES (
		 [avain]
		,[alkaa]
		,[paattyy]
		,[taso1_fi]
		,[taso2_fi]
		,[taso3_fi]
		,[tietojen_viive]
		,[rahoitusosuus]
		,[taso1_jarjestys]
		,[taso2_jarjestys]
		,[taso3_jarjestys]
		,source
	);
  




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_yo_rahoitusmalliala]    Script Date: 29.9.2020 13:31:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_yo_rahoitusmalliala]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_yo_rahoitusmalliala] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_yo_rahoitusmalliala] AS

TRUNCATE TABLE dw.d_yo_rahoitusmalliala

set identity_INSERT dw.d_yo_rahoitusmalliala on;

INSERT INTO dw.d_yo_rahoitusmalliala (id,alkaa,paattyy,koodi,selite_fi,selite_sv,selite_en,jarjestys,source)

SELECT
	-1
	,'1900'
	,'9999'
	,-1
	,nimi
	,nimi_sv
	,nimi_en
	,99
	,'ETL: p_lataa_d_yo_rahoitusmalliala'
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'

set identity_INSERT dw.d_yo_rahoitusmalliala off;

INSERT INTO dw.d_yo_rahoitusmalliala (alkaa,paattyy,koodi,selite_fi,selite_sv,selite_en,jarjestys,source)

SELECT distinct 
	alkaa = 2017
	,paattyy = 2020
	,koodi = Yliopistot_tutkintotavoitteet_koodi
	,selite_fi = RTRIM(Yliopistot_tutkintotavoitteet)
	,selite_sv = Yliopistot_tutkintotavoitteet_SV
	,selite_en = Yliopistot_tutkintotavoitteet_EN
	,jarjestys = Yliopistot_tutkintotavoitteet_koodi
	,'ETL: p_lataa_d_yo_rahoitusmalliala'
FROM VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala
WHERE Ammattikorkeakoulut_tutkintotavoitteet_koodi not in (998,999)

UNION ALL

SELECT distinct 
	alkaa = 2021
	,paattyy = 9999
	,Yliopistot_tutkintotavoitteet2021_koodi
	,RTRIM(Yliopistot_tutkintotavoitteet2021)
	,Yliopistot_tutkintotavoitteet2021_SV
	,Yliopistot_tutkintotavoitteet2021_EN
	,Yliopistot_tutkintotavoitteet2021_koodi
	,'ETL: p_lataa_d_yo_rahoitusmalliala'
FROM VipunenTK_lisatiedot.dbo.isced_suomi_ohjauksenala
WHERE Ammattikorkeakoulut_tutkintotavoitteet_koodi not in (998,999)
