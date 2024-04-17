USE [ANTERO]
GO

/****** Object:  View [dw].[v_indikaattorit_kk]    Script Date: 17.4.2024 13:30:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_indikaattorit_kk] AS

SELECT
	f.tilastovuosi as Tilastovuosi,
	f.nelivuotiskausi as Nelivuotiskausi,
	d1.organisaatio_fi as Korkeakoulu,
	d1.oppilaitostyyppi_fi as Oppilaitostyyppi,
	d2.selite_fi as Indikaattori,
	d2.indikaattorityyppi_fi as indikaattorityyppi_fi,

	d2.tyyppi,
	d2.jarjestys,
	d2.jarjestys_indikaattorityyppi,
	f.arvo,
	f.arvo_sektori

FROM [ANTERO].[dw].[f_indikaattorit_kk_4v] f
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d1 on d1.organisaatio_koodi = f.organisaatio_koodi
LEFT JOIN ANTERO.dw.d_indikaattorit_kk d2 on d2.koodi = f.indikaattori


GO

USE [ANTERO]
