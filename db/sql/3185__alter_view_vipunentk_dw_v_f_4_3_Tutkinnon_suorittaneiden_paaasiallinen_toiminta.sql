USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 21.7.2020 20:02:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER VIEW [dbo].[v_f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] AS
 
SELECT 
       tilastointivuosi = [tilv]
      ,tilv_date=[tilv_date]
      ,aineisto = [aineisto] 
      ,asuinmaakunta = [tilvasmaak]
      ,aikuisopiskelija= [aiopis] 
      ,tutkinnon_suoritusvuosi=[suorv] 
      ,tutkinnon_suorittamismaakunta=[tutkmaak] 
      ,koulutuksen_jarjestaja = [jarj] 
      ,oppilaitos=[tunn] 
      ,valiaikainen_amk=Cast(left(ltrim([akk]),2) as nvarchar(2)) 
      ,koulutusluokitus =[koulk] 
      ,koulutusmuoto=[kouljat]
      ,oppisopimuskoulutus = [oppis] 
      ,ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa =[tutklaja_tr] 
      ,paaasiallinen_toiminta=[ptoim1r2] 
      ,maassaolo = [maassaolo] 
      ,ammattiasema = [amas] 
      ,ammattiluokitus_2010 = [amm2010] 
      ,lukumaara =[lkm] 

      ,eu_etamaat_avain = eu_etamaat
	  ,aikielir1_avain = aikielir1
	  ,kansalaisuus_maanosa_avain = 
	    CASE 
			WHEN mosa <> '-1' THEN 'M' + mosa
			ELSE mosa
		END 

      ,tietolahde = l.[tietolahde]
      ,rivinumero = [rivinumero]
      ,aineistotunnus = Cast('4.3' as nvarchar(8))
      ,tutkintolaji_tyollistymiseen = cast( 
	    (
	     -- eka
		case
	    when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					  where 
							 kluok.koulutusaste2002_koodi   = '20'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat='1'
	      then '01'
		 -- toinen
		when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where
							 kluok.koulutusaste2002_koodi   = '31'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat='1'
	      then '02' 
		   -- kolmas
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
							  kluok.koulutusaste2002_koodi   = '31'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat='3'
			          then '03'
		   -- neljas ja viides (2018 alkaen ei erottelua ops-per. / näyttötutk.) 
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
							  kluok.koulutusaste2002_koodi   = '32'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='1'
			 --and l.kouljat='1'
			          then '04'
		  /* -- viides
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
							  kluok.koulutusaste2002_koodi   = '32'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='1'
			 --and l.kouljat='8'
			          then '05'*/

		   -- kuudes
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
							  kluok.koulutusaste2002_koodi   = '32'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='2'
			          then '06'
		   -- seitsemas
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
			
						kluok.koulutusaste2002_koodi   = '32'
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='3'
			          then '07'
		   -- kahdeksas
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					   
							 (kluok.koulutusaste2002_koodi   = '61' or kluok.koulutusaste_koodi = '50')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='1'
			          then '08'
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					
							 (kluok.koulutusaste2002_koodi   = '50' or kluok.koulutusaste_koodi = '50')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='1'
			 and l.kouljat = '1'
			          then '08'
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					
							  (kluok.koulutusaste2002_koodi   = '61' or kluok.koulutusaste_koodi = '50')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='1'
			 and l.kouljat = '1'
			          then '08'
		   -- yhdeksän
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					
							(kluok.koulutusaste2002_koodi   = '62')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '09'
		   -- kymmenen
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					  
							 (kluok.koulutusaste2002_koodi   = '62')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '3'
			          then '10'
		   -- yksitoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					  
							 (kluok.koulutusaste2002_koodi   = '71')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '3'
			          then '11'
		   -- kaksitoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					   
							 (kluok.koulutusaste2002_koodi   = '63')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '12'
		   -- kolmetoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					  
							 (kluok.koulutusaste2002_koodi   = '72')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '13'
		   -- neljatoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where
					  
							 (kluok.koulutusaste2002_koodi   = '73')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '14'
		   -- viisitoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					   
							  (kluok.koulutusaste2002_koodi   = '81')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '15'
		   -- kuusitoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					   
							 (kluok.koulutusaste2002_koodi   = '82')
							 and kluok.koulutus_koodi = l.koulk)
			 and l.tutklaja_tr='9'
			 and l.kouljat = '1'
			          then '16'
		   -- seitsemantoista
		  when l.koulk in (select (kluok.koulutus_koodi )
					   from VipunenTK_DW.dbo.d_koulutusluokitus kluok
					   where 
					
							 (kluok.koulutusaste2002_koodi   = '90')
							 and kluok.koulutus_koodi = l.koulk)
			          then '17'
		  end
	   ) as nvarchar(2))
, sijoittuminen_1v_tutkinnon_jalkeen = case when cast(l.suorv as int) = (cast(l.tilv as int) - 1) then  cast(lkm as int) else '' end 
, sijoittuminen_3v_tutkinnon_jalkeen = case when cast(l.suorv as int) = (cast(l.tilv as int) - 3) then  cast(lkm as int) else '' end
, sijoittuminen_5v_tutkinnon_jalkeen = case when cast(l.suorv as int) = (cast(l.tilv as int) - 5) then  cast(lkm as int) else '' end  
, paaasiallinen_toiminta_ja_maasta_muuttaneet = cast(
	(
		case
			when maassaolo = '2' then '8'
			when ptoim1r2 = '10' then '1'
			when ptoim1r2 = '12' then '4'
			when ptoim1r2 = '13' then '2'
			when ptoim1r2 = '22' then '3'
			when ptoim1r2 = '25' then '5'
			when ptoim1r2 = '26' then '6'
			when ptoim1r2 = '99' then '7'
			else '9'
		end
	)
	as nvarchar(2))
,paaasiallinen_toiminta_okm= cast(
	(
		case
			when maassaolo = '2' then '5'	
			when (ptoim1r2 = '10' or ptoim1r2 = '13') then '1'
			when ptoim1r2 = '22'  then '2'
			when ptoim1r2 = '12'  then '3'
			when (ptoim1r2 = '25' or ptoim1r2 = '26'or ptoim1r2 = '28' or ptoim1r2 = '99') then '4'
			else '-1'
		end
	)
	as nvarchar(2))
		

  FROM [VipunenTK_DW].[dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] as l







GO


USE [ANTERO]