USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_55_kuluva_lukuvuosi]    Script Date: 8.8.2025 12.02.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE dw.p_lataa_f_virta_otp_55_kuluva_lukuvuosi as

TRUNCATE TABLE ANTERO.dw.f_virta_otp_55_kuluva_lukuvuosi

INSERT INTO ANTERO.dw.f_virta_otp_55_kuluva_lukuvuosi
SELECT  
	f.[vuosi] as tilastovuosi,
	cast(f.vuosi-1 as nvarchar)+'/'+cast(f.vuosi as nvarchar) as lukuvuosi,
	replace(convert(varchar(10), dateadd(S, f.loAloituspvm/1000, '1970-01-01 03:00:00'),102),'.','-') as lo_aloituspvm,
	replace(convert(varchar(10),dateadd(S, f.ooAloituspvm/1000, '1970-01-01 03:00:00'),102),'.','-') as oo_aloituspvm,
	coalesce(
		case 
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)>=8 then 8
			when f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end)<0 then -1
			else cast(f.vuosi-(year(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))+case when month(DATEADD(SECOND, loAloituspvm / 1000, '19691231 20:00'))>7 then 1 else 0 end) as varchar) 
		end,
	-1) as aika_aloittamisesta,

	opiskelijaAvain+opiskeluoikeusAvain+d1.organisaatio_koodi as henkilo_koodi,	
	coalesce(f.uusiOpisk,0) as uusi_opiskelija,
	coalesce(f.edellinenSyysolo,0) as olo_syksy,
	coalesce(f.olok,0) as olo_kevat,
	case when f.edellinenSyysolo=1 or f.olok=1 then 1 else 0 end as lasna,
	case when f.[suorittanut27]=1 or f.[suorittanut55ilmanPankkia]=1 or f.[suorittanut55PankinAvulla]=1 then 1 else 0 end as suorittanut55,

	coalesce(f.[syys],0) as opintopisteet_syksy,
	coalesce(f.[kevat],0) as opintopisteet_kevat,	
	coalesce(f.[summa],0) as opintopisteet_summa,
	   
	f.[suorittanut27],
	f.[suorittanut55IlmanPankkia],
	f.[suorittanut55PankinAvulla],

	coalesce(f.ika, -1) as ika,

	coalesce(d1.id,-1) as d_organisaatioluokitus_id,
	coalesce(d2.id,-1) as d_koulutusluokitus_id,
	coalesce(d3.id,-1) as d_sukupuoli_id,
	coalesce(d4.id,-1) as d_ika_id,
	coalesce(d5.id,-1) as d_opintopisteet_id,
	coalesce(d6.id,-1) as d_kytkin_aloittanut_kevaalla_id,

	getdate() as loadtime,
	SUSER_SNAME() as username,
	'ETL: p_lataa_f_virta_otp_55_kuluva_lukuvuosi' as source

FROM ANTERO.sa.sa_virta_otp_viisviis f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=f.oppilaitostunnus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi=f.tkoodi
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi=f.sukupuoli
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = f.ika
LEFT JOIN ANTERO.dw.d_opintopisteet d5 ON d5.op_avain  = f.summa
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.kytkin_koodi = f.uusiOpiskKevat

DECLARE @n_org as int

SET	@n_org = (
		SELECT  
			COUNT(DISTINCT d.organisaatio_fi)
		FROM ANTERO.dw.f_virta_otp_55_kuluva_lukuvuosi f
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.id=f.d_organisaatioluokitus_id
	)

IF @n_org >= 35 

BEGIN
	
	UPDATE ANTERO.dbo.pbi_dataset_tabular
		SET PendingRefresh = 1
	WHERE tabular = '55op kuluva lukuvuosi'

END

GO


