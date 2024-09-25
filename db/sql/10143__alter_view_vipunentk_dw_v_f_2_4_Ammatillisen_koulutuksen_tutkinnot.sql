USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_4_Ammatillisen_koulutuksen_tutkinnot]    Script Date: 25.9.2024 15:11:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_2_4_Ammatillisen_koulutuksen_tutkinnot] AS

-- truncate table f_2_4_Ammatillisen_koulutuksen_tutkinnot
-- insert into f_2_4_Ammatillisen_koulutuksen_tutkinnot select * from v_f_2_4_Ammatillisen_koulutuksen_tutkinnot

SELECT
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusluokitus = koulk
	,tutkintonimike_ammpk = tunim
	
	,koulutusohjelma_ammpk = koohj
	
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,koulutuksen_kieli = kkieli
	,koulutuksen_kunta = kkun
	,opetushallinnon_koulutus = 
		case 
			when ophal in ('1','2') then '1' --k
			when ophal = '3' then '2' --e
			else '-1' 
		end 
	,sukupuoli = sp
	,aidinkieli_versio1 = aikielir1
	,kirjoihintulovuosi =			CASE
										WHEN alvv IS NULL or alvv = '' THEN 'Tuntematon'
										else cast(alvv AS varchar(10))
									end
	,jarjestys_kirjoihintulovuosi = CASE
										WHEN alvv IS NULL or alvv = '' THEN 9999
										else cast(alvv AS int)
									end

	,kirjoihintulokausi = allk
	,aikuisopiskelija = aiopis
	,nuorten_aikuisten_koulutus = aikoul
	,ika_kirjv_1v = case when kirika2 = 60 then 'kirikar160' else kirika2 end
	,ika_kirjv_5v = kirikar1
	,ika_tilv_1v = case when tilvika2 = 60 then 'kirikar160' else tilvika2 end
	,ika_tilv_5v = tilvikar1
	,ika_tilv = tilvika
	,suorituspaivamaara = suorpvm
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
	,tyovoimapoliittinen_koulutus = tyov
	,tuva_opiskeluoikeus_amm = tuva
	,rahoituslahde_amm = rahoitus
	,vayla_nayttotutkintoon = vayla
	,alkamispaivamaara = alaika
	,paattymispaivamaara = loaika
	,tutkinnon_tavoite = tavoite
	,tutkinnon_toteuma = toteuma_tutk
	,yrittajan_oppisopimuskoulutus = yrit
	,oppisopimus_purkautunut = purku
	,todistus_oppisopimuskoulutuksen_suorittamisesta = todis
	,toimiala_2008 = tol2008
	,oppisopimus_yrityksen_koko = koko
	,tyonantajasektori = tyansek
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
	,hallinnonala = cast(
	(
		case
		when ophal /*opetushallinnon_koulutus*/ = '1' then '1'
		when tyov  /*tyovoimapoliittinen_koulutus*/ = '1' then '2'
		when ophal /*opetushallinnon_koulutus*/<>'1' and tyov /*tyovoimapoliittinen_koulutus*/<>'1' then '3'
		end
	)
	as nvarchar(2))
	,hallinnonala2 = f.ophal --ophal muuttunut 3-luokkaiseksi tilv21, päätelty takautuvastikin jo sa-näkymään. JS 9.9.2022
	/*cast(
	(
		case
		when f.ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
		when f.ophal = '2' and coalesce(coalesce(d1.koulutuksen_jarjestajan_korvaavakoodi,d1.koulutuksen_jarjestajakoodi),'') not in ('0145076-7','2153105-4','150622-3','0909306-3') /*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/ then '2' --Opetushallinto, työvoimakoulutus
		when f.ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
		else '-1'
		end
	)
	as nvarchar(2))*/
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
	,tyovoimapoliittinen = cast(
	(
		case
		when tyov /*tyovoimapoliittinen_koulutus*/ = '1' then '1'
		when tyov /*tyovoimapoliittinen_koulutus*/ = '2' or coalesce(tyov /*tyovoimapoliittinen_koulutus*/,'')='' then '2'
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
		when (f.tutktav /*ops_näyttö*/ in ('1','2') and f.lahde = '34')
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
		
	,yhtoppilaitos = 
		CASE
			WHEN lahde in (22,23,34) THEN tunn
			WHEN tilv < 2013 AND lahde in (32,33) THEN tunn
			WHEN tilv >= 2013 AND lahde in (35,36) AND tunn_opisk <> '-1' THEN tunn_opisk
			WHEN tilv >= 2013 AND lahde in (35,36) AND tunn_opisk = '-1' THEN tunn
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


FROM VipunenTK_DW.dbo.[sa_2_4_Amm_koulutuksen_tutkinnot] f
--left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain = coalesce(nullif(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1'),f.tunn)

GO


