-- v_erikoistumiskoulutukset

use ANTERO
 
IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_erikoistumiskoulutukset') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_erikoistumiskoulutukset AS select 1 AS a'
GO

ALTER VIEW  dw.v_virta_otp_erikoistumiskoulutukset
AS
		
SELECT   	
              [Erikoistumiskoulutus] = coalesce(d1.erikoistumiskoulutus_nimi_fi,'Tuntematon')	  
			, [Erikoistumiskoulutuskoodi] =coalesce(f.erikoistumiskoulutuskoodi,'-1')
			, [Ikä] = coalesce(f.ika,'Tuntematon')
			, [Ikäryhmä] = coalesce(d2.ikaryhma1_fi,'Tuntematon')
			,[Ohjauksen ala] = coalesce(d3.ohjauksenala_nimi_fi,'Tuntematon')
			,convert(date,dateadd(s, convert(bigint, f.opiskeluoikeudenalkamispaivamaara) / 1000, convert(datetime, '1-1-1970'))) as opiskeluoikeuden_alkamispvm
			, [sukupuoli] =  coalesce(d4.sukupuoli_fi,'Tuntematon')
			, [Erikoistumiskoulutus jarj] = coalesce(d1.jarjestys_erikoistumiskoulutus_koodi,'999')
			, [Ikä jarj] 			= coalesce(d2.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= coalesce(d2.jarjestys_ikaryhma1,'999')	
			, [Ohjauksen ala jarj] = coalesce(d3.jarjestys_ohjauksenala_koodi,'99999')	  
			, [Sukupuoli jarj] =    coalesce(d4.jarjestys_sukupuoli_koodi,'99999')	 
	FROM 	ANTERO.sa.sa_virta_otp_erikoistumiskoulutukset f 
	          LEFT JOIN ANTERO.dw.d_erikoistumiskoulutus d1 on d1.erikoistumiskoulutus_koodi = f.erikoistumiskoulutuskoodi
		      LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain	=	f.ika
		      LEFT JOIN ANTERO.dw.d_ohjauksenala d3 on d3.ohjauksenala_koodi	=	f.ohjauksenalakoodi
              LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.sukupuoli_koodi	=	f.sukupuolikoodi