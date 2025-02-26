USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 13.52.58 ******/
DROP VIEW [dw].[v_amos_kustannuskysely_yhdistelma]
GO

/****** Object:  View [dw].[v_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 13.52.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dw].[v_amos_kustannuskysely_yhdistelma] AS

/*
Näkymä kuutiolle Amos kustannuskysely yhdistelmä ja raportille Ammatillisen koulutuksen kustannuskysely - kustannukset ja rahoitus. 
*/

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Taso 1] = d2.taso1
	,[Taso 2] = d2.taso2
	,[Taso 3] = d2.taso3
	,[Taso 4] = d2.taso4
	,[Taso 5] = d2.taso5
	,[Omistajatyyppi] = f.omistajatyyppi_nimi
	,[Koulutuksen järjestäjän maakunta] = d3.maakunta_fi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[avain] = CONCAT(f.vuosi, d1.organisaatio_koodi)
	,[maara_euroa]
	,[ovyht]
FROM dw.f_amos_kustannuskysely_yhdistelma f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_amos_kustannuskysely_yhdistelma d2 on d2.id = f.d_amos_tili_id
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = d1.kunta_koodi