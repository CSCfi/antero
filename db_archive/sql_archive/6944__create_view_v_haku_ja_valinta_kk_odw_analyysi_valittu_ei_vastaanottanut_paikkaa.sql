USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_odw_analyysi_valittu_ei_vastaanottanut_paikkaa]    Script Date: 24.1.2023 15:13:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dw].[v_haku_ja_valinta_kk_odw_analyysi_valittu_ei_vastaanottanut_paikkaa] AS

SELECT 
	f.HenkiloOID,
	f.Hakukerta,
	f.koulutuksen_alkamisvuosi as 'Koulutuksen alkamisvuosi',
	d1.sukupuoli_fi as Sukupuoli,
	d2.ikaryhma2_fi as 'Ikäryhmä',
	d3.maakunta_fi as Kotimaakunta,
	d4.maanosa6_fi as Kansalaisuus,
	d5.organisaatio_fi as Korkeakoulu,
	d5.oppilaitostyyppi_fi as Sektori,
	d6.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d6.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d6.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d7.kytkin_fi as 'Aidosti ensikertalainen',
	d8.kytkin_fi as 'Hakenut uudestaan',
	d9.kytkin_fi as 'Valittu myöhemmässä haussa',
	d10.kytkin_fi as 'Vastaanottanut paikan',
	CASE
		WHEN d6b.id is null THEN 'Ei ole vastaanottanut paikkaa'
		WHEN d6.koulutusalataso1_fi = d6b.koulutusalataso1_fi THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Vastaanottanut paikan samalta koulutusalalta (taso 1)',
	CASE
		WHEN d5b.id is null THEN 'Ei ole vastaanottanut paikkaa'
		WHEN d5.organisaatio_fi = d5b.organisaatio_fi THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Vastaanottanut paikan samasta korkeakoulusta',
	CASE
		WHEN d5b.id is null THEN 'Ei ole vastaanottanut paikkaa'
		WHEN d5.oppilaitostyyppi_fi = d5b.oppilaitostyyppi_fi THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Vastaanottanut paikan samalta sektorilta',
	CASE
		WHEN d6b.id is null THEN 3
		WHEN d6.koulutusalataso1_fi = d6b.koulutusalataso1_fi THEN 3
		ELSE 1
	END as 'Jarj Vastaanottanut paikan samalta koulutusalalta (taso 1)',
	CASE
		WHEN d5b.id is null THEN 3
		WHEN d5.organisaatio_fi = d5b.organisaatio_fi THEN 2
		ELSE 1
	END as 'Jarj Vastaanottanut paikan samasta korkeakoulusta',
	CASE
		WHEN d5b.id is null THEN 3
		WHEN d5.oppilaitostyyppi_fi = d5b.oppilaitostyyppi_fi THEN 2
		ELSE 1
	END as 'Jarj Vastaanottanut paikan samalta sektorilta',
	CASE
		WHEN koulutuksen_alkamisvuosi_vastaanottanut_paikan is null THEN 'Ei ole vastaanottanut paikkaa'
		WHEN koulutuksen_alkamisvuosi_vastaanottanut_paikan - koulutuksen_alkamisvuosi = 1 THEN '1 vuosi'
		WHEN koulutuksen_alkamisvuosi_vastaanottanut_paikan - koulutuksen_alkamisvuosi > 3 THEN 'Vähintään 4 vuotta'
		ELSE concat(cast(koulutuksen_alkamisvuosi_vastaanottanut_paikan - koulutuksen_alkamisvuosi as nvarchar), ' vuotta')
	END as 'Koulutuksen alkamisvuosien erotus',
	CASE
		WHEN koulutuksen_alkamisvuosi_vastaanottanut_paikan is null THEN 5
		WHEN koulutuksen_alkamisvuosi_vastaanottanut_paikan - koulutuksen_alkamisvuosi > 3 THEN 4
		ELSE koulutuksen_alkamisvuosi_vastaanottanut_paikan - koulutuksen_alkamisvuosi
	END as 'Jarj Koulutuksen alkamisvuosien erotus',
	f.hakenut_uudestaan_ero,
	f.valittu_ero,
	f.vastaanottanut_paikan_ero
FROM [dw].[f_haku_ja_valinta_odw_analyysi_toiminta] f
LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_alueluokitus d3 on d3.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.id = f.d_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5b on d5b.id = f.d_organisaatioluokitus_vastaanottanut_paikan_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6b on d6b.id = f.d_koulutusluokitus_vastaanottanut_paikan_id
LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.kytkin_koodi = f.aidostiEnsikertalainen
LEFT JOIN ANTERO.dw.d_kytkin d8 on d8.kytkin_koodi = f.hakenut_uudestaan
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.kytkin_koodi = f.valittu_myohemmassa_haussa
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = f.vastaanottanut_paikan_myohemmassa_haussa
WHERE f.valittu = 1 and  f.vastaanottanut_paikan_hakukerralla = 0

GO

USE [ANTERO]