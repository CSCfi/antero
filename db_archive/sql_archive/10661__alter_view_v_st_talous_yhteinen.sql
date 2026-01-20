USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_talous_yhteinen]    Script Date: 10.3.2025 10.09.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_st_talous_yhteinen] AS
SELECT 

  d3.tili_taso0_fi
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
  ,f.arvo
  ,d3.tili_koodi
  ,NULL AS 'd6.erittely_nimi_fi'
  ,tilikausi AS 'Tilastovuosi'
  ,CASE WHEN konserni = 'E' THEN 'Ei' ELSE 'Kyllä' END AS Konserni
  ,d1.organisaatio_fi AS 'Korkeakoulu'
  ,d2.opintoala95_nimi_fi AS 'Koulutusala'
  ,d4.aineistotyyppi_nimi_fi AS 'Aineisto'
  ,d6.ohjauksenala_nimi_fi AS 'Ohjauksenala'
  --ruotsi
  ,tilikausi AS 'Statistikår'
  ,d1.organisaatio_sv AS 'Universitet'
  ,d2.opintoala95_nimi_sv AS 'Utbildningsområde'
  ,d4.aineistotyyppi_nimi_sv AS 'Material typ'
  ,d6.ohjauksenala_nimi_sv AS 'Ohjauksenala_sv'
  --englanti
  ,tilikausi AS 'Statistical year'
  ,d1.organisaatio_en AS 'University'
  ,d2.opintoala95_nimi_en AS 'Field of education'
  ,d4.aineistotyyppi_nimi_en AS 'Material type'
  ,d6.ohjauksenala_nimi_en AS 'Ohjauksenala_en'

  ,d1.organisaatio_koodi AS 'Koodit_yliopisto'
  ,d2.opintoala95_koodi AS 'Koodit_koulutusala'
  ,d4.aineistotyyppi_koodi AS 'Koodit_aineisto'
  ,d6.ohjauksenala_koodi AS 'Koodit_ohjauksenala'
  ,'Yliopisto' AS 'Sektori'


    FROM dw.f_yo_talous f
INNER JOIN dw.d_organisaatioluokitus d1 ON f.d_yo_id = d1.id
INNER JOIN dw.d_opintoala95 d2 ON f.d_opintoala95_id = d2.id
INNER JOIN dw.d_tili d3 ON f.d_tili_id = d3.id
INNER JOIN dw.d_aineistotyyppi d4 ON f.d_aineistotyyppi_id = d4.id
INNER JOIN dw.d_toiminto d5 ON f.d_toiminto_id = d5.id
INNER JOIN dw.d_ohjauksenala d6 ON f.d_ohjauksenala_id = d6.id
WHERE f.arvo <> 0 AND NOT (tili_taso5_fi='Konserni; Henkilöstökulut' AND konserni='E') AND NOT (tili_taso5_fi='Konserni; Avustustuotot' AND konserni='E') AND NOT (tili_taso5_fi='Konserni; Lahjoitukset' AND konserni='E')

UNION ALL
SELECT 
  d3.tili_taso0_fi
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

  ,f.arvo
  ,d3.tili_koodi
  ,d6.erittely_nimi_fi
  ,tilikausi AS 'Tilastovuosi'
  ,CASE WHEN konserni = 'E' THEN 'Ei' ELSE 'Kyllä' END AS Konserni
  ,d1.organisaatio_fi AS 'Korkeakoulu'
  ,NULL
  ,NULL
  ,d2.ohjauksenala_nimi_fi AS 'Ohjauksenala'

   ,tilikausi AS 'Statistikår'
  ,d1.organisaatio_sv AS 'Högskola'
  ,NULL
  ,NULL
  ,d2.ohjauksenala_nimi_sv AS 'Utbildningsområde'

  ,tilikausi AS 'Statistical year'
  ,d1.organisaatio_en AS 'Higher educational institute'
  ,NULL
  ,NULL
  ,d2.ohjauksenala_nimi_en AS 'Field of education'

  ,d1.organisaatio_koodi AS 'Koodit_korkeakoulu'
  ,NULL
  ,NULL
  ,d2.ohjauksenala_koodi AS 'Ohjauksenalakoodi'
  ,'Ammattikorkeakoulu' AS 'Sektori'


  FROM dw.f_amk_talous f
INNER JOIN dw.d_organisaatioluokitus d1 ON f.d_amk_id = d1.id
INNER JOIN dw.d_ohjauksenala d2 ON f.d_ohjauksenala_id = d2.id
INNER JOIN dw.d_tili d3 ON f.d_tili_id = d3.id
INNER JOIN dw.d_aineistotyyppi d4 ON f.d_aineistotyyppi_id = d4.id
INNER JOIN dw.d_toiminto d5 ON f.d_toiminto_id = d5.id
INNER JOIN dw.d_erittely d6 ON f.d_erittely_id = d6.id
WHERE f.arvo <> 0


GO

USE [ANTERO]