USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_toimitilat_ja_toimipisteet]    Script Date: 3.3.2025 10.01.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_toimitilat_ja_toimipisteet] as

select
	Tilastovuosi = f.vuosi

	,Yliopisto = d1.organisaatio_fi
	,Ammattikorkeakoulu = NULL
	,Korkeakoulu = d1.organisaatio_fi
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

	---ruotsi
	,Statistikår = f.vuosi
	,Universitet = d1.organisaatio_sv
	,Yrkehögskola = NULL
	,Högskola = d1.organisaatio_sv
	,Sektor = 'Universitet'

	,Verksamhetsställe = NULL
	,Verksamhetsenhet = NULL
	,[Verksamhetsställets kommun] = NULL

	,[Verksamhet: utbildning som leder till en examen] = NULL
	,[Verksamhet: forskningsarbete] = NULL
	,[Verksamhet: andra] = NULL
	,[Verksamhet: FUI] = NULL
	,[Verksamhet: tjänsteverksamhet] = NULL
	,[Verksamhet: utbildning för unga] = NULL
	,[Verksamhet: utbildning för vuxna] = NULL
	,[Verksamhet: utbildning som leder till en högre yrkeshögskoleexamen] = NULL

	---enkku
	,[Statistical year] = f.vuosi
	,University = d1.organisaatio_en
	,[University of applied sciences] = NULL
	,[Higher education] = d1.organisaatio_en
	,Sector = 'University'

	,[Site] = NULL
	,Unit = NULL
	,[Municipality of site] = NULL

	,[Activity: education leading to a degree] = null
	,[Activity: research] = null
	,[Activity: other] = null
	,[Activity: RDI] = null
	,[Activity: service] = null
	,[Activity: youth education] =null
	,[Activity: adult education] = null
	,[Activity: education leading to a UAS Master's degree] = null

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
	,[Koodit Yliopisto] = d1.organisaatio_koodi
	,[Koodit Ammattikorkeakoulu] = NULL
	,[Koodit Toimipaikka] = NULL
	,[Koodit Toimipiste] = NULL
--järjestykset

from [dw].[f_yo_tilat] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

UNION ALL

select
	Tilastovuosi = f.vuosi

	,Yliopisto = NULL
	,Ammattikorkeakoulu = d1.organisaatio_fi
	,Korkeakoulu = d1.organisaatio_fi
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

	---ruotsi
	,Statistikår = f.vuosi
	,Universitet = NULL
	,Yrkeshögskola = d1.organisaatio_sv
	,Högskola = d1.organisaatio_sv
	,Sektor = 'Yrkeshögskola'

	,Verksamhetsställe = d3.toimipisteen_nimi
	,Verksamhetsenhet = d3.toimipaikan_nimi
	,Bostad = d4.kunta_sv

	,[Verksamhet: utbildning som leder till en examen] = NULL
	,[Verksamhet: forskningsarbete] = NULL
	,[Verksamhet: andra] = NULL
	,[Verksamhet: FUI] = CASE d3.tki_toiminta WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: tjänsteverksamhet] = CASE d3.palvelutoiminta WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: utbildning för unga] = CASE d3.nuorten_koulutus WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: utbildning för vuxna] = CASE d3.aikuiskoulutus WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: utbildning som leder till en högre yrkeshögskoleexamen] = CASE d3.ylempaan_amk_tutkintoon_johtava_koulutus WHEN 'Kyllä' THEN
																			'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END

	---enkku
	,[Statistical year] = f.vuosi
	,University = NULL
	,[University of applied sciences] = d1.organisaatio_en
	,[Higher education] = d1.organisaatio_en
	,Sector ='University of applied sciences'


	,[Site] = d3.toimipisteen_nimi
	,Unit = d3.toimipaikan_nimi
	,Municipality = d4.kunta_en

	,[Activity: education leading to a degree] = null
	,[Activity: research] = null
	,[Activity: other] = null
	,[Activity: RDI] = CASE d3.tki_toiminta WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: service] = CASE d3.palvelutoiminta WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: youth education] = CASE d3.nuorten_koulutus WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: adult education] = CASE d3.aikuiskoulutus WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: education leading to a UAS Master's degree] = CASE d3.ylempaan_amk_tutkintoon_johtava_koulutus WHEN 'Kyllä' THEN 'Yes'
															  WHEN 'Ei' THEN 'No' ELSE 'Missing data' END

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
	,[Koodit Ammattikorkeakoulu] = d1.organisaatio_koodi
	,[Koodit Toimipaikka] = d3.koodi_toimipaikka
	,[Koodit Toimipiste] = d3.koodi_toimipiste

FROM [dw].[f_amk_toimipisteet] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_amk_id
join dw.d_amk_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipisteen_toimipaikka_id
join dw.d_alueluokitus d4 on d4.kunta_koodi=d3.kunta


UNION ALL

select
	Tilastovuosi = f.vuosi

	,Yliopisto = d1.organisaatio_fi
	,Ammattikorkeakoulu = NULL
	,Korkeakoulu = d1.organisaatio_fi
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

	---ruotsi
	,Statistikår = f.vuosi
	,Universitet = d1.organisaatio_sv
	,Yrkeshögskola = NULL
	,Högskola = d1.organisaatio_sv
	,Sektor = 'Universitet'

	,Verksamhetsställe = d2.selite_sv
	,Verksamhetsenhet = d3.selite_sv
	,Bostad = d4.kunta_sv

	,[Verksamhet: utbildning som leder till en examen] = CASE d5.kytkin_sv WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: forskningsarbete] = CASE d6.kytkin_sv WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: andra] = CASE d7.kytkin_sv WHEN 'Kyllä' THEN 'Ja' WHEN 'Ei' THEN 'Nej' ELSE 'information saknas' END
	,[Verksamhet: FUI] = NULL
	,[Verksamhet: tjänsteverksamhet] = NULL
	,[Verksamhet: utbildning för unga] = NULL
	,[Verksamhet: utbildning för vuxna] = NULL
	,[Verksamhet: utbildning som leder till en högre yrkeshögskoleexamen] = NULL

	---enkku
	,[Statistical year] = f.vuosi
	,University = d1.organisaatio_en
	,[University of applied sciences]  = NULL
	,[Higher education] = d1.organisaatio_en
	,Sector = 'University'

	,[Site] = d2.selite_en
	,Unit = d3.selite_en
	,Municipality  = d4.kunta_en

	,[Activity: education leading to a degree] = CASE d5.kytkin_en WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: research] = CASE d6.kytkin_en WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: other] = CASE d7.kytkin_en WHEN 'Kyllä' THEN 'Yes' WHEN 'Ei' THEN 'No' ELSE 'Missing data' END
	,[Activity: RDI] = null
	,[Activity: service] = null
	,[Activity: youth education] =null
	,[Activity: adult education] = null
	,[Activity: education leading to a UAS Master's degree] = null

	--mittarit
	,harjoittelukoulujen_tilat = NULL
	,muut_vuokratilat = NULL
	,yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy = NULL
	,yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy = NULL
	,yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy = NULL
	,toimipaikan_henkilokunnan_henkilotyovuodet
	,CASE 
		WHEN tutkimusaseman_henkilokunnan_maksimimäärä < tutkimusaseman_henkilokunnan_minimäärä THEN tutkimusaseman_henkilokunnan_minimäärä
		ELSE tutkimusaseman_henkilokunnan_maksimimäärä
	END as tutkimusaseman_henkilokunnan_maksimimäärä
	,CASE
		WHEN tutkimusaseman_henkilokunnan_minimäärä > tutkimusaseman_henkilokunnan_maksimimäärä THEN tutkimusaseman_henkilokunnan_maksimimäärä
		ELSE tutkimusaseman_henkilokunnan_minimäärä
	END as tutkimusaseman_henkilokunnan_minimäärä
	,tutkimusaseman_yopymisvuorokaudet

	--koodit
	,[Koodit Yliopisto] = d1.organisaatio_koodi
	,[Koodit Ammattikorkeakoulu] = NULL
	,[Koodit Toimipaikka] = d3.koodi_toimipaikka
	,[Koodit Toimipiste] = d3.koodi_toimipiste

FROM [dw].[f_yo_toimipisteet] f
join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
join dw.d_yo_toimipiste d2 on d2.id=f.d_toimipiste_id and d2.vuosi=f.vuosi
join dw.d_yo_toimipisteen_toimipaikka d3 on d3.id=f.d_toimipaikka_id
join dw.d_alueluokitus d4 on d4.kunta_koodi=d3.kunta
left join dw.d_kytkin d5 on d5.id=d2.d_toiminta_tutkintoon_johtava_koulutus_id
left join dw.d_kytkin d6 on d6.id=d2.d_toiminta_tutkimustoiminta_id
left join dw.d_kytkin d7 on d7.id=d2.d_toiminta_muu_id


GO

USE [ANTERO]