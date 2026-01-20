USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_sosiaali_ja_terveysalan_patevyydet]    Script Date: 10.6.2025 14.50.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW  [dw].[v_virta_otp_sosiaali_ja_terveysalan_patevyydet] AS

SELECT 

	tilastovuosi as Tilastovuosi,
	
	henkilo,
	lkm,

	d1.organisaatio_fi as Korkeakoulu,
	d1.oppilaitostyyppi_fi as Sektori,
	d2.patevyys_fi as 'Pätevyys',
	d2.patevyysryhma2_fi as 'Pätevyysryhmä',
	jarjestys_patevyysryhma2 as jarjestys_patevyysryhma

FROM  ANTERO.dw.f_virta_otp_sosiaali_ja_terveysalan_patevyydet f 
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_virta_patevyydet d2 on  d2.id = f.d_virta_patevyydet_id
WHERE tilastovuosi < YEAR(GETDATE())

GO

USE [ANTERO]