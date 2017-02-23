



CREATE view [dw].[v_st_harjoittelukoulut] as

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.yo_nimi_fi

--mittarit
,f.harjoittelukoulun_oppilaat_esiopetus
,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6
,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9
,f.harjoittelukoulun_oppilaat_lukio
,f.harjoittelukoulun_oppilaat_yhteensa
,f.harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit
,f.harjoittelukoulun_kokonaistuntimaara

,[opintopisteet_lastentarha] = null
,[opintopisteet_luokanopettaja] = null
,[opintopisteet_aineenopettaja] = null
,[opintopisteet_erityisopettaja] = null
,[opintopisteet_opinto_ohjaaja] = null
,[opintopisteet_aikuiskoulutus] = null
,[opintopisteet_muut] = null

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus


from [dw].[f_yo_harjoittelukoulut] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.yo_nimi_fi

--mittarit
,null
,null
,null
,null
,null
,null
,null

,f.suoritetut_opintopisteet_lastentarhanopettajat
,f.suoritetut_opintopisteet_luokanopettajaharjoittelu
,f.suoritetut_opintopisteet_aineenopettajaharjoittelu
,f.suoritetut_opintopisteet_erityisopettajat
,f.suoritetut_opintopisteet_opinto_ohjaajat
,f.suoritetut_opintopisteet_aikuiskoulutus_harjoittelu
,f.suoritetut_opintopisteet_muut_opettajankoulutusryhmat

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus


from [dw].[f_yo_harjoittelukoulujen_opintopisteet] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id





