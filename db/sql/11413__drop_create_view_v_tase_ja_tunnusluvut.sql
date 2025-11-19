USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_tase_ja_tunnusluvut]    Script Date: 29.10.2025 15.12.40 ******/
DROP VIEW IF EXISTS [dw].[v_amos_tase_ja_tunnusluvut]
GO

/****** Object:  View [dw].[v_amos_tase_ja_tunnusluvut]    Script Date: 29.10.2025 15.12.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [dw].[v_amos_tase_ja_tunnusluvut] AS

/*
Näkymä kuutiolle  
*/

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Omistajatyyppi] = f.omistajatyyppi_nimi
	,[Toiminnanohjauksen kokeilu] = d2.[Toiminnanohjauksen kokeilu]
	,[PILKE-alue] = d2.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Koulutuksen järjestäjän maakunta] = d3.maakunta_fi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[Toiminnanohjauksen kokeilu järjestys]=d2.[jarjestys Toiminnanohjauksen kokeilu]
	,[PILKE-alue järjestys] = d2.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	--
	,[avain] = CONCAT(f.vuosi, d1.organisaatio_koodi)
	,[vos_rahoitus]
	,[toimintatuotot_vos]
	,[toimintakulut_vos]=f.toimintakulut
	,[toimintakate_vos]=f.toimintakate
	,[poistot_arvonalen]
	,[investoinnit_vos]=f.investoinnit
	,[ylialijaama]
	,[rahoitustuotot]
	,[rahoituskulut]
FROM dw.f_amos_tase_ja_tunnusluvut f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d2 on d2.id = f.d_amos_spl_jarjestaja_linkki_id
LEFT JOIN dw.d_alueluokitus d3 on d3.kunta_koodi = d1.kunta_koodi
WHERE vos_rahoitus !=0 