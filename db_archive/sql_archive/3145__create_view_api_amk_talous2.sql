USE [ANTERO]
GO
DROP VIEW IF EXISTS [api].[amk_talous2]
GO
CREATE VIEW [api].[amk_talous2] AS
SELECT
	 d1.amk_tunnus AS 'Ammattikorkeakoulun tunnus'
	,d1.amk_nimi_fi AS 'Ammattikorkeakoulu'
	,CASE WHEN konserni = 'E' THEN 'Ei' ELSE 'Kyllä' END AS Konserni
	,tilikausi AS 'Tilikausi'
	,d2.ohjauksenala_nimi_fi AS 'Ohjauksenala'
	--ruotsi
	,d1.amk_tunnus AS 'Yrkeshögskolas beteckning'
	,d1.amk_nimi_sv AS 'Yrkeshögskola'
	,tilikausi AS 'Finansår'
	,d2.ohjauksenala_nimi_sv AS 'Utbildningsområde'
	--englanti
	,d1.amk_tunnus AS 'Identifier of the university of applied science'
	,d1.amk_nimi_en AS 'University of applied science'
	,tilikausi AS 'Financial year'
	,d2.ohjauksenala_nimi_en AS 'Field of education'
	--koodit
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
	--oletussorttaus
	,ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d6.id ASC ) as defaultorder

  FROM dw.f_amk_talous f
INNER JOIN dw.d_amk d1 ON f.d_amk_id = d1.id
INNER JOIN dw.d_ohjauksenala d2 ON f.d_ohjauksenala_id = d2.id
INNER JOIN dw.d_tili d3 ON f.d_tili_id = d3.id
INNER JOIN dw.d_aineistotyyppi d4 ON f.d_aineistotyyppi_id = d4.id
INNER JOIN dw.d_toiminto d5 ON f.d_toiminto_id = d5.id
INNER JOIN dw.d_erittely d6 ON f.d_erittely_id = d6.id
WHERE f.arvo <> 0
