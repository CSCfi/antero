USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_toimipisteet_esilataus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_toimipisteet_esilataus] AS

TRUNCATE TABLE [dw].[api_toimipisteet]

INSERT INTO [dw].[api_toimipisteet]



--amk
SELECT
1000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id) AS defaultorder
,Tilastovuosi = f.vuosi

--,Ammattikorkeakoulu = d7.amk_nimi_fi
,Yliopisto = d1.yo_nimi_fi
,Ammattikorkeakoulu = NULL
,Toimipiste = NULL
,Toimipaikka = NULL

--mittarit
,harjoittelukoulujen_tilat
,muut_vuokratilat
,yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy
,yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy
,yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy
,toimipaikan_henkilokunnan_henkilotyovuodet = NULL
,tutkimusaseman_henkilokunnan_maksimimäärä = NULL
,tutkimusaseman_henkilokunnan_minimäärä = NULL
,tutkimusaseman_yopymisvuorokaudet = NULL

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Ammattikorkeakoulu] = NULL

from [antero].[dw].[f_yo_tilat] f
JOIN antero.dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

SELECT
2000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id, d3.id) AS defaultorder
,Tilastovuosi = f.vuosi
--,Ammattikorkeakoulu = d7.amk_nimi_fi
,Yliopisto = NULL
,Ammattikorkeakoulu = d1.amk_nimi_fi

,Toimipiste = d3.toimipisteen_nimi
,Toimipaikka = d3.toimipaikan_nimi

--mittarit
,harjoittelukoulujen_tilat = NULL
,muut_vuokratilat = NULL
,yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy = NULL
,yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy = NULL
,yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy = NULL
,toimipaikan_henkilokunnan_henkilotyovuodet
,tutkimusaseman_henkilokunnan_maksimimäärä = NULL
,tutkimusaseman_henkilokunnan_minimäärä = NULL
,tutkimusaseman_yopymisvuorokaudet = NULL


--koodit
,[Koodit Yliopisto] = NULL
,[Koodit Ammattikorkeakoulu] = d1.amk_tunnus

FROM [antero].[dw].[f_amk_toimipisteet] f
JOIN antero.dw.d_amk d1 on d1.id=f.d_amk_id
--JOIN antero.dw.d_amk_toimipiste d2 on d2.id=f.d_toimipiste_id
JOIN antero.dw.d_amk_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipisteen_toimipaikka_id
--JOIN antero.dw.d_amk_t

UNION ALL

SELECT
3000000000+ ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id, d3.id) AS defaultorder
,Tilastovuosi = f.vuosi
,Yliopisto = d1.yo_nimi_fi
,Ammattikorkeakoulu = NULL

,Toimipiste = d2.selite_fi
,Toimipaikka = d3.selite_fi

--mittarit
,harjoittelukoulujen_tilat = NULL
,muut_vuokratilat = NULL
,yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy = NULL
,yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy = NULL
,yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy = NULL
,toimipaikan_henkilokunnan_henkilotyovuodet
,tutkimusaseman_henkilokunnan_maksimimäärä
,tutkimusaseman_henkilokunnan_minimäärä
,tutkimusaseman_yopymisvuorokaudet

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Ammattikorkeakoulu] = NULL

FROM [antero].[dw].[f_yo_toimipisteet] f
JOIN antero.dw.d_yo d1 on d1.id=f.d_yliopisto_id
JOIN antero.dw.d_yo_toimipiste d2 on d2.id=f.d_toimipiste_id and d2.vuosi = f.vuosi
JOIN antero.dw.d_yo_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipaikka_id

GO
