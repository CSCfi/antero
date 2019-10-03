USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_erikoistumiskoulutukset]    Script Date: 18.10.2018 16:47:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_erikoistumiskoulutukset] as

TRUNCATE TABLE dw.f_virta_otp_erikoistumiskoulutukset

INSERT INTO [dw].[f_virta_otp_erikoistumiskoulutukset]
           ([d_erikoistumiskoulutuskoodi_id]
           ,[d_ika_id]
           ,[d_ohjauksenala_id]
           ,[opiskeluoikeus_alku_pvm]
           ,[d_organisaatioluokitus_id]
           ,[d_sukupuoli_id]
		   ,[Lkm]
		   ,[source])
     select
            coalesce(d1.id,-1) as d_erikoistumiskoulutuskoodi_id,
		    coalesce(d2.id,-1) as d_ika_id,
			coalesce(d3.id,-1) as d_ohjauksenala_id,
			convert(date,dateadd(s, convert(bigint, sa.opiskeluoikeudenalkamispaivamaara) / 1000, convert(datetime, '1-1-1970'))) as opiskeluoikeus_alku_pvm,
			coalesce(d5.id,-1) as d_organisaatioluokitus_id,
			coalesce(d4.id,-1) as d_sukupuoli_id,
			1 as Lkm,
			'p_lataa_f_virta_otp_erikoistumiskoulutukset' as [source]
		   
		    	FROM 	ANTERO.sa.sa_virta_otp_erikoistumiskoulutukset sa 
	          LEFT JOIN ANTERO.dw.d_erikoistumiskoulutus d1 on d1.erikoistumiskoulutus_koodi = sa.erikoistumiskoulutuskoodi
		      LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain	=	sa.ika
		      LEFT JOIN ANTERO.dw.d_ohjauksenala d3 on d3.ohjauksenala_koodi	=	sa.ohjauksenalakoodi
              LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi	=	sa.sukupuolikoodi
			  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = sa.oppilaitoskoodi

GO


