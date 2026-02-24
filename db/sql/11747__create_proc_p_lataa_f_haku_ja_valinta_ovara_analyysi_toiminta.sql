USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_haku_ja_valinta_ovara_analyysi_toiminta]    Script Date: 5.2.2026 8.07.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_haku_ja_valinta_odw_analyysi_toiminta]

GO

CREATE OR ALTER  PROCEDURE [dw].[p_lataa_f_haku_ja_valinta_ovara_analyysi_toiminta] AS

DROP TABLE IF EXISTS ANTERO.dw.f_haku_ja_valinta_ovara_analyysi_toiminta

SELECT DISTINCT
	f.master_oid,
	f.koulutuksen_alkamisvuosi,
	f.Hakukerta,
	f.d_sukupuoli_id,
	f.d_ika_id,
	f.d_maatjavaltiot2_kansalaisuus_id,
	f.d_alueluokitus_kotikunta_id,
	f.d_organisaatioluokitus_oppilaitos_id,
	f.d_koulutusluokitus_id,
	f.aidosti_ensikertainen,
	f.valittu,
	MAX(f.valittu) OVER (PARTITION BY f.hakemus_oid) as valittu_hakukerralla,
	MAX(f.vastaanottanut_paikan) OVER (PARTITION BY f.hakemus_oid) as vastaanottanut_paikan_hakukerralla,
	coalesce(hu.hakenut_uudestaan,0) as hakenut_uudestaan,
	coalesce(vmh.valittu_myohemmassa_haussa,0) as valittu_myohemmassa_haussa,
	coalesce(vpmh.vastaanottanut_paikan_myohemmassa_haussa,0) as vastaanottanut_paikan_myohemmassa_haussa,
	vpmh.d_koulutusluokitus_id as d_koulutusluokitus_vastaanottanut_paikan_id,
	vpmh.d_organisaatioluokitus_oppilaitos_id as d_organisaatioluokitus_vastaanottanut_paikan_id,
	vpmh.koulutuksen_alkamisvuosi as koulutuksen_alkamisvuosi_vastaanottanut_paikan,
	vuodet1.hakenut_uudestaan_ero - f.koulutuksen_alkamisvuosi as hakenut_uudestaan_ero,
	vuodet2.valittu_ero - f.koulutuksen_alkamisvuosi as valittu_ero,
	vpmh.koulutuksen_alkamisvuosi - f.koulutuksen_alkamisvuosi as vastaanottanut_paikan_ero
INTO ANTERO.dw.f_haku_ja_valinta_ovara_analyysi_toiminta
FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi f
OUTER APPLY (
	SELECT MIN(h.hakukerta) as hakukerta, 1 as hakenut_uudestaan
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi h
	WHERE f.master_oid = h.master_oid and f.Hakukerta < h.Hakukerta
) hu
OUTER APPLY (
	SELECT 
		MIN(h.hakukerta) as hakukerta_vastaanottanut_paikan
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi h
	WHERE f.master_oid = h.master_oid and f.Hakukerta < h.Hakukerta and h.vastaanottanut_paikan = 1
) hvp
OUTER APPLY (
	SELECT MIN(h.hakukerta) as hakukerta, 1 as valittu_myohemmassa_haussa
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi h
	WHERE f.master_oid = h.master_oid and f.Hakukerta < h.Hakukerta and h.valittu = 1
) vmh
OUTER APPLY (
	SELECT TOP 1 
	h.d_koulutusluokitus_id,
	h.d_organisaatioluokitus_oppilaitos_id,
	h.koulutuksen_alkamisvuosi,
	1 as vastaanottanut_paikan_myohemmassa_haussa
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi h
	WHERE f.master_oid = h.master_oid and hvp.hakukerta_vastaanottanut_paikan = h.Hakukerta and h.vastaanottanut_paikan = 1
) vpmh
OUTER APPLY (
	SELECT 
		MIN(koulutuksen_alkamisvuosi) as hakenut_uudestaan_ero 
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi vuodet1 
	WHERE vuodet1.master_oid = f.master_oid and vuodet1.Hakukerta = hu.hakukerta
) vuodet1
OUTER APPLY (
	SELECT 
		MIN(koulutuksen_alkamisvuosi) as valittu_ero
	FROM ANTERO.dw.f_haku_ja_valinta_kk_ovara_analyysi vuodet2
	WHERE vuodet2.master_oid = f.master_oid and vuodet2.Hakukerta = vmh.hakukerta
) vuodet2