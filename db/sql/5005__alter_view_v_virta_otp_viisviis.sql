USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_viisviis]    Script Date: 9.11.2021 10:40:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_virta_otp_viisviis] 

AS

SELECT       
      [Tilastovuosi] = f.[vuosi]
	  ,[Lukuvuosi] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
	  ,convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))) AS lo_Aloituspvm
      ,convert(date,dateadd(s, convert(bigint, f.ooAloituspvm) / 1000, convert(datetime, '1-1-1970'))) AS oo_Aloituspvm
	  ,[Aika aloittamisesta] = coalesce(
		case 
			when f.vuosi-(year(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))+case when month(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))>7 then 1 else 0 end)>=8 then '8 tai enemmän' 
			when f.vuosi-(year(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))+case when month(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))>7 then 1 else 0 end)<0 then 'Ei tietoa'
			else cast(f.vuosi-(year(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))+case when month(convert(date,dateadd(s, convert(bigint, f.loAloituspvm) / 1000, convert(datetime, '1-1-1970'))))>7 then 1 else 0 end) as varchar) 
		end,'Ei tietoa')
	  ,[Henkilo_koodi] = opiskelijaAvain+opiskeluoikeusAvain+d1.oppilaitoskoodi
	  ,[Sukupuoli] = coalesce(d3.sukupuoli,'Tuntematon')
      ,uusi_Opisk = coalesce(f.[uusiOpisk],0)
	  ,[Aloittanut keväällä] = case f.uusiOpiskKevat when 1 then 'Kyllä' when 0 then 'Ei' else 'Tuntematon' end
      ,[Olo syksy] = coalesce(f.edellinenSyysolo,0)
	  ,[Olo kevät] = coalesce(f.olok,0)
	  ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55pankinAvulla]=1 then 1 else 0 end
	  --,f.[olos]
	  --,f.[olok]
      ,[Opintopisteet syksy] = coalesce(f.[syys],0)
      ,[Opintopisteet kevät] = coalesce(f.[kevat],0)
      --,[Opintopisteet summa] = f.[summa]
	  
	  ,[Sektori] = 
		case 
			when d1.oppilaitos in 
			('Aalto-yliopisto',
			'Helsingin yliopisto',
			'Itä-Suomen yliopisto',
			'Jyväskylän yliopisto',
			'Lapin yliopisto',
			'Lappeenrannan–Lahden teknillinen yliopisto',
			'Oulun yliopisto',
			'Svenska handelshögskolan',
			'Taideyliopisto',
			'Tampereen tekn. yliopisto',
			'Tampereen yliopisto',
			'Turun yliopisto',
			'Vaasan yliopisto',
			'Åbo Akademi') then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,[Korkeakoulu] = d1.oppilaitos     
      ,[Tutkintokoodi] = coalesce(f.[tkoodi],'999999')
	  ,[Tutkinto]  = coalesce(d2.koulutus,'Tuntematon')
	  ,[OKM ohjauksen ala] = coalesce(d2.OKM_ohjauksen_ala,'Tuntematon')
	  ,[Koulutusaste, taso 1] = coalesce(d2.iscle2011,'Tuntematon')
	  ,[Koulutusaste, taso 2] = coalesce(d2.Koulutusaste_taso2,'Tuntematon')
	  ,[Koulutusala, taso 1] = coalesce(d2.iscfibroad2013,'Tuntematon')
	  ,[Koulutusala, taso 2] = coalesce(d2.iscfinarrow2013,'Tuntematon')
	  ,[Koulutusala, taso 3] = coalesce(d2.iscfi2013,'Tuntematon')

      ,f.[suorittanut27] AS suorittanut_27
      ,f.[suorittanut55ilmanPankkia] AS suorittanut_55_ilman_pankkia
      ,f.[suorittanut55pankinAvulla] AS suorittanut_55_pankin_avulla

	  --järjestys
	  ,[OKM ohjauksen ala jarj] = coalesce(case when d2.jarjestys_OKM_ohjauksen_ala = 'ööö' then null else d2.jarjestys_OKM_ohjauksen_ala end,999)
	  ,[Koulutusaste, taso 1 jarj] = coalesce(case when d2.jarjestys_iscle2011 = 'ööö' then null else d2.jarjestys_iscle2011 end,999)
	  ,[Koulutusaste, taso 2 jarj] = coalesce(case when d2.jarjestys_Koulutusaste_taso2 = 'ööö' then null else d2.jarjestys_Koulutusaste_taso2 end,999)
	  ,[Koulutusala, taso 1 jarj] = coalesce(case when d2.jarjestys_iscfibroad2013 = 'ööö' then null else d2.jarjestys_iscfibroad2013 end,999)
	  ,[Koulutusala, taso 2 jarj] = coalesce(case when d2.jarjestys_iscfinarrow2013 = 'ööö' then null else d2.jarjestys_iscfinarrow2013 end,999)
	  ,[Koulutusala, taso 3 jarj] = coalesce(case when d2.jarjestys_iscfi2013 = 'ööö' then null else d2.jarjestys_iscfi2013 end,9999)   

  FROM [sa].[sa_virta_otp_viisviis] f

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitoskoodi=f.oppilaitostunnus
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutus_koodi=f.tkoodi
LEFT JOIN VipunenTK.dbo.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli


GO


USE [ANTERO]