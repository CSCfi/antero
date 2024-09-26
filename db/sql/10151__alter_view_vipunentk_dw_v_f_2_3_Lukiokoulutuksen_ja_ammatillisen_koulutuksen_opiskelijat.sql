USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 26.9.2024 10:23:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] AS

-- truncate table [VipunenTK_DW]..f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
-- insert into [VipunenTK_DW]..f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat select * from v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat

SELECT
	 tilastointivuosi = tilv
	,tilv_date
	,lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusluokitus = koulk
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
	,opiskelijan_olo_tamm = olotamm
	,opiskelijan_olo_syys = olosyys
	,aikuisopiskelija = aiopis
	,ika_kirjv_1v = case when kirika2 = 60 then 'kirikar160' else kirika2 end
	,ika_kirjv_5v = kirikar1
	,ika_tilv_1v = case when tilvika2 = 60 then 'kirikar160' else tilvika2 end
	,ika_tilv_5v = tilvikar1
	,lukumaara = lkm
	,lukiokoulutuksen_koulutuslaji = tutklajl
	,nuorten_aikuisten_koulutus = aikoul
	,koulutuksen_tutkinnon_aloitusvuosi = tutalv
	,koulutuksen_tutkinnon_aloituskausi = tutalk
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,tutkintonimike_ammpk = tunim
	
	,koulutusohjelma_ammpk = koohj
	
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,tyovoimapoliittinen_koulutus = tyov
	,tuva_opiskeluoikeus_amm = tuva
	,rahoituslahde_amm = rahoitus
	,alkamispaivamaara = alaika
	,paattymispaivamaara = loaika
	,tutkinnon_tavoite = tavoite
	,yrittajan_oppisopimuskoulutus = yrit
	,oppisopimus_purkautunut = purku
	,todistus_oppisopimuskoulutuksen_suorittamisesta = todis
	,toimiala_2008 = tol2008
	,oppisopimus_yrityksen_koko = koko
	,tyonantajasektori = tyansek
	,asuinmaakunta = tilvasmaak
	,tietolahde
	,rivinumero
-- johdetut
	,aineistotunnus = '2.3a-d'
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
	,hallinnonala = cast(
	(
		case
		when f.ophal /*opetushallinnon_koulutus*/ = '1' then '1'
		when f.tyov  /*tyovoimapoliittinen_koulutus*/ = '1' then '2'
		when f.ophal /*opetushallinnon_koulutus*/<>'1' and f.tyov /*tyovoimapoliittinen_koulutus*/<>'1' then '3'
		else '-1'
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
	,tyovoimapoliittinen = cast(
	(
		case
		when f.tyov /*tyovoimapoliittinen_koulutus*/ = '1' then '1'
		when f.tyov /*tyovoimapoliittinen_koulutus*/ = '2' or coalesce(f.tyov /*tyovoimapoliittinen_koulutus*/,'')='' then '2'
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
			WHEN lahde in (21,31,33,35,36) THEN jarj
			WHEN lahde = 34 THEN opjarj
			ELSE '-1'
		END

	,yhtoppilaitos = tunn
	,yht_koulutuksen_kunta = kkun

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

JOS Aineisto=2.3 JA lahde=21 NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA TILV<2013 JA (lahde=31 TAI lahde=33) NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA TILV>2012 JA lahde=35 NIIN yhtjarj = jarj;
JOS Aineisto=2.3 JA lahde=34 NIIN yhtjarj = opjarj;

JOS Aineisto=2.3 JA lahde=21 NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA TILV<2013 JA (lahde=31 TAI lahde=33) NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA TILV>2012 JA lahde=35 NIIN yhtoppilaitos = tunn;
JOS Aineisto=2.3 JA lahde=34 NIIN yhtoppilaitos = ”Tuntematon”;

*/


FROM VipunenTK_DW.dbo.sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat AS f
--left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain=coalesce(nullif(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1'),f.tunn)


GO


