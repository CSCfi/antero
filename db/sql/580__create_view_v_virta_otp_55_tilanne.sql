IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_55_tilanne'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_virta_otp_55_tilanne as select 1 as a'
GO

ALTER VIEW dw.[v_virta_otp_55_tilanne] AS

select 
      
      [Tilastovuosi] = f.[vuosi]
	  ,[Lukuvuosi] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
	  ,f.loAloituspvm
      ,f.ooAloituspvm
	  ,[Aika aloittamisesta] = coalesce(
		case 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)>=8 then '8 tai enemmän' 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)<0 then 'Ei tietoa'
			else cast(f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end) as varchar) 
		end,'Ei tietoa')
	  ,[Henkilo_koodi] = opiskelijaAvain+opiskeluoikeusAvain+d1.oppilaitoskoodi
	  ,[Sukupuoli] = coalesce(d3.sukupuoli,'Tuntematon')
      ,uusi_opisk = coalesce(f.uusiOpisk,0)
	  ,[Aloittanut keväällä] = case f.uusiOpiskKevat when 1 then 'Kyllä' when 0 then 'Ei' else 'Tuntematon' end
      ,[Olo syksy] = coalesce(f.edellinenSyysolo,0)
	  ,[Olo kevät] = coalesce(f.olok,0)
	  ,[Lasna] = case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end
	  ,[Suorittanut55] = case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end
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
			'Lappeenrannan tekn. yliopisto',
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

      ,f.[suorittanut27]
      ,f.[suorittanut55IlmanPankkia]
      ,f.[suorittanut55PankinAvulla]

	  --järjestys
	  ,[OKM ohjauksen ala jarj] = coalesce(case when d2.jarjestys_OKM_ohjauksen_ala = 'ööö' then null else d2.jarjestys_OKM_ohjauksen_ala end,999)
	  ,[Koulutusaste, taso 1 jarj] = coalesce(case when d2.jarjestys_iscle2011 = 'ööö' then null else d2.jarjestys_iscle2011 end,999)
	  ,[Koulutusaste, taso 2 jarj] = coalesce(case when d2.jarjestys_Koulutusaste_taso2 = 'ööö' then null else d2.jarjestys_Koulutusaste_taso2 end,999)
	  ,[Koulutusala, taso 1 jarj] = coalesce(case when d2.jarjestys_iscfibroad2013 = 'ööö' then null else d2.jarjestys_iscfibroad2013 end,999)
	  ,[Koulutusala, taso 2 jarj] = coalesce(case when d2.jarjestys_iscfinarrow2013 = 'ööö' then null else d2.jarjestys_iscfinarrow2013 end,999)
	  ,[Koulutusala, taso 3 jarj] = coalesce(case when d2.jarjestys_iscfi2013 = 'ööö' then null else d2.jarjestys_iscfi2013 end,9999)
   

  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitoskoodi=f.oppilaitostunnus
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d2 on d2.koulutus_koodi=f.tkoodi
LEFT JOIN VipunenTK.dbo.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli