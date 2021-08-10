USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 5.8.2021 19:45:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] AS

-- truncate table [VipunenTK_DW]..f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
-- insert into [VipunenTK_DW].dbo.f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat select * from v_f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat

SELECT
	 tilastointivuosi = tilv
	,tilv_date
	,lahde
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusluokitus = koulk
	,sukupuoli = sp
	,aidinkieli = aikielir1
	,asuinmaakunta = tilvasmaak
	,aikuisopiskelija = aiopis
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
	,ika = case when ika2<>'XX' and cast(ika2 as int)+(cast(tilv as int)-cast(alvv as int))>=60 then 'kirikar160' when ika2='XX' then '-1' else cast(cast(ika2 as int)+(cast(tilv as int)-cast(alvv as int)) as nvarchar) end
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
			
	
	,koulutuksen_kieli = kkieli
	,koulutuksen_kunta = kkun
	,opetushallinnon_koulutus = ophal
	,kirjoihintulovuosi = alvv
	,opiskelijan_olo_syys = olosyys
	,lukumaara = lkm
	,nuorten_aikuisten_koulutus = aikoul
	,koulutuksen_tutkinnon_aloitusvuosi = tutalv
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,tutkintonimike_ammpk = tunim
	--,tutkintonimike_suomi = sutunim
	--,tutkintonimike_ruotsi = rutunim
	,koulutusohjelma_ammpk = koohj
	--,koulutusohjelma_suomi = sukoohj
	--,koulutusohjelma_ruotsi = rukoohj
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,rahoituslahde_amm = rahoitus
	,tutkinnon_tavoite = tavoite
	,f.tietolahde
	,rivinumero
-- johdetut
	,aineistotunnus = '2.3efg'
	,koulutussektori = cast(
	(
		case
		when f.lahde = '*1' then '1'
		when f.lahde in ('21','22','23') then '2'
		when f.lahde in ('31','32','33','34','35','36') then '3'
		when f.lahde in ('41','42') then '4'
		when f.lahde in ('51','52') then '5'
		else '-1'
		end
	)
	as nvarchar(2))

	,koulutuksen_jarjestamismuoto = cast(
	(
		case
		when f.lahde in ('31','32','33','35') then '1'
		when f.lahde in ('34') then '2'
		else '-1'
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
		when f.tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ = '1' then '1'
		when f.tutklaja /*ammatillisen_koulutuksen_koulutuslaji*/ in ('2','3') then '2'
		else '-1'
		end
	)
	as nvarchar(2))
	,koulutuksen_tavoite_toteuma = cast(
	(
		case
		when f.tavoite /*tutkinnon_tavoite*/ = '1' or coalesce(f.tavoite /*tutkinnon_tavoite*/,'')='' then '1'
		when f.tavoite /*tutkinnon_tavoite*/ = '2' then '2'
		when f.tavoite /*tutkinnon_tavoite*/ = '9' then '3'
		else '-1'
		end
	)
	as nvarchar(2))

	,aloittaneet = CAST(
	(
		case 
		when f.alvv /*kirjoihintulovuosi*/ = f.tilv /*tilastointivuosi*/ 
		     and (f.lahde <> '21' /*ei-lukio*/ or f.olosyys /*opiskelijan_olo_syys*/ in ('1','2'))
		then f.lkm /*lukumaara*/ 
		end
	)
	as int)

	,opiskelijat = cast(
	(
		case
		when f.lahde <> '21' /*ei-lukio*/ or f.olosyys /*opiskelijan_olo_syys*/ in ('1','2') 
		then f.lkm /*lukumaara*/
		end
	)
	as int)

	,opiskelijat_lasna = cast(
	(
		case
		when f.olosyys /*opiskelijan_olo_syys*/ in ('1') then f.lkm /*lukumaara*/
		end
	)
	as int)
	,nuorten_aikuisten_koulutus_amm = cast(
	(
		case
		when f.tutktav /*ops_näyttö*/ = '1' and f.lahde in ('31','32','33','35') then 1
		when (f.tutktav /*ops_näyttö*/ in ('1','2') and f.lahde = '34' )
		or (f.tutktav /*ops_näyttö*/ = '2' and f.lahde in ('31','32','33','35')) then 2
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
			
			WHEN tutklaja = 1 AND koso = 1 AND opso = 2 THEN 74
			WHEN tutklaja = 2 AND koso = 1 AND opso = 2 THEN 75
			WHEN tutklaja = 3 AND koso = 1 AND opso = 2 THEN 76
			
			WHEN tutklaja = 1 AND koso = 2 AND opso = 1 THEN 77
			WHEN tutklaja = 2 AND koso = 2 AND opso = 1 THEN 78
			WHEN tutklaja = 3 AND koso = 2 AND opso = 1 THEN 79
			
			WHEN tutklaja = 1 AND koso = 1 AND opso = 1 THEN 80
			WHEN tutklaja = 2 AND koso = 1 AND opso = 1 THEN 81
			WHEN tutklaja = 3 AND koso = 1 AND opso = 1 THEN 82
			
			ELSE -1
		END

	,yhtjarj = 
		CASE
			WHEN lahde in (21,31,33,35,36) THEN jarj
			WHEN lahde = 34 THEN opjarj
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
		  ,yht_koul_jarj_kunta = 
			CASE
			 WHEN lahde = 34 THEN kkun
			 ELSE '-1'
			END
*/
 
 
/* 

JOS Aineisto=2.3 JA lahde=21 NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA TILV<2013 JA (lahde=31 TAI lahde=33) NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA TILV>2012 JA lahde=35 NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA lahde=34 NIIN yhtjarj = opjarj;

JOS Aineisto=2.3 JA lahde=21 NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA TILV<2013 JA (lahde=31 TAI lahde=33) NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA TILV>2012 JA lahde=35 NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA lahde=34 NIIN yhtoppilaitos = ”Tuntematon”;

*/


FROM VipunenTK_DW.dbo.sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat AS f
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain=coalesce(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1')
cross apply (SELECT 
		case 
			when ika2<>'XX' and cast(ika2 as int)+(cast(tilv as int)-cast(alvv as int))>=60 then 'kirikar160' 
			when ika2 = 'XX' then '-1' 
			else cast(cast(ika2 as int)+(cast(tilv as int)-cast(alvv as int)) as nvarchar) 
		end AS ika_k) aa


GO


