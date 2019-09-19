USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 19.9.2019 10:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa] AS

TRUNCATE TABLE dw.f_virta_otp_tutkinnon_suorittaneet_vaihdossa

INSERT INTO dw.f_virta_otp_tutkinnon_suorittaneet_vaihdossa (
	tilastovuosi,
	d_sukupuoli_id,
	d_ika_id,
	d_koulutusluokitus_id,
	d_maatjavaltiot2_kohdemaa_id,
	d_liikkuvuudentyyppi_id,
	d_liikkuvuudenkesto_id,
	d_liikkuvuusohjelma_id,
	d_organisaatioluokitus_id,
	vaihtovuosi,
	opiskelijaavain,
	source
)

SELECT
	 sa.tutkinnonsuoritusvuosi as tilastovuosi
	,coalesce(d1.id,-1) as d_sukupuoli_id
	,coalesce(d2.id,-1) as d_ika_id
	,coalesce(d3.id,-1) as d_koulutusluokitus_id
	,coalesce(d4.id,-1) as d_maatjavaltiot2_kohdemaa_id
	,coalesce(d5.id,-1) as d_liikkuvuudentyyppi_id
	,coalesce(d6.id,-1) as d_liikkuvuudenkesto_id
	,coalesce(d7.id,-1) as d_liikkuvuusohjelma_id
	,coalesce(d8.id,-1) as d_organisaatioluokitus_id
	,vaihtovuosi
	,sa.opiskelijaavain
	,'p_lataa_f_virta_otp_tutkinnon_suorittaneet_vaihdossa'
	
FROM sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi sa
LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = sa.sukupuolikoodi
LEFT JOIN dw.d_ika d2 on d2.ika_avain = sa.ika
LEFT JOIN dw.d_koulutusluokitus d3 on d3.koulutusluokitus_avain = 'koulutus_' + sa.tutkintokoodi
LEFT JOIN dw.d_maatjavaltiot2 d4 on d4.maatjavaltiot2_koodi = sa.kohdemaakoodi
LEFT JOIN dw.d_liikkuvuudentyyppi d5 on d5.liikkuvuudentyyppi_koodi = sa.liikkuvuudentyyppikoodi
LEFT JOIN dw.d_liikkuvuudenkesto d6 on d6.liikkuvuudenkesto_koodi = sa.liikkuvuudenkesto
LEFT JOIN dw.d_liikkuvuusohjelma d7 on d7.liikkuvuusohjelma_koodi = sa.liikkuvuusohjelmakoodi
LEFT JOIN dw.d_organisaatioluokitus d8 on d8.organisaatio_avain = 'oppilaitos_' + sa.oppilaitoskoodi

WHERE sa.tutkinnonsuoritusvuosi > 2016

--GROUP BY sa.tutkinnonsuoritusvuosi,d1.id,d2.id,d3.id,d4.id,d5.id,d6.id,d7.id,d8.id


