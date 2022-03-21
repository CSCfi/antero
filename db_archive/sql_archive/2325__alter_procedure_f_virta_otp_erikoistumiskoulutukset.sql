USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_erikoistumiskoulutukset]    Script Date: 16.7.2019 13:38:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_erikoistumiskoulutukset] as

TRUNCATE TABLE dw.f_virta_otp_erikoistumiskoulutukset

INSERT INTO [dw].[f_virta_otp_erikoistumiskoulutukset]
           ([d_erikoistumiskoulutus_id]
           ,[d_ika_id]
           ,[d_ohjauksenala_id]
           ,[d_kalenteri_opiskeluoikeus_alku_id]
           ,[d_organisaatioluokitus_id]
           ,[d_sukupuoli_id]
		   ,[d_kalenteri_muu_tutkinto_id]
		   ,[d_koulutusluokitus_muu_tutkinto_id]
		   ,[d_organisaatioluokitus_muu_tutkinto_id]
		   ,[d_kytkin_aiempi_tutkinto_id]
		   ,[d_kytkin_myohempi_tutkinto_id]
		   ,[lkm]
		   ,[source])

select
    coalesce(d1.id,-1) as d_erikoistumiskoulutus_id,
	coalesce(d2.id,-1) as d_ika_id,
	coalesce(d3.id,-1) as d_ohjauksenala_id,
	coalesce(d6.id,-1) as d_kalenteri_opiskeluoikeus_alku_id,
	coalesce(d5.id,-1) as d_organisaatioluokitus_id,
	coalesce(d4.id,-1) as d_sukupuoli_id,
	coalesce(d7.id,-1) as d_kalenteri_muu_tutkinto_id,
	coalesce(d8.id,-1) as d_koulutusluokitus_muu_tutkinto_id,
	coalesce(d9.id,-1) as d_organisaatioluokitus_muu_tutkinto_id,
	coalesce(d11.id,-1) as d_kytkin_aiempi_tutkinto_id,
	coalesce(d10.id,-1) as d_kytkin_myohempi_tutkinto_id,
	1 as lkm,
	'p_lataa_f_virta_otp_erikoistumiskoulutukset' as [source]
		   
FROM ANTERO.sa.sa_virta_otp_erikoistumiskoulutukset sa 
LEFT JOIN ANTERO.dw.d_erikoistumiskoulutus d1 on d1.erikoistumiskoulutus_koodi = sa.erikoistumiskoulutuskoodi
LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain	=	sa.ika
LEFT JOIN ANTERO.dw.d_ohjauksenala d3 on d3.ohjauksenala_koodi	=	sa.ohjauksenalakoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi	=	sa.sukupuolikoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = sa.oppilaitoskoodi
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.kalenteri_avain = convert(date,dateadd(s, convert(bigint, sa.opiskeluoikeudenalkamispaivamaara) / 1000, convert(datetime, '1-1-1970')))
LEFT JOIN ANTERO.dw.d_kalenteri d7 on d7.kalenteri_avain = convert(date,dateadd(s, convert(bigint, sa.tutkinnonsuorituspvm) / 1000, convert(datetime, '1-1-1970')))
LEFT JOIN ANTERO.dw.d_koulutusluokitus d8 on d8.koulutusluokitus_avain = 'koulutus_'+sa.ylinuusintutkintokoodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d9 on d9.organisaatio_avain = 'oppilaitos_'+sa.tutkinnonsuoropkoodi
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = 
(CASE 
	WHEN convert(date,dateadd(s, convert(bigint, sa.tutkinnonsuorituspvm) / 1000, convert(datetime, '1-1-1970'))) > convert(date,dateadd(s, convert(bigint, sa.opiskeluoikeudenalkamispaivamaara) / 1000, convert(datetime, '1-1-1970'))) THEN 1 
	ELSE 0
END)
LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.kytkin_koodi = 
(CASE 
	WHEN convert(date,dateadd(s, convert(bigint, sa.tutkinnonsuorituspvm) / 1000, convert(datetime, '1-1-1970'))) <= convert(date,dateadd(s, convert(bigint, sa.opiskeluoikeudenalkamispaivamaara) / 1000, convert(datetime, '1-1-1970'))) THEN 1 
	ELSE 0
END)




