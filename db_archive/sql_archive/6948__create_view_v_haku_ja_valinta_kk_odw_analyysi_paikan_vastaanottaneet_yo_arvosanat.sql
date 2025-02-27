USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_kk_odw_analyysi_paikan_vastaanottaneet_yo_arvosanat]    Script Date: 25.1.2023 15:54:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dw].[v_haku_ja_valinta_kk_odw_analyysi_paikan_vastaanottaneet_yo_arvosanat] AS

SELECT DISTINCT
	f.HenkiloOID,
	f.HakukohdeOID,
	f.Hakukerta,
	f.koulutuksen_alkamisvuosi as 'Koulutuksen alkamisvuosi',
	d1.sukupuoli_fi as Sukupuoli,
	d2.ikaryhma2_fi as 'Ikäryhmä',
	d4.maanosa6_fi as Kansalaisuus,
	d5.organisaatio_fi as Korkeakoulu,
	d5.oppilaitostyyppi_fi as Sektori,
	d6.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d6.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d6.koulutusalataso3_fi as 'Koulutusala, taso 3',
	f.yo_aineen_arvosana,
	f.yo_arvosanojen_keskiarvo,
	CASE
		WHEN d8.koodi = 'AI' THEN 'Äidinkieli' 
		ELSE d7.aine_selite_fi
	END as Aine
FROM [dw].[f_haku_ja_valinta_kk_odw_analyysi_yo_arvosanat] f
LEFT JOIN ANTERO.dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.id = f.d_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_ytl_aine d7 on d7.id = f.d_ytl_aine_id
LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d8 on d8.id = f.d_ytl_aine_laajuus_id
WHERE vastaanottanut_paikan = 1

GO

USE [ANTERO]

