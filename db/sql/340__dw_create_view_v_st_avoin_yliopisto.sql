

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_avoin_yliopisto]'))
EXEC dbo.sp_executesql @statement = N'

create view [dw].[v_st_avoin_yliopisto] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi


,[Yliopisto] = null

--mittarit
,f.suorittaneiden_lkm


--koodit
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi



from [dw].[f_yo_avoimen_yliopiston_kautta_opiskelevat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id
'