USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_uusi_rahoitusmalli]    Script Date: 17.4.2024 11:13:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_uusi_rahoitusmalli] AS

SELECT  
			
	[Korkeakoulu] = COALESCE(d1.organisaatio_fi,'Tuntematon'),
	[Tutkinnon suorittamisvuosi] = COALESCE(f.tutkintovuosi,-1),			  
			
	[Tutkinto] = COALESCE(d2.koulutusluokitus_fi,'Tuntematon'), 
	[Tutkintokoodi] = COALESCE(f.tutkintokoodi,'999999'),
			
	[Tutkinnon vaadittu laajuus] = COALESCE(f.vaadittuop,-1),  
	[Tavoiteaika vuosia] = COALESCE(f.tavoiteaikavuosia,-1),
	[Tavoiteaika lukukausia] = COALESCE(f.tavoitelukukaudet,-1),			
			
	[Tavoiteaika kuukausia] = COALESCE(f.xxetavoiteaikakuukausia,-1),				
	[Tutkinnon suoritusaika kuukausia] = COALESCE(f.xxfkaytettyaikakk,-1),
			
	[Tutkinto suoritettu määräajassa] = CASE f.tavoiteajassavalmistunut WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END,
	f.tavoiteajassavalmistunut,
	[Tutkinto pisteet] = COALESCE(f.tutkintokerroin,-1),
	f.tutkintokerroin,
	[Läsnäolo lukukausia] = COALESCE(f.xxalasnaololukukaudet,-1),				
	[Läsnäolo kuukausia] = COALESCE(f.xxblasnaolokuukaudet,-1),
			
	[Poissaolo lukukausia] = COALESCE(f.xxcpoissaololukukaudet,-1),
	[Poissaolo kuukausia] = COALESCE(f.xxdpoissaolokuukaudet,-1),

	[Lyhyt kv-vaihto] = d11.kytkin_fi,
	[Pitkä kv-vaihto] = d12.kytkin_fi,
	[Virtuaalinen blended kv-vaihto] = d13.kytkin_fi,
	[Kv-vaihdon kesto (päivissä)] = f.xxxxvaihdonkestopaivissa,
			
	[Aiempi korkeakoulututkinto] = CASE f.onaiempitutkinto WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END,			 			
	f.onaiempitutkinto,
	[Enintään 12 kk määräajan jälkeen] = CASE f.[xonenintaan12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END, 
	f.xonenintaan12kk,
	[Yli 12 kk määräajan jälkeen] = CASE f.[xonyli12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END, 
	f.xonyli12kk,
	[Ryhmä A]	= CASE f.[xonryhmaa] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END, 
	f.xonryhmaa,
	[Ryhmä B] = CASE f.[xonryhmab] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END, 
	f.xonryhmab,
	[Ryhmä C] = CASE f.[xonryhmac] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END, 
	f.xonryhmac,
	[Tutkinnon aloitusvuosi] = COALESCE(f.aloitusvuosi,'Tuntematon'),  				
	[Tutkinnon suoritusaika vuosia] = COALESCE(f.vuosia,-1),
	[Tutkinnon suoritusaika lukukausia] = COALESCE(f.kaytetytlukukaudet,-1),
	[Kokonaisaika kuukausia] = COALESCE(f.xxgkokonaisaikakk,-1),
	[Aiempi sama koulutuskoodi] = d10.kytkin_fi,
					 
	[Henkilo_koodi] = opiskelijaavain+opiskeluoikeusAvain+d1.organisaatio_koodi,			 
	[Sukupuoli] = COALESCE(d3.sukupuoli_fi,'Tuntematon'),
	[Ikä] = COALESCE(f.ika,'Tuntematon'),
	[Ikäryhmä] = COALESCE(d4.ikaryhma1_fi,'Tuntematon'),		
			
	[Sektori] = d1.oppilaitostyyppi_fi,
			 
	[Koulutuskieli] = COALESCE(d5.kieli_fi,'Tuntematon'),
	[Koulutuskunta] = COALESCE(d6.kunta_fi,'Tuntematon'),				

	[OKM ohjauksen ala] = COALESCE(d2.okmohjauksenala_fi,'Tuntematon'),
	[Koulutusaste, taso 1] = COALESCE(d2.koulutusastetaso1_fi,'Tuntematon'),
	[Koulutusaste, taso 2] = COALESCE(d2.Koulutusastetaso2_fi,'Tuntematon'),
	[Koulutusala, taso 1] = COALESCE(d2.koulutusalataso1_fi,'Tuntematon'),
	[Koulutusala, taso 2] = COALESCE(d2.koulutusalataso2_fi,'Tuntematon'),
	[Koulutusala, taso 3] = COALESCE(d2.koulutusalataso3_fi,'Tuntematon'),

	[Tutkintoryhmä] = COALESCE( d7.tutkintoryhma_koodi,'Tuntematon'),	
	[Koulutustyyppi] =  CASE f.xxlkoulutustyyppi WHEN 1 THEN 'Päivämuoto' WHEN 2 THEN 'Monimuoto' ELSE 'Yliopisto' END, 
			
	f.[tutkinnonsuorituspvm] AS suorituspvm,
	MONTH(f.[tutkinnonsuorituspvm]) AS suorituskuukausi,

	[Rahoitusmallialat AMK 2021-2024] = O.Ammattikorkeakoulut_tutkintotavoitteet,			 
	[Rahoitusmallialat YO 2021-2024] = O.Yliopistot_tutkintotavoitteet2021,
			
	-- Ikä tutkinnon aloittaessa
	[Ikä tutkinnon aloittaessa] = COALESCE(CAST(f.xxmikatutkinnonaloitusajankohtana as nvarchar),'Tuntematon'),
	[Ikäryhmä tutkinnon aloittaessa] = COALESCE(d8.ikaryhma1_fi,'Tuntematon'),
	-- Rahoituslähde
	[Rahoituslähde] = COALESCE( d9.rahoituslahde_nimi_fi,'Tuntematon'),
			
	-- Järjestys
	[OKM ohjauksen ala jarj] = COALESCE(d2.jarjestys_okmohjauksenala_koodi,'99999'),
	[Koulutusaste, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusastetaso1_koodi,'99999'),
	[Koulutusaste, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusastetaso2_koodi,'99999'),
	[Koulutusala, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999'),
	[Koulutusala, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999'),
	[Koulutusala, taso 3 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999'),
			
	[Ikä jarj] = COALESCE(d4.jarjestys_ika,'999'),
	[Ikäryhmä jarj]	= COALESCE(d4.jarjestys_ikaryhma1,'999')	,

	[Ikä tutkinnon aloittaessa jarj] = COALESCE(d8.jarjestys_ika,'999'),
	[Ikäryhmä tutkinnon aloittaessa jarj] = COALESCE(d8.jarjestys_ikaryhma1,'999')			
			  
FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_uusi_rahoitusmalli f 
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = f.oppilaitosnro
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.tutkintokoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi = f.sukupuoli
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain = f.ika
LEFT JOIN ANTERO.dw.d_kieli	d5 ON d5.kieli_koodi = f.xkoulutuskieli
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.kunta_koodi = f.xkoulutuskunta
LEFT JOIN ANTERO.dw.d_virta_tutkintoryhmat d7 ON d7.tutkintoryhma_koodi = f.xxltutkintoryhma
LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] O ON O.iscfi2013_koodi = d2.koulutusalataso3_koodi
LEFT JOIN ANTERO.dw.d_ika d8 ON d8.ika_avain  = f.xxmikatutkinnonaloitusajankohtana
LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d9 ON d9.rahoituslahde_koodi  = f.xxmrahoituslahde
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = coalesce(f.xxxsamakoodi, -1)
LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.kytkin_koodi = coalesce(f.xxxvaihdossalyhyt,0)
LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.kytkin_koodi = coalesce(f.xxxvaihdossapitka,0)
LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.kytkin_koodi = coalesce(f.xxxvaihdossavirtuaalinenblended,0)
				
GO

USE [ANTERO]
