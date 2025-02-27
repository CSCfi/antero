USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_haku]    Script Date: 27.8.2018 15:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	,coalesce(k3.nimi_en,(case k3.koodi when '01' then 'Primary application round' when '03' then 'Supplementary application round' end)) as hakutyyppi_en
	,k4.koodi as hakutapa_koodi
	,k4.nimi as hakutapa_fi
	,k4.nimi_sv as hakutapa_sv
	,coalesce(k4.nimi_en,(case k4.koodi when '01' then 'Joint application' when '02' then 'Separate application' when '03' then 'Separate application' end)) as hakutapa_en
	,k5.koodi as kohdejoukontarkenne_koodi
	,k5.nimi as kohdejoukontarkenne_fi
	,k5.nimi_sv as kohdejoukontarkenne_sv
	,k5.nimi_en as kohdejoukontarkenne_en
	,korkeakouluHaku as korkeakouluhaku
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then '1'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then '2'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then '3'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then '4'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then '5'
		else '9'
	end as hakuryhma_koodi
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Ammatillisen koulutuksen ja lukiokoulutuksen yhteishaku'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Perusopetuksen jälkeisen valmistavan koulutuksen haku'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Korkeakoulujen yhteishaku'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Erillishaku'
		else 'Muu'
	end as hakuryhma_fi
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Gemensam ansökan till yrkes- och gymnasieutbildning'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Ansökan till förberedande utbildningar efter grundskolan'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Ansökan till yrkesinriktad utbildning som anordnas som specialundervisning'
		when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Högskolornas gemensamma ansökan'
		when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separata antagningar'
		else 'Annan'
	end as hakuryhma_sv
	,case
		when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Application to vocational or general upper secondary education in the joint application system'
		when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' then 'Application to preparatory education for upper secondary vocational education and training'
		when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Application to vocational special needs education and training'
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



