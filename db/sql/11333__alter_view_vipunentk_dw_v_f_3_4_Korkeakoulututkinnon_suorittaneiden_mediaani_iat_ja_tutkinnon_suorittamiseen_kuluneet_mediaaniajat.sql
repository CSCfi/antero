USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]    Script Date: 30.10.2025 9.55.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] AS

-- truncate table f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat
-- insert into f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat select * from v_f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat

SELECT 
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,koulutusluokitus = koulk
	,koulutustyyppi = koultyp
	,rahoituslahde = rahlahde_v2
	,kv_opiskelija = kvopisk
	,sukupuoli = sp
	,aidinkieli_versio1 = aikielir1
	,syntymavuosi = syntv
	,syntymakuukausi = synkk
	,kirjoihintulovuosi = alvv
	,kirjoihintulokausi = allk
	,kirjoihintulovuosi_korkeakoulu = alvv_kk
	,kirjoihintulokausi_korkeakoulu = allk_kk
	,tutkinnon_suoritusvuosi = suorv
	,tutkinnon_suorituskuukausi = suorkk
	,lukumaara = lkm
	,tietolahde = left(t.tietolahde,50)
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = '3.4'
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
	
	,suoritusika = CAST(
	(
		case
		when ISNUMERIC(syntv)=1 and LEN(syntv)=4
		and ISNUMERIC(synkk)=1 and synkk between 1 and 12
		and ISNUMERIC(suorv)=1 and LEN(suorv)=4
		and ISNUMERIC(suorkk)=1 and suorkk between 1 and 12
		and syntv<suorv
		then
		cast(
		 cast( ( cast(suorv as integer) + (cast(suorkk as decimal)/12) )
			 - ( cast(syntv as integer) + (cast(synkk  as decimal)/12) ) as decimal(18,6))
			 as decimal(18,6))
			 ELSE cast(-1 as decimal(18,6))
		end
	)
	as decimal(18,6))

	,jarjestys_suoritusika = CAST(
	(
		case
		when ISNUMERIC(syntv)=1 and LEN(syntv)=4
		and ISNUMERIC(synkk)=1 and synkk between 1 and 12
		and ISNUMERIC(suorv)=1 and LEN(suorv)=4
		and ISNUMERIC(suorkk)=1 and suorkk between 1 and 12
		and syntv<suorv
		then
		cast(
		 cast( ( cast(suorv as integer) + (cast(suorkk as decimal)/12) )
			 - ( cast(syntv as integer) + (cast(synkk  as decimal)/12) ) as decimal(4,1))
			 as int)
			 ELSE -1
		end
	)
	as int)
	
	,suoritusaika = CAST(
	(
		case
			when
				alvv = suorv
				and allk = 2
				and suorkk < 9
			then cast(0 as decimal(18,6))   -- negatiiviset suoritusajat nollaksi

		when isnumeric(suorv)=1 and LEN(suorv)=4
		 and isnumeric(suorkk)=1 and cast(suorkk as int) between 1 and 12
		 and isnumeric(alvv)=1 and LEN(alvv)=4
		 and isnumeric(allk)=1 and allk in ('1','2')
		then

				cast( 

				(cast(suorv as integer) + cast(suorkk as decimal)/12)
					- 
				(cast(alvv as int) + (CASE WHEN allk = 1 THEN 0 WHEN d.koulutusaste_taso2_koodi in ('81','82') THEN /*tutkija-aste ohjattu allk='2'*/ 7.0/12 ELSE 9.0/12 END))
		  
				as decimal(18,6))
		ELSE cast(-1 as decimal(18,6))
		end
	)
	as decimal(18,6))

	,jarjestys_suoritusaika = CAST(
	(
		case
		when isnumeric(suorv)=1 and LEN(suorv)=4
		 and isnumeric(suorkk)=1 and cast(suorkk as int) between 1 and 12
		 and isnumeric(alvv)=1 and LEN(alvv)=4
		 and isnumeric(allk)=1 and allk in ('1','2')
		then

				cast( 

				(cast(suorv as integer) + cast(suorkk as decimal)/12)
					- 
				(cast(alvv as int) + CASE WHEN allk = 1 THEN 0 WHEN d.koulutusaste_taso2_koodi in ('81','82') THEN /*tutkija-aste ohjattu allk='2'*/ 7.0/12 ELSE 9.0/12 END)
		  
				as int)
		ELSE -1
		end
	)
	as int)

	,suoritusaika_kk = CAST(
	(
		case
			when
				alvv_kk = suorv
				and allk_kk = 2
				and suorkk < 9
			then cast(0 as decimal(18,6))   -- negatiiviset suoritusajat nollaksi
	
		when isnumeric(suorv)=1 and LEN(suorv)=4
		 and isnumeric(suorkk)=1 and cast(suorkk as int) between 1 and 12
		 and isnumeric(alvv_kk)=1 and LEN(alvv_kk)=4
		 and isnumeric(allk_kk)=1 and allk_kk in ('1','2')
		then

				cast( 

				(cast(suorv as integer) + cast(suorkk as decimal)/12)
					- 
				(cast(alvv_kk as int) + CASE WHEN allk_kk = 1 THEN 0 ELSE 7/12 END)
		  
				as decimal(18,6))
		ELSE cast(-1 as decimal(18,6))
		end
	)
	as decimal(18,6))

	,jarjestys_suoritusaika_kk = CAST(
	(
		case
		when isnumeric(suorv)=1 and LEN(suorv)=4
		 and isnumeric(suorkk)=1 and cast(suorkk as int) between 1 and 12
		 and isnumeric(alvv_kk)=1 and LEN(alvv_kk)=4
		 and isnumeric(allk_kk)=1 and allk_kk in ('1','2')
		then

				cast( 

				(cast(suorv as integer) + cast(suorkk as decimal)/12)
					- 
				(cast(alvv_kk as int) + CASE WHEN allk_kk = 1 THEN 0 ELSE 7/12 END)
		  
				as int)
		ELSE -1
		end
	)
	as int)

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
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 63 or koulutusaste_taso2_koodi = 63
							)
				THEN 16	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 72 or koulutusaste_taso2_koodi = 72
							)
				THEN 17	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 73 or koulutusaste_taso2_koodi = 73
							)
				THEN 18	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 81 or koulutusaste_taso2_koodi = 81
							)

				THEN 19	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 82 or koulutusaste_taso2_koodi = 82
							)

				THEN 20	--Tohtorintutkinto

			ELSE -1
		END


FROM VipunenTK_DW.dbo.sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk


GO


