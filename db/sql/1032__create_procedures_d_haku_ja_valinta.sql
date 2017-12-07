USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_haku]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_haku]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_haku] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_haku]
AS
IF (
		SELECT count(1)
		FROM dw.d_haku
		WHERE haku_oid = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_haku
	set identity_insert dw.d_haku on
	INSERT dw.d_haku (
		id
		,haku_oid
		,haun_nimi_fi
		,haun_nimi_sv
		,haun_nimi_en
		,hakutyyppi_koodi
		,hakutyyppi_fi
		,hakutyyppi_sv
		,hakutyyppi_en
		,hakutapa_koodi
		,hakutapa_fi
		,hakutapa_sv
		,hakutapa_en
		,hakuryhma_koodi
		,hakuryhma_fi
		,hakuryhma_sv
		,hakuryhma_en
		,kohdejoukontarkenne_koodi
		,kohdejoukontarkenne_fi
		,kohdejoukontarkenne_sv
		,kohdejoukontarkenne_en
		,korkeakouluhaku
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'etl: p_lataa_d_haku'
		)
	set identity_insert dw.d_haku off
END


MERGE dw.d_haku AS target
USING (
	SELECT 
	oid as haku_oid
	,kh.nimi as haun_nimi_fi
	,kh.nimi_sv as haun_nimi_sv
	,kh.nimi_en as haun_nimi_en
	,k3.koodi as hakutyyppi_koodi
	,k3.nimi as hakutyyppi_fi
	,k3.nimi_sv as hakutyyppi_sv
	,k3.nimi_en as hakutyyppi_en
	,k4.koodi as hakutapa_koodi
	,k4.nimi as hakutapa_fi
	,k4.nimi_sv as hakutapa_sv
	,k4.nimi_en as hakutapa_en
	,k5.koodi as kohdejoukontarkenne_koodi
	,k5.nimi as kohdejoukontarkenne_fi
	,k5.nimi_sv as kohdejoukontarkenne_sv
	,k5.nimi_en as kohdejoukontarkenne_en
	,korkeakouluHaku as korkeakouluhaku
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then '1'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then '2'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' then '3'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then '4'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then '5'
		else '9'
	end as hakuryhma_koodi
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Ammatillisen koulutuksen ja lukiokoulutuksen yhteishaku'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Perusopetuksen jälkeisen valmistavan koulutuksen haku'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' then 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Korkeakoulujen yhteishaku'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Erillishaku'
		else 'Muu'
	end as hakuryhma_fi
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Gemensam ansökan till yrkes- och gymnasieutbildning'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Ansökan till förberedande utbildningar efter grundskolan'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' then 'Ansökan till yrkesinriktad utbildning som anordnas som specialundervisning'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Högskolornas gemensamma ansökan'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separata antagningar'
		else 'Annan'
	end as hakuryhma_sv
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Application to vocational or general upper secondary education in the joint application system'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Application to preparatory education for upper secondary vocational education and training'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' then 'Application to vocational special needs education and training'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Joint application to higher education '
		when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separate application'
		else 'Other'
	end as hakuryhma_en
	,'etl: p_lataa_d_haku' AS source
	FROM sa.koulutustarjonta_haku kh
left join sa.sa_koodistot k3 on k3.koodi=substring(kh.hakutyyppiUri,CHARINDEX('_',kh.hakutyyppiUri)+1,2) and k3.koodisto='hakutyyppi'
left join sa.sa_koodistot k4 on k4.koodi=substring(kh.hakutapaUri,CHARINDEX('_',kh.hakutapaUri)+1,2) and k4.koodisto='hakutapa'
left join sa.sa_koodistot k5 on k5.koodi=substring(kh.kohdejoukonTarkenne,CHARINDEX('_',kh.kohdejoukonTarkenne)+1,1) and k5.koodisto='haunkohdejoukontarkenne'
where kh.tila = 'JULKAISTU' or (kh.tila = 'VALMIS' and k5.nimi='Jatkotutkintohaku')
	) AS src
ON target.haku_oid = src.haku_oid --and target.hakutyyppi_koodi = src.hakutyyppi_koodi and target.hakutapa_koodi = src.hakutapa_koodi and target.kohdejoukontarkenne_koodi = src.kohdejoukontarkenne_koodi and target.korkeakouluhaku = src.korkeakouluhaku
WHEN MATCHED
	THEN
		UPDATE SET 
			haun_nimi_fi = src.haun_nimi_fi
			,haun_nimi_sv = src.haun_nimi_sv
			,haun_nimi_en = src.haun_nimi_en
			,hakutyyppi_koodi = src.hakutyyppi_koodi
			,hakutyyppi_fi = src.hakutyyppi_fi
			,hakutyyppi_sv = src.hakutyyppi_sv
			,hakutyyppi_en = src.hakutyyppi_en
			,hakutapa_koodi = src.hakutapa_koodi
			,hakutapa_fi = src.hakutapa_fi
			,hakutapa_sv = src.hakutapa_sv
			,hakutapa_en = src.hakutapa_en
			,hakuryhma_koodi = src.hakuryhma_koodi
			,hakuryhma_fi = src.hakuryhma_fi
			,hakuryhma_sv = src.hakuryhma_sv
			,hakuryhma_en = src.hakuryhma_en
			,kohdejoukontarkenne_koodi = src.kohdejoukontarkenne_koodi
			,kohdejoukontarkenne_fi = src.kohdejoukontarkenne_fi
			,kohdejoukontarkenne_sv = src.kohdejoukontarkenne_sv
			,kohdejoukontarkenne_en = src.kohdejoukontarkenne_en
			,korkeakouluhaku = src.korkeakouluhaku
	,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			haku_oid
			,haun_nimi_fi
			,haun_nimi_sv
			,haun_nimi_en
			,hakutyyppi_koodi
			,hakutyyppi_fi 
			,hakutyyppi_sv
			,hakutyyppi_en 
			,hakutapa_koodi 
			,hakutapa_fi  
			,hakutapa_sv 
			,hakutapa_en
			,hakuryhma_koodi
			,hakuryhma_fi
			,hakuryhma_sv
			,hakuryhma_en
			,kohdejoukontarkenne_koodi
			,kohdejoukontarkenne_fi  
			,kohdejoukontarkenne_sv  
			,kohdejoukontarkenne_en  
			,korkeakouluhaku  
			,source
			)
		VALUES (
			src.haku_oid
			,src.haun_nimi_fi
			,src.haun_nimi_sv
			,src.haun_nimi_en
			,src.hakutyyppi_koodi
			,src.hakutyyppi_fi
			,src.hakutyyppi_sv
			,src.hakutyyppi_en
			,src.hakutapa_koodi
			,src.hakutapa_fi
			,src.hakutapa_sv
			,src.hakutapa_en
			,src.hakuryhma_koodi
			,src.hakuryhma_fi
			,src.hakuryhma_sv
			,src.hakuryhma_en
			,src.kohdejoukontarkenne_koodi
			,src.kohdejoukontarkenne_fi
			,src.kohdejoukontarkenne_sv
			,src.kohdejoukontarkenne_en
			,src.korkeakouluhaku
			,src.source
			);



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_hakuaika]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_hakuaika]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_hakuaika] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_hakuaika]
AS
IF (
		SELECT count(1)
		FROM dw.d_hakuaika
		WHERE hakuaikaId = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_hakuaika
	set identity_insert dw.d_hakuaika on
	INSERT dw.d_hakuaika (
		id
		,hakuaikaId
		,selite_fi
		,selite_sv
		,selite_en
		,haku_oid
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'-1'
		,N'etl: p_lataa_d_hakuaika'
		)
	set identity_insert dw.d_hakuaika off
END

MERGE dw.d_hakuaika AS target
USING (
	SELECT hakuaikaId
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
		,hakuOid as haku_oid
		,tila
		,'etl: p_lataa_d_hakuaika' AS source
	FROM sa.sa_hakuajat
	) AS src
	ON target.hakuaikaId = src.hakuaikaId

WHEN MATCHED AND src.tila = 'JULKAISTU'
	THEN
		UPDATE
		SET selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,haku_oid = src.haku_oid
			,target.source = src.source

WHEN MATCHED AND src.tila <> 'JULKAISTU'
	THEN
		DELETE
	
WHEN NOT MATCHED AND src.tila = 'JULKAISTU'
	THEN
		INSERT (
			hakuaikaId
			,selite_fi
			,selite_sv
			,selite_en
			,haku_oid
			,source
			)
		VALUES (
			src.hakuaikaId
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.haku_oid
			,src.source
			);




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_hakukohde]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_hakukohde]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_hakukohde] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_hakukohde]
AS
IF (
		SELECT count(1)
		FROM dw.d_hakukohde
		WHERE oid = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_hakukohde
	set identity_insert dw.d_hakukohde on
	INSERT dw.d_hakukohde (
		id
		,oid
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_hakukohde'
		)
	set identity_insert dw.d_hakukohde off
END

MERGE dw.d_hakukohde AS target
USING (
	SELECT hakukohdeOid
		,coalesce(nimi_fi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi_fi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi_fi,nimi_sv) as nimi_en
		,tila
		,'etl: p_lataa_d_hakukohde' AS source
	FROM sa.sa_hakukohteet
	) AS src
	ON target.oid = src.hakukohdeOid

WHEN MATCHED AND src.tila = 'JULKAISTU'
	THEN
		UPDATE
		SET selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,target.source = src.source

WHEN MATCHED AND src.tila <> 'JULKAISTU'
	THEN
		DELETE
	
WHEN NOT MATCHED AND src.tila = 'JULKAISTU'
	THEN
		INSERT (
			oid
			,selite_fi
			,selite_sv
			,selite_en
			,source
			)
		VALUES (
			src.hakukohdeOid
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_ika]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_ika]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_ika] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_ika] AS

TRUNCATE TABLE dw.d_ika

SET IDENTITY_INSERT dw.d_ika ON
INSERT dw.d_ika (id, ika_avain, ika_fi, ika_sv, ika_en,  jarjestys_ika, source)

VALUES 
(-1,-1,-1,-1,-1,-1,'manuaalinen'),
(1,1,1,1,1,1,'manuaalinen'),
(2,2,2,2,2,2,'manuaalinen'),
(3,3,3,3,3,3,'manuaalinen'),
(4,4,4,4,4,4,'manuaalinen'),
(5,5,5,5,5,5,'manuaalinen'),
(6,6,6,6,6,6,'manuaalinen'),
(7,7,7,7,7,7,'manuaalinen'),
(8,8,8,8,8,8,'manuaalinen'),
(9,9,9,9,9,9,'manuaalinen'),
(10,10,10,10,10,10,'manuaalinen'),
(11,11,11,11,11,11,'manuaalinen'),
(12,12,12,12,12,12,'manuaalinen'),
(13,13,13,13,13,13,'manuaalinen'),
(14,14,14,14,14,14,'manuaalinen'),
(15,15,15,15,15,15,'manuaalinen'),
(16,16,16,16,16,16,'manuaalinen'),
(17,17,17,17,17,17,'manuaalinen'),
(18,18,18,18,18,18,'manuaalinen'),
(19,19,19,19,19,19,'manuaalinen'),
(20,20,20,20,20,20,'manuaalinen'),
(21,21,21,21,21,21,'manuaalinen'),
(22,22,22,22,22,22,'manuaalinen'),
(23,23,23,23,23,23,'manuaalinen'),
(24,24,24,24,24,24,'manuaalinen'),
(25,25,25,25,25,25,'manuaalinen'),
(26,26,26,26,26,26,'manuaalinen'),
(27,27,27,27,27,27,'manuaalinen'),
(28,28,28,28,28,28,'manuaalinen'),
(29,29,29,29,29,29,'manuaalinen'),
(30,30,30,30,30,30,'manuaalinen'),
(31,31,31,31,31,31,'manuaalinen'),
(32,32,32,32,32,32,'manuaalinen'),
(33,33,33,33,33,33,'manuaalinen'),
(34,34,34,34,34,34,'manuaalinen'),
(35,35,35,35,35,35,'manuaalinen'),
(36,36,36,36,36,36,'manuaalinen'),
(37,37,37,37,37,37,'manuaalinen'),
(38,38,38,38,38,38,'manuaalinen'),
(39,39,39,39,39,39,'manuaalinen'),
(40,40,40,40,40,40,'manuaalinen'),
(41,41,41,41,41,41,'manuaalinen'),
(42,42,42,42,42,42,'manuaalinen'),
(43,43,43,43,43,43,'manuaalinen'),
(44,44,44,44,44,44,'manuaalinen'),
(45,45,45,45,45,45,'manuaalinen'),
(46,46,46,46,46,46,'manuaalinen'),
(47,47,47,47,47,47,'manuaalinen'),
(48,48,48,48,48,48,'manuaalinen'),
(49,49,49,49,49,49,'manuaalinen'),
(50,50,50,50,50,50,'manuaalinen'),
(51,51,51,51,51,51,'manuaalinen'),
(52,52,52,52,52,52,'manuaalinen'),
(53,53,53,53,53,53,'manuaalinen'),
(54,54,54,54,54,54,'manuaalinen'),
(55,55,55,55,55,55,'manuaalinen'),
(56,56,56,56,56,56,'manuaalinen'),
(57,57,57,57,57,57,'manuaalinen'),
(58,58,58,58,58,58,'manuaalinen'),
(59,59,59,59,59,59,'manuaalinen'),
(60,60,60,60,60,60,'manuaalinen'),
(61,61,61,61,61,61,'manuaalinen'),
(62,62,62,62,62,62,'manuaalinen'),
(63,63,63,63,63,63,'manuaalinen'),
(64,64,64,64,64,64,'manuaalinen'),
(65,65,65,65,65,65,'manuaalinen'),
(66,66,66,66,66,66,'manuaalinen'),
(67,67,67,67,67,67,'manuaalinen'),
(68,68,68,68,68,68,'manuaalinen'),
(69,69,69,69,69,69,'manuaalinen'),
(70,70,70,70,70,70,'manuaalinen'),
(71,71,71,71,71,71,'manuaalinen'),
(72,72,72,72,72,72,'manuaalinen'),
(73,73,73,73,73,73,'manuaalinen'),
(74,74,74,74,74,74,'manuaalinen'),
(75,75,75,75,75,75,'manuaalinen'),
(76,76,76,76,76,76,'manuaalinen'),
(77,77,77,77,77,77,'manuaalinen'),
(78,78,78,78,78,78,'manuaalinen'),
(79,79,79,79,79,79,'manuaalinen'),
(80,80,80,80,80,80,'manuaalinen'),
(81,81,81,81,81,81,'manuaalinen'),
(82,82,82,82,82,82,'manuaalinen'),
(83,83,83,83,83,83,'manuaalinen'),
(84,84,84,84,84,84,'manuaalinen'),
(85,85,85,85,85,85,'manuaalinen'),
(86,86,86,86,86,86,'manuaalinen'),
(87,87,87,87,87,87,'manuaalinen'),
(88,88,88,88,88,88,'manuaalinen'),
(89,89,89,89,89,89,'manuaalinen'),
(90,90,90,90,90,90,'manuaalinen'),
(91,91,91,91,91,91,'manuaalinen'),
(92,92,92,92,92,92,'manuaalinen'),
(93,93,93,93,93,93,'manuaalinen'),
(94,94,94,94,94,94,'manuaalinen'),
(95,95,95,95,95,95,'manuaalinen'),
(96,96,96,96,96,96,'manuaalinen'),
(97,97,97,97,97,97,'manuaalinen'),
(98,98,98,98,98,98,'manuaalinen'),
(99,99,99,99,99,99,'manuaalinen'),
(100,100,100,100,100,100,'manuaalinen')

UPDATE dw.d_ika 
SET 
ikaryhma1_fi = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14–vuotiaat ja sitä nuoremmat'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34-vuotiaat'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44-vuotiaat'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54-vuotiaat'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59-vuotiaat'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64-vuotiaat'
		when ika_avain >= 65 then '65–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma1_sv = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14 år eller yngre'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29 år'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34 år'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39 år'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44 år'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49 år'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54 år'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59 år'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64 år'
		when ika_avain >= 65 then '65 år eller äldre'
		else 'Information saknas'
	END
,ikaryhma1_en = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then 'Aged 14 or under'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then 'Aged 25–29'
		when ika_avain >= 30 and ika_avain <= 34 then 'Aged 30–34'
		when ika_avain >= 35 and ika_avain <= 39 then 'Aged 35–39'
		when ika_avain >= 40 and ika_avain <= 44 then 'Aged 40–44'
		when ika_avain >= 45 and ika_avain <= 49 then 'Aged 45–49'
		when ika_avain >= 50 and ika_avain <= 54 then 'Aged 50–54'
		when ika_avain >= 55 and ika_avain <= 59 then 'Aged 55–59'
        when ika_avain >= 60 and ika_avain <= 64 then 'Aged 60–64'
		when ika_avain >= 65 then 'Aged 65 or older'
		else 'Missing data'
	END
,jarjestys_ikaryhma1 =
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25'
		when ika_avain >= 30 and ika_avain <= 34 then '30'
		when ika_avain >= 35 and ika_avain <= 39 then '35'
		when ika_avain >= 40 and ika_avain <= 44 then '40'
		when ika_avain >= 45 and ika_avain <= 49 then '45'
		when ika_avain >= 50 and ika_avain <= 54 then '50'
		when ika_avain >= 55 and ika_avain <= 59 then '55'
        when ika_avain >= 60 and ika_avain <= 64 then '60'
		when ika_avain >= 65 then '65'
		else '999'
	END
--ikaryhma2
,ikaryhma2_fi = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then '18–vuotiaat ja sitä nuoremmat'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34-vuotiaat'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44-vuotiaat'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54-vuotiaat'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59-vuotiaat'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64-vuotiaat'
		when ika_avain >= 65 then '65–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma2_sv = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then '18–vuotiaat ja sitä nuoremmat'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29 år'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34 år'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39 år'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44 år'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49 år'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54 år'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59 år'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64 år'
		when ika_avain >= 65 then '65 år eller äldre'
		else 'Information saknas'
	END 
,ikaryhma2_en = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then '18–vuotiaat ja sitä nuoremmat'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then 'Aged 25–29'
		when ika_avain >= 30 and ika_avain <= 34 then 'Aged 30–34'
		when ika_avain >= 35 and ika_avain <= 39 then 'Aged 35–39'
		when ika_avain >= 40 and ika_avain <= 44 then 'Aged 40–44'
		when ika_avain >= 45 and ika_avain <= 49 then 'Aged 45–49'
		when ika_avain >= 50 and ika_avain <= 54 then 'Aged 50–54'
		when ika_avain >= 55 and ika_avain <= 59 then 'Aged 55–59'
        when ika_avain >= 60 and ika_avain <= 64 then 'Aged 60–64'
		when ika_avain >= 65 then 'Aged 65 or older'
		else 'Missing data'
	END 
,jarjestys_ikaryhma2 =
	CASE
		when ika_avain > 0 and ika_avain < 19 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25'
		when ika_avain >= 30 and ika_avain <= 34 then '30'
		when ika_avain >= 35 and ika_avain <= 39 then '35'
		when ika_avain >= 40 and ika_avain <= 44 then '40'
		when ika_avain >= 45 and ika_avain <= 49 then '45'
		when ika_avain >= 50 and ika_avain <= 54 then '50'
		when ika_avain >= 55 and ika_avain <= 59 then '55'
        when ika_avain >= 60 and ika_avain <= 64 then '60'
		when ika_avain >= 65 then '65'
		else '999'
	END
 






GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_kausi]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_kausi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_kausi] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_kausi]
AS
IF (
		SELECT count(1)
		FROM dw.d_kausi
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_kausi
	set identity_insert dw.d_kausi on
	INSERT dw.d_kausi (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_kausi'
		)
	set identity_insert dw.d_kausi off
END


MERGE dw.d_kausi AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_kausi' AS source
	FROM sa.sa_koodistot
	where koodisto = 'kausi'
	
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
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);



GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_koulutustyyppi]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_koulutustyyppi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_koulutustyyppi] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_koulutustyyppi]
AS
IF (
		SELECT count(1)
		FROM dw.d_koulutustyyppi
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_koulutustyyppi
	set identity_insert dw.d_koulutustyyppi on
	INSERT dw.d_koulutustyyppi (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'99'
		,N'etl: p_lataa_d_koulutustyyppi'
		)
	set identity_insert dw.d_koulutustyyppi off
END

MERGE dw.d_koulutustyyppi AS target
USING (
	SELECT koodi
		,coalesce(nimi,nimi_sv,nimi_en) as nimi_fi
		,coalesce(nimi_sv,nimi,nimi_en) as nimi_sv
		,coalesce(nimi_en,nimi,nimi_sv) as nimi_en
		,'etl: p_lataa_d_koulutustyyppi' AS source
	FROM sa.sa_koodistot
	where koodisto = 'koulutustyyppi'
	) AS src
	ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.nimi_fi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,jarjestys = src.koodi
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
			,src.nimi_fi
			,src.nimi_sv
			,src.nimi_en
			,src.koodi
			,src.source
			);




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opintojenlaajuus]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_opintojenlaajuus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_opintojenlaajuus] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_opintojenlaajuus]
AS
IF (
		SELECT count(1)
		FROM dw.d_opintojenlaajuus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_opintojenlaajuus
	set identity_insert dw.d_opintojenlaajuus on
	INSERT dw.d_opintojenlaajuus (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_opintojenlaajuus'
		)
	set identity_insert dw.d_opintojenlaajuus off
END


MERGE dw.d_opintojenlaajuus AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_opintojenlaajuus' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opintojenlaajuus'

	
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
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);




GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_pohjakoulutus]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_pohjakoulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_pohjakoulutus] AS' 
END
GO
ALTER PROCEDURE [dw].[p_lataa_d_pohjakoulutus]
AS
IF (
		SELECT count(1)
		FROM dw.d_pohjakoulutus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_pohjakoulutus
	set identity_insert dw.d_pohjakoulutus on
	INSERT dw.d_pohjakoulutus (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_pohjakoulutus'
		)
	set identity_insert dw.d_pohjakoulutus off
END


MERGE dw.d_pohjakoulutus AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_pohjakoulutus' AS source
	FROM sa.sa_koodistot
	where koodisto = 'pohjakoulutustoinenaste'

	UNION 

	SELECT koodi
		,nimi_FI
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_pohjakoulutus' AS source
	FROM [sa].[sa_koodisto_pohjakoulutus_kk_odw]
	
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
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);


GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_pohjakoulutusvaatimus]    Script Date: 7.12.2017 17:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_pohjakoulutusvaatimus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_pohjakoulutusvaatimus] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_pohjakoulutusvaatimus]
AS
IF (
		SELECT count(1)
		FROM dw.d_pohjakoulutusvaatimus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_pohjakoulutusvaatimus
	set identity_insert dw.d_pohjakoulutusvaatimus on
	INSERT dw.d_pohjakoulutusvaatimus (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'Tieto puuttuu'
		,N'Information saknas'
		,N'Missing data'
		,N'etl: p_lataa_d_pohjakoulutusvaatimus'
		)
	set identity_insert dw.d_pohjakoulutusvaatimus off
END


MERGE dw.d_pohjakoulutusvaatimus AS target
USING (
	SELECT koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'etl: p_lataa_d_pohjakoulutusvaatimus' AS source
	FROM sa.sa_koodistot
	where koodisto = 'pohjakoulutusvaatimustoinenaste'

	
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
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.source
			);




