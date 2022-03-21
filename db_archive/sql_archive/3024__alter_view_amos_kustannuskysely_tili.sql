USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_kustannuskysely_tili]    Script Date: 27.4.2020 18:43:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dw].[v_amos_kustannuskysely_tili] AS

SELECT 
	 [Tilastovuosi] = f.vuosi
	,[Koulutuksen järjestäjä] = d1.organisaatio_fi
	,[Taso 0] = d2.taso0
	,[Taso 1] = d2.taso1
	,[Taso 2] = d2.taso2
	,[Taso 3] = d2.taso3
	,[Taso 4] = d2.taso4
	,[Taso 5] = d2.taso5
	,[Taso, alin] = d2.taso_alin
	,[tili_jarjestys] = case when d2.taso5 = '' then '999' else CONCAT(d2.id,'_',d2.koodi) end
	,[Omistajatyyppi] = f.omistajatyyppi_nimi
	--
	,[Koodit Koulutuksen järjestäjä] = d1.organisaatio_koodi
	--
	,[avain] = CONCAT(f.vuosi, d1.organisaatio_koodi)
	,[maara_euroa]
FROM dw.f_amos_kustannuskysely_jarjestajakohtainen f
LEFT JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_amos_kustannuskysely_tili d2 on d2.id = f.d_amos_tili_id



