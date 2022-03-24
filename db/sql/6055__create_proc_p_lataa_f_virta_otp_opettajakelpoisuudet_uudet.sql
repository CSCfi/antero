USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_uudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_uudet] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet_uudet] AS

--sa-taulu unpivot
DROP TABLE IF EXISTS [sa].[virta_otp_opettajapatevyydet_unpivot]
SELECT * INTO [sa].[virta_otp_opettajapatevyydet_unpivot] FROM [sa].[v_virta_otp_opettajapatevyydet_unpivot] 

--sa-taulu
EXEC [sa].[p_lataa_virta_opettajakelpoisuus_uudet]

--dimensiotaulu 
EXEC [dw].[p_lataa_d_opettajapatevyys]

--faktataulu
TRUNCATE TABLE dw.f_virta_otp_opettajakelpoisuudet_uudet

INSERT INTO dw.f_virta_otp_opettajakelpoisuudet_uudet (
	[tilastovuosi]
	,patevyyden_vuosi
	,tutkinnon_vuosi
	,[d_organisaatioluokitus_id]
	,[d_sukupuoli_id]
	,[d_ika_id]
	,[d_koulutusluokitus_korkein_tutkinto_id]
	,[d_organisaatioluokitus_kelpoisuus_id]
	,[d_organisaatioluokitus_tutkinto_id]
	,[d_opettajapatevyys_kaikki_id]
	,[d_opettajapatevyys_id]
	,[d_virta_patevyydet_id]
	,[d_opettajapatevyys_suoritustapa_id]
	,[kelpoinen]
	,[patevyys_ryhma]
	,[laajuus]
	,[ainekelpoisuuksien_maara]
	,[lkm]
)

SELECT 
	vuosi 
	,patevyys_vuosi
	,korkein_tutkinto_vuosi
	,d_organisaatio_id = COALESCE(d3.id,'-1')
	,d_sukupuoli_id = COALESCE(d1.id,'-1')
	,d_ika_id = COALESCE(d2.id,'-1')
	,d_koulutusluokitus_viimeisin_tutkinto_id = COALESCE(d5.id,'-1')
	,d_organisaatio_kelpoisuus_id = COALESCE(d7.id,'-1')
	,d_organisaatio_tutkinto_id = COALESCE(d6.id,'-1')
	,d_opettajapatevyys_kaikki_id = COALESCE(d4a.id,'-1')
	,d_opettajapatevyys_id = COALESCE(d4b.id,'-1')
	,d_virta_patevyydet_id = COALESCE(d8.id,'-1')
	,d_opettajapatevyys_suoritustapa_id = suoritustapa
	,kelpoinen = 1	
	,v.patevyys_ryhma
	,laajuus
	,ainekelpoisuuksien_maara = 
		CASE ainekelpoisuuksien_maara
			WHEN '1' THEN cast(ainekelpoisuuksien_maara as varchar(50))
			WHEN '2' THEN cast(ainekelpoisuuksien_maara as varchar(50))
			ELSE '3 tai enemmän'
		END
	,lkm = count(distinct opiskelija_avain_org)
FROM sa.virta_opettajakelpoisuus_uudet v
LEFT JOIN dw.d_sukupuoli d1 ON d1.sukupuoli_koodi = v.sukupuoli_koodi
LEFT JOIN dw.d_ika d2 ON d2.ika_avain = v.ika
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = v.organisaatio_koodi
LEFT JOIN dw.d_opettajapatevyys d4a ON d4a.koodi = v.kelpoisuus_koodi_kaikki
LEFT JOIN dw.d_opettajapatevyys d4b ON d4b.koodi = v.kelpoisuus_priorisoitu
LEFT JOIN dw.d_koulutusluokitus d5 ON d5.koulutusluokitus_koodi = v.korkein_tutkinto
LEFT JOIN dw.d_organisaatioluokitus d6 ON d6.organisaatio_koodi = v.korkein_tutkinto_oppilaitos
LEFT JOIN dw.d_organisaatioluokitus d7 ON d7.organisaatio_koodi = v.patevyys_oppilaitos
LEFT JOIN dw.d_virta_patevyydet d8 ON d8.patevyys_koodi = v.patevyys_koodi

WHERE v.rnk_kelpoisuusryhma=1 and (
	case 
		when v.tutkinto_suoritettu=1 then 
			case 
				when v.patevyys_ryhma='opettajaaineet' and v.pedagoginen_suoritettu=0 then 0 
				else 1 
			end
		else 0
	end
) = 1

GROUP BY 
	vuosi
	,patevyys_vuosi
	,korkein_tutkinto_vuosi
	,patevyys_ryhma
	,laajuus
	,COALESCE(d1.id,'-1')
	,COALESCE(d2.id,'-1')
	,COALESCE(d3.id,'-1')
	,COALESCE(d4a.id,'-1')
	,COALESCE(d4b.id,'-1')
	,COALESCE(d5.id,'-1')
	,COALESCE(d6.id,'-1')
	,COALESCE(d7.id,'-1')
	,COALESCE(d8.id,'-1')
	,suoritustapa
	,ainekelpoisuuksien_maara

END

GO

USE [ANTERO]