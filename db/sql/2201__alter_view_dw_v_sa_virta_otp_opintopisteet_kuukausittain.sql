-- v_sa_virta_otp_opintopisteet_kuukausittain näkymä faktatauluun f_virta_otp_opintopisteet_kuukausittain patch Lappeenrannan-Lahden teknillinen yliopisto
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
			, 	[Sektori] = 
				CASE 
					WHEN d1.organisaatio_fi IN 
					('Aalto-yliopisto',
					'Helsingin yliopisto',
					'Itä-Suomen yliopisto',
					'Jyväskylän yliopisto',
					'Lapin yliopisto',
					'Lappeenrannan-Lahden teknillinen yliopisto',
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
			
			, [Opintosuoritus luokittelu] = COALESCE(d6.os_luokittelu_nimi_fi,'Tuntematon')		
			, [Opintopisteryhmä] = coalesce(d5.opryhma1_fi,'Tuntematon')			
			
			-- Järjestys
			, [Ohjauksen ala jarj] = COALESCE(d3.jarjestys_ohjauksenala_koodi,'99999')				
			 ,[Opintopisteet summa jarj] 	= coalesce(d5.jarjestys_op,'9999')
			 ,[Opintopisteryhmä jarj] 		= coalesce(d5.jarjestys_opryhma1,'9999')  	 
		FROM 	ANTERO.dw.f_virta_otp_opintopisteet_kuukausittain f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id	=	f.d_organisaatio_id	
				LEFT JOIN ANTERO.dw.d_ohjauksenala d3 ON d3.id	=	f.d_ohjauksenala_id		
				LEFT JOIN ANTERO.dw.d_opintopisteet d5 ON d5.op_avain    = FLOOR(f.laajuus)
				LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d6 ON d6.id = f.d_virta_os_luokittelu_id	  
				


				
