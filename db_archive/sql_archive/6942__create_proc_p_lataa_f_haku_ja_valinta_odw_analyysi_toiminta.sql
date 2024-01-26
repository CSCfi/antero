USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_odw_analyysi_toiminta] AS

TRUNCATE TABLE dw.f_haku_ja_valinta_odw_analyysi_toiminta

INSERT INTO ANTERO.dw.f_haku_ja_valinta_odw_analyysi_toiminta
SELECT DISTINCT
	s.HenkiloOID,
	s.koulutuksen_alkamisvuosi,
	s.Hakukerta,
	s.d_sukupuoli_id,
	s.d_ika_id,
	s.d_kansalaisuus_id,
	s.d_alueluokitus_kotikunta_id,
	s.d_organisaatioluokitus_id,
	s.d_koulutusluokitus_id,
	s.aidostiEnsikertalainen,
	s.valittu,
	s0.valittu_hakukerralla,
	s0.vastaanottanut_paikan_hakukerralla
	,coalesce(HU.hakenut_uudestaan,0) as hakenut_uudestaan
	,coalesce(VMH.valittu_myohemmassa_haussa,0) as valittu_myohemmassa_haussa
	,coalesce(VPMH.vastaanottanut_paikan_myohemmassa_haussa,0) as vastaanottanut_paikan_myohemmassa_haussa
	,VPMH.d_koulutusluokitus_id as d_koulutusluokitus_vastaanottanut_paikan_id
	,VPMH.d_organisaatioluokitus_id as d_organisaatioluokitus_vastaanottanut_paikan_id
	,VPMH.koulutuksen_alkamisvuosi as koulutuksen_alkamisvuosi_vastaanottanut_paikan
	,vuodet1.hakenut_uudestaan_ero - s.koulutuksen_alkamisvuosi as hakenut_uudestaan_ero
	,vuodet2.valittu_ero - s.koulutuksen_alkamisvuosi as valittu_ero
	,VPMH.koulutuksen_alkamisvuosi - s.koulutuksen_alkamisvuosi as vastaanottanut_paikan_ero
FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi s
OUTER APPLY (
	SELECT * FROM (
		SELECT 
			HenkiloOID, Hakukerta, MAX(valittu) as valittu_hakukerralla, MAX(vastaanottanut_paikan) as vastaanottanut_paikan_hakukerralla
		FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi
		GROUP BY HenkiloOID, Hakukerta
	) s0 WHERE s0.HenkiloOID = s.HenkiloOID and s0.Hakukerta = s.Hakukerta
) s0
OUTER APPLY (
	SELECT DISTINCT
		HenkiloOID, MIN(hu.hakukerta) as hakukerta, 1 as hakenut_uudestaan
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi hu
	WHERE s.HenkiloOID = hu.HenkiloOID and s.Hakukerta < hu.Hakukerta
	GROUP BY HenkiloOID
) HU
OUTER APPLY (
	SELECT DISTINCT
		HenkiloOID, MIN(Hakukerta) as hakukerta_vastaanottanut_paikan
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi hvp
	WHERE s.HenkiloOID = hvp.HenkiloOID and s.Hakukerta < hvp.Hakukerta and vastaanottanut_paikan = 1
	GROUP BY hvp.HenkiloOID
) HVP
OUTER APPLY (
	SELECT DISTINCT
		HenkiloOID, MIN(hu.hakukerta) as hakukerta, 1 as valittu_myohemmassa_haussa
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi hu
	WHERE s.HenkiloOID = hu.HenkiloOID and s.Hakukerta < hu.Hakukerta and valittu = 1
	GROUP BY HenkiloOID
) VMH
OUTER APPLY (
	SELECT DISTINCT
		HenkiloOID, hu.d_koulutusluokitus_id, hu.d_organisaatioluokitus_id, hu.koulutuksen_alkamisvuosi, 1 as vastaanottanut_paikan_myohemmassa_haussa
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi hu
	WHERE s.HenkiloOID = hu.HenkiloOID and hvp.hakukerta_vastaanottanut_paikan = hu.Hakukerta and vastaanottanut_paikan = 1
) VPMH
OUTER APPLY (
	SELECT 
		MIN(koulutuksen_alkamisvuosi) as hakenut_uudestaan_ero 
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi vuodet1 
	WHERE vuodet1.HenkiloOID = s.HenkiloOID and vuodet1.Hakukerta = HU.hakukerta
) vuodet1
OUTER APPLY (
	SELECT 
		MIN(koulutuksen_alkamisvuosi) as valittu_ero
	FROM ANTERO.dw.f_haku_ja_valinta_kk_odw_analyysi vuodet2
	WHERE vuodet2.HenkiloOID = s.HenkiloOID and vuodet2.Hakukerta = VMH.hakukerta
) vuodet2

GO

USE [ANTERO]