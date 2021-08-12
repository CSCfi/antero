USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 5.8.2021 19:45:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] AS

-- truncate table [VipunenTK_DW]..f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
-- insert into [VipunenTK_DW].dbo.f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat select * from v_f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat

SELECT
	 tilastointivuosi = tilv
	,tilv_date
	,lahde
	,koulk
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,oppisopimuskoulutuksen_jarjestaja = opjarj
	,koulutusaste = opmast
	,koulutusaste_taso2 = kaste_t2
	,koulutusala = opmala
	,koulutusala_taso1 = iscfibroad2013
	,koulutuksen_kieli = kkieli
	,koulutuksen_kunta = kkun
	,opetushallinnon_koulutus = ophal
	,kotikunta = tilvaskun
	,kotikunta_ed = tilvaskunx
	,kirjoihintulovuosi = alvv
	,opiskelijan_olo_syys = olosyys
	,ika_1v = case when ika2 = 60 then 'kirikar160' else ika2 end
	,ika_5v = kirikar1
	,lukumaara = lkm
	,lukiokoulutuksen_koulutuslaji = tutklajl
	,nuorten_aikuisten_koulutus = aikoul
	,ammatillisen_koulutuksen_koulutuslaji = tutklaja
	,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = tutktav
	,tyovoimapoliittinen_koulutus = tyov
	,rahoituslahde_amm = rahoitus
	,tutkinnon_tavoite = tavoite
	,yrittajan_oppisopimuskoulutus = yrit
	,f.tietolahde
	,rivinumero
-- johdetut
	,aineistotunnus = '2.3h'
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

	,yhtoppilaitos = 
		CASE
			WHEN lahde in (21,31,33,35,36) THEN tunn
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
		WHEN lahde in (21,31,33,35,36) THEN kkun
		ELSE '-1'
	END

	,kotikunta_sama_kuin_koulutuksen_kunta = 
	CASE
		WHEN tilvaskun in (999) or kkun in (200,999) THEN '-1'
		WHEN tilvaskun=kkun THEN '1'
		WHEN tilvaskun<>kkun then '0'
		ELSE '-1'
	END

	,kotimaakunta_sama_kuin_koulutuksen_maakunta =
	CASE	
		WHEN tilvaskun in (999) or kkun in (200,999) then '-1'
		WHEN d2.maakunta_koodi=d1.maakunta_koodi THEN '1'
		WHEN d2.maakunta_koodi<>d1.maakunta_koodi THEN '0'
		ELSE '-1'
	END

	,kotikunta_sama_kuin_ed_vuonna = 
	CASE
		WHEN tilvaskun=999 or tilvaskunx=999 or (tilvaskun=200 and tilvaskunx=200) then '-1'
		WHEN tilvaskun=tilvaskunx THEN '1'
		WHEN tilvaskun<>tilvaskunx THEN '0'
		ELSE '-1'
	END
 
	,kotimaakunta_sama_kuin_ed_vuonna =
	CASE	
		WHEN tilvaskun=999 or tilvaskunx=999 or (tilvaskun=200 and tilvaskunx=200) then '-1'
		WHEN d2.maakunta_koodi=d3.maakunta_koodi THEN '1'
		WHEN d2.maakunta_koodi<>d3.maakunta_koodi THEN '0'
		ELSE '-1'
	END

	,ed_vuoden_kotimaakunta_sama_kuin_koulutuksen_maakunta =
	CASE	
		WHEN tilvaskunx=999 or kkun=999 or (tilvaskunx=200 and kkun=200) then '-1'
		WHEN d3.maakunta_koodi=d1.maakunta_koodi THEN '1'
		WHEN d3.maakunta_koodi<>d1.maakunta_koodi THEN '0'
		ELSE '-1'
	END

	,ed_vuoden_kotikunta_sama_kuin_koulutuksen_kunta =
	CASE	
		WHEN tilvaskunx=999 or kkun=999 or (tilvaskunx=200 and kkun=200) then '-1'
		WHEN tilvaskunx=kkun THEN '1'
		WHEN tilvaskunx<>kkun THEN '0'
		ELSE '-1'
	END

	,hallinnonala2 = cast(
	(
		case
		when f.ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
		when f.ophal = '2' and coalesce(coalesce(d4.koulutuksen_jarjestajan_korvaavakoodi,d4.koulutuksen_jarjestajakoodi),'') not in ('0145076-7','2153105-4','150622-3','0909306-3') /*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/ then '2' --Opetushallinto, työvoimakoulutus
		when f.ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
		else '-1'
		end
	)
	as nvarchar(2))

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

FROM VipunenTK_DW.dbo.sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat AS f
left join VipunenTK.dbo.d_alueluokitus d1 on d1.kunta_koodi=f.kkun
left join VipunenTK.dbo.d_alueluokitus d2 on d2.kunta_koodi=f.tilvaskun
left join VipunenTK.dbo.d_alueluokitus d3 on d3.kunta_koodi=f.tilvaskunx
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4 on d4.oppilaitos_avain=coalesce(nullif(coalesce(nullif(f.jarj,'-1'),f.opjarj),'-1'),f.tunn)


GO


