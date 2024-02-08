USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_yhteiskaksoistutkinnot]    Script Date: 8.2.2024 13:49:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_yhteiskaksoistutkinnot] AS

TRUNCATE TABLE ANTERO.dw.f_virta_otp_yhteiskaksoistutkinnot

INSERT INTO ANTERO.dw.f_virta_otp_yhteiskaksoistutkinnot
SELECT
	s.tutkintovuosi as tilastovuosi,
	COALESCE(d1.id, -1) as d_organisaatioluokitus_id,
	COALESCE(d2.id, -1) as d_koulutusluokitus_id,
	COALESCE(d3.id, -1) as d_virta_os_luokittelu_id,
	COALESCE(d4.id, -1) as d_ika_id,
	COALESCE(d5.id, -1) as d_sukupuoli_id,
	COALESCE(d6.id, -1) as d_maatjavaltiot2_kansalaisuus_id,
	opiskelijaavain + s.kk as henkilo_koodi,
	'ETL: p_lataa_f_virta_otp_yhteiskaksoistutkinnot' as source,
	SUSER_NAME() as username,
	GETDATE() as loadtime
FROM ANTERO.sa.sa_virta_otp_yhteiskaksoistutkinnot s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.oppilaitoskoodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_koodi = S.tutkintokoodi
LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d3 ON d3.os_luokittelu_koodi = S.luokittelukoodi
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = S.ika
LEFT JOIN ANTERO.dw.d_sukupuoli d5 ON d5.sukupuoli_koodi = S.sukupuoli
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d6 ON d6.jarjestys_maatjavaltiot2_koodi = S.kansalaisuus
WHERE CAST((CAST((S.tutkintovuosi + 1) as varchar(4)) + '-02-06') as date) <= CONVERT(date, GETDATE()) 

GO

USE [ANTERO]