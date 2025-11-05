USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_8_Korkeakouluopiskelijat]    Script Date: 5.11.2025 10.28.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_f_2_8_Korkeakouluopiskelijat] AS

-- truncate table f_2_8_Korkeakouluopiskelijat
-- insert into f_2_8_Korkeakouluopiskelijat select * from v_f_2_8_Korkeakouluopiskelijat


SELECT
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,aineisto = aineisto
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,koulutusluokitus = koulk
	,koulutuksen_kunta = kkun
	,sukupuoli = sp
	,aidinkieli_versio1x = aikielir1x
	,syntymavuosi = syntv
	,kotikunta = tilvaskun
	,kotikunta1x = tilvaskunx
	,kotikunta2x = tilvaskun2x
	,kansalaisuus_versio2 = kansalr2
	,kvopisk
	,suormaa
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
	,rahoituslahde = rahlahde
	,opiskelijan_fte_tieto = fte
	,kirjoihintulovuosi_korkeakoulusektori = alvv_kksek
	,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva = alvv_kksek_lasna
	,kirjoihintulovuosi_sektori = alvv_sek
	,kirjoihintulovuosi_sektori_lasnaoleva = alvv_sek_lasna
	,kirjoihintulovuosi_korkeakoulu = alvv_kk
	,kirjoihintulovuosi_korkeakoulu_lasnaoleva = alvv_kk_lasna
	,kirjoihintulovuosi_opintoala = alvv_opa
	,kirjoihintulovuosi_opintoala_lasnaoleva = alvv_opa_lasna
	,lukumaara = lkm
	,lkm_op0 = opyht0
	,lkm_op1_14 = opyht14
	,lkm_op15_29 = opyht29
	,lkm_op30_44 = opyht44
	,lkm_op45_59 = opyht59
	,lkm_op60_74 = opyht74
	,lkm_op75_89 = opyht89
	,lkm_op90_104 = opyht104
	,lkm_op105_119 = opyht119
	,lkm_op120_ = opyht120
	,vahintaan_55_op_suorittanut = op55
	,op_edellinen_syksy = opes
	,op_edellinen_kevat = opek
	,op_kertyma_edel_lkv_loppu = opker
	,tutkinto_amk = tutkamk
	
	,koulutusohjelma_amk = koamk
	
	,suuntautumisvaihtoehto_amk = suun_v
	
	,koulutustyyppi = koultyp
	,koulutuksen_kieli = kkieli
	,lkm_lasnalk = lasnalk
	,lkm_poissalk = poissalk
	,op_suoritettavien_laajuus = oplaaj
	,kirjoihintulovuosi_tutkinto = kirtu1v
	,kirjoihintulokausi_tutkinto = kirtu1k
	,ensisijainen_opintooikeus = ensisop
	,tilauskoulutuksen_sijaintimaa = tilmaa
	,tutkinto_yo = tutkyo
	
	,koulutusohjelma_yo = koyo
	
	,paaaine_yo = paine
	
	,yliopisto = kk
	,tiedekunta_yo = tdk
	,uusi_vanha_opiskelija = fuksi
	,tutkintooikeusvuosi = opoikv
	,opiskelumuoto = om
	,opettajankelpoisuus = opkelp
	,avoinvayla = avo
	,tietolahde = tietolahde
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = '2.8a-c'
	,koulutussektori = cast(
	(
		case
		when lahde = '*1' then '1'
		when lahde in ('21','22','23') then '2'
		when lahde in ('31','32','33','34','35') then '3'
		when lahde in ('41','42') then '4'
		when lahde in ('51','52') then '5'
		end
	)
	as nvarchar(2))
	,ika_1v = CAST(
	(
		case
		when isnumeric(syntv)=1 and syntv<tilv
		then cast(cast(tilv as int) - cast(syntv as int) as varchar)
		end
	)
	as nvarchar(4))
	--Tehdään lukumäärämuuttuja Aloittaneet, joka saa arvoja seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_kk_lasna = tilv NIIN Aloittaneet = lkm
	---JOS Aineisto=2.8b-d JA koultyp=6 JA alvv=tilv JA olosyys=1 NIIN Aloittaneet=lkm

	,aloittaneet = CAST(
	(
		case
		-- kaksi ekaa historia-aineistoja varten
			when lahde = 41 --historia-aineisto
				and alvv = tilv 
				and koultyp <> 6 
				--and ensisop = 1
				and tilv<2010
			then lkm

			when alvv = tilv 
				and koultyp = '6'
				and olosyys  IN ('1','2')
				--and ensisop = 1
				and tilv<2010
			then lkm 
		--

			when lahde = 41
				and alvv = tilv 
				and koultyp not in ('6' ,'7')
				and coalesce(ensisop,1) = 1 --sopv23 alkaen muille kuin väestöön kuuluville null
			then lkm  

			when alvv = tilv 
				and koultyp in ('6','7')
				and olosyys  IN ('1','2')
				and coalesce(ensisop,1) = 1 --sopv23 alkaen muille kuin väestöön kuuluville null
			then lkm 

			when lahde = 51
			    and tilv < 2012
				and alvv = tilv 
				and olosyys  IN ('1','2')
				--and koulk NOT IN (SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus where koulutusaste2002_koodi IN ('73','81','82','91'))
			then lkm 

			--perusopiskelijat
			when lahde = 51
			    and tilv >= 2012 
			    and not (koulk like '8%' or laak is not null)
				and (case when aineisto = 'L' then alvv_kk else alvv end) = tilv
				and olosyys IN ('1','2')
			then lkm

			--jatko-opiskelijat
			when lahde = 51
			    and tilv >= 2012 
			    and (koulk like '8%' or laak is not null) --tohtorit ja lisensiaatit ja lääkärien erikoistumiskoulutus
				and opoikv = tilv
				and olosyys IN ('1','2')
			then lkm


			/*
			when lahde = 51
			    and tilv >= 2012 and tilv < (select max(tilv) from VipunenTK_DW.dbo.sa_2_8_Korkeakoulut_opiskelijat)
			    and alvv_kk = tilv
				and olosyys IN ('1','2')
				and koulk NOT IN (SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus where koulutusaste2002_koodi IN ('73','81','82','91'))
			then lkm
			
			when lahde = 51
			    and tilv = (select max(tilv) from VipunenTK_DW.dbo.sa_2_8_Korkeakoulut_opiskelijat)
				and aineisto = (case when aineisto <> 'L' then 'E' else 'L' end) 
			    and (case when aineisto = 'L' then alvv_kk Else alvv end) = tilv
				and olosyys IN ('1','2')
				and koulk NOT IN (SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus where koulutusaste2002_koodi IN ('73','81','82','91'))
			then lkm
			*/
		end
	)
	as int)



/*


2.8:

 ,aloittaneet = CAST(
  (
   case JOS lahde = 41
   when alvv_kk_lasna /*kirjoihintulovuosi_korkeakoulu_lasnaoleva*/=tilv and koultyp <> 6 and ensiop = 1 /*tilastointivuosi*/ then lkm /*lukumaara*/

  when alvv /*kirjoihintulovuosi*/=tilv /*tilastointivuosi*/
    and koultyp /*koulutustyyppi*/='6'

   and ensiop = 1
    and olosyys /*opiskelijan_olo_syys*/ IN ('1','2')
   then lkm /*lukumaara*/

JOS lahde = 51

when alvv /*kirjoihintulovuosi*/=tilv /*tilastointivuosi*/

   and olosyys /*opiskelijan_olo_syys*/ IN ('1','2')

   and ensiop = 1
 then lkm /*lukumaara*/

  end
  )
  as int)



*/




	--Aloittaneet_alvv
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv = tilv NIIN Aloittaneet_alvv = lkm
	--Aloittaneet_alvv_kksek
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_kksek, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_kksek = tilv NIIN Aloittaneet_alvv_kksek = lkm
	--Aloittaneet_alvv_kksek_lasna
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_kksek_lasna, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_kksek_lasna = tilv NIIN Aloittaneet_alvv_kksek_lasna = lkm
	--Aloittaneet_alvv_sek
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_sek, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_sek = tilv NIIN Aloittaneet_alvv_sek = lkm
	--Aloittaneet_alvv_sek_lasna
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_sek_lasna, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_sek_lasna = tilv NIIN Aloittaneet_alvv_sek_lasna = lkm
	--Aloittaneet_alvv_kk
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_kk, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_kk = tilv NIIN Aloittaneet_alvv_kk= lkm
	--Aloittaneet_alvv_kk_lasna
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_kk_lasna, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_kk_lasna = tilv NIIN Aloittaneet_alvv_kk_lasna= lkm
	--HUOM! TÄMÄ TARKOITUKSELLA ’UUDELLEEN’ VRT. KOHTA Aloittaneet
	--Aloittaneet_alvv_opa
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_opa, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_opa = tilv NIIN Aloittaneet_alvv_opa = lkm
	--Aloittaneet_alvv_opa_lasna
	--Tehdään lukumäärämuuttuja Aloittaneet_alvv_opa_lasna, joka saa arvon seuraavasti:
	---JOS  Aineisto= 2.8a-c JA alvv_opa_lasna = tilv NIIN Aloittaneet_alvv_opa_lasna= lkm
	,aloittaneet_kirjoihintulovuosi = CAST(
	case when alvv=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_korkeakoulusektori = cast(
	case when alvv_kksek=tilv  
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_korkeakoulusektori_lasnaoleva =cast(
	case when alvv_kksek_lasna=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_sektori = cast(
	case when alvv_sek=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_sektori_lasnaoleva =cast(
	case when alvv_sek_lasna=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_korkeakoulu =cast(
	case when alvv_kk=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_korkeakoulu_lasnaoleva =cast(
	case when alvv_kk_lasna=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_opintoala =cast(
	case when alvv_opa=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)
	,aloittaneet_opintoala_lasnaoleva =cast(
	case when alvv_opa_lasna=tilv 
	and koulk NOT IN (
		SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus 
		where koulutusaste_taso2_koodi IN ('73','81','82') or koulutusaste2002_koodi IN ('73','81','82','91')
	) then lkm end
	as int)

	,opiskelijat = cast(
	(
		case
		when olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/
		end
	)
	as int)
	,opiskelijat_lasna = cast(
	(
		case
		when olosyys /*opiskelijan_olo_syys*/ in ('1') then lkm /*lukumaara*/
		end
	)
	as int)
	,opiskelijat_fte = cast(
	(
		case
		when (fte = '1' or fte = '2') and olosyys = 1 and koultyp in ('1','2','6') then fte/2.0 * lkm -- Ammattikorkeakoulut
		when lahde in (41,51) and fte in ('1','2') and olosyys = 1 then (fte/2.0) * lkm -- Yliopistot
		else NULL
		end
	)
	as decimal(18,1))


	,koulutuslaji_OKM_avain =
		CASE
			WHEN koultyp = '1'
				THEN 13	--Ammattikorkeakoulututkinto (nuorten koulutus)  
			WHEN koultyp = '2'
				THEN 14	--Ammattikorkeakoulututkinto (aikuiskoulutus)  
			WHEN koultyp = '6' 
				THEN 15	--Ylempi ammattikorkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 63 or koulutusaste2002_koodi = 63
							)
				THEN 16	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 72 or koulutusaste2002_koodi = 72
							)
				THEN 17	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 73 or koulutusaste2002_koodi = 73
							)
				OR laak is not null
				THEN 18	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 81 or koulutusaste2002_koodi = 81
							)
				THEN 19	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 82 or koulutusaste2002_koodi = 82
							)

				THEN 20	--Tohtorintutkinto

			ELSE -1
		END

	,koulutusryhma_avain =
		CASE
			WHEN koultyp = '1'
				THEN '41'	--Ammattikorkeakoulututkinto (nuorten koulutus)  
			WHEN koultyp = '2'
				THEN '42'	--Ammattikorkeakoulututkinto (aikuiskoulutus)  
			WHEN koultyp = '6' 
				THEN '46'	--Ylempi ammattikorkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 63 or koulutusaste2002_koodi = 63
							)
				THEN '51'	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 72 or koulutusaste2002_koodi = 72
							)
				THEN '51'	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 73 or koulutusaste2002_koodi = 73
							)
				OR laak is not null
				THEN '52'	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 81 or koulutusaste2002_koodi = 81
							)

				THEN '52'	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste_taso2_koodi = 82 or koulutusaste2002_koodi = 82
							)

				THEN '52'	--Tohtorintutkinto

			ELSE -1
		END

      ,ikaryhma1_avain = 
		CASE
			WHEN syntv = 9999 THEN '-1'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) >59 THEN 'kirikar160'
			ELSE cast(cast(tilv as int) - syntv as varchar(10))
		END
      ,ikaryhma2_avain = 
		CASE
			WHEN syntv = 9999 THEN '-1'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) <3 THEN 'ikaryh2_2'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 3 AND 5 THEN 'ikaryh2_5'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) = 6 THEN 'ikaryh2_6'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 7 AND 12 THEN 'ikaryh2_12'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 13 AND 15 THEN 'ikaryh2_15'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 16 AND 18 THEN 'ikaryh2_18'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 19 AND 21 THEN 'ikaryh2_21'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 22 AND 24 THEN 'ikaryh2_24'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 25 AND 29 THEN 'ikaryh2_29'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 30 AND 34 THEN 'ikaryh2_34'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 35 AND 39 THEN 'ikaryh2_39'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 40 AND 44 THEN 'ikaryh2_44'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 45 AND 49 THEN 'ikaryh2_49'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 50 AND 54 THEN 'ikaryh2_54'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 55 AND 59 THEN 'ikaryh2_59'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) between 60 AND 64 THEN 'ikaryh2_64'
			WHEN syntv <> 9999 AND (cast(tilv as int) - syntv) > 64 THEN 'ikaryh2_65'
			ELSE '-1'
		END
		,laak
		,ltop

FROM VipunenTK_DW.dbo.sa_2_8_Korkeakoulut_opiskelijat


GO


