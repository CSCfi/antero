-- p_lataa_f_virta_otp_opintopisteet_kuukausittain  vie dataa dw.f_virta_otp_opintopisteet_kuukausittain tauluun
USE ANTERO
GO
  
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain') AND type in (N'P', N'PC'))
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain AS'
END
GO

ALTER PROCEDURE dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain 
AS

TRUNCATE TABLE dw.f_virta_otp_opintopisteet_kuukausittain

INSERT INTO dw.f_virta_otp_opintopisteet_kuukausittain 
   (		
			hkoodi
           , kk
           , kuukausi
           , laajuus
           , d_opryhma_id
           , d_ohjauksenala_id		 
           , opintosuoritusavain
           , opiskelijaavain
           , opiskeluoikeusavain
           , d_organisaatio_id
           , d_virta_os_luokittelu_id
           , suorituspaivamaara
           , vuosi
           , loadtime
           , source
           , username
	)
	SELECT  
				  f.hkoodi		
				, f.kk	
				, f.kuukausi	
				, f.laajuus				
				, COALESCE(d5.id,-1) AS d_opryhma_id
				, COALESCE(d3.id,-1) AS d_ohjauksenala_id				
				, f.opintosuoritusavain
				, f.opiskelijaavain
				, f.opiskeluoikeusavain				
				, COALESCE(d1.id,-1) AS d_organisaatio_id
				, COALESCE(d6.id,-1) AS d_virta_os_luokittelu_id				
				, CONVERT(date, DATEADD(s, CONVERT(bigint, f.suorituspaivamaara)/1000, CONVERT(datetime, '1970-01-01 03:00:00'))) AS suorituspvm					
				, f.vuosi				
				, f.loadtime
				, f.source
				, f.username	
	FROM 	ANTERO.sa.sa_virta_otp_opintopisteet_kuukausittain f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi	=	f.oppilaitos	
				LEFT JOIN ANTERO.dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi	=	f.ohjausalakoodi		
				LEFT JOIN ANTERO.dw.d_opintopisteet d5 ON d5.op_avain    = FLOOR(f.laajuus)
				LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d6 ON d6.os_luokittelu_koodi = f.osluokittelukoodi
				