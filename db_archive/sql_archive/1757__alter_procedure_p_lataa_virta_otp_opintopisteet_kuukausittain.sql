-- p_lataa_f_virta_otp_opintopisteet_kuukausittain  vie dataa dw.f_virta_otp_opintopisteet_kuukausittain tauluun
USE ANTERO
GO
  
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain') AND type in (N'P', N'PC'))
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain AS'
END
GO

ALTER PROCEDURE dw.p_lataa_f_virta_otp_opintopisteet_kuukausittain  ( @vuosi int )
AS

DELETE FROM dw.f_virta_otp_opintopisteet_kuukausittain WHERE vuosi >= @vuosi

INSERT INTO dw.f_virta_otp_opintopisteet_kuukausittain 
   (		
			 hkoodi
           , kk
           , kuukausi
           , laajuus         
           , d_ohjauksenala_id	
           , d_organisaatio_id       
           , vuosi           
	)
SELECT   		  f.hkoodi		
				, f.kk	
				, f.kuukausi	
				, SUM(f.laajuus)		
				, COALESCE(d3.id,-1) AS d_ohjauksenala_id	
				, COALESCE(d1.id,-1) AS d_organisaatio_id				
				, f.vuosi								
	FROM 	ANTERO.sa.sa_virta_otp_opintopisteet_kuukausittain f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi	=	f.oppilaitos	
				LEFT JOIN ANTERO.dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi	=	f.ohjausalakoodi				

GROUP BY d1.id, f.vuosi, f.kk, f.kuukausi, f.hkoodi, d3.id


