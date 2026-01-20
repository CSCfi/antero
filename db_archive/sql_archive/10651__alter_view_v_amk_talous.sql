USE [ANTERO]
GO

/****** Object:  View [dw].[v_amk_talous]    Script Date: 10.3.2025 9.44.53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_amk_talous] AS
--Tämä näkymä lukee vanhan koodiston mukaiset talousluvut
SELECT d1.organisaatio_koodi AS 'Ammattikorkeakoulun tunnus'
  ,d1.organisaatio_fi AS 'Ammattikorkeakoulu'
  ,tilikausi AS 'Tilikausi'
  ,d2.ohjauksenala_nimi_fi AS 'Ohjauksenala'
  ,d1.organisaatio_koodi AS 'Yrkeshögskolas beteckning'
  ,d1.organisaatio_sv AS 'Yrkeshögskola'
  ,tilikausi AS 'Finansår'
  ,d2.ohjauksenala_nimi_sv AS 'Utbildningsområde'
  ,d1.organisaatio_koodi AS 'Identifier of the university of applied science'
  ,d1.organisaatio_en AS 'University of applied science'
  ,tilikausi AS 'Financial year'
  ,d2.ohjauksenala_nimi_en AS 'Field of education'
  ,d2.ohjauksenala_koodi AS 'Ohjauksenalakoodi'
  ,d2.ohjauksenala_koodi + ' ' + d2.ohjauksenala_nimi_fi AS 'Ohjauksenala koodilla'
  ,d3.tili_taso0_fi
  ,d3.tili_taso1_fi
  ,d3.tili_taso2_fi
  ,d3.tili_taso3_fi
  ,d3.tili_taso4_fi
  ,d3.tili_taso5_fi
  ,d3.tili_taso0_sv
  ,d3.tili_taso1_sv
  ,d3.tili_taso2_sv
  ,d3.tili_taso3_sv
  ,d3.tili_taso4_sv
  ,d3.tili_taso5_sv
  ,d3.tili_taso0_en
  ,d3.tili_taso1_en
  ,d3.tili_taso2_en
  ,d3.tili_taso3_en
  ,d3.tili_taso4_en
  ,d3.tili_taso5_en
  ,d5.toiminto_nimi_fi
  ,d6.erittely_nimi_fi
  ,f.arvo
  ,d3.tili_koodi
  FROM dw.f_amk_talous_vanha_koodisto f
INNER JOIN dw.d_organisaatioluokitus d1 ON f.d_amk_id = d1.id
INNER JOIN dw.d_ohjauksenala d2 ON f.d_ohjauksenala_id = d2.id
INNER JOIN dw.d_tili d3 ON f.d_tili_id = d3.id
INNER JOIN dw.d_aineistotyyppi d4 ON f.d_aineistotyyppi_id = d4.id
INNER JOIN dw.d_toiminto d5 ON f.d_toiminto_id = d5.id
INNER JOIN dw.d_erittely d6 ON f.d_erittely_id = d6.id
WHERE f.arvo <> 0

GO

USE [ANTERO]