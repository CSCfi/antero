


ALTER view [dw].[v_st_erilliset_opinto_oikeudet] as

select 

[Tilastovuosi] = vuosi


,[Yliopisto] = null

--mittarit
,f.suorittaneiden_lkm
,f.opettajakoulutus_suorittaneiden_lkm
,erillisilla_oik_op_lkm = null
,erillisilla_oik_opkoul_op_lkm = null

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus



from [dw].[f_yo_erillisella_opinto_oikeudella_opiskelevat] f
join dw.d_yo d6 on d6.id=f.d_yliopisto_id

union all

select 

[Tilastovuosi] = f.vuosi


,[Yliopisto] = null

--mittarit
,null
,null
,[erillisilla_oik_op_lkm]
,[erillisilla_oik_opkoul_op_lkm]

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus



from [dw].[f_yo_opintopisteet] f
join dw.d_yo d6 on d6.id=f.d_yo_id
join dw.d_kalenteri d7 on d7.id=f.d_tilannepvm_id

where d7.paivays like '%-03-02'






