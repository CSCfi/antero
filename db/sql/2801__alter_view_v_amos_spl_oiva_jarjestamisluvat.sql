USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP view if exists [sa].[v_amos_spl_oiva_jarjestamisluvat]
GO
CREATE VIEW [sa].[v_amos_spl_oiva_jarjestamisluvat]
AS
SELECT DISTINCT
                         ojl.jarjestajaYtunnus AS ytunnus, ol.organisaatio_fi AS jarjestaja_nimi,
                         CASE WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = '' THEN '-' ELSE okm8.paa_asiallinen_toiminta_maakunta_koodi END AS paa_asiallinen_toiminta_maakunta_koodi,
                         CASE WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = '00' THEN 'Valtakunnallinen' WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi IS NULL
                         THEN 'Ei määritelty' ELSE al.maakunta_fi END AS maakunta_fi
FROM            sa.sa_oiva_luvat AS ojl INNER JOIN
                         dw.d_organisaatioluokitus AS ol ON ojl.jarjestajaYtunnus = ol.organisaatio_koodi INNER JOIN
                         sa.sa_amos_siirtotiedosto_okm8 AS okm8 ON ojl.jarjestajaYtunnus = okm8.koul_jarj LEFT OUTER JOIN
                         dw.d_alueluokitus AS al ON okm8.paa_asiallinen_toiminta_maakunta_koodi = al.maakunta_koodi

GO
