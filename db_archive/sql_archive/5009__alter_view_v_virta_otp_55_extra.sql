USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_55_extra]    Script Date: 9.11.2021 11:03:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW  [dw].[v_virta_otp_55_extra] 
AS

	SELECT  
			   [Tilastovuosi] = f.[vuosi]
			  ,[Lukuvuosi] = cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar)
			  ,REPLACE(convert(varchar(10), dateadd(S, f.loAloituspvm/1000, '1970-01-01 03:00:00'),102),'.','-') 	AS lo_aloituspvm
			  ,REPLACE(convert(varchar(10),dateadd(S, f.ooAloituspvm/1000, '1970-01-01 03:00:00'),102),'.','-')  	AS oo_aloituspvm
			  
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
					'Lappeenrannan-Lahden teknillinen yliopisto LUT',
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

			  ,f.[suorittanut27] AS suorittanut_27
			  ,f.[suorittanut55IlmanPankkia] AS suorittanut_55_ilman_pankkia
			  ,f.[suorittanut55PankinAvulla] AS suorittanut_55_pankin_avulla

			  , [Ikä] = coalesce(f.ika,'Tuntematon')
			  , [Ikäryhmä] = coalesce(d4.ikaryhma1_fi,'Tuntematon')

			  --järjestys
			  ,[OKM ohjauksen ala jarj] = coalesce(d2.jarjestys_okmohjauksenala_koodi,'99999')
			  ,[Koulutusaste, taso 1 jarj] = coalesce(d2.jarjestys_koulutusastetaso1_koodi,'99999')
			  ,[Koulutusaste, taso 2 jarj] = coalesce(d2.jarjestys_koulutusastetaso2_koodi,'99999')
			  ,[Koulutusala, taso 1 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			  ,[Koulutusala, taso 2 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			  ,[Koulutusala, taso 3 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
		   

		FROM ANTERO.sa.sa_virta_otp_viisviis f

				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
				LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
				LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli
				LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = f.ika




GO

USE [ANTERO]


