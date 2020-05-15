USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_valmentavaan_koulutukseen_osallistuneet]    Script Date: 15.5.2020 19:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_valmentavaan_koulutukseen_osallistuneet] AS


TRUNCATE TABLE dw.f_virta_otp_valmentavaan_koulutukseen_osallistuneet

INSERT INTO [dw].[f_virta_otp_valmentavaan_koulutukseen_osallistuneet] (
	[henkilo_tunniste]
    ,[d_ika]
    ,[d_sukupuoli]
    ,[d_koulutusluokitus]
    ,[d_organisaatioluokitus_tutkintooppilaitos]
    ,[tutkinto_oikeus_aloitusvuosi]
    ,[valmentava_oikeus_aloitusvuosi]
    ,[valmentava_oikeus_paattymisvuosi]
    ,[valmentava_oikeus_tyyppi]
    ,[d_organisaatioluokitus_valmentavaoppilaitos]
    ,tutkinnon_suoritus_vuosi
	,tilastovuosi
	,[d_kytkin_aiempi_tutkinto_id]
	,[d_kytkin_myohempi_tutkinto_id]
	,[d_kalenteri_muu_tutkinto_id]
	,[source]
)

select 
	atunniste,
	d4.id,
	d3.id,
	d5.id,
	d6.id,
	YEAR((select d from dbo.BigintToDate (sa.tooalkamispaivamaara))), 
	YEAR((select d from dbo.BigintToDate (sa.vooalkamispaivamaara))),
	YEAR((select d from dbo.BigintToDate (sa.voopaattymispaivamaara))),
	sa.vootyyppi,
	d1.id,
	YEAR((select d from dbo.BigintToDate (sa.ttutkinnonsuorituspvm))),
	xvuosi,
	coalesce(d7.id,-1) as d_kytkin_aiempi_tutkinto_id,
	coalesce(d8.id,-1) as d_kytkin_myohempi_tutkinto_id,
	coalesce(d9.id,-1) as d_kalenteri_muu_tutkinto_id,
	'f_lataa_valmentavaan_koulutukseen_osallistuneet'
from sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet sa
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi	=	sa.voppilaitosnro				
LEFT JOIN ANTERO.dw.d_sukupuoli d3 ON d3.sukupuoli_koodi	=	sa.sukupuoli
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = sa.ika	
				
LEFT JOIN ANTERO.dw.d_koulutusluokitus d5 ON d5.koulutusluokitus_koodi	=	sa.tkoulutuskoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 ON d6.organisaatio_koodi	=	sa.toppilaitosnro	
LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.kytkin_koodi = 
	(CASE 
		WHEN YEAR((select d from dbo.BigintToDate (sa.ttutkinnonsuorituspvm))) >= YEAR((select d from dbo.BigintToDate (sa.vooalkamispaivamaara))) THEN 1 
		ELSE 0
	END)
LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = 
	(CASE 
		WHEN YEAR((select d from dbo.BigintToDate (sa.ttutkinnonsuorituspvm))) < YEAR((select d from dbo.BigintToDate (sa.vooalkamispaivamaara))) THEN 1 
		ELSE 0
	END)
LEFT JOIN ANTERO.dw.d_kalenteri d9 on d9.vuosi = YEAR((select d from dbo.BigintToDate (sa.ttutkinnonsuorituspvm)))	
