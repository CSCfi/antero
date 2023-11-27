USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 27.11.2023 14:18:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset] AS

DECLARE @alkuVuosi nvarchar(5)
DECLARE @sql nvarchar(max)
DECLARE @taulu nvarchar(max)

SET @alkuVuosi = '2022'

TRUNCATE TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset

INSERT INTO dw.f_virta_otp_lukuvuosimaksuvelvolliset ( 
	 
	 tilastovuosi
	,aloitusvuosi
	,d_sukupuoli_id
	,d_ika_id
	,d_maatjavaltiot_kansalaisuus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarjestaja_id
	,lkm
	,tutkinnot
	,source
)

SELECT 
	
	 tilastovuosi = vuosi
	,aloitusvuosi = aloitusvuosi
	,d_sukupuoli_id = COALESCE(d1.id,-1)
	,d_ika_id = COALESCE(d2.id,-1)
	,d_maatjavaltiot_kansalaisuus_id = COALESCE(d3.id, -1)
	,d_koulutusluokitus_id = COALESCE(d4.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d5.id,-1)
	,d_organisaatioluokitus_jarjestaja_id = COALESCE(d6.id,-1)
	,lkm = 1
	,tutkinnot = NULL
	,source = 'p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset'
	
FROM (
	
	SELECT
		 vuosi
		,aloitusvuosi
		,sukupuoli
		,ika
		,kansalaisuus
		,koulutuskoodi
		,oppilaitos
	FROM [ANTERO].[sa].[sa_virta_otp_lukuvuosimaksuvelvolliset]
			
) q
	
LEFT JOIN d_sukupuoli d1 ON d1.sukupuoli_koodi=q.sukupuoli
LEFT JOIN d_ika d2 ON d2.ika_avain=q.ika
LEFT JOIN d_maatjavaltiot2 d3 ON d3.maatjavaltiot2_koodi=q.kansalaisuus
LEFT JOIN d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi=q.koulutuskoodi
LEFT JOIN d_organisaatioluokitus d5 ON d5.organisaatio_koodi=q.oppilaitos
LEFT JOIN d_organisaatioluokitus d6 ON d6.organisaatio_oid=d5.ylaorganisaatio_oid

WHILE cast(@alkuVuosi as int) <= YEAR(GETDATE())

BEGIN

	IF (SELECT COUNT(*) FROM ANTERO.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = concat('sa_virta_otp_tktutkintoennakko_', @alkuVuosi)) >= 1

	BEGIN 

		SET @taulu = concat('sa.sa_virta_otp_tktutkintoennakko_', @alkuVuosi)

		SET @sql =

		' INSERT INTO dw.f_virta_otp_lukuvuosimaksuvelvolliset (' +
			 ' tilastovuosi' +
			' ,aloitusvuosi' +
			' ,d_sukupuoli_id' +
			' ,d_ika_id' +
			' ,d_maatjavaltiot_kansalaisuus_id' +
			' ,d_koulutusluokitus_id' +
			' ,d_organisaatioluokitus_oppilaitos_id' +
			' ,d_organisaatioluokitus_jarjestaja_id' +
			' ,lkm' +
			' ,tutkinnot' +
			' ,source' +
		' )' +
		' SELECT' +
			' tilastovuosi = tilv,' +
			' aloitusvuosi = alvv,' +
			' d_sukupuoli_id = COALESCE(d1.id,-1),' +
			' d_ika_id = COALESCE(d2.id,-1),' +
			' d_maatjavaltiot_kansalaisuus_id = COALESCE(d3.id, -1),' +
			' d_koulutusluokitus_id = COALESCE(d4.id,-1),' +
			' d_organisaatioluokitus_oppilaitos_id = COALESCE(d5.id,-1),' +
			' d_organisaatioluokitus_jarjestaja_id = COALESCE(d6.id,-1),' +
			' lkm = NULL,' +
			' tutkinnot = lkm,' +
			' source = ' + '''' + 'p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset' + '''' +
		' FROM ' + @taulu + ' s' +
		' LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.sukupuoli_koodi = s.sp' +
		' LEFT JOIN ANTERO.dw.d_ika d2 on d2.ika_avain = cast(tilv as int) - cast(syntv as int)' +
		' LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 ON d3.maatjavaltiot2_koodi = s.kansalr2' +
		' LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = s.koulk' +
		' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 ON d5.organisaatio_koodi = s.tunn' +
		' LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 ON d6.organisaatio_oid = d5.ylaorganisaatio_oid' +
		' WHERE rahlahde = 5' 

		EXEC (@sql)

	END

	SET @alkuVuosi = cast(cast(@alkuVuosi as int) + 1 as nvarchar)

END

GO

USE [ANTERO]