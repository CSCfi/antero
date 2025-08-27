USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opiskeluoikeudet]    Script Date: 21.11.2024 8:17:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER   PROCEDURE  [dw].[p_lataa_f_virta_otp_opiskeluoikeudet] AS

TRUNCATE TABLE [ANTERO].[dw].[f_virta_otp_opiskeluoikeudet] 

INSERT INTO [ANTERO].[dw].[f_virta_otp_opiskeluoikeudet] 
SELECT

	Tilastovuosi as tilastovuosi,

	d1a.id as d_organisaatioluokitus_ensimmainen_id,
	d1b.id as d_organisaatioluokitus_viimeinen_id,

	coalesce(d7.id, -1) as d_ika_id,

	coalesce(d2a.id, -1) as d_koulutusluokitus_ensimmainen_id,
	coalesce(d2b.id, -1) as d_koulutusluokitus_viimeinen_id,

	coalesce(d3.id, -1) as d_kytkin_usea_oo_samalta_alalta_id,
	coalesce(d4.id, -1) as d_kytkin_usea_oo_samasta_ammattikorkeakoulusta_id,
	coalesce(d5.id, -1) as d_kytkin_usea_oo_samasta_yliopistosta_id,
	coalesce(d6.id, -1) as d_kytkin_yliopisto_ja_ammattikorkeakoulu_id,
	coalesce(d8.id, -1) as d_kytkin_uusi_oo_edellisena_lukuvuotena_id,

	[Vuosia ensimmäisestä opiskeluoikeudesta] as vuosia_ensimmaisesta_opiskeluoikeudesta,
	[Vuosia viimeisestä opiskeluoikeudesta] as vuosia_viimeisesta_opiskeluoikeudesta,
	[Opiskeluoikeuksien lukumäärä] as lukumaara_opiskeluoikeudet,
	[Korkeakoulujen lukumäärä] as lukumaara_korkeakoulut,
	Yliopistoja as lukumaara_yliopistot,
	AMKeja as lukumaara_ammattikorkeakoulut,
	coalesce([eka_op],0) as opintopisteet_ensimmainen_opiskeluoikeus,
	coalesce([muut_op],0) as opintopisteet_muut_opiskeluoikeudet,

	Lkm as lkm,

	getdate() as loadtime,
	'ETL: p_lataa_f_virta_otp_opiskeluoikeudet' as source,
	SUSER_NAME() as username

FROM [ANTERO].[sa].[sa_virta_otp_opiskeluoikeudet] s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.organisaatio_koodi = s.[Ensimmäinen korkeakoulu]
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.organisaatio_koodi = s.[Viimeinen korkeakoulu]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2a on d2a.koulutusluokitus_koodi = s.[1. op.oikeuden koulutuskoodi]
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = s.[Viim. op.oikeuden koulutuskoodi]
LEFT JOIN ANTERO.dw.d_kytkin d3 on d3.kytkin_fi = s.[Useampi opiskeluoikeus samalta alalta]
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.kytkin_fi = s.[Useampi opiskeluoikeus samasta AMKista]
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.kytkin_fi = s.[Useampi opiskeluoikeus samasta yliopistosta]
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.kytkin_fi = s.[YO+AMK]
LEFT JOIN ANTERO.dw.d_ika d7 on d7.ika_avain = s.Tilastovuosi - s.syntymavuosi
LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = s.uusi_oo_edell_lv

GO


