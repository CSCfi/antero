IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_toimitilat_ja_toimipisteet]'))
EXEC dbo.sp_executesql @statement = N'

create view [dw].[v_st_toimitilat_ja_toimipisteet] as


select 
Tilastovuosi = vuosi

,Yliopisto = d1.yo_nimi_fi
,Ammattikorkeakoulu = NULL
,Korkeakoulu = d1.yo_nimi_fi
,Sektori = "Yliopisto"

,Toimipiste = NULL
,Toimipaikka = NULL
,[Toimipisteen kunta] = NULL

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
,Sektori = "Ammattikorkeakoulu"

,Toimipiste = d3.toimipisteen_nimi
,Toimipaikka = d3.toimipaikan_nimi
,Kunta = d4.kunta_fi

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
,Sektori = "Yliopisto"

,Toimipiste = d2.selite_fi
,Toimipaikka = d3.selite_fi
,Kunta = d4.kunta_fi

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


'


