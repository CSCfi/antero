USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_20_Lukio_amm_oppis_opisk_ian_ja_koul_mukaan]    Script Date: 25.3.2025 16.55.54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_2_20_Lukio_amm_oppis_opisk_ian_ja_koul_mukaan] AS
 
SELECT 
       tilastointivuosi = [tilv]
      ,tilv_date=[tilv_date]
      ,lahde = [lahde]
      ,oppilaitoksen_oppilaitostyyppi = CAST(
      (
		case
		when [oltyp] = 'XX' then '-1'
		else [oltyp]
		end
	   ) as nvarchar(10))	
      ,koulutusluokitus = [koulk]
      ,nuorten_aikuisten_koulutus = [aikoul]
      ,opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus = [tutktav]
      ,ammatillisen_koulutuksen_koulutuslaji = [tutklaja]
      ,opetushallinnon_koulutus = case when halla in ('1','2') then '1' when halla = '3' then '2' else '-1' end
	  
      ,koulutuksen_kunta = [kkun]
      ,rahoituslahde = [rahoitus]
	  ,koulutuksen_tavoite = [tavoite]
      ,sukupuoli = [sp]
      ,aidinkieli_versio1 = [aikielir1]
      ,kirjoihintulovuosi = [alvv]
      ,kirjoihintulokausi = [allk]
      ,opiskelijan_olo_syys = [olosyys]
      ,aikaisempi_yleissivistava_koulutus = [ylsivx]
      ,aikaiksempi_ammpk = [peruskx]
      ,aikaisempi_ammpk_tarkempi= CAST(
      (
		case
			when [peruskx] = '1' then 'Aikaisempi ammatillinen peruskoulutus'
			else 'Ei aikaisempaa ammatillista peruskoulutusta'
		end
	  ) as nvarchar(100))
	  ,ammpk_pohjakoulutuksen_tila = cast(
		(
		case
			when (peruskx = '1' and ((cast(alvv as int) - cast(ammvupe as int) >= 0))) then 'Ammatillinen peruskoulutus suoritettu ennen koulutuksen aloittamista'
			when (peruskx = '1' and ((cast(alvv as int) - cast(ammvupe as int) < 0))) then 'Ammatillinen peruskoulutus suoritettu koulutuksen aloittamisen jälkeen'
			else  'Ei ammatillista peruskoulutusta'
		end
       ) as nvarchar(150))
      ,aikaisemman_ammpk_opintoala1995 = [oalapex]
      ,aikaisemman_ammpk_koulutusala1995 = left([oalapex],1)
      ,aikaisemman_ammpk_koulutusaste1995 = [oastepex]
      ,aikaisemman_ammpk_opintoala2002 = [oalapeux]
      ,aikaisemman_ammpk_koulutusala2002 = [oalapeux_koulutusala]
      ,aikaisemman_ammpk_koulutusaste2002 = [oastpeux]
	  ,aikaisemman_ammpk_koulutusala_taso2 = [iscfinarrow_pex]
	  ,aikaisemman_ammpk_koulutusaste_taso2 = [kaste_t2_pex]
      ,aikaisemman_ammpk_suoritusvuosi = [ammvupe]
      ,aikaisempi_ammpk_nayttotutkintona = [nayttox]
      ,aikaisempi_ammpk_nayttotutkintona_tarkempi= CAST(
      (
		case
			when tilv >= 2018 then 'Tuntematon' --2018 alkaen ei mukana
			when [nayttox] = '1' then 'Aikaisempi ammatillinen peruskoulutus näyttötutkintona'		
			else 'Ei aikaisempaa ammatillista peruskoulutusta näyttötutkintona'			  
		end
	   ) as nvarchar(100))
      ,aikaisempi_ammpk_oppisopimuskoulutuksena = [oppispex]
      ,aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi= CAST(
      (
		case
			when [oppispex] = '1' then 'Aikaisempi ammatillinen peruskoulutus oppisopimuskoulutuksena'
			else 'Ei aikaisempaa ammatillista peruskoulutusta oppisopimuskoulutuksena'
		end
	   ) as nvarchar(100))
      ,aikaisempi_ammlisa = [lisakx]
      ,aikaisempi_ammlisa_tarkempi= CAST(
      (
		case
			when [lisakx] = '1' then 'Aikaisempi ammatillinen lisäkoulutus'
			else 'Ei aikaisempaa ammatillista lisäkoulutusta'
		end
	   ) as nvarchar(100))
	  ,ammlisa_pohjakoulutuksen_tila = cast(
	  (
		case
			when (lisakx = '1' and ((cast(alvv as int) - cast(ammvuli as int) >= 0))) then 'Ammatillinen lisäkoulutus suoritettu ennen koulutuksen aloittamista'
			when (lisakx = '1' and ((cast(alvv as int) - cast(ammvuli as int) < 0))) then 'Ammatillinen lisäkoulutus suoritettu koulutuksen aloittamisen jälkeen'
			else  'Ei ammatillista lisäkoulutusta'
		end
       ) as nvarchar(150)) 
      ,aikaisemman_ammlisa_opintoala1995 = [oalalix]
      ,aikaisemman_ammlisa_koulutusala1995 = left([oalalix],1)
      ,aikaisemman_ammlisa_koulutusaste1995 = [oastelix]
      ,aikaisemman_ammlisa_opintoala2002 = [oalaliux]
      ,aikaisemman_ammlisa_koulutusala2002 = [oalaliux_koulutusala]
      ,aikaisemman_ammlsia_koulutusaste2002 = [oastliux]
	  ,aikaisemman_ammlisa_koulutusala_taso2 = [iscfinarrow_lix]
	  ,aikaisemman_ammlisa_koulutusaste_taso2 = [kaste_t2_lix]
      ,aikaisemman_ammlisa_suoritusvuosi = [ammvuli]
      ,aikaisempi_ammlisa_oppisopimuskoulutuksena = [oppislix]
      ,aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi= CAST(
      (
		case
			when [oppislix] = '1' then 'Aikaisempi ammatillinen lisäkoulutus oppisopimuskoulutuksena'
			else 'Ei aikaisempaa ammatillista lisäkoulutusta oppisopimuskoulutuksena'
		end
	   )as nvarchar(100))
      ,aikaisempi_alempi_kk = [alempikax]
      ,aikaisempi_alempi_kk_tarkempi= CAST(
      (
		case
			when [alempikax] = '1' then 'Aikaisempi alemman korkeakouluasteen tai ammatillisen korkea-asteen koulutus'
			else 'Ei aikaisempaa alemman korkeakouluasteen tai ammatillisen korkea-asteen koulutusta'
		end
	   )as nvarchar(100))
	  ,alempi_kk_pohjakoulutuksen_tila = cast(
		(
		case
        when (alempikax = '1' and ((cast(alvv as int) - cast(svuosiak as int) >= 0))) then 'Alempi korkeakouluaste tai ammatillisen korkea-aste suoritettu ennen koulutuksen aloittamista'
        when (alempikax = '1' and ((cast(alvv as int) - cast(svuosiak as int) < 0))) then 'Alempi korkeakouluaste tai ammatillisen korkea-aste suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei alempaa korkeakouluastetta tai ammatillista korkea-astetta'
    end
       )
    as nvarchar(150)) 
      ,aikaisemman_alemman_kk_opintoala1995 = [oalaakx]
      ,aikaisemman_alemman_kk_koulutusala1995 = LEFT([oalaakx],1)
      ,aikaisemman_alemman_kk_koulutusaste1995 = [oasteakx]
      ,aikaisemman_alemman_kk_opintoala2002 = [oalauakx]
      ,aikaisemman_alemman_kk_koulutusala2002 = [oalauakx_koulutusala]
      ,aikaisemman_alemman_kk_koulutusaste2002 = [oasteuakx]
	  ,aikaisemman_alemman_kk_koulutusala_taso2 = [iscfinarrow_akx]
	  ,aikaisemman_alemman_kk_koulutusaste_taso2 = [kaste_t2_akx]
      ,aikaisemman_alemman_kk_suoritusvuosi = [svuosiak]
      ,aikaisempi_ylempi_kk = [ylempikax]
      ,aikaisempi_ylempi_kk_tarkempi= CAST(
      (
		case
		when [ylempikax] = '1' then 'Aikaisempi ylemmän korkeakouluasteen koulutus tai tutkijakoulutus'
		else 'Ei aikaisempaa ylemmän korkeakouluasteen koulutusta tai tutkijakoulutusta'
		end
	   )as nvarchar(100))
	  ,ylempi_kk_pohjakoulutuksen_tila = cast(
		(
		case
        when (ylempikax = '1' and ((cast(alvv as int) - cast(svuosiyk as int) >= 0))) then 'Ylempi korkeakouluaste tai tutkijakoulutus suoritettu ennen koulutuksen aloittamista'
        when (ylempikax = '1' and ((cast(alvv as int) - cast(svuosiyk as int) < 0))) then 'Ylempi korkeakouluaste tai tutkijakoulutus suoritettu koulutuksen aloittamisen jälkeen'
        else  'Ei ylempää korkeakouluastetta tai tutkijakoulutusta'
    end
       )
    as nvarchar(150)) 
      ,aikasemman_ylemman_kk_opintoala1995= [oalaykx]
      ,aikaisemman_ylemman_kk_koulutuasala1995 = left([oalaykx],1)
      ,aikaisemman_ylemman_kk_koulutusaste1995 = [oasteykx]
      ,aikaisemman_ylemman_kk_opintoala2002 = [oalauykx]
      ,aikaisemman_ylemman_kk_koulutusala2002 = [oalauykx_koulutusala]
      ,aikaisemman_ylemman_kk_koulutusaste2002 = [oasteuykx]
	  ,aikaisemman_ylemman_kk_koulutusala_taso2 = [iscfinarrow_ykx]
	  ,aikaisemman_ylemman_kk_koulutusaste_taso2 = [kaste_t2_ykx]
      ,aikaisemman_ylemman_kk_suoritusvuosi = [svuosiyk]
      ,opiskelijan_asuinkunta = [askun]
      ,syntymavuosi = CAST(
      (
		case
		when [syntv] = 'XXXX' then '-1'
		else [syntv]
		end
	   )
	as nvarchar(10))	
         ,lukumaara = CAST(
	(
		case 
			when lahde <> '21' /*ei-lukio*/ or olosyys /*opiskelijan_olo_syys*/ in ('1','2') 
			then lkm /*lukumaara*/
		end
	)
	as int)

      ,tietolahde = f.[tietolahde]
      ,rivinumero = [rivinumero]
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
      ,aikaisemmasta_koulutuksesta_ammpk_kulunut_aika =  cast ((case when [ammvupe] = '' then ' '
      when alvv = '' then ' '
	  when ((cast(alvv as int) - cast(ammvupe as int) < 0)) then '888' 
	  else ((cast(alvv as int) - cast(ammvupe as int)) )end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika =  cast ((case when [ammvuli] = '' then ' '
      when alvv = '' then ' '
	  when ((cast(alvv as int) - cast(ammvuli as int) < 0)) then '888' 
	  else ((cast(alvv as int) - cast(ammvuli as int)))end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika =  cast ((case when [svuosiak] = '' then ' '
      when alvv = '' then ' ' 
	  when ((cast(alvv as int) - cast(svuosiak as int) < 0)) then '888' 
	  else ((cast(alvv as int) - cast(svuosiak as int)))end) as nvarchar (10))

      ,aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika =  cast ((case when [svuosiyk] = '' then ' '
      when alvv = '' then ' ' 
	  when ((cast(alvv as int) - cast(svuosiyk as int) < 0)) then '888' 
	  else ((cast(alvv as int) - cast(svuosiyk as int)))end) as nvarchar (10))      
 
 --vertailut     
	  ,aiemman_tutkinnon_ammpk_opintoala_sama  =  
       CAST(
      (
		case
		when koulk_opintoala = oalapeux then 'Aiemman tutkinnon (ammpk) opintoala sama'
		else 'Ei sama opintoala'
		end
	  )
	 	
	 as nvarchar(100))	
	  ,aiemman_tutkinnon_ammpk_koulutusala_sama  = CAST(
      (
		case
		when koulk_koulutusala = oalapeux_koulutusala then 'Aiemman tutkinnon (ammpk) koulutusala sama'
		else 'Ei sama koulutusaste'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ammpk_koulutusaste_sama  = CAST(
      (
		case
        when koulk_koulutusaste = oastpeux then 'Aiemman tutkinnon (ammpk) koulutusaste sama'
		else 'Ei sama koulutusaste'
		end
	   )
	as nvarchar(100))	
	,aiemman_tutkinnon_ammlisa_opintoala_sama  =
	 CAST(
      (
		case
		when oalaliux = '' then 'Ei sama opintoala'
		when koulk_opintoala = [oalaliux] then 'Aiemman tutkinnon (ammlisa) opintoala sama'
		else 'Ei sama opintoala'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ammlisa_koulutusala_sama  = CAST(
      (
		case
		when koulk_koulutusala = oalaliux_koulutusala then 'Aiemman tutkinnon (ammlisa) koulutusala sama'
		else 'Ei sama koulutusala'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ammlisa_koulutusaste_sama  = CAST(
      (
		case
		when koulk_koulutusaste = [oastliux] then 'Aiemman tutkinnon (ammlisa) koulutusaste sama'
		else 'Ei sama koulutusaste'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_alempi_kk_opintoala_sama  = 
	 CAST(
      (
		case
		when koulk_opintoala = [oalauakx] then 'Aiemman tutkinnon (alempi_kk) opintoala sama'
		else 'Ei sama opintoala'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_alempi_kk_koulutusala_sama  = CAST(
      (
		case
	    when koulk_koulutusala = [oalauakx_koulutusala]  then 'Aiemman tutkinnon (alempi_kk) koulutusala sama'
		else 'Ei sama koulutusala'
		end
	   )
	   	as nvarchar(100))
	 ,aiemman_tutkinnon_alempi_kk_koulutusaste_sama  = CAST(
      (
		case
		when koulk_koulutusaste = [oasteuakx] then 'Aiemman tutkinnon (alempi_kk) koulutusaste sama'
		else 'Ei sama koulutusaste'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ylempi_kk_opintoala_sama  = 
	 CAST(
      (
		case
		when koulk_opintoala = [oalauykx] then 'Aiemman tutkinnon (ylempi_kk) opintoala sama'
		else 'Ei sama opintoala'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ylempi_kk_koulutusala_sama  = CAST(
      (
		case
		when koulk_koulutusala = oalauykx_koulutusala then 'Aiemman tutkinnon (ylempi_kk) koulutusala sama'
		else 'Ei sama koulutusala'
		end
	   )
	as nvarchar(100))	
	 ,aiemman_tutkinnon_ylempi_kk_koulutusaste_sama  = CAST(
      (
		case
		when koulk_koulutusaste = [oasteuykx] then 'Aiemman tutkinnon (ylempi_kk) koulutusaste sama'
		else 'Ei sama koulutusaste'
		end
	   )
	as nvarchar(100))	
	
	 ,aikaisempi_korkein_tutkinto =  cast (
      (
         case 
		 --Ylempi korkeakouluasteen koulutus tai tutkijakoulutus
         when ylempikax = '1'  then '7'
		 --Alempi korkeakouluasteen tai ammatillisen korkea-asteen koulutus
         when alempikax = '1'  then '6'
		 --Opistoaste
         when peruskx='1' and (oastpeux = '50' or kaste_t2_pex = '51') then '5'
		 -- Ammatti- ja erikoisammattitutkinto
         when lisakx='1'   then '4'
		 -- Ammatillinen perustutkinto
		 when peruskx='1' /*and oastpeux <> '50' and kaste_t2_pex <> '51'*/ then '3'
		 -- Ylioppilastutkinto
		 when ylsivx = '2' then '2'
		 -- Ei perusasteen jälkeistä koulutusta
		 when ylsivx = '1' then '1'
		 -- Muu tai tuntematon
         else '8'
         end) as nvarchar (1))
		 
	 ,aiemman_tutkinnon_opintoala2002_sama  = 
	 CAST(
      (
		case
			when koulk_opintoala = [oalapeux] then 'Aiemman tutkinnon opintoala sama'
			when koulk_opintoala = [oalaliux] then 'Aiemman tutkinnon opintoala sama'
			when koulk_opintoala = [oalauakx] then 'Aiemman tutkinnon opintoala sama'
			when koulk_opintoala = [oalauykx] then 'Aiemman tutkinnon opintoala sama'
		else 'Ei sama opintoala'

		end
	   )
	as nvarchar(100))
	
	,aiemman_tutkinnon_koulutusaste2002_sama  = 
	 CAST(
      (
		case
			when koulk_koulutusaste = [oastpeux] then 'Aiemman tutkinnon koulutusaste sama'
			when koulk_koulutusaste = [oastliux] then 'Aiemman tutkinnon koulutusaste sama'
			when koulk_koulutusaste = [oasteuakx] then 'Aiemman tutkinnon koulutusaste sama'
			when koulk_koulutusaste = [oasteuykx] then 'Aiemman tutkinnon koulutusaste sama'
		else 'Ei sama koulutusaste'

		end
	   )
	as nvarchar(100))
	
	,aiemman_tutkinnon_koulutusala2002_sama  = 
	 CAST(
      (
		case
			when koulk_koulutusala = [oalapeux_koulutusala] then 'Aiemman tutkinnon koulutusala sama'
			when koulk_koulutusala = [oalaliux_koulutusala] then 'Aiemman tutkinnon koulutusala sama'
			when koulk_koulutusala = [oalauakx_koulutusala] then 'Aiemman tutkinnon koulutusala sama'
			when koulk_koulutusala = [oalauykx_koulutusala] then 'Aiemman tutkinnon koulutusala sama'
		else 'Ei sama koulutusala'
		end
	   )
	as nvarchar(100))
	,aiemman_tutkinnon_koulutusala_taso2_sama  = 
	 CAST(
      (
		case
			when koulk_koulutusala_taso2 = [iscfinarrow_pex] then 'Aiemman tutkinnon koulutusala taso 2 sama'
			when koulk_koulutusala_taso2 = [iscfinarrow_lix] then 'Aiemman tutkinnon koulutusala taso 2 sama'
			when koulk_koulutusala_taso2 = [iscfinarrow_akx] then 'Aiemman tutkinnon koulutusala taso 2 sama'
			when koulk_koulutusala_taso2 = [iscfinarrow_ykx] then 'Aiemman tutkinnon koulutusala taso 2 sama'
			else 'Ei sama koulutusala taso 2'
		end
	  ) as nvarchar(100))
	,aiemman_tutkinnon_koulutusaste_taso2_sama  = 
	 CAST(
      (
		case
			when koulk_koulutusaste_taso2 = [kaste_t2_pex] then 'Aiemman tutkinnon koulutusaste taso 2 sama'
			when koulk_koulutusaste_taso2 = [kaste_t2_lix] then 'Aiemman tutkinnon koulutusaste taso 2 sama'
			when koulk_koulutusaste_taso2 = [kaste_t2_akx] then 'Aiemman tutkinnon koulutusaste taso 2 sama'
			when koulk_koulutusaste_taso2 = [kaste_t2_ykx] then 'Aiemman tutkinnon koulutusaste taso 2 sama'
		else 'Ei sama koulutusaste taso 2'

		end
	   )
	as nvarchar(100))
	,nuorten_aikuisten_koulutus_amm = cast(
    (
        case
			when tutktav /*ops_näyttö*/ = '1' and lahde in ('31','32','33','35') then 1
			when (tutktav /*ops_näyttö*/ in ('1','2') and lahde = '34' ) or (tutktav /*ops_näyttö*/ = '2' and lahde in ('31','32','33','35')) then 2
			else '-1'
        end
    )
    as nvarchar(2))	
	,koulutuksen_jarjestamismuoto=cast(
    (
        case
			when (lahde = '31' or lahde = '32' or lahde = '33' or lahde='35')  then 1
			when (lahde = '34') then 2
			else '-1'
        end
    )
    as nvarchar(2))	
	,aloittaneet = CAST(
	(
		case 
			when alvv /*kirjoihintulovuosi*/ = tilv /*tilastointivuosi*/ 
				 and (lahde <> '21' /*ei-lukio*/ or olosyys /*opiskelijan_olo_syys*/ in ('1','2'))
			then lkm /*lukumaara*/
		end
	)
	as int)
	,viimeisimman_koulutuksen_suorituvuosi=cast(
    (
        case
        when ammvupe is not null and (ammvupe >= coalesce(ammvuli,0)) and (ammvupe >= coalesce(svuosiak,0)) and (ammvupe >= coalesce(svuosiyk,0))  then ammvupe
        when ammvuli is not null and (ammvuli >= coalesce(ammvupe,0)) and (ammvuli >= coalesce(svuosiak,0)) and (ammvuli >= coalesce(svuosiyk,0))  then ammvuli
		when svuosiak is not null and (svuosiak >= coalesce(ammvupe,0)) and (svuosiak >= coalesce(ammvuli,0)) and (svuosiak >= coalesce(svuosiyk,0))  then svuosiak
		when svuosiyk is not null and (svuosiyk >= coalesce(ammvupe,0)) and (svuosiyk >= coalesce(ammvuli,0)) and (svuosiyk >= coalesce(svuosiak,0))  then svuosiyk
        else '-1'
        end
    )
    as nvarchar(4))	
	,viimeisimmästä_koulutuksesta_kulunut_aika=cast(
    (
        case
        when ammvupe is not null and (ammvupe >= coalesce(ammvuli,0)) and (ammvupe >= coalesce(svuosiak,0)) and (ammvupe >= coalesce(svuosiyk,0)) and alvv <> ''  then ((cast(alvv as int) - cast(ammvupe as int)))
        when ammvuli is not null and (ammvuli >= coalesce(ammvupe,0)) and (ammvuli >= coalesce(svuosiak,0)) and (ammvuli >= coalesce(svuosiyk,0))  and alvv <> '' then ((cast(alvv as int) - cast(ammvuli as int)))
		when svuosiak is not null and (svuosiak >= coalesce(ammvupe,0)) and (svuosiak >= coalesce(ammvuli,0)) and (svuosiak >= coalesce(svuosiyk,0)) and alvv <> '' then ((cast(alvv as int) - cast(svuosiak as int)))
		when svuosiyk is not null and (svuosiyk >= coalesce(ammvupe,0)) and (svuosiyk >= coalesce(ammvuli,0)) and (svuosiyk >= coalesce(svuosiak,0)) and alvv <>'' then ((cast(alvv as int) - cast(svuosiyk as int)))
        else '-1'
        end
    )    as nvarchar(10))	

	,hallinnonala2 = halla
	  /*(
		case
		when ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
		when ophal = '2' and d1.maakunta_koodi <> '21' /* 'Ålands Landskapsregering' */ and d2.opintoala2002_koodi not in ('902','903','904') /* Palo- ja pelastusala, Poliisiala ja Vankeinhoito  = 'Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/ then '2' --Opetushallinto, työvoimakoulutus
		when ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
		else '-1'
		end
	  )*/

  FROM [VipunenTK_DW].[dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] f
  /*left join VipunenTK.dbo.d_alueluokitus d1 on d1.alueluokitus_avain=f.kkun
  left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutusluokitus_avain=f.koulk*/

GO


