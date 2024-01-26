USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_haku]    Script Date: 8.3.2023 8:01:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_d_haku] AS

DELETE FROM dw.d_haku WHERE haku_oid = '-1'

SET identity_insert dw.d_haku ON

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
	,hakutapa2_fi
	,hakutapa2_sv
	,hakutapa2_en
	,hakuryhma_koodi
	,hakuryhma_fi
	,hakuryhma_sv
	,hakuryhma_en
	,kohdejoukontarkenne_koodi
	,kohdejoukontarkenne_fi
	,kohdejoukontarkenne_sv
	,kohdejoukontarkenne_en
	,korkeakouluhaku
	,jarjestys_hakutapa2
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
	,N'9'
	,N'etl: p_lataa_d_haku'
)
SET identity_insert dw.d_haku OFF


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
		,case when k4.koodi = '03' then 'Erillishaku' else k4.nimi end as hakutapa2_fi
		,case when k4.koodi = '03' then 'Separata antagningar' else k4.nimi_sv end as hakutapa2_sv
		,case when k4.koodi in ('02','03') then 'Separate application' else 'Joint application' end as hakutapa2_en
		,k5.koodi as kohdejoukontarkenne_koodi
		,k5.nimi as kohdejoukontarkenne_fi
		,k5.nimi_sv as kohdejoukontarkenne_sv
		,k5.nimi_en as kohdejoukontarkenne_en
		,korkeakouluHaku as korkeakouluhaku
		,case
			when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then '1'
			when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi like 'Lisähaku kymppiluokalle%' then '2'
			when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then '3'
			when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then '4'
			when k4.nimi = 'Jatkuva haku' and korkeakouluHaku <> 1 then '6'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then '5'
			else '9'
		end as hakuryhma_koodi
		,case
			when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Ammatillisen koulutuksen ja lukiokoulutuksen yhteishaku'
			when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi like 'Lisähaku kymppiluokalle%' then 'Perusopetuksen jälkeisen valmistavan koulutuksen haku'
			when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku'
			when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Korkeakoulujen yhteishaku'
			when k4.nimi = 'Jatkuva haku' and korkeakouluHaku <> 1 then 'Jatkuva haku'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Erillishaku'
			else 'Muu'
		end as hakuryhma_fi
		,case
			when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Gemensam ansökan till yrkes- och gymnasieutbildning'
			when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi like 'Lisähaku kymppiluokalle%' then 'Ansökan till förberedande utbildningar efter grundskolan'
			when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Ansökan till yrkesinriktad utbildning som anordnas som specialundervisning'
			when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Högskolornas gemensamma ansökan'
			when k4.nimi = 'Jatkuva haku' and korkeakouluHaku <> 1 then 'Kontinuerlig ansökan'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separata antagningar'
			else 'Annan'
		end as hakuryhma_sv
		,case
			when kh.nimi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi like '%yhteishaussa%' and kh.nimi like '%lisähaku%') then 'Application to vocational or general upper secondary education in the joint application system'
			when kh.nimi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi like 'Lisähaku kymppiluokalle%' then 'Application to preparatory education for upper secondary vocational education and training'
			when kh.nimi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Application to vocational special needs education and training'
			when kh.nimi like '%korkeakoulujen%' and (kh.nimi like '%yhteishaku%' or kh.nimi like '%lisähaku%')  then 'Joint application to higher education '
			when k4.nimi = 'Jatkuva haku' and korkeakouluHaku <> 1 then 'Rolling admission'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separate application'
			else 'Other'
		end as hakuryhma_en
		,cast(case when k4.koodi = '03' then '2' else k4.koodi end as int) as jarjestys_hakutapa2
		,'etl: p_lataa_d_haku' AS source
		FROM sa.koulutustarjonta_haku kh
	left join sa.sa_koodistot k3 on k3.koodi=substring(kh.hakutyyppiUri,CHARINDEX('_',kh.hakutyyppiUri)+1,2) and k3.koodisto='hakutyyppi'
	left join sa.sa_koodistot k4 on k4.koodi=substring(kh.hakutapaUri,CHARINDEX('_',kh.hakutapaUri)+1,2) and k4.koodisto='hakutapa'
	left join sa.sa_koodistot k5 on k5.koodi=substring(kh.kohdejoukonTarkenne,CHARINDEX('_',kh.kohdejoukonTarkenne)+1,1) and k5.koodisto='haunkohdejoukontarkenne'
	where kh.tila = 'JULKAISTU' or (kh.tila = 'VALMIS' and k5.nimi='Jatkotutkintohaku')

UNION ALL

SELECT DISTINCT
		hakuOid as haku_oid
		,kh.nimi_fi as haun_nimi_fi
		,kh.nimi_sv as haun_nimi_sv
		,kh.nimi_en as haun_nimi_en
		,case k4.nimi when 'Erillishaku' then '03' when NULL then '-1' else '01' end as hakutyyppi_koodi
		,case k4.nimi when 'Erillishaku' then 'Erillishaku' when NULL then 'Tieto puuttuu' else 'Varsinainen haku' end as hakutyyppi_fi
		,case k4.nimi when 'Erillishaku' then 'Kompletteringansökan' when NULL then 'Information saknas' else 'Egentlig ansökan' end as hakutyyppi_sv
		,case k4.nimi when 'Erillishaku' then 'Supplementary application round' when NULL then 'Missing data' else 'Primary application round' end as hakutyyppi_en
		,k4.koodi as hakutapa_koodi
		,k4.nimi as hakutapa_fi
		,k4.nimi_sv as hakutapa_sv
		,coalesce(k4.nimi_en,(case k4.koodi when '01' then 'Joint application' when '02' then 'Separate application' when '03' then 'Separate application' end)) as hakutapa_en
		,case when k4.koodi = '03' then 'Erillishaku' else k4.nimi end as hakutapa2_fi
		,case when k4.koodi = '03' then 'Separata antagningar' else k4.nimi_sv end as hakutapa2_sv
		,case when k4.koodi in ('02','03') then 'Separate application' else 'Joint application' end as hakutapa2_en
		,k6.koodi as kohdejoukontarkenne_koodi
		,k6.nimi as kohdejoukontarkenne_fi
		,k6.nimi_sv as kohdejoukontarkenne_sv
		,k6.nimi_en as kohdejoukontarkenne_en
		,case k5.koodi when '12' then 1 else 0 end as korkeakouluhaku
		,case
			when kh.nimi_fi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi_fi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi_fi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi_fi like '%yhteishaussa%' and kh.nimi_fi like '%lisähaku%') then '1'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen koulutuksen yhteishaku%' then '6'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi_fi like 'Lisähaku kymppiluokalle%' then '2'
			when kh.nimi_fi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi_fi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi_fi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then '3'
			when kh.nimi_fi like '%korkeakoulujen%' and (kh.nimi_fi like '%yhteishaku%' or kh.nimi_fi like '%lisähaku%')  then '4'
			when k5.koodi <> '12' and k4.nimi = 'Jatkuva haku' then '6'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then '5'
			else '9'
		end as hakuryhma_koodi
		,case
			when kh.nimi_fi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi_fi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi_fi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi_fi like '%yhteishaussa%' and kh.nimi_fi like '%lisähaku%') then 'Ammatillisen koulutuksen ja lukiokoulutuksen yhteishaku'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen koulutuksen yhteishaku%' then 'Perusopetuksen jälkeisen koulutuksen yhteishaku'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi_fi like 'Lisähaku kymppiluokalle%' then 'Perusopetuksen jälkeisen valmistavan koulutuksen haku'
			when kh.nimi_fi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi_fi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi_fi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku'
			when kh.nimi_fi like '%korkeakoulujen%' and (kh.nimi_fi like '%yhteishaku%' or kh.nimi_fi like '%lisähaku%')  then 'Korkeakoulujen yhteishaku'
			when k5.koodi <> '12' and k4.nimi = 'Jatkuva haku' then 'Jatkuva haku'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Erillishaku'
			else 'Muu'
		end as hakuryhma_fi
		,case
			when kh.nimi_fi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi_fi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi_fi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi_fi like '%yhteishaussa%' and kh.nimi_fi like '%lisähaku%') then 'Gemensam ansökan till yrkes- och gymnasieutbildning'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen koulutuksen yhteishaku%' then 'Gemensam ansökan till utbildning efter den grundläggande utbildningen'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi_fi like 'Lisähaku kymppiluokalle%' then 'Ansökan till förberedande utbildningar efter grundskolan'
			when kh.nimi_fi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi_fi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi_fi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Ansökan till yrkesinriktad utbildning som anordnas som specialundervisning'
			when kh.nimi_fi like '%korkeakoulujen%' and (kh.nimi_fi like '%yhteishaku%' or kh.nimi_fi like '%lisähaku%')  then 'Högskolornas gemensamma ansökan'
			when k5.koodi <> '12' and k4.nimi = 'Jatkuva haku' then 'Kontinuerlig ansökan'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separata antagningar'
			else 'Annan'
		end as hakuryhma_sv
		,case
			when kh.nimi_fi like 'Yhteishaku ammatilliseen ja lukioon%' or kh.nimi_fi like 'Ammatillisen koulutuksen ja lukiokoulutuksen%' or kh.nimi_fi like 'Ammatillisen koulutuksen syksyn%' or (kh.nimi_fi like '%yhteishaussa%' and kh.nimi_fi like '%lisähaku%') then 'Application to vocational or general upper secondary education in the joint application system'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen koulutuksen yhteishaku%' then 'Joint application to upper secondary education and preparatory education'
			when kh.nimi_fi like 'Perusopetuksen jälkeisen valmistavan koulutuksen%' or kh.nimi_fi like 'Lisähaku kymppiluokalle%' then 'Application to preparatory education for upper secondary vocational education and training'
			when kh.nimi_fi like '%haku erityisopetuksena järjestettävään ammatilliseen koulutukseen%' or kh.nimi_fi like 'Erityisopetuksena järjestettävän ammatillisen koulutuksen haku%' or kh.nimi_fi like '%vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen%' then 'Application to vocational special needs education and training'
			when kh.nimi_fi like '%korkeakoulujen%' and (kh.nimi_fi like '%yhteishaku%' or kh.nimi_fi like '%lisähaku%')  then 'Joint application to higher education '
			when k5.koodi <> '12' and k4.nimi = 'Jatkuva haku' then 'Rolling admission'
			when k4.nimi in ('Erillishaku','Jatkuva haku') then 'Separate application'
			else 'Other'
		end as hakuryhma_en
		,cast(case when k4.koodi = '03' then '2' else k4.koodi end as int) as jarjestys_hakutapa2
		,'etl: p_lataa_d_haku' AS source
		FROM sa.sa_kouta_haku kh
	left join sa.sa_koodistot k4 on k4.koodi=substring(kh.hakutapaKoodiUri,CHARINDEX('_',kh.hakutapaKoodiUri)+1,2) and k4.koodisto='hakutapa'
	left join sa.sa_koodistot k5 on k5.koodi=substring(kh.kohdejoukkoKoodiUri,CHARINDEX('_',kh.kohdejoukkoKoodiUri)+1,2) and k5.koodisto='haunkohdejoukko'
	left join sa.sa_koodistot k6 on k6.koodi=substring(kh.kohdejoukonTarkenneKoodiUri,CHARINDEX('_',kh.kohdejoukonTarkenneKoodiUri)+1,1) and k6.koodisto='haunkohdejoukontarkenne'
	where kh.Tila = 'julkaistu' or kh.Tila = 'arkistoitu' or (kh.tila = 'valmis' and k6.nimi='Jatkotutkintohaku')
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
			,hakutapa2_fi = src.hakutapa2_fi
			,hakutapa2_sv = src.hakutapa2_sv
			,hakutapa2_en = src.hakutapa2_en
			,hakuryhma_koodi = src.hakuryhma_koodi
			,hakuryhma_fi = src.hakuryhma_fi
			,hakuryhma_sv = src.hakuryhma_sv
			,hakuryhma_en = src.hakuryhma_en
			,kohdejoukontarkenne_koodi = src.kohdejoukontarkenne_koodi
			,kohdejoukontarkenne_fi = src.kohdejoukontarkenne_fi
			,kohdejoukontarkenne_sv = src.kohdejoukontarkenne_sv
			,kohdejoukontarkenne_en = src.kohdejoukontarkenne_en
			,korkeakouluhaku = src.korkeakouluhaku
			,jarjestys_hakutapa2 = src.jarjestys_hakutapa2
			,target.source = src.source

WHEN NOT MATCHED by target
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
			,hakutapa2_fi  
			,hakutapa2_sv 
			,hakutapa2_en
			,hakuryhma_koodi
			,hakuryhma_fi
			,hakuryhma_sv
			,hakuryhma_en
			,kohdejoukontarkenne_koodi
			,kohdejoukontarkenne_fi  
			,kohdejoukontarkenne_sv  
			,kohdejoukontarkenne_en  
			,korkeakouluhaku  
			,jarjestys_hakutapa2
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
			,src.hakutapa2_fi
			,src.hakutapa2_sv
			,src.hakutapa2_en
			,src.hakuryhma_koodi
			,src.hakuryhma_fi
			,src.hakuryhma_sv
			,src.hakuryhma_en
			,src.kohdejoukontarkenne_koodi
			,src.kohdejoukontarkenne_fi
			,src.kohdejoukontarkenne_sv
			,src.kohdejoukontarkenne_en
			,src.korkeakouluhaku
			,src.jarjestys_hakutapa2
			,src.source
		)

WHEN NOT MATCHED by source and id != '-1'
	THEN delete;




GO

USE [ANTERO]