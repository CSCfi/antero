USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot]    Script Date: 5.8.2021 19:45:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot] AS

-- truncate table f_2_4_Ammatillisen_koulutuksen_tutkinnot
-- insert into f_2_4_Ammatillisen_koulutuksen_tutkinnot select * from v_f_2_4_Ammatillisen_koulutuksen_tutkinnot

SELECT
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,lahde = lahde
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusluokitus = koulk
	,tutkintonimike_ammpk = tunim
	,koulutusohjelma_ammpk = koohj
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,koulutuksen_kieli = kkieli
	,koulutuksen_kunta = kkun
	,opetushallinnon_koulutus = ophal
	,sukupuoli = sp
	,aidinkieli_versio1 = aikielir1
	,aikuisopiskelija = aiopis
	,nuorten_aikuisten_koulutus = aikoul
	,ika_kirjoihintulovuonna = case ika2 when '60' then 'kirikar160' else ika2 end
	,ikaryhma_kirjoihintulovuonna =
						case 
							when ika2 in ('0','1','2') then 'ikaryh2_2'
							when ika2 in ('3','4','5') then 'ikaryh2_5'
							when ika2='6' then 'ikaryh2_6'
							when ika2 in ('7','8','9','10','11','12') then 'ikaryh2_12'
							when ika2 in ('13','14','15') then 'ikaryh2_15'
							when ika2 in ('16','17','18') then 'ikaryh2_18'
							when ika2 in ('19','20','21') then 'ikaryh2_21'
							when ika2 in ('22','23','24') then 'ikaryh2_24'
							when ika2 in ('25','26','27','28','29') then 'ikaryh2_29'
							when ika2 in ('30','31','32','33','34') then 'ikaryh2_34'
							when ika2 in ('35','36','37','38','39') then 'ikaryh2_39'
							when ika2 in ('40','41','42','43','44') then 'ikaryh2_44'
							when ika2 in ('45','46','47','48','49') then 'ikaryh2_49'
							when ika2 in ('50','51','52','53','54') then 'ikaryh2_54'
							when ika2 in ('55','56','57','58','59') then 'ikaryh2_59'
							when ika2 in ('60','61','62','63','64') then 'kirikar160'
							else '-1'
						end
	,ika = case when ika2<>'XX' and tutalv<>'-1' and cast(ika2 as int)+(cast(tilv as int)-cast(tutalv as int))>=60 then 'kirikar160' when ika2='XX' or tutalv='-1' then '-1' else cast(cast(ika2 as int)+(cast(tilv as int)-cast(tutalv as int)) as nvarchar) end
	,ikaryhma = 
		case 
			when ika_k in ('0','1','2') then 'ikaryh2_2'
			when ika_k in ('3','4','5') then 'ikaryh2_5'
			when ika_k='6' then 'ikaryh2_6'
			when ika_k in ('7','8','9','10','11','12') then 'ikaryh2_12'
			when ika_k in ('13','14','15') then 'ikaryh2_15'
			when ika_k in ('16','17','18') then 'ikaryh2_18'
			when ika_k in ('19','20','21') then 'ikaryh2_21'
			when ika_k in ('22','23','24') then 'ikaryh2_24'
			when ika_k in ('25','26','27','28','29') then 'ikaryh2_29'
			when ika_k in ('30','31','32','33','34') then 'ikaryh2_34'
			when ika_k in ('35','36','37','38','39') then 'ikaryh2_39'
			when ika_k in ('40','41','42','43','44') then 'ikaryh2_44'
			when ika_k in ('45','46','47','48','49') then 'ikaryh2_49'
			when ika_k in ('50','51','52','53','54') then 'ikaryh2_54'
			when ika_k in ('55','56','57','58','59') then 'ikaryh2_59'
			when ika_k in ('60','61','62','63','64') then 'kirikar160'
			when ika_k > '64' or ika_k like '10%' then 'kirikar160'
			when ika_k = 'kirikar160' then 'kirikar160'
			else '-1'
		end
	,lukumaara = lkm
	,koulutuksen_tutkinnon_aloitusvuosi = tutalv
	,koulutuksen_tutkinnon_aloituskausi = tutalk
	,ov_hyvaksiluettu_ennen = hyvennen
	,ov_hyvaksiluettu_aikana = hyvaik
	,ov_suoritettu_koulutuksen_aikana = suorkouaik
	,ov_yhteensa = ovyht
	,ov_tyossaoppiminen = tyop
	,lkm_ammattiosaaminen = ammos
	,lkm_opintokokonaisuus = opintokok
	,lkm_tutkintojen_osat = suorosat
	,rahoituslahde_amm = rahoitus
	,vayla_nayttotutkintoon = vayla
	,tutkinnon_tavoite = tavoite
	,tutkinnon_toteuma = toteuma_tutk
	,tietolahde = tietolahde
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = '2.4a-c'
	,koulutussektori = cast(
	(
		case
			when lahde = '*1' then '1'
			when lahde in ('21','22','23') then '2'
			when lahde in ('31','32','33','34','35','36') then '3'
			when lahde in ('41','42') then '4'
			when lahde in ('51','52') then '5'
		end
	)
	as nvarchar(2))

	,koulutuksen_jarjestamismuoto = cast(
	(
		case
			when lahde in ('31','32','33','35') then '1'
			when lahde in ('34') then '2'
		end
	)
	as nvarchar(2))
	,amm_sopimusjaksot = cast(
	(
		case 
		when koso = 2 and opso = 2 then '3'
		when koso = 1 and opso = 2 then '4'
		when koso = 2 and opso = 1 then '5'
		when koso = 1 and opso = 1 then '6'
		end
	)
	as nvarchar(2))
	,ammatillinen_peruskoulutus_lisakoulutus = cast(
	(
		case
			when tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ = '1' then '1'
			when tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ in ('2','3') then '2'
		end
	)
	as nvarchar(2))
	,koulutuksen_tavoite_toteuma = cast(
	(
		case
			when toteuma_tutk /*tutkinnon_toteuma*/ = '1' or coalesce(toteuma_tutk /*tutkinnon_toteuma*/,'')='' then '1'
			when toteuma_tutk /*tutkinnon_toteuma*/ = '2' then '2'
			when toteuma_tutk /*tutkinnon_toteuma*/ = '9' then '3'
		end
	)
	as nvarchar(2))
	,tutkinnot = cast(
		lkm /*lukumaara*/
	as int)
	,nuorten_aikuisten_koulutus_amm = cast(
	(
		case
			when f.tutktav /*ops_näyttö*/ = '1' and f.lahde in ('31','32','33','35') then 1
			when (f.tutktav /*ops_näyttö*/ in ('1','2') and f.lahde = '34') or (f.tutktav /*ops_näyttö*/ = '2' and f.lahde in ('31','32','33','35')) then 2
			else '-1'
		end
	)
	as nvarchar(2))

	,koulutuslaji_OKM_avain =
		CASE
			WHEN aikoul = '1' THEN 3 --Lukiokoulutus (nuorten koulutus)
			WHEN aikoul = '2' THEN 4 --Lukiokoulutus (aikuiskoulutus)
			
			WHEN tutklaja = 2 AND lahde in ('31','32','33','35') THEN 7 --Ammattitutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 3 AND lahde in ('31','32','33','35') THEN 8 --Erikoisammattitutkinto  (oppilaitosmuotoinen)
			WHEN tutklaja = 2 AND lahde = '34' THEN 11 --Ammattitutkinto (oppisopimuskoulutus)
			WHEN tutklaja = 3 AND lahde = '34' THEN 12 --Erikoisammattitutkinto (oppisopimuskoulutus)			
		  --tutktav poistui 2018, tarvittaessa aiemmille ops.per. 5 ja näyttö 6 
			WHEN tutklaja = 1 AND lahde in ('31','32','33','35') THEN 61 --Ammatillinen perustutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 1 AND lahde = '34' THEN 64 --Ammatillinen perustutkinto (oppisopimuskoulutus)
			
		  --opso/koso 2019-, tarvittaessa voidaan karkeistaa ja/tai tuoda sopimusjaksomuuttuja raportille
			WHEN tutklaja = 1 AND koso = 2 AND opso = 2 THEN 71
			WHEN tutklaja = 2 AND koso = 2 AND opso = 2 THEN 72
			WHEN tutklaja = 3 AND koso = 2 AND opso = 2 THEN 73
			
			WHEN tutklaja = 1 AND koso = 1 AND opso = 1 THEN 74
			WHEN tutklaja = 2 AND koso = 1 AND opso = 1 THEN 75
			WHEN tutklaja = 3 AND koso = 1 AND opso = 1 THEN 76
			
			WHEN tutklaja = 1 AND koso = 1 AND opso = 2 THEN 77
			WHEN tutklaja = 2 AND koso = 1 AND opso = 2 THEN 78
			WHEN tutklaja = 3 AND koso = 1 AND opso = 2 THEN 79
			
			WHEN tutklaja = 1 AND koso = 2 AND opso = 1 THEN 80
			WHEN tutklaja = 2 AND koso = 2 AND opso = 1 THEN 81
			WHEN tutklaja = 3 AND koso = 2 AND opso = 1 THEN 82
			
			ELSE -1
		END

	,yhtjarj = 
		CASE
			WHEN lahde in (22,23) THEN jarj
			WHEN tilv < 2013 AND lahde in (32,33) THEN jarj
			WHEN tilv >= 2013 AND lahde in (35,36) AND jarj_opisk <> '-1' THEN jarj_opisk
			WHEN tilv >= 2013 AND lahde in (35,36) AND jarj_opisk = '-1' THEN jarj
			WHEN lahde = 34 THEN opjarj
			ELSE '-1'
		END
		
/*
		  , yht_koul_jarj_kunta =
			CASE
			 WHEN lahde = 34 THEN kkun
			 ELSE '-1'
			END
*/
 
	,yht_koulutuksen_kunta = 
		CASE
			WHEN lahde in (22,23,34) THEN kkun
			WHEN tilv < 2013 AND lahde in (32,33) THEN kkun
			WHEN tilv >= 2013 AND lahde in (35,36) AND kkun_opisk <> '-1' THEN kkun_opisk
			WHEN tilv >= 2013 AND lahde in (35,36) AND kkun_opisk = '-1' THEN kkun
			ELSE '-1'
		END

	,koulutusryhma_avain =
		CASE
			WHEN aikoul = '1' THEN '21' --Lukiokoulutus (nuorten koulutus)
			WHEN aikoul = '2' THEN '22' --Lukiokoulutus (aikuiskoulutus)
			
		  --yhdistettävän 2.17 luokituksessa muutoksia tilastovuosina 2018 ja 2019
		    WHEN tilv < 2018 THEN
				CASE
					WHEN tutklaja = 1 AND lahde in ('31','32','33','35') AND tutktav = 1 THEN '31' --oppilaitosm. amm. pk., ops.per.
					WHEN tutklaja = 1 AND lahde in ('31','32','33','35') AND tutktav = 2 THEN '32' --oppilaitosm. amm. pk., näyttötutk. valm.
					WHEN tutklaja in (2,3) AND lahde in ('31','32','33','35') THEN '33' --oppilaitosm. amm. lk.
					WHEN lahde = '34' THEN '35' --oppis.
				END
			--tutktav poistui 2018
			WHEN tilv = 2018 THEN
				CASE
					WHEN tutklaja = 1 AND lahde in ('31','32','33','35') THEN '61' --Ammatillinen perustutkinto (oppilaitosmuotoinen)
					WHEN tutklaja = 2 AND lahde in ('31','32','33','35') THEN '62' --Ammattitutkinto (oppilaitosmuotoinen)
					WHEN tutklaja = 3 AND lahde in ('31','32','33','35') THEN '63' --Erikoisammattitutkinto (oppilaitosmuotoinen)
					WHEN tutklaja = 1 AND lahde = '34' THEN '64' --Ammatillinen perustutkinto (oppisopimuskoulutus)
					WHEN tutklaja = 2 AND lahde = '34' THEN '65' --Ammattitutkinto (oppisopimuskoulutus)
					WHEN tutklaja = 3 AND lahde = '34' THEN '66' --Erikoisammattitutkinto (oppisopimuskoulutus)
				END
		    --opso/koso 2019-, tarvittaessa voidaan karkeistaa ja/tai tuoda sopimusjaksomuuttuja raportille
			WHEN tutklaja = 1 AND koso = 2 AND opso = 2 THEN '71' --amm. pk., e-e
			WHEN tutklaja in (2,3) AND koso = 2 AND opso = 2 THEN '72' --amm. lk., e-e
			WHEN tutklaja = 1 AND koso = 1 AND opso = 1 THEN '74' --amm. pk., k-k
			WHEN tutklaja in (2,3) AND koso = 1 AND opso = 1 THEN '75' --amm. lk., k-k
			WHEN tutklaja = 1 AND koso = 1 AND opso = 2 THEN '77' --amm. pk., k-e
			WHEN tutklaja in (2,3) AND koso = 1 AND opso = 2 THEN '78' --amm. lk., k-e
			WHEN tutklaja = 1 AND koso = 2 AND opso = 1 THEN '80' --amm. pk., e-k
			WHEN tutklaja in (2,3) AND koso = 2 AND opso = 1 THEN '81' --amm. lk., e-k
			
			ELSE '-1'
		END
	
	,hallinnonala2 = cast(
	(
		case
		when f.ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
		when f.ophal = '2' and coalesce(coalesce(d1.koulutuksen_jarjestajan_korvaavakoodi,d1.koulutuksen_jarjestajakoodi),'') not in ('0145076-7','2153105-4','150622-3','0909306-3') /*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/ then '2' --Opetushallinto, työvoimakoulutus
		when f.ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
		else '-1'
		end
	)
	as nvarchar(2))
					
/*
JOS Aineisto=2.4 JA (lahde=22 TAI lahde=23) NIIN yhtjarj = jarj;
JOS Aineisto=2.4 JA TILV<2013 JA (lahde=32 TAI lahde=33) NIIN yhtjarj = jarj;
JOS Aineisto=2.4 JA TILV>2012 JA lahde=35 JA jarj_opisk<>”” NIIN yhtjarj = jarj_opisk;
JOS Aineisto=2.4 JA TILV>2012 JA lahde=35 JA jarj_opisk = ”” NIIN yhtjarj = jarj;
JOS Aineisto=2.4 JA lahde=34 NIIN yhtjarj = opjarj;

JOS Aineisto=2.4 JA (lahde=22 TAI lahde=23) NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.4 JA TILV<2013 JA (lahde=32 TAI lahde=33) NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.4 JA TILV>2012 JA lahde=35 JA tunn_opisk<>”” NIIN yhtoppilaitos = tunn_opisk;
JOS Aineisto=2.4 JA TILV>2012 JA lahde=35 JA tunn_opisk = ”” NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.4 JA lahde=34 NIIN yhtoppilaitos = ”Tuntematon”;

*/


FROM VipunenTK_DW.dbo.[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot] f
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain=coalesce(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1')


cross apply (SELECT 
		case 
			when ika2<>'XX' and tutalv<>'-1' and cast(ika2 as int)+(cast(tilv as int)-cast(tutalv as int))>=60 then 'kirikar160' 
			when ika2='XX' or tutalv='-1' then '-1' 
			else cast(cast(ika2 as int)+(cast(tilv as int)-cast(tutalv as int)) as nvarchar) 
		end AS ika_k) aa





GO


