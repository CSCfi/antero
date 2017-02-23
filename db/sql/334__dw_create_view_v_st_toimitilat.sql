

CREATE view [dw].[v_st_toimitilat] as

--amk
select 
Tilastovuosi = vuosi


--,Ammattikorkeakoulu = d7.amk_nimi_fi
,Yliopisto = d1.yo_nimi_fi

--mittarit
,harjoittelukoulujen_tilat
,muut_vuokratilat
,yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy
,yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy
,yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
--järjestykset

from [dw].[f_yo_tilat] f

join dw.d_yo d1 on d1.id=f.d_yliopisto_id






