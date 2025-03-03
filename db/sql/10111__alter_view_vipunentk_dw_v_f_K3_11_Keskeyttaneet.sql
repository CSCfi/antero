USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_K3_11_Keskeyttaneet]    Script Date: 17.9.2024 9:57:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_f_K3_11_Keskeyttaneet] AS

--CSC Juha 24.11.2021: 
--Lisätty 2016 koulutusluokituksen mukaiset opintojen kulun muuttujaryhmät 1 ja (3x)2 sekä muuttuja 4bb, jotka saatu korvaamalla vastaavissa vanhoissa
  --koulutusaste (mahd. 2002,_2002) -> kaste_t2
  --koulutusala (mahd. 2002,_2002) -> kala_t1, kala_t2 & kala_t3 
--Lisäksi 
  --lisätty kohtiin 5bb ja 7a-f vastaavat kaste_t2-päättelyt
  --huom. koulutustietojen vertailusta puuttuu osin tuntemattoman käsittely, joten ko. havaintoja menee alkuperäiseen/muuhun myös riippuen tiedetäänkö jompikumpi vai molemmat.
	--parempi kuitenkin näin kuin että päätyisivät alempiin kategorioihin
  --muokattu <> null -tyyppisiä kohtia, aluksi myös lisätty myös tuntemattomien käsittelyä osin mutta sittemmin pyritty poistamaan lisätyt, ks. em. huom.

SELECT 
       tilastovuosi = ([tilv]+'01')
      ,tilv_date = [tilv_date]
      ,aineisto = [aineisto]
      ,lahde = [lahde]
      ,sukupuoli = [sp]
      ,aidinkieli_versio1x = [aikielir1]
       ,ika_1v = cast ((cast(tilv as int) - cast(syntv as int)) as nvarchar (10))
      ,ika_5v =cast(
       (
		case
		when (cast(tilv as int) - cast(syntv as int)) < 15 then '5v10'
		when ((cast(tilv as int) - cast(syntv as int)) >= 15 and (cast(tilv as int) - cast(syntv as int)) <= 19) then '5v15'
		when ((cast(tilv as int) - cast(syntv as int)) >= 20 and (cast(tilv as int) - cast(syntv as int)) <= 24) then '5v20'
		when ((cast(tilv as int) - cast(syntv as int)) >= 25 and (cast(tilv as int) - cast(syntv as int)) <= 29) then '5v25'
		when ((cast(tilv as int) - cast(syntv as int)) >= 30 and (cast(tilv as int) - cast(syntv as int)) <= 34) then '5v30'
		when ((cast(tilv as int) - cast(syntv as int)) >= 35 and (cast(tilv as int) - cast(syntv as int)) <= 39) then '5v35'
		when ((cast(tilv as int) - cast(syntv as int)) >= 40 and (cast(tilv as int) - cast(syntv as int)) <= 44) then '5v40'
		when ((cast(tilv as int) - cast(syntv as int)) >= 45 and (cast(tilv as int) - cast(syntv as int)) <= 49) then '5v45'
		when ((cast(tilv as int) - cast(syntv as int)) >= 50 and (cast(tilv as int) - cast(syntv as int)) <= 54) then '5v50'
		when ((cast(tilv as int) - cast(syntv as int)) >= 55 and (cast(tilv as int) - cast(syntv as int)) <= 59) then '5v55'
		when ((cast(tilv as int) - cast(syntv as int)) >= 60 and (cast(tilv as int) - cast(syntv as int)) <= 64) then '5v60'
		when ((cast(tilv as int) - cast(syntv as int)) >= 65 and (cast(tilv as int) - cast(syntv as int)) <= 69) then '5v65'
		when ((cast(tilv as int) - cast(syntv as int)) >= 70 and (cast(tilv as int) - cast(syntv as int)) <= 74) then '5v70'
		when ((cast(tilv as int) - cast(syntv as int)) >= 75 and (cast(tilv as int) - cast(syntv as int)) <= 79) then '5v75'
		when ((cast(tilv as int) - cast(syntv as int)) >= 80 and (cast(tilv as int) - cast(syntv as int)) <= 84) then '5v80'
		when ((cast(tilv as int) - cast(syntv as int)) >= 85 and (cast(tilv as int) - cast(syntv as int)) <= 89) then '5v85'
		when ((cast(tilv as int) - cast(syntv as int)) >= 90 and (cast(tilv as int) - cast(syntv as int)) <= 94) then '5v90'
		when ((cast(tilv as int) - cast(syntv as int)) >= 95) then '5v95'
		
		end
	   ) as nvarchar (10))
      ,kotikunta = cast(
       (
	   case
		when [tilvaskun] = '999' then '-1'
		else [tilvaskun]
		end)as nvarchar (3))

      ,kansalaisuus_versio1 = [kansalr1]
      ,eumaa = [eumaa]
      ,etamaa = [etamaa]
      ,pohjoismaa = [pohjmaa]
      ,kirjoihintulovuosi = [alvv]
      ,kirjoihintulolukukausi = 
	   (case
	when allk = '1'  then (alvv+'0'+allk)
	when allk = '2'  then (alvv+'0'+'8')
	else ''
	end)
      ,opiskelijan_olo_lk = [ololk]
      ,oppilaitoksen_taustatiedot =[tunn]
	  ,koulutusluokitus = [koulk]
      ,koulutuksen_kieli_versio1 = [kkielir1]
      ,koulutuksen_kunta = cast(
       (
	   case
		when [kkun] = '999' then '-1'
		else [kkun]
		end)as nvarchar (3))
      ,opetushallinnon_koulutus = [ophal]
	  ,hallinnonala2 = 
		case
			when ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
			when ophal = '2' and cast(tilv as int) < 2021 and coalesce(coalesce(d1.koulutuksen_jarjestajan_korvaavakoodi,d1.koulutuksen_jarjestajakoodi),'') not in ('0145076-7','2153105-4','150622-3','0909306-3' /*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/) then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
			when ophal = '3' then '2' --Opetushallinto, työvoimakoulutus
			else '-1'
		end
	
      ,koulutustyyppi = [koultyp]
      ,tutkinnon_suorittamismaakunta = [tutkmaak]
      ,tutkinnon_jarjestaja = [tutkjarj]
      ,tutkinnon_suorittamisoppilaitos = [tutktunn]
      ,tutkinnon_koulutusluokitus = [tutkkoulk]
      ,tutkinnon_koulutustyyppi = [tutkkoultyp]
      ,seuraavan_vuoden_maakunta = [seurvkmaak]
      ,seuraavan_vuoden_jarjestaja = [seurvjarj]
      ,seuraavan_vuoden_oppilaitos = [seurvtunn]
      ,seuraavan_vuoden_koulutusluokitus = [seurvkoulk]
      ,seuraavan_vuoden_koulutustyyppi = [seurvkoulutyp]
      ,pääasiallinen_toiminta_versio2 = [ptoim1r2]
      ,ammattiasema = [amas1]
      ,opiskelijat = [lkm]


  --UUDET OPINTOJEN KULUN MUUTTUJAT (VANHAT JÄLJEMPÄNÄ)
	
  --kaste_t2
	,[1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä kaste_t2ella,tavoitetutkinto
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'
        --Tutkinto alkuperäisellä kaste_t2ella, välitutkinto
		when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		     or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '2'
		--Tutkinto muulla kaste_t2ella
		when [koulk_kaste_t2] <> [tutk_kaste_t2] and [tutk_kaste_t2] <> '' then '3'
		--Opiskelee alkuperäisellä kaste_t2ella
		when [koulk_kaste_t2] = [seurv_kaste_t2] then '4'
		--Opiskelee muulla kaste_t2lla
		when [koulk_kaste_t2] <> [seurv_kaste_t2] and [seurv_kaste_t2] <> '' then '5'
		--Keskeyttänyt työllinen
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '10' then '6'
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		--Keskeyttänyt työtön
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '12' then '7'
        --Keskeyttänyt muu
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '')  and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
	    else '-1'
         end
		
	   ) as nvarchar (2))
	   
	   
	,[1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan] =cast(
        (
	   case
	   --Tutkinto alkuperäisellä kaste_t2ella,tavoitetutkinto
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'
        --Tutkinto alkuperäisellä kaste_t2ella, välitutkinto
		when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		     or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '2'
		--Opiskelee alkuperäisellä kaste_t2ella
		when [koulk_kaste_t2] = [seurv_kaste_t2] then '4'
		----Tutkinto muulla kaste_t2ella
		when [koulk_kaste_t2] <> [tutk_kaste_t2] and [tutk_kaste_t2] <> '' then '3' 
        ----Opiskelee muulla kaste_t2lla
		when [koulk_kaste_t2] <> [seurv_kaste_t2] and [seurv_kaste_t2] <> '' then '5'
		--Keskeyttänyt työllinen
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '10' then '6'
		----Keskeyttänyt työtön
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '12' then '7'
        --Keskeyttänyt muu
		when ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '')  and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))
	   

	,[1c_tutkinto_alkuperaisella_kaste_t2ella] =cast(
        (
	   
        case
	  	when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'

		when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		     or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '2'
		else '3'
		end
		
	   ) as nvarchar (2))


	,[1d_tutkinto_muulla_kaste_t2ella] =cast(
        (
	   
        case
	    when [koulk_kaste_t2] <> [tutk_kaste_t2] and [tutk_kaste_t2] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] =cast(
        (
	   
        case
	    when [koulk_kaste_t2] = [seurv_kaste_t2]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))

	   
	,[1f_jatkaa_opiskelua_muulla_kaste_t2ella] =cast(
        (
	   
        case
	    when [koulk_kaste_t2] <> [seurv_kaste_t2] and [seurv_kaste_t2] <> ''  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   
  --kala_t1
	,[2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] =cast(
       (
	    case
		--Tutkinto alkuperäisellä kala_t3lla
	    when [koulk_kala_t1] = [tutk_kala_t1]  then '1'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t1] <> [tutk_kala_t1] and [tutk_kala_t1] <> '' then '2'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t1] = [seurv_kala_t1] then '3'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t1] <> [seurv_kala_t1] and [seurv_kala_t1] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '')and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	   
	   
	,[2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä kala_t3lla
		when [koulk_kala_t1] = [tutk_kala_t1]  then '1'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t1] = [seurv_kala_t1] then '3'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t1] <> [tutk_kala_t1] and [tutk_kala_t1] <> '' then '2'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t1] <> [seurv_kala_t1] and [seurv_kala_t1] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] =cast(
       (
	   case
	   --Suorittanut tavoitetutkinnon
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Jatkaa opiskelua samalla kala_t1lla
        when( ([koulk_kaste_t2] = [seurv_kaste_t2] or ([koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72') or ([koulk_kaste_t2] = '72' and [seurv_kaste_t2] = '63'))
		 and ([koulk_kala_t1] = [seurv_kala_t1])
		  )  then '2'

		-- Jatkaa opiskelua muulla kala_t1lla
		 when( ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' )
		 and ([koulk_kala_t1] <> [seurv_kala_t1])
		  )  then '3'
        -- Suorittanut kandidaatin tutkinnon ja keskeyttänyt
        when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		  or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '4' 
        -- Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla
		when ([koulk_kaste_t2] <> [tutk_kaste_t2] or [koulk_kaste_t2] <> [seurv_kaste_t2] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutk_kala_t1] is null or [tutk_kala_t1] = '') and
		     ([seurv_kala_t1] is null or [seurv_kala_t1] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2c_tutkinto_alkuperaisella_kala_t1lla] =cast(
        (
	   
        case
	    when [koulk_kala_t1] = [tutk_kala_t1]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2d_tutkinto_muulla_kala_t1lla] =cast(
        (
	   
        case
	    when [koulk_kala_t1] <> [tutk_kala_t1] and [tutk_kala_t1] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla] =cast(
        (
	   
        case
	    when [koulk_kala_t1] = [seurv_kala_t1]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2f_jatkaa_opiskelua_muulla_kala_t1lla] =cast(
        (
	   
        case
	    when [koulk_kala_t1] <> [seurv_kala_t1] and [seurv_kala_t1] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   
	   
	
  --kala_t2
	,[2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] =cast(
       (
	    case
		--Tutkinto alkuperäisellä kala_t3lla
	    when [koulk_kala_t2] = [tutk_kala_t2]  then '1'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t2] <> [tutk_kala_t2] and [tutk_kala_t2] <> '' then '2'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t2] = [seurv_kala_t2] then '3'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t2] <> [seurv_kala_t2] and [seurv_kala_t2] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '')and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	   
	   
	,[2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä kala_t3lla
		when [koulk_kala_t2] = [tutk_kala_t2]  then '1'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t2] = [seurv_kala_t2] then '3'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t2] <> [tutk_kala_t2] and [tutk_kala_t2] <> '' then '2'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t2] <> [seurv_kala_t2] and [seurv_kala_t2] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] =cast(
       (
	   case
	   --Suorittanut tavoitetutkinnon
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Jatkaa opiskelua samalla kala_t2lla
        when( ([koulk_kaste_t2] = [seurv_kaste_t2] or ([koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72') or ([koulk_kaste_t2] = '72' and [seurv_kaste_t2] = '63'))
		 and ([koulk_kala_t2] = [seurv_kala_t2])
		  )  then '2'

		-- Jatkaa opiskelua muulla kala_t2lla
		 when( ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' )
		 and ([koulk_kala_t2] <> [seurv_kala_t2])
		  )  then '3'
        -- Suorittanut kandidaatin tutkinnon ja keskeyttänyt
        when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		  or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '4' 
        -- Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla
		when ([koulk_kaste_t2] <> [tutk_kaste_t2] or [koulk_kaste_t2] <> [seurv_kaste_t2] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutk_kala_t2] is null or [tutk_kala_t2] = '') and
		     ([seurv_kala_t2] is null or [seurv_kala_t2] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2c_tutkinto_alkuperaisella_kala_t2lla] =cast(
        (
	   
        case
	    when [koulk_kala_t2] = [tutk_kala_t2]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2d_tutkinto_muulla_kala_t2lla] =cast(
        (
	   
        case
	    when [koulk_kala_t2] <> [tutk_kala_t2] and [tutk_kala_t2] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla] =cast(
        (
	   
        case
	    when [koulk_kala_t2] = [seurv_kala_t2]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2f_jatkaa_opiskelua_muulla_kala_t2lla] =cast(
        (
	   
        case
	    when [koulk_kala_t2] <> [seurv_kala_t2] and [seurv_kala_t2] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   
	   
	   
  --kala_t3
	,[2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] =cast(
       (
	    case
		--Tutkinto alkuperäisellä kala_t3lla
	    when [koulk_kala_t3] = [tutk_kala_t3]  then '1'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t3] <> [tutk_kala_t3] and [tutk_kala_t3] <> '' then '2'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t3] = [seurv_kala_t3] then '3'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t3] <> [seurv_kala_t3] and [seurv_kala_t3] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '')and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	   
	   
	,[2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä kala_t3lla
		when [koulk_kala_t3] = [tutk_kala_t3]  then '1'
		--Opiskelee alkuperäisellä kala_t3lla
		when [koulk_kala_t3] = [seurv_kala_t3] then '3'
		--Tutkinto muulla kala_t3lla
		when [koulk_kala_t3] <> [tutk_kala_t3] and [tutk_kala_t3] <> '' then '2'
		--Opiskelee muulla kala_t3lla
		when [koulk_kala_t3] <> [seurv_kala_t3] and [seurv_kala_t3] <> '' then '4'
		--Keskeyttänyt työllinen
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] =cast(
       (
	   case
	   --Suorittanut tavoitetutkinnon
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Jatkaa opiskelua samalla kala_t3lla
        when( ([koulk_kaste_t2] = [seurv_kaste_t2] or ([koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72') or ([koulk_kaste_t2] = '72' and [seurv_kaste_t2] = '63'))
		 and ([koulk_kala_t3] = [seurv_kala_t3])
		  )  then '2'

		-- Jatkaa opiskelua muulla kala_t3lla
		 when( ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' )
		 and ([koulk_kala_t3] <> [seurv_kala_t3])
		  )  then '3'
        -- Suorittanut kandidaatin tutkinnon ja keskeyttänyt
        when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		  or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '4' 
        -- Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla
		when ([koulk_kaste_t2] <> [tutk_kaste_t2] or [koulk_kaste_t2] <> [seurv_kaste_t2] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutk_kala_t3] is null or [tutk_kala_t3] = '') and
		     ([seurv_kala_t3] is null or [seurv_kala_t3] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   
	,[2c_tutkinto_alkuperaisella_kala_t3lla] =cast(
        (
	   
        case
	    when [koulk_kala_t3] = [tutk_kala_t3]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2d_tutkinto_muulla_kala_t3lla] =cast(
        (
	   
        case
	    when [koulk_kala_t3] <> [tutk_kala_t3] and [tutk_kala_t3] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla] =cast(
        (
	   
        case
	    when [koulk_kala_t3] = [seurv_kala_t3]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	,[2f_jatkaa_opiskelua_muulla_kala_t3lla] =cast(
        (
	   
        case
	    when [koulk_kala_t3] <> [seurv_kala_t3] and [seurv_kala_t3] <> '' then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   
	--kaste_t2 mukainen 4bb
	,[4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan] = cast(
       (
	   case
	   -- Tutkinto alkuperäisellä kaste_t2ella, tavoitetutkinto
		when (([koulk_kaste_t2] = [tutk_kaste_t2] and (koulk_kaste_t2 <> '63' and tutk_kaste_t2 <> '63'))
		      
		      or  [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72'  )  
		      or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Opiskelee alkuperäisellä koulutuksen järjestäjällä
        when( ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' )
		 and ([jarj] = [seurvjarj])
		  )  then '2'

		-- Opiskelee muulla koulutuksen järjestäjällä
		 when( ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' )
		 and ([jarj] <> [seurvjarj])
		  )  then '3'
        -- Tutkinto alkuperäisellä kaste_t2ella, välitutkinto
        when ( [koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63'
		  or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63') then '4' 
        -- Opiskelee muulla kaste_t2ella tai tutkinto muulla kaste_t2ella
		when ([koulk_kaste_t2] <> [tutk_kaste_t2] or [koulk_kaste_t2] <> [seurv_kaste_t2] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))
	   
	   
	   
  --VANHAT OPINTOJEN KULUN MUUTTUJAT (5bb ja 7a-f PÄIVITETTY, TÄYSIN UUDET YLLÄ)
  
	  ,[1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä koulutusasteella (2002),tavoitetutkinto
		when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'
        --Tutkinto alkuperäisellä koulutusasteella (2002), välitutkinto
		when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		     or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '2'
		--Tutkinto muulla koulutusasteella (2002)
		when [koulk_koulutusaste] <> [tutk_koulutusaste] and ([tutk_koulutusaste] <> '') then '3'
		--Opiskelee alkuperäisellä koulutusasteella (2002)
		when [koulk_koulutusaste] = [seurv_koulutusaste] then '4'
		--Opiskelee muulla koulutusastella (2002)
		when [koulk_koulutusaste] <> [seurv_koulutusaste] and ([seurv_koulutusaste] <> '') then '5'
		--Keskeyttänyt työllinen
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and ptoim1r2= '10' then '6'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		--Keskeyttänyt työtön
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and ptoim1r2= '12' then '7'
        --Keskeyttänyt muu
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '')  and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
	    else '-1'
         end
		
	   ) as nvarchar (2))
	  ,[1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan] =cast(
        (
	   case
	   --Tutkinto alkuperäisellä koulutusasteella (2002),tavoitetutkinto
		when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'
        --Tutkinto alkuperäisellä koulutusasteella (2002), välitutkinto
		when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		     or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '2'
		--Opiskelee alkuperäisellä koulutusasteella (2002)
		when [koulk_koulutusaste] = [seurv_koulutusaste] then '4'
		----Tutkinto muulla koulutusasteella (2002)
		when [koulk_koulutusaste] <> [tutk_koulutusaste] and ([tutk_koulutusaste] <> '') then '3' 
        ----Opiskelee muulla koulutusastella (2002)
		when [koulk_koulutusaste] <> [seurv_koulutusaste] and ([seurv_koulutusaste] <> '') then '5'
		--Keskeyttänyt työllinen
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and ptoim1r2= '10' then '6'
		----Keskeyttänyt työtön
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and ptoim1r2= '12' then '7'
        --Keskeyttänyt muu
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '')  and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))


	   ,[1c_tutkinto_alkuperaisella_koulutusasteella_2002] =cast(
        (
	   
        case
	  	when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'

		when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		     or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '2'
		else '3'
		end
		
	   ) as nvarchar (2))


	   ,[1d_tutkinto_muulla_koulutusasteella_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusaste] <> [tutk_koulutusaste] and ([tutk_koulutusaste] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusaste] = [seurv_koulutusaste]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))

	   ,[1f_jatkaa_opiskelua_muulla_koulutusasteella_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusaste] <> [seurv_koulutusaste] and ([seurv_koulutusaste] <> '')  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	  ,[2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] =cast(
       (
	    case
		--Tutkinto alkuperäisellä opintoalalla (2002)
	    when [koulk_koulutusala] = [tutk_koulutusala]  then '1'
		--Tutkinto muulla opintoalalla (2002)
		when [koulk_koulutusala] <> [tutk_koulutusala] and ([tutk_koulutusala] <> '') then '2'
		--Opiskelee alkuperäisellä opintoalalla (2002)
		when [koulk_koulutusala] = [seurv_koulutusala] then '3'
		--Opiskelee muulla opintoalalla (2002)
		when [koulk_koulutusala] <> [seurv_koulutusala] and ([seurv_koulutusala] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '')and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	  ,[2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä opintoalalla (2002)
		when [koulk_koulutusala] = [tutk_koulutusala]  then '1'
		--Opiskelee alkuperäisellä opintoalalla (2002)
		when [koulk_koulutusala] = [seurv_koulutusala] then '3'
		--Tutkinto muulla opintoalalla (2002)
		when [koulk_koulutusala] <> [tutk_koulutusala] and ([tutk_koulutusala] <> '') then '2'
		--Opiskelee muulla opintoalalla (2002)
		when [koulk_koulutusala] <> [seurv_koulutusala] and ([seurv_koulutusala] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   ,[2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] =cast(
       (
	   case
	   --Suorittanut tavoitetutkinnon
		when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Jatkaa opiskelua samalla koulutusalalla
        when( ([koulk_koulutusaste] = [seurv_koulutusaste] or ([koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72') or ([koulk_koulutusaste] = '72' and [seurv_koulutusaste] = '63'))
		 and ([koulk_koulutusala] = [seurv_koulutusala])
		  )  then '2'

		-- Jatkaa opiskelua muulla koulutusalalla
		 when( ([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' )
		 and ([koulk_koulutusala] <> [seurv_koulutusala])
		  )  then '3'
        -- Suorittanut kandidaatin tutkinnon ja keskeyttänyt
        when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		  or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '4' 
        -- Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla
		when ([koulk_koulutusaste] <> [tutk_koulutusaste] or [koulk_koulutusaste] <> [seurv_koulutusaste] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutk_koulutusala] is null or [tutk_koulutusala] = '') and
		     ([seurv_koulutusala] is null or [seurv_koulutusala] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   ,[2c_tutkinto_alkuperaisella_koulutusalalla_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusala] = [tutk_koulutusala]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[2d_tutkinto_muulla_koulutusalalla_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusala] <> [tutk_koulutusala] and ([tutk_koulutusala] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusala] = [seurv_koulutusala]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[2f_jatkaa_opiskelua_muulla_koulutusalalla_2002] =cast(
        (
	   
        case
	    when [koulk_koulutusala] <> [seurv_koulutusala] and ([seurv_koulutusala] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	 ,[3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] =cast(
     (
	    case
		--Tutkinto alkuperäisellä opintoalalla (2002)
	    when [koulk_opintoala] = [tutk_opintoala]  then '1'
		--Tutkinto muulla opintoalalla (2002)
		when [koulk_opintoala] <> [tutk_opintoala] and ([tutk_opintoala] <> '') then '2'
		--Opiskelee alkuperäisellä opintoalalla (2002)
		when [koulk_opintoala] = [seurv_opintoala] then '3'
		--Opiskelee muulla opintoalalla (2002)
		when [koulk_opintoala] <> [seurv_opintoala] and ([seurv_opintoala] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '12' then '6'
        --Keskeyttänyt muu
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	 ,[3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] =cast(
       (
	   case
	   --Tutkinto alkuperäisellä opintoalalla (2002)
		when [koulk_opintoala] = [tutk_opintoala]  then '1'
		--Opiskelee alkuperäisellä opintoalalla (2002)
		when [koulk_opintoala] = [seurv_opintoala] then '3'
		--Tutkinto muulla opintoalalla (2002)
		when [koulk_opintoala] <> [tutk_opintoala] and ([tutk_opintoala] <> '') then '2'
		--Opiskelee muulla opintoalalla (2002)
		when [koulk_opintoala] <> [seurv_opintoala] and ([seurv_opintoala] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '10' then '5'
        --Keskeyttänyt työtön
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '12' then '6'
	    --Keskeyttänyt muu
			when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   ,[3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] =cast(
       (
	   case
	   -- Tutkinto alkuperäisellä koulutusasteella (2002), tavoitetutkinto
		when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Opiskelee alkuperäisellä opintoalalla (2002)
        when( ([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' )
		 and ([koulk_opintoala] = [seurv_opintoala])
		  )  then '2'

		-- Opiskelee muulla opintoalalla (2002)
		 when( ([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' )
		 and ([koulk_opintoala] <> [seurv_opintoala])
		  )  then '3'
        -- Tutkinto alkuperäisellä koulutusasteella (2002), välitutkinto
        when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		  or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '4' 
        -- Opiskelee muulla koulutusasteella (2002) tai tutkinto muulla koulutusasteella (2002)
		when ([koulk_koulutusaste] <> [tutk_koulutusaste] or [koulk_koulutusaste] <> [seurv_koulutusaste] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutk_opintoala] is null or [tutk_opintoala] = '') and
		     ([seurv_opintoala] is null or [seurv_opintoala] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	  ,[3c_tutkinto_alkuperaisella_opintoalalla_2002] =cast(
        (
	   
        case
	    when [koulk_opintoala] = [tutk_opintoala]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[3d_tutkinto_muulla_opintoalalla_2002] =cast(
        (
	   
        case
	    when [koulk_opintoala] <> [tutk_opintoala] and ([tutk_opintoala] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))

	   ,[3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002] =cast(
        (
	   
        case
	    when [koulk_opintoala] = [seurv_opintoala]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[3f_jatkaa_opiskelua_muulla_opintoalalla_2002] =cast(
        (
	   
        case
	    when [koulk_opintoala] <>[seurv_opintoala] and ([seurv_opintoala] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	  ,[4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] = cast(
     (
	    case
		--Tutkinto alkuperäisellä koulutuksen järjestäjällä
	    when [jarj] = [tutkjarj]  then '1'
		--Tutkinto muulla koulutuksen järjestäjällä
		when [jarj] <> [tutkjarj] and ([tutkjarj] <> '') then '2'
		--Opiskelee alkuperäisellä koulutuksen järjestäjällä
		when [jarj] = [seurvjarj] then '3'
		--Opiskelee muulla koulutuksen järjestäjällä
		when [jarj] <> [seurvjarj] and ([seurvjarj] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	  ,[4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] = cast(
       (
	   case
	   ----Tutkinto alkuperäisellä koulutuksen järjestäjällä
		when [jarj] = [tutkjarj]  then '1'
		--Opiskelee alkuperäisellä koulutuksen järjestäjällä
		when [jarj] = [seurvjarj] then '3'
		--Tutkinto muulla koulutuksen järjestäjällä
		when [jarj] <> [tutkjarj] and ([tutkjarj] <> '') then '2'
		----Opiskelee muulla koulutuksen järjestäjällä
		when [jarj] <> [seurvjarj] and ([seurvjarj] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '12' then '6'
        --Keskeyttänyt muu
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '')  and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	,[4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] = cast(
       (
	   case
	   -- Tutkinto alkuperäisellä koulutusasteella (2002), tavoitetutkinto
		when (([koulk_koulutusaste] = [tutk_koulutusaste] and (koulk_koulutusaste <> '63' and tutk_koulutusaste <> '63'))
		      
		      or  [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72'  )  
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )  then '1'

        -- Opiskelee alkuperäisellä koulutuksen järjestäjällä
        when( ([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' )
		 and ([jarj] = [seurvjarj])
		  )  then '2'

		-- Opiskelee muulla koulutuksen järjestäjällä
		 when( ([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' )
		 and ([jarj] <> [seurvjarj])
		  )  then '3'
        -- Tutkinto alkuperäisellä koulutusasteella (2002), välitutkinto
        when ( [koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63'
		  or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') then '4' 
        -- Opiskelee muulla koulutusasteella (2002) tai tutkinto muulla koulutusasteella (2002)
		when ([koulk_koulutusaste] <> [tutk_koulutusaste] or [koulk_koulutusaste] <> [seurv_koulutusaste] ) then '5'
		-- keskeyttänyt työllinen
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutkjarj] is null or [tutkjarj] = '') and
		     ([seurvjarj] is null or [seurvjarj] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))

	    ,[4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla] = cast(
        (
	   
        case
	    when [jarj] = [tutkjarj]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))

	   ,[4d_tutkinto_muulla_koulutuksen_jarjestajalla] = cast(
        (
	   
        case
	    when [jarj] <> [tutkjarj] and ([tutkjarj] <> '')   then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla] = cast(
        (
	   
        case
	    when [tutkjarj] = [seurvjarj]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	   ,[4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla] = cast(
        (
	   
        case
	    when [tutkjarj] <> [seurvjarj] and ([seurvjarj] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))


	  ,[5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] = cast(
      (
	    case
		--Tutkinto alkuperäisessä oppilaitoksessa
	    when [tunn] = [tutktunn]  then '1'
		--Tutkinto muussa oppilaitoksessa
		when [tunn] <> [tutktunn] and ([tutktunn] <> '') then '2'
		--Opiskelee alkuperäisessä  oppilaitoksessa
		when [tunn] = [seurvtunn] then '3'
		--Opiskelee muussa oppilaitoksessa
		when [tunn] <> [seurvtunn] and ([seurvtunn] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	 ,[5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] = cast(
     (
	   case
	   ----Tutkinto alkuperäisessä oppilaitoksessa
		when [tunn] = [tutktunn]  then '1'
		--Opiskelee alkuperäisessä  oppilaitoksessa
		when [tunn] = [seurvtunn] then '3'
		--Tutkinto muussa oppilaitoksessa
		when [tunn] <> [tutktunn] and ([tutktunn] <> '') then '2'
		--Opiskelee muussa oppilaitoksessa
		when [tunn] <> [seurvtunn] and ([seurvtunn] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))

	   ,[5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan] = cast(
       (
	   case
	   -- Suorittanut tavoitetutkinnon
		when ([koulk_koulutusaste] = [tutk_koulutusaste] and koulk_koulutusaste <> '63')
			  or ([koulk_kaste_t2] = [tutk_kaste_t2] and koulk_kaste_t2 <> '63') 
		      or ([koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '72') 
			  or ([koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '72') 
		      or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '612101' )
			  or ([koulk_koulutusaste] = '63' and [tutkkoulk] = '672401' )
			  or ([koulk_kaste_t2] = '63' and [tutkkoulk] = '672401' ) then '1'

        -- Jatkaa opiskelua samassa korkeakoulussa 
        when( 

		([koulk_koulutusaste] = [seurv_koulutusaste] or ([koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72') or ([koulk_koulutusaste] = '72' and [seurv_koulutusaste] = '63')
		  or [koulk_kaste_t2] = [seurv_kaste_t2] or ([koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72') or ([koulk_kaste_t2] = '72' and [seurv_kaste_t2] = '63'))
		 
		 and 
		 
		(select top 1 coalesce(nullif(oppilaitoksen_korvaavakoodi,''), tunn) FROM [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot_historia] where [tunn] = oppilaitoskoodi and tilv+'-01-01' between
	     alkaa and paattyy)  = [seurvtunn])

		 then '2'

		-- Jatkaa opiskelua muussa korkeakoulussa
		 when( (([koulk_koulutusaste] = [seurv_koulutusaste] or [koulk_koulutusaste] = '63' and [seurv_koulutusaste] = '72' ) 
				  or ([koulk_kaste_t2] = [seurv_kaste_t2] or [koulk_kaste_t2] = '63' and [seurv_kaste_t2] = '72' ))
		 and ([tunn] <> [seurvtunn])
		  )  then '3'
        -- Suorittanut kandidaatin tutkinnon ja keskeyttänyt
        when ( ([koulk_koulutusaste] = '63' and [tutk_koulutusaste] = '63' or  [koulk_koulutusaste] = '72' and [tutk_koulutusaste] = '63') 
				  or ([koulk_kaste_t2] = '63' and [tutk_kaste_t2] = '63' or  [koulk_kaste_t2] = '72' and [tutk_kaste_t2] = '63'))
		  and (ptoim1r2<> '13' and ptoim1r2 <> '22') then '4' 
        -- Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla
		--when ([koulk_koulutusaste] <> [tutk_koulutusaste] or [koulk_koulutusaste] <> [seurv_koulutusaste] ) then '5'
		when [koulk_koulutusaste] <> [tutk_koulutusaste] or [koulk_kaste_t2] <> [tutk_kaste_t2] or (ptoim1r2= '13' or ptoim1r2 = '22') then '5'
		-- keskeyttänyt työllinen
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '10' then '6'

	    --keskeyttänyt työtön
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and ptoim1r2= '12' then '7'
        --keskeyttänyt muu
		when ([tutktunn] is null or [tutktunn] = '') and
		     ([seurvtunn] is null or [seurvtunn] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '8'
		else '-1'
         end
		
	   ) as nvarchar (2))


	  ,[5c_tutkinto_alkuperaisessa_oppilaitoksessa] = cast(
        (
	   
        case
	    when [tunn] = [tutktunn]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[5d_tutkinto_muussa_oppilaitoksessa] = cast(
        (
	   
        case
	     when [tunn] <> [tutktunn] and ([tutktunn] <> '') then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))

	   ,[5e_jatkaa_opiskelua_alkuperaisella_oppilaitoksessa] = cast(
        (
	   
        case
	    when [tutktunn] = [seurvtunn]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[5f_jatkaa_opiskelua_muussa_oppilaitoksessa] = cast(
        (
	   
        case
	    when [tutktunn] <>[seurvtunn] and ([seurvtunn] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	  ,[6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan] = cast(
      (
	    case
		--Tutkinto alkuperäisessä maakunnassa
	    when [kkun_kmaak] = [tutkmaak]  then '1'
		--Tutkinto muussa maakunnassa
		when [kkun_kmaak] <> [tutkmaak] and ([tutkmaak] <> '')then '2'
		--Opiskelee alkuperäisessä maakunnassa
		when [kkun_kmaak] = [seurvkmaak] then '3'
		--Opiskelee muussa maakunnassa
		when [kkun_kmaak] <> [seurvkmaak] and ([seurvkmaak] <> '') then '4'
		--Keskeyttänyt työllinen
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and ptoim1r2= '10' then '5'
		--Keskeyttänyt työtön
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	 ,[6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan] = cast(
     (
	   case
	   --Tutkinto alkuperäisessä maakunnassa
		when [kkun_kmaak] = [tutkmaak]  then '1'
		----Opiskelee alkuperäisessä maakunnassa
		when [kkun_kmaak] = [seurvkmaak] then '3'
		----Tutkinto muussa maakunnassa
		when [kkun_kmaak] <> [tutkmaak] and ([tutkmaak] <> '') then '2'
		--Opiskelee muussa maakunnassa
		when [kkun_kmaak] <> [seurvkmaak] and ([seurvkmaak] <> '')  then '4'
		--Keskeyttänyt työllinen
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and ptoim1r2= '10' then '5'
		----Keskeyttänyt työtön
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and ptoim1r2= '12' then '6'
		--Keskeyttänyt muu
		when ([tutkmaak] is null or [tutkmaak] = '') and
		     ([seurvkmaak] is null or [seurvkmaak] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))


	 ,[6c_tutkinto_alkuperaisessa_maakunnassa] = cast(
        (
	   
        case
	    when [kkun_kmaak] = [tutkmaak]  then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[6d_tutkinto_muussa_maakunnassa] = cast(
        (
	   
        case
	     when [kkun_kmaak] <> [tutkmaak] and ([tutkmaak] <> '')  then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))
	   ,[6e_jatkaa_opiskelua_alkuperaisella_maakunnassa] = cast(
        (
	   
        case
	     when [tutkmaak] = [seurvkmaak]  then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))
	   ,[6f_jatkaa_opiskelua_muussa_maakunnassa] = cast(
        (
	   
        case
	    when [tutkmaak] <> [seurvkmaak] and ([seurvkmaak] <> '') then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	  ,[7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan] = cast(
      (
	    case
	    when ([lahde] ='21' and ([tutk_koulutusaste] = '31' or [tutk_kaste_t2] = '31'))
		    or ([lahde] in ('31','35','36') and  ([tutk_koulutusaste] = '32' or [tutk_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([tutk_koulutusaste] in ('62','71') or [tutk_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([tutk_koulutusaste] in ('63','72')) or [tutk_kaste_t2] in ('63','72'))  then '1'

		when (
		       ([lahde] ='21' and  [tutk_koulutusaste] <> '31' and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='21' and  [tutk_kaste_t2] <> '31' and ([tutk_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [tutk_koulutusaste] <> '32' and ([tutk_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [tutk_kaste_t2] not in ('32','33','41') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='41' and  [tutk_koulutusaste] not in ('62','71') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='41' and  [tutk_kaste_t2] not in ('62','71') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='51' and  [tutk_koulutusaste] not in ('63','72') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='51' and  [tutk_kaste_t2] not in ('63','72') and ([tutk_kaste_t2] <> '')) ) then '2'
		when ([lahde] ='21' and  ([seurv_koulutusaste] = '31' or [seurv_kaste_t2] = '31')
		    or ([lahde] in ('31','35','36') and  ([seurv_koulutusaste] = '32' or [seurv_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([seurv_koulutusaste] in ('62','71') or [seurv_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([seurv_koulutusaste] in ('63','72') or [seurv_kaste_t2] in ('63','72')))) then '3'
		when (
		       ([lahde] ='21' and  [seurv_koulutusaste] <> '31' and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='21' and  [seurv_kaste_t2] <> '31' and ([seurv_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [seurv_koulutusaste] <> '32' and ([seurv_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [seurv_kaste_t2] not in ('32','33','41') and ([seurv_kaste_t2] <> ''))
			or ([lahde] ='41' and  [seurv_koulutusaste] not in ('62','71') and ([seurv_koulutusaste] <> '' ))
			or ([lahde] ='41' and  [seurv_kaste_t2] not in ('62','71') and ([seurv_kaste_t2] <> '' ))
			or ([lahde] ='51' and  [seurv_koulutusaste] not in ('63','72') and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='51' and  [seurv_kaste_t2] not in ('63','72') and ([seurv_kaste_t2] <> '')) )  then '4'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '10' then '5'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '12' then '6'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
	   ) as nvarchar (2))
	 ,[7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan] = cast(
     (
	   case
		 when (([lahde] ='21' and ([tutk_koulutusaste] = '31' or [tutk_kaste_t2] = '31'))
		    or ([lahde] in ('31','35','36') and  ([tutk_koulutusaste] = '32' or [tutk_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([tutk_koulutusaste] in ('62','71') or [tutk_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([tutk_koulutusaste] in ('63','72')) or [tutk_kaste_t2] in ('63','72'))) then '1'
		when ([lahde] ='21' and  ([seurv_koulutusaste] = '31' or [seurv_kaste_t2] = '31')
		    or ([lahde] in ('31','35','36') and  ([seurv_koulutusaste] = '32' or [seurv_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([seurv_koulutusaste] in ('62','71') or [seurv_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([seurv_koulutusaste] in ('63','72') or [seurv_kaste_t2] in ('63','72')))) then '3'
		when (
		       (([lahde] ='21' and  [tutk_koulutusaste] <> '31' and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='21' and  [tutk_kaste_t2] <> '31' and ([tutk_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [tutk_koulutusaste] <> '32' and ([tutk_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [tutk_kaste_t2] not in ('32','33','41') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='41' and  [tutk_koulutusaste] not in ('62','71') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='41' and  [tutk_kaste_t2] not in ('62','71') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='51' and  [tutk_koulutusaste] not in ('63','72') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='51' and  [tutk_kaste_t2] not in ('63','72') and ([tutk_kaste_t2] <> '')))) then '2'
		when (
		       ([lahde] ='21' and  [seurv_koulutusaste] <> '31' and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='21' and  [seurv_kaste_t2] <> '31' and ([seurv_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [seurv_koulutusaste] <> '32' and ([seurv_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [seurv_kaste_t2] not in ('32','33','41') and ([seurv_kaste_t2] <> ''))
			or ([lahde] ='41' and  [seurv_koulutusaste] not in ('62','71') and ([seurv_koulutusaste] <> '' ))
			or ([lahde] ='41' and  [seurv_kaste_t2] not in ('62','71') and ([seurv_kaste_t2] <> '' ))
			or ([lahde] ='51' and  [seurv_koulutusaste] not in ('63','72') and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='51' and  [seurv_kaste_t2] not in ('63','72') and ([seurv_kaste_t2] <> '')) )  then '4'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '10' then '5'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and ptoim1r2= '12' then '6'
		when ([tutk_koulutusaste] is null or [tutk_koulutusaste] = '') and
		     ([seurv_koulutusaste] is null or [seurv_koulutusaste] = '') and 
			 ([tutk_kaste_t2] is null or [tutk_kaste_t2] = '') and
		     ([seurv_kaste_t2] is null or [seurv_kaste_t2] = '') and (ptoim1r2 <> '10' and ptoim1r2<> '12' or ptoim1r2 is NULL) then '7'
		else '-1'
         end
		
	   ) as nvarchar (2))
	  ,[7c_tutkinto_alkuperaisella_koulutussektorilla] = cast(
        (
	   
        case
	     when (([lahde] ='21' and ([tutk_koulutusaste] = '31' or [tutk_kaste_t2] = '31'))
		    or ([lahde] in ('31','35','36') and  ([tutk_koulutusaste] = '32' or [tutk_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([tutk_koulutusaste] in ('62','71') or [tutk_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([tutk_koulutusaste] in ('63','72')) or [tutk_kaste_t2] in ('63','72'))) then '1'
		else '2'
		end
		
	   ) as nvarchar (2))
	   ,[7d_tutkinto_muulla_koulutussektorilla] = cast(
        (
	   
        case
	     when (([lahde] ='21' and  [tutk_koulutusaste] <> '31' and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='21' and  [tutk_kaste_t2] <> '31' and ([tutk_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [tutk_koulutusaste] <> '32' and ([tutk_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [tutk_kaste_t2] not in ('32','33','41') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='41' and  [tutk_koulutusaste] not in ('62','71') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='41' and  [tutk_kaste_t2] not in ('62','71') and ([tutk_kaste_t2] <> ''))
			or ([lahde] ='51' and  [tutk_koulutusaste] not in ('63','72') and ([tutk_koulutusaste] <> ''))
			or ([lahde] ='51' and  [tutk_kaste_t2] not in ('63','72') and ([tutk_kaste_t2] <> '')) ) then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))
	   ,[7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla] = cast(
        (
	   
        case
	     when [lahde] ='21' and  ([seurv_koulutusaste] = '31' or [seurv_kaste_t2] = '31')
		    or ([lahde] in ('31','35','36') and  ([seurv_koulutusaste] = '32' or [seurv_kaste_t2] in ('32','33','41')))
			or ([lahde] ='41' and  ([seurv_koulutusaste] in ('62','71') or [seurv_kaste_t2] in ('62','71')))
			or ([lahde] ='51' and  ([seurv_koulutusaste] in ('63','72') or [seurv_kaste_t2] in ('63','72')))  then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))
	   ,[7f_jatkaa_opiskelua_muulla_koulutussektorilla] = cast(
        (
	   
        case
	     when ([lahde] ='21' and  [seurv_koulutusaste] <> '31' and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='21' and  [seurv_kaste_t2] <> '31' and ([seurv_kaste_t2] <> ''))
		    or ([lahde] in ('31','35','36') and  [seurv_koulutusaste] <> '32' and ([seurv_koulutusaste] <> ''))
			or ([lahde] in ('31','35','36') and  [seurv_kaste_t2] not in ('32','33','41') and ([seurv_kaste_t2] <> ''))
			or ([lahde] ='41' and  [seurv_koulutusaste] not in ('62','71') and ([seurv_koulutusaste] <> '' ))
			or ([lahde] ='41' and  [seurv_kaste_t2] not in ('62','71') and ([seurv_kaste_t2] <> '' ))
			or ([lahde] ='51' and  [seurv_koulutusaste] not in ('63','72') and ([seurv_koulutusaste] <> ''))
			or ([lahde] ='51' and  [seurv_kaste_t2] not in ('63','72') and ([seurv_kaste_t2] <> '')) then '1'
		 else '2'
		end
		
	   ) as nvarchar (2))


FROM [VipunenTK_DW].[dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain=tunn
--where aineisto = 'L'



GO


