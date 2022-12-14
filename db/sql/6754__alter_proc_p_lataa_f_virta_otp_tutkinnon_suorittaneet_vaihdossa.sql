USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 14.12.2022 12:47:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa] AS

TRUNCATE TABLE dw.f_virta_otp_tutkinnon_suorittaneet_vaihdossa

DECLARE @year as int = (SELECT MAX(tilastointivuosi) FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] WHERE liikkuvuuden_kesto_id not in ('-1', '-2'))

INSERT INTO dw.f_virta_otp_tutkinnon_suorittaneet_vaihdossa (
	tilastovuosi,
	d_sukupuoli_id,
	d_ika_id,
	d_koulutusluokitus_id,
	d_liikkuvuudenkesto_id,
	d_organisaatioluokitus_id,
	opiskelijaavain,
	lukumaara,
	source
)

SELECT
	 sa.tutkinnonsuoritusvuosi as tilastovuosi
	,coalesce(d1.id,-1) as d_sukupuoli_id
	,coalesce(d2.id,-1) as d_ika_id
	,coalesce(d3.id,-1) as d_koulutusluokitus_id
	,coalesce(d6.id,-1) as d_liikkuvuudenkesto_id
	,coalesce(d8.id,-1) as d_organisaatioluokitus_id
	,sa.opiskelijaavain as opiskelijaavain
	,0 as lukumaara
	,'p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa'
FROM sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi sa
LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = sa.sukupuolikoodi
LEFT JOIN dw.d_ika d2 on d2.ika_avain = sa.ika
LEFT JOIN dw.d_koulutusluokitus d3 on d3.koulutusluokitus_avain = 'koulutus_' + sa.tutkintokoodi
LEFT JOIN dw.d_liikkuvuudenkesto d6 on d6.liikkuvuudenkesto_koodi = sa.liikkuvuudenkesto
LEFT JOIN dw.d_organisaatioluokitus d8 on d8.organisaatio_avain = 'oppilaitos_' + sa.oppilaitoskoodi
WHERE sa.tutkinnonsuoritusvuosi = 2017 or 
sa.tutkinnonsuoritusvuosi > @year

INSERT INTO dw.f_virta_otp_tutkinnon_suorittaneet_vaihdossa (
	tilastovuosi,
	d_sukupuoli_id,
	d_ika_id,
	d_koulutusluokitus_id,
	d_liikkuvuudenkesto_id,
	d_organisaatioluokitus_id,
	opiskelijaavain,
	lukumaara,
	source
)

SELECT   
	 f.tilastointivuosi as tilastovuosi
	,coalesce(d1.id,-1) as d_sukupuoli_id
	,coalesce(d2.id,-1) as d_ika_id
	,coalesce(d3.id,-1) as d_koulutusluokitus_id
	,coalesce(d6.id,-1) as d_liikkuvuudenkesto_id
	,coalesce(d8.id,-1) as d_organisaatioluokitus_id
	,null as opiskelijaavain
	,lukumaara
	,'p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa'
FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f 
LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d2 on d2.ika_avain = f.ika_1v
LEFT JOIN dw.d_koulutusluokitus d3 on d3.koulutusluokitus_avain	= 'koulutus_' + f.koulutusluokitus
LEFT JOIN VipunenTK.dbo.d_liikkuvuuden_kesto d4 on d4.id = f.liikkuvuuden_kesto_id 
LEFT JOIN dw.d_liikkuvuudenkesto d6 on d6.liikkuvuudenkesto_koodi = d4.liikkuvuuden_kesto_koodi
LEFT JOIN dw.d_organisaatioluokitus d8 on d8.organisaatio_avain = 'oppilaitos_' + f.oppilaitos
WHERE f.liikkuvuuden_kesto_id not in ('-1', '-2') and d3.koulutusastetaso2_koodi in ('62','72') 


GO

USE [ANTERO]