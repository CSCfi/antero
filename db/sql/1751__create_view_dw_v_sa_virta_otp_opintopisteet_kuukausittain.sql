-- v_sa_virta_otp_opintopisteet_kuukausittain  näkymä
USE ANTERO
GO
 
IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_sa_virta_otp_opintopisteet_kuukausittain') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_sa_virta_otp_opintopisteet_kuukausittain AS select 1 AS a'
GO

ALTER VIEW  dw.v_sa_virta_otp_opintopisteet_kuukausittain 
AS
		SELECT 	
				[Henkilo_koodi] = f.[hkoodi]			 	
			, 	[Korkeakoulu] 	= d1.organisaatio_fi
			, 	[Vuosi] 		= f.[vuosi]			  
			, 	[Kuukausi] 		= f.[kuukausi]			  
			,	[Opintopisteet] = f.[laajuus]			
			, CONVERT(date, DATEADD(s, CONVERT(bigint, f.suorituspaivamaara)/1000, CONVERT(datetime, '1970-01-01 03:00:00'))) AS suorituspvm			
			, 	[Sektori] = 
				CASE 
					WHEN d1.organisaatio_fi IN 
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
					'Åbo Akademi') THEN 'Yliopisto'
					ELSE 'Ammattikorkeakoulu'
				END
						 
			, [Ohjauksen ala] = COALESCE(d3.ohjauksenala_nimi_fi,'Tuntematon')				
			, [Opintosuoritus luokittelu koodi] = f.[osluokittelukoodi]	
			, [Opintopisteryhmä] = coalesce(d5.[opryhma1_fi],'Tuntematon')			
			-- Järjestys
			, [Ohjauksen ala jarj] = COALESCE(d3.jarjestys_ohjauksenala_koodi,'99999')				
			 ,[Opintopisteet summa jarj] 	= coalesce(d5.jarjestys_op,'9999')
			 ,[Opintopisteryhmä jarj] 		= coalesce(d5.jarjestys_opryhma1,'9999')  	 				  
			  
	FROM 	ANTERO.sa.sa_virta_otp_opintopisteet_kuukausittain f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi	=	f.oppilaitos	
				LEFT JOIN ANTERO.dw.d_ohjauksenala d3 ON d3.ohjauksenala_koodi	=	f.ohjausalakoodi		
				LEFT JOIN ANTERO.dw.d_opintopisteet d5 ON d5.op_avain    = FLOOR(f.laajuus)
