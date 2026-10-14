USE [ANTERO]

GO

CREATE OR ALTER VIEW [dw].[v_haku_ja_valinta_kk_yo_arvosanat_visualisointi] AS

SELECT 
	CAST(HASHBYTES('SHA2_256', vs.salt + f.master_oid) as varchar) as [Henkilö OID],
	f.koulutuksen_alkamisvuosi as [Koulutuksen alkamisvuosi],
	case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d12.koulutussektori_fi end as Sektori,
    d7.sukupuoli_fi as Sukupuoli,
	d5b.organisaatio_fi as Korkeakoulu,
	d19.selite_fi as [Tutkinnon aloitussykli (hakukohde)],
	d12.okmohjauksenala_fi as [OKM ohjauksen ala (hakukohde)],
	d22.selite_fi as [Valintatapajonon tyyppi],
	d3.vuosi as [Ylioppilastutkinnon suoritusvuosi],
	d13.selite_fi as [Pohjakoulutus] 
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f 
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste s on s.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
LEFT JOIN ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_ylioppilastutkinnon_suorituspaivamaara_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b ON d5b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 ON d12.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d13 ON d13.id = f.d_pohjakoulutus_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d19 on d19.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d22 on d22.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dbo.view_salt vs on vs.[view] = CONCAT('v_haku_ja_valinta_kk_yo_arvosanat_visualisointi','_', f.koulutuksen_alkamisvuosi)
WHERE s.visualisoinnit <= cast(getdate() as date) and d19.selite_fi = 'I sykli' and f.koulutuksen_alkamisvuosi > 2015 and
case when f.loadtime>=s.vastaanottaneet then f.vastaanottanut_paikan else 0 end = 1