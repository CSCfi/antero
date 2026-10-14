USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_yhteenveto_1]    Script Date: 14.10.2026 7.46.44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_haku_ja_valinta_kk_hakukohteet] AS

SELECT 
	CAST(HASHBYTES('SHA2_256', vs.salt + f.master_oid) as varchar) as [Henkilö OID],
	f.koulutuksen_alkamisvuosi as [Koulutuksen alkamisvuosi],
	case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d12.koulutussektori_fi end as Sektori,
	d5b.organisaatio_fi as Korkeakoulu,
	d19.selite_fi as [Tutkinnon aloitussykli (hakukohde)],
	d12.okmohjauksenala_fi as [OKM ohjauksen ala (hakukohde)],
	d12.koulutusalataso2_fi as [Koulutusala, taso 2 (hakukohde)],
	d12.koulutusalataso2_fi as [Koulutusala, taso 3 (hakukohde)],
	case when f.loadtime >= coalesce(f.vastaanottaneet_indikaattori, s.vastaanottaneet) then f.vastaanottanut_paikan else 0 end	as [Paikan vastaanottaneet2],
	case when f.loadtime>=s.valitut then f.valittu else 0 end as Valitut2,
	CASE WHEN f.master_oid is not null THEN 1 ELSE 0 END as Hakijat2,
	f.alpa,
	d12.jarjestys_okmohjauksenala_koodi as [OKM ohjauksen ala järjestys],
	d19.jarjestys_koodi as [Tutkinnon aloitussykli (hakukohde) järjestys],
	case when hakutoive=1 then 1 else 0 end as [Ensisijaiset hakijat2],
	hakutoive as Hakutoive,
	d10.selite_fi as Hakukohde,
	d20.selite_fi as [Valintatapajonon tyyppi],
	d20.jarjestys as [Valintatapajono järjestys]
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f 
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste s on s.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b ON d5b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d12 ON d12.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d19 on d19.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d20 on d20.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN ANTERO.dbo.view_salt vs on vs.[view] = CONCAT('v_haku_ja_valinta_kk_hakukohteet','_', f.koulutuksen_alkamisvuosi)
WHERE s.visualisoinnit <= cast(getdate() as date)