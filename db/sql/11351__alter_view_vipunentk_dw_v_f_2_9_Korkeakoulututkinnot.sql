USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_9_Korkeakoulututkinnot]    Script Date: 5.11.2025 10.28.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_2_9_Korkeakoulututkinnot] AS

-- truncate table f_2_9_Korkeakoulututkinnot
-- insert into f_2_9_Korkeakoulututkinnot select * from v_f_2_9_Korkeakoulututkinnot

SELECT
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,aineisto = aineisto
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,koulutusluokitus = koulk
	,opintoala1995 = opm95opa
	,koulutuksen_kunta = kkun
	,sukupuoli = sp
	,aidinkieli_versio1x = aikielir1x
	,syntymavuosi = syntv
	,kotikunta = tilvaskun
	,kotikunta1x = tilvaskunx
	,kansalaisuus_versio2 = kansalr2
	,kvopisk
	,suormaa
	,kirjoihintulovuosi =			CASE
										WHEN alvv IS NULL or alvv = '' or alvv = '0998' THEN 'Tuntematon'
										else cast(alvv AS varchar(10))
									end
	,jarjestys_kirjoihintulovuosi = CASE
										WHEN alvv IS NULL or alvv = '' THEN 9999
										else cast(alvv AS int)
									end
	,kirjoihintulokausi = allk
	,tutkinnon_suoritusvuosi = suorv
	,tutkinnon_suorituslukukausi = suorlk
	,rahoituslahde = rahlahde
	,kirjoihintulovuosi_korkeakoulusektori = alvv_kksek
	,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva = alvv_kksek_lasna
	,kirjoihintulovuosi_sektori = alvv_sek
	,kirjoihintulovuosi_sektori_lasnaoleva = alvv_sek_lasna
	,kirjoihintulovuosi_korkeakoulu = alvv_kk
	,kirjoihintulovuosi_korkeakoulu_lasnaoleva = alvv_kk_lasna
	,kirjoihintulovuosi_opintoala = alvv_opa
	,kirjoihintulovuosi_opintoala_lasnaoleva = alvv_opa_lasna
	,lukumaara = lkm
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
	,op_amk_yhteensa = opyhtamk
	,op_amk_yleissiv_amm_opplait = opylamamk
	,op_amk_muualla = opmuuamk
	,op_amk_oma_amk = opoamk
	,op_amk_muu_amk = opmamk
	,op_amk_yliopistoissa = opyliopamk
	,op_amk_ulkomailla = opulkomamk
	,tilauskoulutuksen_sijaintimaa = tilmaa
	,tutkinto_yo = tutkyo
	
	,koulutusohjelma_yo = koyo
	
	,paaaine_yo = paine
	
	,tiedekunta_yo = tdk
	,opiskelumuoto = om
	,opettajankelpoisuus = opkelp
	,op_yo_yhteensa = opyhtyo
	,op_yo_ulkomailla = opulkyo
	,op_yo_muualla = opmuuyo
	,op_yo_oma_yo = opoylio
	,op_yo_avoimessa = opaylio
	,op_yo_muu_yo = opmylio
	,op_yo_ammattikorkeakouluissa = opamkyo
	,liikkuvuuden_kesto
	,tietolahde = tietolahde
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = '2.9a-c'
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
	,tutkinnot = cast(
		lkm /*lukumaara*/
	as int)

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
							where koulutusaste2002_koodi = 63
							or koulutusaste_taso2_koodi = 63
							)
				THEN 16	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 72
							or koulutusaste_taso2_koodi = 72
							)
				THEN 17	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 73
							or koulutusaste_taso2_koodi = 73
							)
				OR laak <> ''
				THEN 18	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 81
							or koulutusaste_taso2_koodi = 81
							)

				THEN 19	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 82
							or koulutusaste_taso2_koodi = 82
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
							where koulutusaste2002_koodi = 63
							or koulutusaste_taso2_koodi = 63
							)
				THEN '51'	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 72
							or koulutusaste_taso2_koodi = 72
							)
				THEN '51'	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 73
							or koulutusaste_taso2_koodi = 73
							)
				OR laak is not null
				THEN '52'	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 81
							or koulutusaste_taso2_koodi = 81
							)
				THEN '52'	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT distinct [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 82
							or koulutusaste_taso2_koodi = 82
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

FROM VipunenTK_DW.dbo.[sa_2_9_Korkeakoulut_tutkinnot]



GO


