USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 27.4.2020 17:46:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS

--DROP TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen

TRUNCATE TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen

INSERT INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

SELECT
	 vuosi
	,d_organisaatioluokitus_id = coalesce(d2.id,-1)
	,d_amos_tili_id = coalesce(d1.id,-1)
	,omistajatyyppi_nimi
	,maara_euroa

--INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

FROM (

	SELECT DISTINCT
	
		 [vuosi]
		,[ytunnus]
		,[omistajatyyppi_koodi] = LEFT(omistaja,1)
		,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
		,[tilitunnus]
		,[maara_euroa]
   
	FROM [ANTERO].[sa].[sa_amos_kustannuskysely_jarjestajakohtainen_2018] sa
	UNPIVOT (
		[maara_euroa] FOR [tilitunnus]
		IN (
			 [k21m1]
			,[k22m1]
			,[k312m1]
			,[k313m1]
			,[k319m1]
			,[k32m1]
			,[k70m1]
			,[k00m1]
			,[k21m2]
			,[k22m2]
			,[k312m2]
			,[k313m2]
			,[k319m2]
			,[k32m2]
			,[k35m2]
			,[k70m2]
			,[k00m2]
			,[k21x1]
			,[k22x1]
			,[k312x1]
			,[k313x1]
			,[k319x1]
			,[k32x1]
			,[k70x1]
			,[k00x1]
			,[k141m2]
			,[e11m0]
			,[e12m0]
			,[e20m0]
			,[e70m0]
			,[e71m0]
			,[e80m0]
			,[e00m0]
			,[e12x2]
			,[e20x2]
			,[e70x2]
			,[e71x2]
			,[e80x2]
			,[e00x2]
			,[e11r0]
			,[e12r0]
			,[e20r0]
			,[e70r0]
			,[e71r0]
			,[e80r0]
			,[e00r0]
			,[f1tl0]
			,[f2tl0]
			,[f3tl0]
			,[f4tl0]
			,[f5tl0]
			,[f6tl0]
			,[f7tl0]
			,[f1ev]
			,[f2ev]
			,[f3ev]
			,[f4ev]
			,[f5ev]
			,[f6ev]
			,[f7ev]
			,[k00m31]
			,[k00m32]
			,[k00m3]
			,[e00m31]
			,[e00m32]
			,[e00m3]
			,[e411m2]
			,[e412m2]
			,[e491m2]
			,[e492m2]
			,[e40m2]
			,[e411r0]
			,[e412r0]
			,[e491r0]
			,[e492r0]
			,[e40r0]
			,[b111te0]
			,[b112te0]
			,[b113te0]
			,[b110te0]
			,[b121te0]
			,[b122te0]
			,[b123te0]
			,[b124te0]
			,[b125te0]
			,[b120te0]
			,[b10te0]
			,[b211te0]
			,[b212te0]
			,[b213te0]
			,[b214te0]
			,[b215te0]
			,[b216te0]
			,[b210te0]
			,[b2211te0]
			,[b2212te0]
			,[b2213te0]
			,[b2210te0]
			,[b2221te0]
			,[b2222te0]
			,[b2223te0]
			,[b2220te0]
			,[b220te0]
			,[b20te0]
			,[b111ev]
			,[b112ev]
			,[b113ev]
			,[b110ev]
			,[b121ev]
			,[b122ev]
			,[b123ev]
			,[b124ev]
			,[b125ev]
			,[b120ev]
			,[b10ev]
			,[b211ev]
			,[b212ev]
			,[b213ev]
			,[b214ev]
			,[b215ev]
			,[b216ev]
			,[b210ev]
			,[b2211ev]
			,[b2212ev]
			,[b2213ev]
			,[b2210ev]
			,[b2221ev]
			,[b2222ev]
			,[b2223ev]
			,[b2220ev]
			,[b220ev]
			,[b20ev])
	) tilinpaatos

) Q

LEFT JOIN dw.d_amos_kustannuskysely_tili d1 ON d1.koodi = Q.tilitunnus
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus

WHERE d1.Summatieto = 0

