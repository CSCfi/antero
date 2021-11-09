USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_55_tilanne]    Script Date: 9.11.2021 10:57:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_virta_otp_55_tilanne] AS

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
	  ,[Henkilo_koodi] = opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi
	  ,[Sukupuoli] = coalesce(d3.sukupuoli_fi,'Tuntematon')
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
			when d1.organisaatio_fi in 
			('Aalto-yliopisto',
			'Helsingin yliopisto',
			'Itä-Suomen yliopisto',
			'Jyväskylän yliopisto',
			'Lapin yliopisto',
			'Lappeenrannan teknillinen yliopisto LUT',
			'Oulun yliopisto',
			'Svenska handelshögskolan',
			'Taideyliopisto',
			'Tampereen teknillinen yliopisto',
			'Tampereen yliopisto',
			'Turun yliopisto',
			'Vaasan yliopisto',
			'Åbo Akademi') then 'Yliopisto'
			else 'Ammattikorkeakoulu'
		end
	  ,[Korkeakoulu] = d1.organisaatio_fi
      ,[Tutkintokoodi] = coalesce(f.[tkoodi],'999999')
	  ,[Tutkinto]  = coalesce(d2.koulutusluokitus_fi,'Tuntematon')
	  ,[OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
	  ,[Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
	  ,[Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
	  ,[Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
	  ,[Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')

      ,f.[suorittanut27]
      ,f.[suorittanut55IlmanPankkia]
      ,f.[suorittanut55PankinAvulla]

	  --ruotsi
	  ,[Statistikår] = f.[vuosi]
	  ,[Läsår] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
	  ,[Inlett studierna] = coalesce(
		case 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)>=8 then '8 eller mer' 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)<0 then 'Information saknas'
			else cast(f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end) as varchar) 
		end,'Information saknas')
	  ,[Kön] = coalesce(d3.sukupuoli_sv,'Information saknas')
	  ,[Inlett studierna på våren] = case f.uusiOpiskKevat when 1 then 'Ja' when 0 then 'Nej' else 'Information saknas' end	  
	  ,[Sektor] = 
		case 
			when d1.organisaatio_fi in 
			('Aalto-yliopisto',
			'Helsingin yliopisto',
			'Itä-Suomen yliopisto',
			'Jyväskylän yliopisto',
			'Lapin yliopisto',
			'Lappeenrannan teknillinen yliopisto',
			'Oulun yliopisto',
			'Svenska handelshögskolan',
			'Taideyliopisto',
			'Tampereen teknillinen yliopisto',
			'Tampereen yliopisto',
			'Turun yliopisto',
			'Vaasan yliopisto',
			'Åbo Akademi') then 'Universitet'
			else 'Yrkeshögskola'
		end
	  ,[Högskola] = d1.organisaatio_sv
      ,[Examenskod] = coalesce(f.[tkoodi],'999999')
	  ,[Examen]  = coalesce(d2.koulutusluokitus_sv,'Information saknas')
	  ,[UKM-styrningsområde] = coalesce(d2.okmohjauksenala_sv,'Information saknas')
	  ,[Utbildningsnivå, nivå 1] = coalesce(d2.koulutusastetaso1_sv,'Information saknas')
	  ,[Utbildningsnivå, nivå 2] = coalesce(d2.Koulutusastetaso2_sv,'Information saknas')
	  ,[Utbildningsområde, nivå 1] = coalesce(d2.koulutusalataso1_sv,'Information saknas')
	  ,[Utbildningsområde, nivå 2] = coalesce(d2.koulutusalataso2_sv,'Information saknas')
	  ,[Utbildningsområde, nivå 3] = coalesce(d2.koulutusalataso3_sv,'Information saknas')

	  --englanti
	  ,[Statistical year] = f.[vuosi]
	  ,[Term] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
	  ,[Time since the beginning of studies] = coalesce(
		case 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)>=8 then '8 or more' 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)<0 then 'Missing data'
			else cast(f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end) as varchar) 
		end,'Missing data')
	  ,[Gender] = coalesce(d3.sukupuoli_en,'Missing data')
	  ,[Started studies in the spring] = case f.uusiOpiskKevat when 1 then 'Yes' when 0 then 'No' else 'Missing data' end	  
	  ,[Sector] = 
		case 
			when d1.organisaatio_fi in 
			('Aalto-yliopisto',
			'Helsingin yliopisto',
			'Itä-Suomen yliopisto',
			'Jyväskylän yliopisto',
			'Lapin yliopisto',
			'Lappeenrannan teknillinen yliopisto',
			'Oulun yliopisto',
			'Svenska handelshögskolan',
			'Taideyliopisto',
			'Tampereen teknillinen yliopisto',
			'Tampereen yliopisto',
			'Turun yliopisto',
			'Vaasan yliopisto',
			'Åbo Akademi') then 'University'
			else 'UAS'
		end
	  ,[Higher education institution] = d1.organisaatio_en
      ,[Code of degree] = coalesce(f.[tkoodi],'999999')
	  ,[Degree]  = coalesce(d2.koulutusluokitus_en,'Missing data')
	  ,[Field of education - HE steering] = coalesce(d2.okmohjauksenala_en,'Missing data')
	  ,[Level of education, tier 1] = coalesce(d2.koulutusastetaso1_en,'Missing data')
	  ,[Level of education, tier 2] = coalesce(d2.Koulutusastetaso2_en,'Missing data')
	  ,[Field of education, tier 1] = coalesce(d2.koulutusalataso1_en,'Missing data')
	  ,[Field of education, tier 2] = coalesce(d2.koulutusalataso2_en,'Missing data')
	  ,[Field of education, tier 3] = coalesce(d2.koulutusalataso3_en,'Missing data')

	  --järjestys
	  ,[OKM ohjauksen ala jarj] = coalesce(d2.jarjestys_okmohjauksenala_koodi,'99999')
	  ,[Koulutusaste, taso 1 jarj] = coalesce(d2.jarjestys_koulutusastetaso1_koodi,'99999')
	  ,[Koulutusaste, taso 2 jarj] = coalesce(d2.jarjestys_koulutusastetaso2_koodi,'99999')
	  ,[Koulutusala, taso 1 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
	  ,[Koulutusala, taso 2 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
	  ,[Koulutusala, taso 3 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
   

  FROM [ANTERO].[sa].[sa_virta_otp_viisviis] f

LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli


GO

USE [ANTERO]


