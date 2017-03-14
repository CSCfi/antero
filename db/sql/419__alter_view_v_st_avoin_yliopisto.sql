

ALTER view [dw].[v_st_avoin_yliopisto] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi


,[Yliopisto] = d6.yo_nimi_fi

--mittarit
,f.suorittaneiden_lkm


--koodit
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi



from [dw].[f_yo_avoimen_yliopiston_kautta_opiskelevat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id










