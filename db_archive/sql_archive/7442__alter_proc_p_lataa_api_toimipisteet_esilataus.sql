USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_toimipisteet_esilataus]    Script Date: 6.3.2023 12:38:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_toimipisteet_esilataus] AS

TRUNCATE TABLE [dw].[api_toimipisteet]

INSERT INTO [dw].[api_toimipisteet]

SELECT
1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d6.id ASC ) AS defaultorder
,[Tilastovuosi] = f.vuosi
,[Yliopisto] = d1.yo_nimi_fi
,[Ammattikorkeakoulu] = NULL
,[Toimipiste] = d2.selite_fi
,[Toimipaikka] = d3.selite_fi

,[Toiminta: tutkintoon johtava koulutus] = d4.kytkin_fi
,[Toiminta: tutkimustoiminta] = d5.kytkin_fi
,[Toiminta: muu] = d6.kytkin_fi
,[Toiminta: TKI] = NULL
,[Toiminta: palvelutoiminta] = NULL
,[Toiminta: nuorten koulutus] = NULL
,[Toiminta: aikuiskoulutus] = NULL
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = NULL

,[toimipaikan_henkilokunnan_henkilotyovuodet]
,CASE 
	WHEN tutkimusaseman_henkilokunnan_maksimimäärä < tutkimusaseman_henkilokunnan_minimäärä THEN tutkimusaseman_henkilokunnan_minimäärä
	ELSE tutkimusaseman_henkilokunnan_maksimimäärä
END as tutkimusaseman_henkilokunnan_maksimimäärä
,CASE
	WHEN tutkimusaseman_henkilokunnan_minimäärä > tutkimusaseman_henkilokunnan_maksimimäärä THEN tutkimusaseman_henkilokunnan_maksimimäärä
	ELSE tutkimusaseman_henkilokunnan_minimäärä
END as tutkimusaseman_henkilokunnan_minimäärä
,[tutkimusaseman_yopymisvuorokaudet]

,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Ammattikorkeakoulu] = NULL

FROM [ANTERO].[dw].[f_yo_toimipisteet] f
LEFT JOIN antero.dw.d_yo d1 ON d1.id=f.d_yliopisto_id
LEFT JOIN antero.dw.d_yo_toimipiste d2 ON d2.id=f.d_toimipiste_id and d2.vuosi=f.vuosi
LEFT JOIN antero.dw.d_yo_toimipisteen_toimipaikka d3 ON d3.id=f.d_toimipaikka_id
LEFT JOIN antero.dw.d_kytkin d4 ON d4.id=d2.d_toiminta_tutkintoon_johtava_koulutus_id
LEFT JOIN antero.dw.d_kytkin d5 ON d5.id=d2.d_toiminta_tutkimustoiminta_id
LEFT JOIN antero.dw.d_kytkin d6 ON d6.id=d2.d_toiminta_muu_id

UNION ALL

SELECT
 2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d3.id ASC) AS defaultorder
,[Tilastovuosi] = f.vuosi
,[Yliopisto] = NULL
,[Ammattikorkeakoulu] = d1.amk_nimi_fi
,[Toimipiste] = d3.toimipisteen_nimi
,[Toimipaikka] = d3.toimipaikan_nimi

,[Toiminta: tutkintoon johtava koulutus] = NULL
,[Toiminta: tutkimustoiminta] = NULL
,[Toiminta: muu] = NULL
,[Toiminta: TKI] = d3.tki_toiminta
,[Toiminta: palvelutoiminta] = d3.palvelutoiminta
,[Toiminta: nuorten koulutus] = d3.nuorten_koulutus
,[Toiminta: aikuiskoulutus] = d3.aikuiskoulutus
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = d3.ylempaan_amk_tutkintoon_johtava_koulutus

,[toimipaikan_henkilokunnan_henkilotyovuodet]
,NULL
,NULL
,NULL

,[Koodit Yliopisto] = NULL
,[Koodit Ammattikorkeakoulu] = d1.amk_tunnus

FROM [ANTERO].[dw].[f_amk_toimipisteet] f
LEFT JOIN antero.dw.d_amk d1 ON d1.id=f.d_amk_id
--LEFT JOIN antero.dw.d_amk_toimipisteen_toimipaikka d2 ON d2.id=f.d_toimipiste_id
LEFT JOIN antero.dw.d_amk_toimipisteen_toimipaikka d3 ON d3.id=f.d_toimipisteen_toimipaikka_id


GO

USE [ANTERO]