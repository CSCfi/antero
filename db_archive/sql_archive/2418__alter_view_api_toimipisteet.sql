USE [ANTERO]
GO

ALTER view [api].[toimipisteet] as

SELECT

[Tilastovuosi] = f.vuosi

,[Yliopisto] = d1.yo_nimi_fi
,[Ammattikorkeakoulu] = null
,[Toimipiste] = d2.selite_fi
,[Toimipaikka] = d3.selite_fi

,[Toiminta: tutkintoon johtava koulutus] = d4.kytkin_fi
,[Toiminta: tutkimustoiminta] = d5.kytkin_fi
,[Toiminta: muu] = d6.kytkin_fi
,[Toiminta: TKI] = null
,[Toiminta: palvelutoiminta] = null
,[Toiminta: nuorten koulutus] = null
,[Toiminta: aikuiskoulutus] = null
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = null

,[toimipaikan_henkilokunnan_henkilotyovuodet]
,[tutkimusaseman_henkilokunnan_maksimimäärä]
,[tutkimusaseman_henkilokunnan_minimäärä]
,[tutkimusaseman_yopymisvuorokaudet]

,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Ammattikorkeakoulu] = null

--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

,1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC , d3.id ASC , d4.id ASC , d5.id ASC, d6.id ASC ) as defaultorder

FROM [ANTERO].[dw].[f_yo_toimipisteet] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
left join dw.d_yo_toimipiste d2 on d2.id=f.d_toimipiste_id and d2.vuosi=f.vuosi
left join dw.d_yo_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipaikka_id
left join dw.d_kytkin d4 on d4.id=d2.d_toiminta_tutkintoon_johtava_koulutus_id
left join dw.d_kytkin d5 on d5.id=d2.d_toiminta_tutkimustoiminta_id
left join dw.d_kytkin d6 on d6.id=d2.d_toiminta_muu_id

UNION ALL

SELECT
[Tilastovuosi] = f.vuosi

,[Yliopisto] = null
,[Ammattikorkeakoulu] = d1.amk_nimi_fi
,[Toimipiste] = d3.toimipisteen_nimi
,[Toimipaikka] = d3.toimipaikan_nimi

,[Toiminta: tutkintoon johtava koulutus] = null
,[Toiminta: tutkimustoiminta] = null
,[Toiminta: muu] = null
,[Toiminta: TKI] = d3.tki_toiminta
,[Toiminta: palvelutoiminta] = d3.palvelutoiminta
,[Toiminta: nuorten koulutus] = d3.nuorten_koulutus
,[Toiminta: aikuiskoulutus] = d3.aikuiskoulutus
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = d3.ylempaan_amk_tutkintoon_johtava_koulutus

,[toimipaikan_henkilokunnan_henkilotyovuodet]
,null
,null
,null

,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d1.amk_tunnus

--oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset

,2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d3.id ASC) as defaultorder


FROM [ANTERO].[dw].[f_amk_toimipisteet] f
left join dw.d_amk d1 on d1.id=f.d_amk_id
--left join dw.d_amk_toimipisteen_toimipaikka d2 on d2.id=f.d_toimipiste_id
left join dw.d_amk_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipisteen_toimipaikka_id

GO
