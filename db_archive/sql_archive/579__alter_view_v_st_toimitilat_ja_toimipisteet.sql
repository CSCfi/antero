

ALTER view [dw].[v_st_toimitilat_ja_toimipisteet] as


select 
Tilastovuosi = vuosi

,Yliopisto = d1.yo_nimi_fi
,Ammattikorkeakoulu = NULL
,Korkeakoulu = d1.yo_nimi_fi
,Sektori = 'Yliopisto'

,Toimipiste = NULL
,Toimipaikka = NULL
,[Toimipisteen kunta] = NULL

,[Toiminta: tutkintoon johtava koulutus] = null
,[Toiminta: tutkimustoiminta] = null
,[Toiminta: muu] = null
,[Toiminta: TKI] = null
,[Toiminta: palvelutoiminta] = null
,[Toiminta: nuorten koulutus] = null
,[Toiminta: aikuiskoulutus] = null
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = null

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
,[Koodit Toimipaikka] = NULL

--järjestykset

from [dw].[f_yo_tilat] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
Tilastovuosi = vuosi

,Yliopisto = NULL
,Ammattikorkeakoulu = d1.amk_nimi_fi
,Korkeakoulu = d1.amk_nimi_fi
,Sektori = 'Ammattikorkeakoulu'

,Toimipiste = d3.toimipisteen_nimi
,Toimipaikka = d3.toimipaikan_nimi
,Kunta = d4.kunta_fi

,[Toiminta: tutkintoon johtava koulutus] = null
,[Toiminta: tutkimustoiminta] = null
,[Toiminta: muu] = null
,[Toiminta: TKI] = d3.tki_toiminta
,[Toiminta: palvelutoiminta] = d3.palvelutoiminta
,[Toiminta: nuorten koulutus] = d3.nuorten_koulutus
,[Toiminta: aikuiskoulutus] = d3.aikuiskoulutus
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = d3.ylempaan_amk_tutkintoon_johtava_koulutus

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
,[Koodit Toimipaikka] = d3.koodi_toimipaikka

FROM [dw].[f_amk_toimipisteet] f
join dw.d_amk d1 on d1.id=f.d_amk_id
join dw.d_amk_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipisteen_toimipaikka_id
join dw.d_alueluokitus d4 on d4.kunta_koodi=d3.kunta


UNION ALL

select 
Tilastovuosi = vuosi

,Yliopisto = d1.yo_nimi_fi
,Ammattikorkeakoulu = NULL
,Korkeakoulu = d1.yo_nimi_fi
,Sektori = 'Yliopisto'

,Toimipiste = d2.selite_fi
,Toimipaikka = d3.selite_fi
,Kunta = d4.kunta_fi

,[Toiminta: tutkintoon johtava koulutus] = d5.kytkin_fi
,[Toiminta: tutkimustoiminta] = d6.kytkin_fi
,[Toiminta: muu] = d7.kytkin_fi
,[Toiminta: TKI] = null
,[Toiminta: palvelutoiminta] = null
,[Toiminta: nuorten koulutus] = null
,[Toiminta: aikuiskoulutus] = null
,[Toiminta: ylempään amk-tutkintoon johtava koulutus] = null

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
,[Koodit Toimipaikka] = d3.koodi_toimipaikka

FROM [dw].[f_yo_toimipisteet] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id
join dw.d_yo_toimipiste d2 on d2.id=f.d_toimipiste_id
join dw.d_yo_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipaikka_id
join dw.d_alueluokitus d4 on d4.kunta_koodi=d3.kunta
left join dw.d_kytkin d5 on d5.id=d2.d_toiminta_tutkintoon_johtava_koulutus_id
left join dw.d_kytkin d6 on d6.id=d2.d_toiminta_tutkimustoiminta_id
left join dw.d_kytkin d7 on d7.id=d2.d_toiminta_muu_id


