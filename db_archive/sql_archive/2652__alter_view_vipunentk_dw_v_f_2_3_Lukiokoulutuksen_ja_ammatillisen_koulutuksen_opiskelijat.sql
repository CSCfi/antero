USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 13.11.2019 14:28:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


























ALTER VIEW [dbo].[v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] AS

-- truncate table [VipunenTK_DW]..f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
-- insert into [VipunenTK_DW]..f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat select * from v_f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
--sel
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
	,opetushallinnon_koulutus = ophal
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
	,ika_5v = kirikar1
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
		when f.lahde in ('31','32','33','34','35') then '3'
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
	,koulutuksen_jarjestamismuoto = cast(
	(
		case
		when f.lahde in ('31','32','33','35') then '1'
		when f.lahde in ('34') then '2'
		else '-1'
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
			WHEN aikoul = '1'
				THEN 3 --Lukiokoulutus (nuorten koulutus)
			WHEN aikoul = '2'
				THEN 4 --Lukiokoulutus (aikuiskoulutus)
			WHEN tutklaja = 1 AND tutktav = 1 AND lahde in ('31','32','33','35')
				THEN 5 --Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)
			WHEN tutklaja = 1 AND tutktav = 2 AND lahde in ('31','32','33','35')
				THEN 6 --Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)
			WHEN tutklaja = 2 AND lahde in ('31','32','33','35')
				THEN 7 --Ammattitutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 3 AND lahde in ('31','32','33','35')
				THEN 8 --Erikoisammattitutkinto  (oppilaitosmuotoinen)
			WHEN tutklaja = 1 AND tutktav = 1 AND lahde = '34'
				THEN 9 --Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)
			WHEN tutklaja = 1 AND tutktav = 2 AND lahde = '34'
				THEN 10 --Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)
			WHEN tutklaja = 2 AND lahde = '34'
				THEN 11 --Ammattitutkinto (oppisopimuskoulutus)
			WHEN tutklaja = 3 AND lahde = '34'
				THEN 12 --Erikoisammattitutkinto (oppisopimuskoulutus)

			ELSE -1
		END

		,yhtjarj = 
			CASE
				WHEN lahde = 21 THEN jarj
				WHEN tilv < 2013 AND (lahde = 31 OR lahde = 33 OR lahde = 35) THEN jarj
				WHEN tilv >= 2013 AND lahde = 35 THEN jarj
				WHEN lahde = 34 THEN opjarj
				ELSE '-1'
			END

		,yhtoppilaitos = 
			CASE
				WHEN lahde = 21 THEN tunn
				WHEN tilv < 2013 AND (lahde = 31 OR lahde = 33 OR lahde = 35) THEN tunn
				WHEN tilv >= 2013 AND lahde = 35 THEN tunn
				ELSE '-1'
			END

/*
		  ,yht_koul_jarj_kunta = 
			CASE
			 WHEN lahde = 34 THEN kkun
			 ELSE '-1'
			END
*/
 
 
		  ,yht_koulutuksen_kunta = 
			CASE
			 WHEN lahde = 21 THEN kkun
			 WHEN tilv < 2013 AND (lahde = 31 OR lahde = 33 OR lahde = 35) THEN kkun
			 WHEN tilv >= 2013 AND lahde = 35 THEN kkun 
			 WHEN lahde = 34 THEN kkun
			 ELSE '-1'
			END

	,koulutusryhma_avain =
		CASE
			WHEN aikoul = '1'
				THEN '21' --Lukiokoulutus (nuorten koulutus)
			WHEN aikoul = '2'
				THEN '22' --Lukiokoulutus (aikuiskoulutus)
			WHEN tutklaja = 1 AND tutktav = 1 AND lahde in ('31','32','33','35')
				THEN '31' --Ammatillinen perustutkinto (oppilaitosmuotoinen, opetussuunnitelmaperusteinen)
			WHEN tutklaja = 1 AND tutktav = 2 AND lahde in ('31','32','33','35')
				THEN '32' --Ammatillinen perustutkinto (oppilaitosmuotoinen, näyttötutkinto)
			WHEN tutklaja = 2 AND lahde in ('31','32','33','35')
				THEN '33' --Ammattitutkinto (oppilaitosmuotoinen)
			WHEN tutklaja = 3 AND lahde in ('31','32','33','35')
				THEN '33' --Erikoisammattitutkinto  (oppilaitosmuotoinen)
			WHEN tutklaja = 1 AND tutktav = 1 AND lahde = '34'
				THEN '35' --Ammatillinen perustutkinto (oppisopimuskoulutus, opetussuunnitelmaperusteinen)
			WHEN tutklaja = 1 AND tutktav = 2 AND lahde = '34'
				THEN '35' --Ammatillinen perustutkinto (oppisopimuskoulutus, näyttötutkinto)
			WHEN tutklaja = 2 AND lahde = '34'
				THEN '35' --Ammattitutkinto (oppisopimuskoulutus)
			WHEN tutklaja = 3 AND lahde = '34'
				THEN '35' --Erikoisammattitutkinto (oppisopimuskoulutus)

			ELSE -1
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
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain=coalesce(nullif(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1'),f.tunn)


























GO


USE [ANTERO]