USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_sosiaali_ja_terveysalan_patevyydet]    Script Date: 20.9.2024 7:51:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_sosiaali_ja_terveysalan_patevyydet] as

TRUNCATE TABLE ANTERO.dw.f_virta_otp_sosiaali_ja_terveysalan_patevyydet

INSERT INTO ANTERO.dw.f_virta_otp_sosiaali_ja_terveysalan_patevyydet
SELECT DISTINCT
	f.tilastovuosi,
	f.henkilo,

	f.d_organisaatioluokitus_id,
	f.d_virta_patevyydet_id,

	f.lkm,

	getdate() as loadtime,
	SUSER_NAME() as username,
	'ETL: p_lataa_f_virta_otp_sosiaali_ja_terveysalan_patevyydet' as source

FROM (
	SELECT
		CASE 
			WHEN d2.patevyys_fi like 'Erikoisl%' and s2.vuosi > s1.vuosi THEN s2.vuosi 
			ELSE s1.vuosi
		END as tilastovuosi,
		s1.henkilo,

		CASE 
			WHEN d2.patevyys_fi like 'Erikois%' and s2.vuosi > s1.vuosi THEN d1b.id 
			ELSE d1a.id
		END as d_organisaatioluokitus_id,
		d2.id as d_virta_patevyydet_id,

		1 as lkm,

		rnk = rank() OVER (partition by s1.henkilo, s1.patevyyskoodi ORDER BY CASE WHEN d2.patevyys_fi like 'Erikois%' and s2.paivamaara > s1.paivamaara THEN s2.paivamaara ELSE s1.paivamaara END)
	
	FROM [VirtaSiirto].[sa].[sa_virta_otp_sosiaalityontekijat_patevyydet] s1
	LEFT JOIN [VirtaSiirto].[sa].[sa_virta_otp_sosiaalityontekijat_patevyydet] s2 on s1.henkilo = s2.henkilo and s2.patevyyskoodi in  ('eha', 'ela')
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_koodi = s1.organisaatiokoodi 
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.organisaatio_koodi = s2.organisaatiokoodi 
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d2 on d2.patevyys_koodi = s1.patevyyskoodi
	WHERE s1.patevyyskoodi not in ('eha', 'ela') AND NOT (d2.patevyys_fi like 'Erikoish%' and (s2.id is null or s2.patevyyskoodi = 'ela')) AND NOT (d2.patevyys_fi like 'Erikoisl%' and (s2.id is null or s2.patevyyskoodi = 'eha'))
) f
WHERE f.rnk = 1
GO

USE [ANTERO]