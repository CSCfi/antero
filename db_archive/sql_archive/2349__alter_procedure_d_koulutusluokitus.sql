USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_koulutusluokitus]    Script Date: 5.8.2019 11:51:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_koulutusluokitus]
AS

if not exists (select * from dw.d_koulutusluokitus where id=-1) 

	begin
	  set identity_insert dw.d_koulutusluokitus on;
	  insert into dw.d_koulutusluokitus (
		id,
		koulutusluokitus_avain,
		koulutusluokitus_koodi,koulutusluokitus_fi,koulutusluokitus_sv,koulutusluokitus_en,
		koulutusastetaso1_koodi,koulutusastetaso1_fi,koulutusastetaso1_sv,koulutusastetaso1_en,
		koulutusastetaso2_koodi,koulutusastetaso2_fi,koulutusastetaso2_sv,koulutusastetaso2_en,
		koulutusalataso1_koodi,koulutusalataso1_fi,koulutusalataso1_sv,koulutusalataso1_en,
		koulutusalataso2_koodi,koulutusalataso2_fi,koulutusalataso2_sv,koulutusalataso2_en,
		koulutusalataso3_koodi,koulutusalataso3_fi,koulutusalataso3_sv,koulutusalataso3_en,
		okmohjauksenala_koodi,okmohjauksenala_fi,okmohjauksenala_sv,okmohjauksenala_en,
		koulutusaste2002_koodi,koulutusaste2002_fi,koulutusaste2002_sv,koulutusaste2002_en,
		koulutusala2002_koodi,koulutusala2002_fi,koulutusala2002_sv,koulutusala2002_en,
		opintoala2002_koodi,opintoala2002_fi,opintoala2002_sv,opintoala2002_en,
		opintoala1995_koodi,opintoala1995_fi,opintoala1995_sv,opintoala1995_en,
		koulutussektori_koodi, koulutussektori_fi, koulutussektori_sv, koulutussektori_en,
		tutkintotyyppi_koodi, tutkintotyyppi_fi, tutkintotyyppi_sv, tutkintotyyppi_en,
		tutkintotyypin_ryhma_koodi, tutkintotyypin_ryhma_fi, tutkintotyypin_ryhma_sv, tutkintotyypin_ryhma_en,
		uusi_eat_koodi,
		source
	  )
	  select
		-1,
		koodi,
		koodi,nimi,nimi_sv,nimi_en, --koulutus
		koodi,nimi,nimi_sv,nimi_en, --astetaso1
		koodi,nimi,nimi_sv,nimi_en, --astetaso2
		koodi,nimi,nimi_sv,nimi_en, --alataso1
		koodi,nimi,nimi_sv,nimi_en, --alataso2
		koodi,nimi,nimi_sv,nimi_en, --alataso3
		koodi,nimi,nimi_sv,nimi_en, --ohjauksenala
  		koodi,nimi,nimi_sv,nimi_en, --koulutusaste2002
  		koodi,nimi,nimi_sv,nimi_en, --koulutusala2002
  		koodi,nimi,nimi_sv,nimi_en, --opintoala2002
  		koodi,nimi,nimi_sv,nimi_en, --opintoala1995
		koodi,nimi,nimi_sv,nimi_en, --koulutussektori
		koodi,nimi,nimi_sv,nimi_en, --tutkintotyyppi
		koodi,nimi,nimi_sv,nimi_en, --tutkintotyypin ryhma
		-1,
		source
	  from sa.sa_koodistot
	  where koodisto='vipunenmeta'
	  and koodi='-1'
	  ;
	  set identity_insert dw.d_koulutusluokitus off;
	end 

else 
	begin
	  update d
	  set
		koulutusluokitus_avain=s.koodi,
		koulutusluokitus_koodi=s.koodi,koulutusluokitus_fi=s.nimi,koulutusluokitus_sv=s.nimi_sv,koulutusluokitus_en=s.nimi_en,
		koulutusastetaso1_koodi=s.koodi,koulutusastetaso1_fi=s.nimi,koulutusastetaso1_sv=s.nimi_sv,koulutusastetaso1_en=s.nimi_en,
		koulutusastetaso2_koodi=s.koodi,koulutusastetaso2_fi=s.nimi,koulutusastetaso2_sv=s.nimi_sv,koulutusastetaso2_en=s.nimi_en,
		koulutusalataso1_koodi=s.koodi,koulutusalataso1_fi=s.nimi,koulutusalataso1_sv=s.nimi_sv,koulutusalataso1_en=s.nimi_en,
		koulutusalataso2_koodi=s.koodi,koulutusalataso2_fi=s.nimi,koulutusalataso2_sv=s.nimi_sv,koulutusalataso2_en=s.nimi_en,
		koulutusalataso3_koodi=s.koodi,koulutusalataso3_fi=s.nimi,koulutusalataso3_sv=s.nimi_sv,koulutusalataso3_en=s.nimi_en,
		okmohjauksenala_koodi=s.koodi,okmohjauksenala_fi=s.nimi,okmohjauksenala_sv=s.nimi_sv,okmohjauksenala_en=s.nimi_en,
  		koulutusaste2002_koodi=s.koodi,koulutusaste2002_fi=s.nimi,koulutusaste2002_sv=s.nimi_sv,koulutusaste2002_en=s.nimi_en,
  		koulutusala2002_koodi=s.koodi,koulutusala2002_fi=s.nimi,koulutusala2002_sv=s.nimi_sv,koulutusala2002_en=s.nimi_en,
  		opintoala2002_koodi=s.koodi,opintoala2002_fi=s.nimi,opintoala2002_sv=s.nimi_sv,opintoala2002_en=s.nimi_en,
  		opintoala1995_koodi=s.koodi,opintoala1995_fi=s.nimi,opintoala1995_sv=s.nimi_sv,opintoala1995_en=s.nimi_en,
		koulutussektori_koodi=s.koodi,koulutussektori_fi=s.nimi,koulutussektori_sv=s.nimi_sv,koulutussektori_en=s.nimi_en,
		tutkintotyyppi_koodi=s.koodi,tutkintotyyppi_fi=s.nimi,tutkintotyyppi_sv=s.nimi_sv,tutkintotyyppi_en=s.nimi_en,
		tutkintotyypin_ryhma_koodi=s.koodi,tutkintotyypin_ryhma_fi=s.nimi,tutkintotyypin_ryhma_sv=s.nimi_sv,tutkintotyypin_ryhma_en=s.nimi_en,
		uusi_eat_koodi=s.koodi,
		source='ETL: p_lataa_d_koulutusluokitus'
	  from dw.d_koulutusluokitus d
	  join sa.sa_koodistot s on s.koodi=d.koulutusluokitus_koodi
	  where s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	end

MERGE dw.d_koulutusluokitus AS target
USING (
  SELECT DISTINCT
    'koulutus_'+s.koodi AS avain,
    s.koodi,
    COALESCE(s.nimi, s.nimi_sv, s.nimi_en) AS nimi,
    COALESCE(s.nimi_sv, s.nimi, s.nimi_en) AS nimi_sv,
    COALESCE(s.nimi_en, s.nimi, s.nimi_sv) AS nimi_en,
    COALESCE(koulutusluokitus2016koulutusastetaso1koodi,t.koodi) as koulutusluokitus2016koulutusastetaso1koodi,
    LTRIM(RTRIM( COALESCE(koulutusluokitus2016koulutusastetaso1nimi, koulutusluokitus2016koulutusastetaso1nimi_sv, koulutusluokitus2016koulutusastetaso1nimi_en, t.nimi))) AS koulutusluokitus2016koulutusastetaso1nimi,
    LTRIM(RTRIM(COALESCE(koulutusluokitus2016koulutusastetaso1nimi_sv, koulutusluokitus2016koulutusastetaso1nimi, koulutusluokitus2016koulutusastetaso1nimi_en, t.nimi_sv))) AS koulutusluokitus2016koulutusastetaso1nimi_sv,
    LTRIM(RTRIM(COALESCE(koulutusluokitus2016koulutusastetaso1nimi_en, koulutusluokitus2016koulutusastetaso1nimi, koulutusluokitus2016koulutusastetaso1nimi_sv, t.nimi_en))) AS koulutusluokitus2016koulutusastetaso1nimi_en,
    COALESCE(koulutusluokitus2016koulutusastetaso2koodi,t.koodi) as koulutusluokitus2016koulutusastetaso2koodi,
    LTRIM(RTRIM(COALESCE(koulutusluokitus2016koulutusastetaso2nimi, koulutusluokitus2016koulutusastetaso2nimi_sv, koulutusluokitus2016koulutusastetaso2nimi_en, t.nimi))) AS koulutusluokitus2016koulutusastetaso2nimi,
    LTRIM(RTRIM( COALESCE(koulutusluokitus2016koulutusastetaso2nimi_sv, koulutusluokitus2016koulutusastetaso2nimi, koulutusluokitus2016koulutusastetaso2nimi_en, t.nimi_sv))) AS koulutusluokitus2016koulutusastetaso2nimi_sv,
    LTRIM(RTRIM( COALESCE(koulutusluokitus2016koulutusastetaso2nimi_en, koulutusluokitus2016koulutusastetaso2nimi, koulutusluokitus2016koulutusastetaso2nimi_sv, t.nimi_en))) AS koulutusluokitus2016koulutusastetaso2nimi_en,
    COALESCE(koulutusluokitus2016koulutusalataso1koodi,t.koodi) as koulutusluokitus2016koulutusalataso1koodi,
    COALESCE(koulutusluokitus2016koulutusalataso1nimi, koulutusluokitus2016koulutusalataso1nimi_sv, koulutusluokitus2016koulutusalataso1nimi_en, t.nimi) AS koulutusluokitus2016koulutusalataso1nimi,
    COALESCE(koulutusluokitus2016koulutusalataso1nimi_sv, koulutusluokitus2016koulutusalataso1nimi, koulutusluokitus2016koulutusalataso1nimi_en, t.nimi_sv) AS koulutusluokitus2016koulutusalataso1nimi_sv,
    COALESCE(koulutusluokitus2016koulutusalataso1nimi_en, koulutusluokitus2016koulutusalataso1nimi, koulutusluokitus2016koulutusalataso1nimi_sv, t.nimi_en) AS koulutusluokitus2016koulutusalataso1nimi_en,
    COALESCE(koulutusluokitus2016koulutusalataso2koodi,t.koodi) as koulutusluokitus2016koulutusalataso2koodi,
    COALESCE(koulutusluokitus2016koulutusalataso2nimi, koulutusluokitus2016koulutusalataso2nimi_sv, koulutusluokitus2016koulutusalataso2nimi_en, t.nimi) AS koulutusluokitus2016koulutusalataso2nimi,
    COALESCE(koulutusluokitus2016koulutusalataso2nimi_sv, koulutusluokitus2016koulutusalataso2nimi, koulutusluokitus2016koulutusalataso2nimi_en, t.nimi_sv) AS koulutusluokitus2016koulutusalataso2nimi_sv,
    COALESCE(koulutusluokitus2016koulutusalataso2nimi_en, koulutusluokitus2016koulutusalataso2nimi, koulutusluokitus2016koulutusalataso2nimi_sv, t.nimi_en) AS koulutusluokitus2016koulutusalataso2nimi_en,
    COALESCE(koulutusluokitus2016koulutusalataso3koodi,t.koodi) as koulutusluokitus2016koulutusalataso3koodi,
    COALESCE(koulutusluokitus2016koulutusalataso3nimi, koulutusluokitus2016koulutusalataso3nimi_sv, koulutusluokitus2016koulutusalataso3nimi_en, t.nimi) AS koulutusluokitus2016koulutusalataso3nimi,
    COALESCE(koulutusluokitus2016koulutusalataso3nimi_sv, koulutusluokitus2016koulutusalataso3nimi, koulutusluokitus2016koulutusalataso3nimi_en, t.nimi_sv) AS koulutusluokitus2016koulutusalataso3nimi_sv,
    COALESCE(koulutusluokitus2016koulutusalataso3nimi_en, koulutusluokitus2016koulutusalataso3nimi, koulutusluokitus2016koulutusalataso3nimi_sv, t.nimi_en) AS koulutusluokitus2016koulutusalataso3nimi_en,
    COALESCE(okmohjauksenalakoodi,t.koodi) as okmohjauksenalakoodi,
    COALESCE(okmohjauksenalanimi, okmohjauksenalanimi_sv, okmohjauksenalanimi_en, t.nimi) AS okmohjauksenalanimi,
    COALESCE(okmohjauksenalanimi_sv, okmohjauksenalanimi, okmohjauksenalanimi_en, t.nimi_sv) AS okmohjauksenalanimi_sv,
    COALESCE(okmohjauksenalanimi_en, okmohjauksenalanimi, okmohjauksenalanimi_sv, t.nimi_en) AS okmohjauksenalanimi_en,
	--koulutusaste2002
	COALESCE(koulutusaste2002koodi,t.koodi) as koulutusaste2002koodi,
    COALESCE(koulutusaste2002nimi, koulutusaste2002nimi_sv, koulutusaste2002nimi_en, t.nimi) AS koulutusaste2002nimi,
    COALESCE(koulutusaste2002nimi_sv, koulutusaste2002nimi, koulutusaste2002nimi_en, t.nimi_sv) AS koulutusaste2002nimi_sv,
    COALESCE(koulutusaste2002nimi_en, koulutusaste2002nimi, koulutusaste2002nimi_sv, t.nimi_en) AS koulutusaste2002nimi_en,
	--koulutusala2002
	COALESCE(koulutusala2002koodi,t.koodi) as koulutusala2002koodi,
    COALESCE(koulutusala2002nimi, koulutusala2002nimi_sv, koulutusala2002nimi_en, t.nimi) AS koulutusala2002nimi,
    COALESCE(koulutusala2002nimi_sv, koulutusala2002nimi, koulutusala2002nimi_en, t.nimi_sv) AS koulutusala2002nimi_sv,
    COALESCE(koulutusala2002nimi_en, koulutusala2002nimi, koulutusala2002nimi_sv, t.nimi_en) AS koulutusala2002nimi_en,
	--opintoala2002
	COALESCE(opintoala2002koodi,t.koodi) as opintoala2002koodi,
    COALESCE(opintoala2002nimi, opintoala2002nimi_sv, opintoala2002nimi_en, t.nimi) AS opintoala2002nimi,
    COALESCE(opintoala2002nimi_sv, opintoala2002nimi, opintoala2002nimi_en, t.nimi_sv) AS opintoala2002nimi_sv,
    COALESCE(opintoala2002nimi_en, opintoala2002nimi, opintoala2002nimi_sv, t.nimi_en) AS opintoala2002nimi_en,
	--opintoala1995
	COALESCE(opintoala1995koodi,t.koodi) as opintoala1995koodi,
    COALESCE(opintoala1995nimi, opintoala1995nimi_sv, opintoala1995nimi_en, t.nimi) AS opintoala1995nimi,
    COALESCE(opintoala1995nimi_sv, opintoala1995nimi, opintoala1995nimi_en, t.nimi_sv) AS opintoala1995nimi_sv,
    COALESCE(opintoala1995nimi_en, opintoala1995nimi, opintoala1995nimi_sv, t.nimi_en) AS opintoala1995nimi_en,
    --nb! no koulutussektori in sa, yet anyway
    --but we need tutkintotyyppi for evaluating koulutussektori
    case
		when s.koodi in ('001101','201100') then '1'
		when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then '2' --01=Yleissivistävä koulutus
		when tutkintotyyppikoodi='02' then '3' --Ammatilliset perustutkinnot
		when tutkintotyyppikoodi='03' then '3' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='06' then '4' --Ammattikorkeakoulutus
		when tutkintotyyppikoodi='09' then '3' --Muu ammatillinen koulutus
		when tutkintotyyppikoodi='10' then (select top 1 koodi from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
		when tutkintotyyppikoodi='12' then '4' --Ylempi ammattikorkeakoulututkinto
		when tutkintotyyppikoodi='13' then '5' --Alempi korkeakoulututkinto
		when tutkintotyyppikoodi='14' then '5' --Ylempi korkeakoulututkinto
		when tutkintotyyppikoodi='15' then '5' --Lisensiaatin tutkinto
		when tutkintotyyppikoodi='16' then '5' --Tohtorin tutkinto
		when tutkintotyyppikoodi='19' then '3' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='20' then '3' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		else t.koodi
    end as koulutussektorikoodi,
    case
		when s.koodi in ('001101','201100') then 'Esi- ja perusopetus'
		when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'Lukiokoulutus' --01=Yleissivistävä koulutus
		when tutkintotyyppikoodi='02' then 'Ammatillinen koulutus' --Ammatilliset perustutkinnot
		when tutkintotyyppikoodi='03' then 'Ammatillinen koulutus' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='06' then 'Ammattikorkeakoulukoulutus' --Ammattikorkeakoulutus
		when tutkintotyyppikoodi='09' then 'Ammatillinen koulutus' --Muu ammatillinen koulutus
		when tutkintotyyppikoodi='10' then (select top 1 nimi from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
		when tutkintotyyppikoodi='12' then 'Ammattikorkeakoulukoulutus' --Ylempi ammattikorkeakoulututkinto
		when tutkintotyyppikoodi='13' then 'Yliopistokoulutus' --Alempi korkeakoulututkinto
		when tutkintotyyppikoodi='14' then 'Yliopistokoulutus' --Ylempi korkeakoulututkinto
		when tutkintotyyppikoodi='15' then 'Yliopistokoulutus' --Lisensiaatin tutkinto
		when tutkintotyyppikoodi='16' then 'Yliopistokoulutus' --Tohtorin tutkinto
		when tutkintotyyppikoodi='19' then 'Ammatillinen koulutus' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='20' then 'Ammatillinen koulutus' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		else t.nimi
    end as koulutussektorinimi,
    case
		when s.koodi in ('001101','201100') then 'Förskoleundervisning och grundläggande utbildning'
		when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'Gymnasieutbildning' --01=Yleissivistävä koulutus
		when tutkintotyyppikoodi='02' then 'Yrkesutbildning' --Ammatilliset perustutkinnot
		when tutkintotyyppikoodi='03' then 'Yrkesutbildning' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='06' then 'Yrkeshögskoleutbildning' --Ammattikorkeakoulutus
		when tutkintotyyppikoodi='09' then 'Yrkesutbildning' --Muu ammatillinen koulutus
		when tutkintotyyppikoodi='10' then (select top 1 nimi_sv from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
		when tutkintotyyppikoodi='12' then 'Yrkeshögskoleutbildning' --Ylempi ammattikorkeakoulututkinto
		when tutkintotyyppikoodi='13' then 'Universitetsutbildning' --Alempi korkeakoulututkinto
		when tutkintotyyppikoodi='14' then 'Universitetsutbildning' --Ylempi korkeakoulututkinto
		when tutkintotyyppikoodi='15' then 'Universitetsutbildning' --Lisensiaatin tutkinto
		when tutkintotyyppikoodi='16' then 'Universitetsutbildning' --Tohtorin tutkinto
		when tutkintotyyppikoodi='19' then 'Yrkesutbildning' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='20' then 'Yrkesutbildning' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		else t.nimi_sv
    end as koulutussektorinimi_sv,
    case
		when s.koodi in ('001101','201100') then 'Pre-primary and basic education'
		when tutkintotyyppikoodi='01' and s.koodi not in ('001101','201100') then 'General upper secondary education' --01=Yleissivistävä koulutus
		when tutkintotyyppikoodi='02' then 'Vocational education and training' --Ammatilliset perustutkinnot
		when tutkintotyyppikoodi='03' then 'Vocational education and training' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='06' then 'University of applied sciences (UAS) education' --Ammattikorkeakoulutus
		when tutkintotyyppikoodi='09' then 'Vocational education and training' --Muu ammatillinen koulutus
		when tutkintotyyppikoodi='10' then (select top 1 nimi_en from sa.sa_koodistot where koodisto='vipunenmeta' and koodi='-1') --Muu koulutus
		when tutkintotyyppikoodi='12' then 'University of applied sciences (UAS) education' --Ylempi ammattikorkeakoulututkinto
		when tutkintotyyppikoodi='13' then 'University education' --Alempi korkeakoulututkinto
		when tutkintotyyppikoodi='14' then 'University education' --Ylempi korkeakoulututkinto
		when tutkintotyyppikoodi='15' then 'University education' --Lisensiaatin tutkinto
		when tutkintotyyppikoodi='16' then 'University education' --Tohtorin tutkinto
		when tutkintotyyppikoodi='19' then 'Vocational education and training' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		when tutkintotyyppikoodi='20' then 'Vocational education and training' --Näyttötutkintoon valmistava ammatillinen lisäkoulutus
		else t.nimi_en
    end as koulutussektorinimi_en,
	CASE 
		WHEN s.tutkintotyyppikoodi = '02' then s.tutkintotyyppikoodi
		WHEN s.tutkintotyyppikoodi in (19,20) THEN '08'
		WHEN s.tutkintotyyppikoodi = '09' then s.tutkintotyyppikoodi
		WHEN s.nimi like '%VALMA%' OR s.nimi like '%TELMA%' THEN '10' 
		WHEN s.koodi = '999900' THEN '11'
		ELSE '-1'
	END as tutkintotyypin_ryhmakoodi,
	CASE 
		WHEN s.tutkintotyyppikoodi = '02' then s.tutkintotyyppinimi
		WHEN s.tutkintotyyppikoodi in (19,20) THEN 'Ammatti- ja erikoisammattitutkinnot'
		WHEN s.tutkintotyyppikoodi = '09' then s.tutkintotyyppinimi
		WHEN s.nimi like '%VALMA%' OR s.nimi like '%TELMA%' THEN 'Valmentava koulutus' 
		WHEN s.koodi = '999900' THEN 'Koulutusaste tuntematon'
		ELSE 'Tieto puuttuu'
	END as tutkintotyypin_ryhma,
	CASE 
		WHEN s.tutkintotyyppikoodi = '02' then s.tutkintotyyppinimi_sv
		WHEN s.tutkintotyyppikoodi in (19,20) THEN 'Yrkes- och specialyrkesexamina'
		WHEN s.tutkintotyyppikoodi = '09' then s.tutkintotyyppinimi_sv
		WHEN s.nimi like '%VALMA%' OR s.nimi like '%TELMA%' THEN 'Handledande utbildning'  
		WHEN s.koodi = '999900' THEN 'Utbildningsnivån okänd'
		ELSE 'Information saknas'
	END as tutkintotyypin_ryhma_sv,
	CASE 
		WHEN s.tutkintotyyppikoodi = '02' then 'Vocational upper secondary qualifications'
		WHEN s.tutkintotyyppikoodi in (19,20) THEN 'Further and Specialist vocational qualifications' 
		WHEN s.tutkintotyyppikoodi = '09' then 'Other vocational education'
		WHEN s.nimi like '%VALMA%' OR s.nimi like '%TELMA%' THEN 'Preparatory education' 
		WHEN s.koodi = '999900' THEN 'Level unknown'
		ELSE 'Missing data'
	END as tutkintotyypin_ryhma_en,
    -- and add tutkintotyyppi to dimension as we already have it here
    COALESCE(tutkintotyyppikoodi, t.koodi) as tutkintotyyppikoodi,
    COALESCE(tutkintotyyppinimi, tutkintotyyppinimi_sv, tutkintotyyppinimi_en, t.nimi) AS tutkintotyyppinimi,
    COALESCE(tutkintotyyppinimi_sv, tutkintotyyppinimi, tutkintotyyppinimi_en, t.nimi_sv) AS tutkintotyyppinimi_sv,
    COALESCE(tutkintotyyppinimi_en, tutkintotyyppinimi, tutkintotyyppinimi_sv, t.nimi_en) AS tutkintotyyppinimi_en,
	(CASE WHEN s.koodi like '3%' and s.nimi like '%erikoisammattitutkinto%' THEN '4' + RIGHT(s.koodi,LEN(s.koodi)-1) ELSE NULL END) as uusi_eat_koodi,
    s.source
  FROM sa.sa_koulutusluokitus s
  cross join sa.sa_koodistot as t
  where t.koodisto='vipunenmeta' and t.koodi='-1'
) AS src
ON target.koulutusluokitus_avain = src.avain
WHEN MATCHED THEN
  UPDATE SET
    koulutusluokitus_fi = src.nimi,
    koulutusluokitus_sv = src.nimi_sv,
    koulutusluokitus_en = src.nimi_en,
  	koulutusastetaso1_fi = src.koulutusluokitus2016koulutusastetaso1nimi,
  	koulutusastetaso1_sv = src.koulutusluokitus2016koulutusastetaso1nimi_sv,
  	koulutusastetaso1_en = src.koulutusluokitus2016koulutusastetaso1nimi_en,
  	koulutusastetaso2_fi = src.koulutusluokitus2016koulutusastetaso2nimi,
  	koulutusastetaso2_sv = src.koulutusluokitus2016koulutusastetaso2nimi_sv,
  	koulutusastetaso2_en = src.koulutusluokitus2016koulutusastetaso2nimi_en,
    koulutusalataso1_koodi =  src.koulutusluokitus2016koulutusalataso1koodi,
  	koulutusalataso1_fi = src.koulutusluokitus2016koulutusalataso1nimi,
  	koulutusalataso1_sv = src.koulutusluokitus2016koulutusalataso1nimi_sv,
  	koulutusalataso1_en = src.koulutusluokitus2016koulutusalataso1nimi_en,
	koulutusalataso2_koodi =  src.koulutusluokitus2016koulutusalataso2koodi,
  	koulutusalataso2_fi = src.koulutusluokitus2016koulutusalataso2nimi,
  	koulutusalataso2_sv = src.koulutusluokitus2016koulutusalataso2nimi_sv,
  	koulutusalataso2_en = src.koulutusluokitus2016koulutusalataso2nimi_en,
	koulutusalataso3_koodi =  src.koulutusluokitus2016koulutusalataso3koodi,
  	koulutusalataso3_fi = src.koulutusluokitus2016koulutusalataso3nimi,
  	koulutusalataso3_sv = src.koulutusluokitus2016koulutusalataso3nimi_sv,
  	koulutusalataso3_en = src.koulutusluokitus2016koulutusalataso3nimi_en,
    okmohjauksenala_koodi = src.okmohjauksenalakoodi,
    okmohjauksenala_fi = src.okmohjauksenalanimi,
  	okmohjauksenala_sv = src.okmohjauksenalanimi_sv,
  	okmohjauksenala_en = src.okmohjauksenalanimi_en,
  	koulutusaste2002_koodi = src.koulutusaste2002koodi,
  	koulutusaste2002_fi = src.koulutusaste2002nimi,
  	koulutusaste2002_sv = src.koulutusaste2002nimi_sv,
  	koulutusaste2002_en = src.koulutusaste2002nimi_en,
  	koulutusala2002_koodi = src.koulutusala2002koodi,
  	koulutusala2002_fi = src.koulutusala2002nimi,
  	koulutusala2002_sv = src.koulutusala2002nimi_sv,
  	koulutusala2002_en = src.koulutusala2002nimi_en,
  	opintoala2002_koodi = src.opintoala2002koodi,
  	opintoala2002_fi = src.opintoala2002nimi,
  	opintoala2002_sv = src.opintoala2002nimi_sv,
  	opintoala2002_en = src.opintoala2002nimi_en,
  	opintoala1995_koodi = src.opintoala1995koodi,
  	opintoala1995_fi = src.opintoala1995nimi,
  	opintoala1995_sv = src.opintoala1995nimi_sv,
  	opintoala1995_en = src.opintoala1995nimi_en,
  	tutkintotyyppi_koodi = src.tutkintotyyppikoodi,
    tutkintotyyppi_fi = src.tutkintotyyppinimi,
    tutkintotyyppi_sv = src.tutkintotyyppinimi_sv,
  	tutkintotyyppi_en = src.tutkintotyyppinimi_en,
	tutkintotyypin_ryhma_koodi = src.tutkintotyypin_ryhmakoodi,
    tutkintotyypin_ryhma_fi = src.tutkintotyypin_ryhma,
    tutkintotyypin_ryhma_sv = src.tutkintotyypin_ryhma_sv,
  	tutkintotyypin_ryhma_en = src.tutkintotyypin_ryhma_en,
    koulutussektori_koodi =src.koulutussektorikoodi,
    koulutussektori_fi = src.koulutussektorinimi,
    koulutussektori_sv = src.koulutussektorinimi_sv,
    koulutussektori_en = koulutussektorinimi_en,
	uusi_eat_koodi = src.uusi_eat_koodi,
    target.source = src.source
WHEN NOT MATCHED THEN
  INSERT (
    koulutusluokitus_avain,
    koulutusluokitus_koodi,koulutusluokitus_fi,koulutusluokitus_sv,koulutusluokitus_en,
    koulutusastetaso1_koodi,koulutusastetaso1_fi,koulutusastetaso1_sv,koulutusastetaso1_en,
    koulutusastetaso2_koodi,koulutusastetaso2_fi,koulutusastetaso2_sv,koulutusastetaso2_en,
    koulutusalataso1_koodi,koulutusalataso1_fi,koulutusalataso1_sv,koulutusalataso1_en,
    koulutusalataso2_koodi,koulutusalataso2_fi,koulutusalataso2_sv,koulutusalataso2_en,
    koulutusalataso3_koodi,koulutusalataso3_fi,koulutusalataso3_sv,koulutusalataso3_en,
    okmohjauksenala_koodi,okmohjauksenala_fi,okmohjauksenala_sv,okmohjauksenala_en,
    koulutussektori_koodi,koulutussektori_fi,koulutussektori_sv,koulutussektori_en,
    tutkintotyyppi_koodi,tutkintotyyppi_fi,tutkintotyyppi_sv,tutkintotyyppi_en,
	tutkintotyypin_ryhma_koodi,tutkintotyypin_ryhma_fi,tutkintotyypin_ryhma_sv,tutkintotyypin_ryhma_en,
  	koulutusaste2002_koodi,koulutusaste2002_fi,koulutusaste2002_sv,koulutusaste2002_en,
  	koulutusala2002_koodi,koulutusala2002_fi,koulutusala2002_sv,koulutusala2002_en,
  	opintoala2002_koodi,opintoala2002_fi,opintoala2002_sv,opintoala2002_en,
  	opintoala1995_koodi,opintoala1995_fi,opintoala1995_sv,opintoala1995_en,
	uusi_eat_koodi,
    source
  )
  VALUES (
    src.avain,
    src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
    koulutusluokitus2016koulutusastetaso1koodi,koulutusluokitus2016koulutusastetaso1nimi,koulutusluokitus2016koulutusastetaso1nimi_sv,koulutusluokitus2016koulutusastetaso1nimi_en,
    koulutusluokitus2016koulutusastetaso2koodi,koulutusluokitus2016koulutusastetaso2nimi,koulutusluokitus2016koulutusastetaso2nimi_sv,koulutusluokitus2016koulutusastetaso2nimi_en,
    koulutusluokitus2016koulutusalataso1koodi,koulutusluokitus2016koulutusalataso1nimi,koulutusluokitus2016koulutusalataso1nimi_sv,koulutusluokitus2016koulutusalataso1nimi_en,
    koulutusluokitus2016koulutusalataso2koodi,koulutusluokitus2016koulutusalataso2nimi,koulutusluokitus2016koulutusalataso2nimi_sv,koulutusluokitus2016koulutusalataso2nimi_en,
    koulutusluokitus2016koulutusalataso3koodi,koulutusluokitus2016koulutusalataso3nimi,koulutusluokitus2016koulutusalataso3nimi_sv,koulutusluokitus2016koulutusalataso3nimi_en,
    okmohjauksenalakoodi,okmohjauksenalanimi,okmohjauksenalanimi_sv,okmohjauksenalanimi_en,
    koulutussektorikoodi,koulutussektorinimi,koulutussektorinimi_sv,koulutussektorinimi_en,
    tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en,
	tutkintotyypin_ryhmakoodi,tutkintotyypin_ryhma,tutkintotyypin_ryhma_sv,tutkintotyypin_ryhma_en,
  	koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en,
  	koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en,
  	opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en,
  	opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en,
	uusi_eat_koodi,
    src.source
  );

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso1_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso1_koodi AS case when koulutusalataso1_koodi = -1 then '99999' else cast(koulutusalataso1_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso2_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso2_koodi AS case when koulutusalataso2_koodi = -1 then '99999' else cast(koulutusalataso2_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso3_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso3_koodi AS case when koulutusalataso3_koodi = '-1' then '99999' else cast(koulutusalataso3_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso1_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso1_koodi AS case when koulutusastetaso1_koodi = '-1' then '99999' else cast(koulutusastetaso1_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso2_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso2_koodi AS case when koulutusastetaso2_koodi = '-1' then '99999' else cast(koulutusastetaso2_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusluokitus_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusluokitus_koodi AS case when koulutusluokitus_koodi = '-1' then '9999999' else cast(koulutusluokitus_koodi as varchar(10))
	  END
	END

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutussektori_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutussektori_koodi AS case when koulutussektori_koodi = '-1' then '99999' else cast(koulutussektori_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_okmohjauksenala_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_okmohjauksenala_koodi AS case when okmohjauksenala_koodi = '-1' then '99999' else cast(okmohjauksenala_koodi as varchar(10))
	  END
	END

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_tutkintotyyppi_koodi'
	)

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_tutkintotyyppi_koodi AS case when tutkintotyyppi_koodi = -1 then '99999' else cast(tutkintotyyppi_koodi as varchar(10))
	END
	END
	

	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_tutkintotyypin_ryhma_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_tutkintotyypin_ryhma_koodi AS case when tutkintotyypin_ryhma_koodi = -1 then '99999' else cast(tutkintotyypin_ryhma_koodi as varchar(10))
	END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusaste2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusaste2002_koodi AS case when koulutusaste2002_koodi = -1 then '99999' else cast(koulutusaste2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusala2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusala2002_koodi AS case when koulutusala2002_koodi = -1 then '99999' else cast(koulutusala2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_opintoala2002_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_opintoala2002_koodi AS case when opintoala2002_koodi = -1 then '99999' else cast(opintoala2002_koodi as varchar(10))
	  END
	END


	IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_opintoala1995_koodi')

	BEGIN
		ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_opintoala1995_koodi AS case when opintoala1995_koodi = -1 then '99999' else cast(opintoala1995_koodi as varchar(10))
	  END
	END
