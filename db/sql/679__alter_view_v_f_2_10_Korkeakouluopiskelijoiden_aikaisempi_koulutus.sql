USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 25.7.2017 13:50:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] AS
 
SELECT 
       tilastointivuosi = [tilv]
      ,tilv_date=[tilv_date]
      ,lahde = [lahde]
      ,oppilaitoksen_taustatiedot = [tunn]
      ,koulutusluokitus = [koulk]
	  ,koulutuksen_kunta = [kkun]
	  ,sukupuoli = [sp]
	  ,aidinkieli_versio1 = [aikielir1]
	  ,ika_1v = cast (
      (
         case 
         when [syntv] = 'XXXX' then '-1' 
         when [syntv] = '' then '-1'
         when ((cast(tilv as int) - cast(syntv as int)) <= 14 ) then '1141'
         else ((cast(tilv as int) - cast(syntv as int)))
         end) as nvarchar (10))
      ,ika_5v =cast(
       (
		case
		when [syntv] = 'XXXX' then '-1'
		when [syntv] = '' then '-1'
		when ((cast(tilv as int) - cast(syntv as int)) <= 19) then '19655v19'
		when ((cast(tilv as int) - cast(syntv as int)) >= 20 and (cast(tilv as int) - cast(syntv as int)) <= 24) then '19655v20'
		when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '19655v25'
		when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '19655v30'
		when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '19655v35'
		when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '19655v40'
		when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '19655v45'
		when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '19655v50'
		when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '19655v55'
        when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '19655v60'
		when ((cast(tilv as int) - cast(syntv as int)) >= 65) then '19655v65'
		
		end
	   ) as nvarchar (10))
      ,ika_14_65 =cast(
       (
		case
		when [syntv] = 'XXXX' then '-1'
		when [syntv] = '' then '-1'
		when ((cast(tilv as int) - cast(syntv as int)) <= 14)  then '1141'
		when ((cast(tilv as int) - cast(syntv as int)) = 15 )  then '15'
		when ((cast(tilv as int) - cast(syntv as int)) = 16) then '16'
		when ((cast(tilv as int) - cast(syntv as int)) = 17) then '17'
		when ((cast(tilv as int) - cast(syntv as int)) = 18) then '18'
		when ((cast(tilv as int) - cast(syntv as int)) = 19) then '19'
		when ((cast(tilv as int) - cast(syntv as int)) = 20) then '20'
		when ((cast(tilv as int) - cast(syntv as int)) = 21) then '21'
		when ((cast(tilv as int) - cast(syntv as int)) = 22) then '22'
		when ((cast(tilv as int) - cast(syntv as int)) = 23) then '23'
		when ((cast(tilv as int) - cast(syntv as int)) = 24) then '24'
		when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '19655v25'
		when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '19655v30'
		when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '19655v35'
		when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '19655v40'
		when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '19655v45'
		when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '19655v50'
		when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '19655v55'
        when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '19655v60'
		when ((cast(tilv as int) - cast(syntv as int)) >= 65) then '19655v65'
		end
	   ) as nvarchar (10))
	   ,kotikunta = [tilvaskun]
	   ,kansalaisuus_versio2 = [kansal]
	   ,opiskelijan_olo_tamm = [olotamm]
	   ,opiskelijan_olo_syys = [olosyys]
	   ,rahoituslahde = rahlahde
	   ,opiskelijan_fte_tieto = [fte]
	   ,vahintaan_45_op_suorittanut = [op45]
	   ,vahintaan_55_op_suorittanut = [op55]
	   ,kirjoihintulovuosi = [alvv]
	   ,kirjoihintulolukukausi = [allk]
	   ,kirjoihintulovuosi_korkeakoulusektori = [alvv_kksek]
	   ,kirjoihintulovuosi_korkeakoulusektori_lasnaoleva = [alvv_kksek_lasna]
	   ,kirjoihintulovuosi_sektori= [alvv_sek]
	   ,kirjoihintulovuosi_sektori_lasnaoleva = [alvv_sek_lasna]
	   ,kirjoihintulovuosi_korkeakoulu = [alvv_kk]  
	   ,kirjoihintulovuosi_korkeakoulu_lasnaoleva = [alvv_kk_lasna]
	   ,kirjoihintulovuosi_opintoala = [alvv_opa]
	   ,kirjoihintulovuosi_opintoala_lasnaoleva = [alvv_opa_lasna]
	   ,koulutustyyppi = [koulutyp]
	   ,opiskelumuoto = [om]
	   ,avoinvayla = [avo]
	   ,aikaisemmin_suoritettu_yotutk = [aikyotutk]
	   ,aikaisemmin_suoritettu_yotutk_tarkempi= CAST(
      (
		case
		when [aikyotutk] = '1' then 'Aikaisemmin suoritettu ylioppilastutkinto'
		else 'Ei suoritettu ylioppilastutkintoa'
		end
	   )as nvarchar(100))
	   ,yotutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikyotutk = '1' and ((cast(alvv as int) - cast(suvuosiyotutk as int) >= 0))) then 'Ylioppilastutkinto suoritettu ennen koulutuksen aloittamista'
        when (aikyotutk = '1' and ((cast(alvv as int) - cast(suvuosiyotutk as int) < 0))) then 'Ylioppilastutkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu ylioppilastutkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_yotutk_koulutustiedot = [aikyotutkkoulk]
	   ,aikaisemmin_suoritetun_yotutk_suoritusvuosi = [suvuosiyotutk]
	   ,aikaisemmin_suoritetun_yotutk_oppilaitostiedot = [tunnyotutk]
	   ,aikaisemmin_suoritettu_ammtutk = [aikamm]
	   ,aikaisemmin_suoritettu_ammtutk_tarkempi= CAST(
      (
		case
		when [aikamm] = '1' then 'Aikaisemmin suoritettu alempi ammatillinen tutkinto'
		else 'Ei suoritettu alempaa ammatillista tutkintoa '
		end
	   )as nvarchar(100))
	   ,ammtutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikamm= '1' and ((cast(alvv as int) - cast(suvuosiamm as int) >= 0))) then 'Alempi ammatillinen tutkinto suoritettu ennen koulutuksen aloittamista'
        when (aikamm = '1' and ((cast(alvv as int) - cast(suvuosiamm as int) < 0))) then 'Alempi ammatillinen tutkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu alempaa ammatillista tutkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_ammtutk_koulutustiedot = [aikammkoulk]
	   ,aikaisemmin_suoritetun_ammtutk_suoritusvuosi = [suvuosiamm]
	   ,aikaisemmin_suoritetun_ammtutk_oppilaitostiedot = [tunnamm]
	   ,aikaisemmin_suoritettu_amktutk = [aikamk]
	   ,aikaisemmin_suoritettu_amktutk_tarkempi= CAST(
      (
		case
		when [aikamk] = '1' then 'Aikaisemmin suoritettu amk-tutkinto'
		else 'Ei suoritettu amk-tutkintoa '
		end
	   )as nvarchar(100))
	    ,amktutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikamk= '1' and ((cast(alvv as int) - cast(suvuosiamk as int) >= 0))) then 'Amk-tutkinto suoritettu ennen koulutuksen aloittamista'
        when (aikamk = '1' and ((cast(alvv as int) - cast(suvuosiamk as int) < 0))) then 'Amk-tutkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu amk-tutkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_amktutk_koulutustiedot = [aikamkkoulk]
	   ,aikaisemmin_suoritetun_amktutk_suoritusvuosi = [suvuosiamk]
	   ,aikaisemmin_suoritetun_amktutk_oppilaitostiedot = [tunnamk]
	   ,aikaisemmin_suoritettu_ylempiamktutk = [aikylamk]
	   ,aikaisemmin_suoritettu_ylempiamktutk_tarkempi= CAST(
      (
		case
		when [aikylamk] = '1' then 'Aikaisemmin suoritettu ylempi amk-tutkinto'
		else 'Ei suoritettu ylempää amk-tutkintoa '
		end
	   )as nvarchar(100))
	   ,ylempiamktutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikylamk= '1' and ((cast(alvv as int) - cast(suvuosiylamk as int) >= 0))) then 'Ylempi amk-tutkinto suoritettu ennen koulutuksen aloittamista'
        when (aikylamk = '1' and ((cast(alvv as int) - cast(suvuosiylamk as int) < 0))) then 'Ylempi amk-tutkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu ylempää amk-tutkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot = [aikylamkkoulk]
	   ,aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi = [suvuosiylamk]
	   ,aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot = [tunnylamk]
	   ,aikaisemmin_suoritettu_alempikktutk = [aikalkk]
	   ,aikaisemmin_suoritettu_alempikktutk_tarkempi= CAST(
      (
		case
		when [aikalkk] = '1' then 'Aikaisemmin suoritettu alempi korkeakoulututkinto'
		else 'Ei suoritettu alempaa korkeakoulututkintoa '
		end
	   )as nvarchar(100))
	    ,alempikktutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikalkk= '1' and ((cast(alvv as int) - cast(suvuosialkk as int) >= 0))) then 'Alempi korkeakoulututkinto suoritettu ennen koulutuksen aloittamista'
        when (aikalkk = '1' and ((cast(alvv as int) - cast(suvuosialkk as int) < 0))) then 'Alempi korkeakoulututkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu alempaa korkeakoulututkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_alempikktutk_koulutustiedot = [aikalkkkoulk]
	   ,aikaisemmin_suoritetun_alempikktutk_suoritusvuosi = [suvuosialkk]
	   ,aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot = [tunnalkk]
	   ,aikaisemmin_suoritettu_ylempikktutk = [aikylkk]
	      ,aikaisemmin_suoritettu_ylempikktutk_tarkempi= CAST(
      (
		case
		when [aikylkk] = '1' then 'Aikaisemmin suoritettu ylempi korkeakoulututkinto'
		else 'Ei suoritettu ylempää korkeakoulututkintoa '
		end
	   )as nvarchar(100))
	     ,ylempikktutk_pohjakoulutuksen_tila = cast(
		(
		case
        when (aikylkk= '1' and ((cast(alvv as int) - cast(suvuosiylkk as int) >= 0))) then 'Ylempi korkeakoulututkinto suoritettu ennen koulutuksen aloittamista'
        when (aikylkk = '1' and ((cast(alvv as int) - cast(suvuosiylkk as int) < 0))) then 'Ylempi korkeakoulututkinto suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei suoritettu ylempää korkeakoulututkintoa'
    end
       )
    as nvarchar(150))
	   ,aikaisemmin_suoritetun_ylempikktutk_koulutustiedot = [aikylkkkoulk]
	   ,aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi = [suvuosiylkk]
	   ,aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot = [tunnylkk]
	   ,opiskelijan_koulutus_edellisvuonna = [koulked]
	   ,opiskelijan_opintoala2002_edellisvuonna= CAST(
      (
		case
		when [opm02opaed] = ' ' then '-1'
		else [opm02opaed]
		end
	   )as nvarchar(3))

	   ,opiskelijan_opintoala1995_edellisvuonna= CAST(
      (
		case
		when [opm95opaed] = ' ' then '-1'
		else [opm95opaed]
		end
	   )as nvarchar(2))


      ,aikaisemmasta_koulutuksesta_yotutk_kulunut_aika =  cast ((case when [suvuosiyotutk] = '' then '-1'
        when alvv = '' then '-1'
	    when ((cast(alvv as int) - cast(suvuosiyotutk as int) <= 0)) then '0' 
	    else ((cast(alvv as int) - cast(suvuosiyotutk as int)) )end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika =  cast ((case when [suvuosiamm] = '' then '-1'
      when alvv = '' then '-1'
	  when ((cast(alvv as int) - cast(suvuosiamm as int) <= 0)) then '0' 
	  else ((cast(alvv as int) - cast(suvuosiamm as int)))end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_amktutk_kulunut_aika =  cast ((case when [suvuosiamk] = '' then '-1'
      when alvv = '' then '-1' 
	  when ((cast(alvv as int) - cast(suvuosiamk as int) <= 0)) then '0' 
	  else ((cast(alvv as int) - cast(suvuosiamk as int)))end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika =  cast ((case when [suvuosiylamk] = '' then '-1'
      when alvv = '' then '-1' 
	  when ((cast(alvv as int) - cast(suvuosiylamk as int) <= 0)) then '0' 
	  else ((cast(alvv as int) - cast(suvuosiylamk as int)))end) as nvarchar (10))    
	  ,aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika =  cast ((case when [suvuosialkk] = '' then '-1'
      when alvv = '' then '-1' 
	  when ((cast(alvv as int) - cast(suvuosialkk as int) <= 0)) then '0' 
	  else ((cast(alvv as int) - cast(suvuosialkk as int)))end) as nvarchar (10))   
	  ,aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika =  cast ((case when [suvuosiylkk] = '' then '-1'
      when alvv = '' then '-1' 
	  when ((cast(alvv as int) - cast(suvuosiylkk as int) <= 0)) then '0' 
	  else ((cast(alvv as int) - cast(suvuosiylkk as int)))end) as nvarchar (10))  
	  ,aiemman_tutkinnon_yotutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikyotutkkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (yotutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	  
	  ,aiemman_tutkinnon_yotutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikyotutkkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (yotutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	  
	  ,aiemman_tutkinnon_yotutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikyotutkkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (yotutk) koulutusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))	   
	  ,aiemman_tutkinnon_yotutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikyotutkkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (yotutk) koulutusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))	   
	  ,aiemman_tutkinnon_ammtutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikammkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (ammtutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	  
	  ,aiemman_tutkinnon_ammtutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikammkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (ammtutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_ammtutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikammkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (ammtutk) koulutusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_ammtutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikammkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (ammtutk) koulutusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))	
	    ,aiemman_tutkinnon_amktutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikamkkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (amktutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	  
	  ,aiemman_tutkinnon_amktutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikamkkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (amktutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_amktutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikamkkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (amktutk) koulutusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_amktutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikamkkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (amktutk) koulutusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikamkkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (ylempiamktutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikamkkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (ylempiamktutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))	
	  ,aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikamkkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (ylempiamktutk) koulutusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))
	  ,aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikamkkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (ylempiamktutk) koulutusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))
	  ,aiemman_tutkinnon_alempikktutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikylamkkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (alempikktutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))
	   ,aiemman_tutkinnon_alempikktutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikylamkkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (alempikktutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))
	   ,aiemman_tutkinnon_alempikktutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikylamkkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (alempikktutk) koulutusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))		
	  ,aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikylamkkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (alempikktutk) koulutusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))			
	  ,aiemman_tutkinnon_ylempikktutk_opintoala1995_sama  = CAST(
      (
		case
		when koulk_opintoala1995 = aikylkkkoulk_opintoala1995
		
		then 'Aiemman tutkinnon (ylempikktutk) opintoala1995 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))
	  ,aiemman_tutkinnon_ylempikktutk_opintoala2002_sama  = CAST(
      (
		case
		when koulk_opintoala2002 = aikylkkkoulk_opintoala2002
		
		then 'Aiemman tutkinnon (ylempikktutk) opintoala2002 sama'
		else 'Ei sama opintoala'
		end
	   )
	   as nvarchar(100))
	  ,aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama  = CAST(
      (
		case
		when koulk_koulutusala2002 = aikylkkkoulk_koulutusala2002
		
		then 'Aiemman tutkinnon (ylempikktutk) koultusala2002 sama'
		else 'Ei sama koulutusala'
		end
	   )
	   as nvarchar(100))
	 ,aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama  = CAST(
      (
		case
		when koulk_koulutusaste2002 = aikylkkkoulk_koulutusaste2002
		
		then 'Aiemman tutkinnon (ylempikktutk) koultusaste2002 sama'
		else 'Ei sama koulutusaste'
		end
	   )
	   as nvarchar(100))
       ,aiemman_tutkinnon_opintoala1995_sama  = 
	 CAST(
      (
		case
		when koulk_opintoala1995 = [aikyotutkkoulk_opintoala1995] then 'Aiemman tutkinnon opintoala1995 sama'
		when koulk_opintoala1995 = [aikammkoulk_opintoala1995] then 'Aiemman tutkinnon opintoala1995 sama'
		when koulk_opintoala1995 = [aikamkkoulk_opintoala1995] then 'Aiemman tutkinnon opintoala1995 sama'
		when koulk_opintoala1995 = [aikylamkkoulk_opintoala1995] then 'Aiemman tutkinnon opintoala1995 sama'
		when koulk_opintoala1995 = [aikylkkkoulk_opintoala1995] then 'Aiemman tutkinnon opintoala1995 sama'
		else 'Ei sama opintoala'

		end
	   )
	as nvarchar(100))
	 ,aiemman_tutkinnon_opintoala2002_sama  = 
	 CAST(
      (
		case
		when koulk_opintoala2002 = [aikyotutkkoulk_opintoala2002] then 'Aiemman tutkinnon opintoala2002 sama'
		when koulk_opintoala2002 = [aikammkoulk_opintoala2002] then 'Aiemman tutkinnon opintoala2002 sama'
		when koulk_opintoala2002 = [aikamkkoulk_opintoala2002] then 'Aiemman tutkinnon opintoala2002 sama'
		when koulk_opintoala2002 = [aikylamkkoulk_opintoala2002] then 'Aiemman tutkinnon opintoala2002 sama'
		when koulk_opintoala2002 = [aikylkkkoulk_opintoala2002] then 'Aiemman tutkinnon opintoala2002 sama'
		else 'Ei sama opintoala'

		end
	   )
	as nvarchar(100))
     ,aiemman_tutkinnon_koulutusala2002_sama  = 
	 CAST(
      (
		case
		when koulk_koulutusala2002 = [aikyotutkkoulk_koulutusala2002] then 'Aiemman tutkinnon koulutusala2002 sama'
		when koulk_koulutusala2002 = [aikammkoulk_koulutusala2002] then 'Aiemman tutkinnon koulutusala2002 sama'
		when koulk_koulutusala2002 = [aikamkkoulk_koulutusala2002] then 'Aiemman tutkinnon koulutusala2002 sama'
		when koulk_koulutusala2002 = [aikylamkkoulk_koulutusala2002] then 'Aiemman tutkinnon koulutusala2002 sama'
		when koulk_koulutusala2002 = [aikylkkkoulk_koulutusala2002] then 'Aiemman tutkinnon koulutusala2002 sama'
		else 'Ei sama koulutusala'

		end
	   )
	as nvarchar(100))
	,aiemman_tutkinnon_koulutusaste2002_sama  = 
	 CAST(
      (
		case
		when koulk_koulutusaste2002 = [aikyotutkkoulk_koulutusaste2002] then 'Aiemman tutkinnon koulutusaste2002 sama'
		when koulk_koulutusaste2002 = [aikammkoulk_koulutusaste2002] then 'Aiemman tutkinnon koulutusaste2002 sama'
		when koulk_koulutusaste2002 = [aikamkkoulk_koulutusaste2002] then 'Aiemman tutkinnon koulutusaste2002 sama'
		when koulk_koulutusaste2002 = [aikylamkkoulk_koulutusaste2002] then 'Aiemman tutkinnon koulutusaste2002 sama'
		when koulk_koulutusaste2002 = [aikylkkkoulk_koulutusaste2002] then 'Aiemman tutkinnon koulutusaste2002 sama'
		else 'Ei sama koulutusaste'

		end
	   )
	as nvarchar(100)),
	 pohjakoulutuksen_tila =  
	    cast ((case 
		when [suvuosiyotutk] = '' then ''
		when [suvuosiamm] = '' then ''
		when [suvuosiamk] = '' then ''
		when [suvuosialkk] = '' then ''
		when [suvuosiylkk] = '' then ''
		when [suvuosiyotutk] = '' then ''
		when [suvuosiamm] = '' then ''
		when [suvuosiamk] = '' then ''
		when [suvuosialkk] = '' then ''
		when [suvuosiylkk] = '' then ''
        when alvv = '' then ''
	    when ((cast(alvv as int) - cast(suvuosiyotutk as int) < 0)) then '1' 
		when ((cast(alvv as int) - cast(suvuosiamm as int) < 0)) then '1' 
		when ((cast(alvv as int) - cast(suvuosiamk as int) < 0)) then '1' 
		when ((cast(alvv as int) - cast(suvuosialkk as int) < 0)) then '1' 
		when ((cast(alvv as int) - cast(suvuosiylkk as int) < 0)) then '1' 
	    when ((cast(alvv as int) - cast(suvuosiyotutk as int) >= 0)) then '2' 
		when ((cast(alvv as int) - cast(suvuosiamm as int) >= 0)) then '2' 
		when ((cast(alvv as int) - cast(suvuosiamk as int) >= 0)) then '2' 
		when ((cast(alvv as int) - cast(suvuosialkk as int) >= 0)) then '2' 
		when ((cast(alvv as int) - cast(suvuosiylkk as int) >= 0)) then '2' 
	    else ''
	end
	   )
	as nvarchar(1)),
	lukumaara = [lkm]
	---- aloittaneet muutettu Pekan pyynnöstä kts. jira tiketti CSCTKTIIMI-64
	--,aloittaneet = CAST(
	--(
	--	case when (koulk_koulutusaste2002 = '63' or koulk_koulutusaste2002= '71' or koulk_koulutusaste2002='73' or koulk_koulutusaste2002='81' or koulk_koulutusaste2002='82') then alvv 
	--	     when  koulk_koulutusaste2002=('62') then alvv_kk_lasna  end
	--)
	--as int)
	,aloittaneet = CAST(
	(
		case 
			when tilv < '2012' and (koulk_koulutusaste2002 IN ( '63','71','72') and koulk_koulutusaste2002 NOT IN ('73','81','82') ) and alvv /*kirjoihintulovuosi*/ = tilv /*tilastointivuosi*/ 
		         and olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/ 
			when tilv >= '2012' and (koulk_koulutusaste2002 IN ( '71') and koulk_koulutusaste2002 NOT IN ('73','81','82') ) and alvv /*kirjoihintulovuosi*/ = tilv /*tilastointivuosi*/ 
		          and olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/ 
			when tilv >= '2012' and (koulk_koulutusaste2002 IN ( '63','72') and koulk_koulutusaste2002 NOT IN ('73','81','82') ) and alvv /*kirjoihintulovuosi*/ = tilv /*tilastointivuosi*/ 
		          and olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/ 
			when koulk_koulutusaste2002=('62') and alvv = tilv and olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/   
		end
	)
	as int)

	,aikaisempi_korkein_tutkinto =  cast (
      (
         case 
		 --Ylempi korkeakoulututkinto 12
         when (aikylkk = '1')  then '12'

		 -- Ylempi amk-tutkinto 11 
         when (aikalkk = '1')  then '10'
		 
		 --Alempi korkeakoulututkinto 10
         when (aikylamk ='1') then '11'
		 
		 -- Amk-tutkinto 9
         when(aikamk='1')   then '9'
		 
		 -- Ammatillinen perustutkinto 3
		 when(aikamm ='1') then '3'
		 -- Ylioppilastutkinto 2
		 when aikyotutk  = '1' then '2'
		 -- Ei perusasteen jälkeistä koulutusta 1
		else '1'
         end) as nvarchar (2))
	 ,ika_18_65 =cast(
       (
		case
		when [syntv] = 'XXXX' then '-1'
		when [syntv] = '' then '-1'
		when ((cast(tilv as int) - cast(syntv as int)) <= 18)  then '18655v18'
		when ((cast(tilv as int) - cast(syntv as int)) = 19 )  then '19'
		when ((cast(tilv as int) - cast(syntv as int)) = 20) then '20'
		when ((cast(tilv as int) - cast(syntv as int)) = 21) then '21'
		when ((cast(tilv as int) - cast(syntv as int)) = 22) then '22'
		when ((cast(tilv as int) - cast(syntv as int)) = 23) then '23'
		when ((cast(tilv as int) - cast(syntv as int)) = 24) then '24'
		when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '19655v25'
		when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '19655v30'
		when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '19655v35'
		when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '19655v40'
		when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '19655v45'
		when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '19655v50'
		when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '19655v55'
        when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '19655v60'
		when ((cast(tilv as int) - cast(syntv as int)) >= 65) then '19655v65'
		end
	   ) as nvarchar (10))
	   ,ylempi_korkeakoulututkinto= case 
	   when (aikylkk = '1') then  cast(lkm as int) else '' end 
	   ,ylempi_amk_tutkinto = case
	   when (aikylamk = '1') then  cast(lkm as int) else '' end
	   ,alempi_korkeakoulututkinto = case 
	   when (aikalkk ='1') then cast(lkm as int) else '' end
	   ,amk_tutkinto = case 
	   when (aikamk='1') then cast(lkm as int) else '' end
	   ,ammatillinen_perustutkinto = case
	   when (aikamm ='1')then cast(lkm as int) else '' end
	   ,ylioppilastutkinto = case
	    when aikyotutk  = '1' then cast(lkm as int) else '' end
	   ,ei_perusasteen_jalkeista_koulutusta = case
	   when ( aikylkk = '0' and aikalkk = '0' and aikylamk = '0' and aikamk='0' and aikamm ='0' and aikyotutk  = '0') then cast(lkm as int) else '' end
	   ,opiskelijat = cast(
	(
		case
		when olosyys /*opiskelijan_olo_syys*/ in ('1','2') then lkm /*lukumaara*/
		end
	)
	as int)

	     FROM [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]


GO

USE [ANTERO]


