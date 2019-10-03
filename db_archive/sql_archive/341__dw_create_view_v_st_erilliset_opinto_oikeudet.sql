
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_erilliset_opinto_oikeudet]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view [dw].[v_st_erilliset_opinto_oikeudet] as

select 

[Tilastovuosi] = vuosi


,[Yliopisto] = null

--mittarit
,f.suorittaneiden_lkm
,f.opettajakoulutus_suorittaneiden_lkm

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus



from [dw].[f_yo_erillisella_opinto_oikeudella_opiskelevat] f

join dw.d_yo d6 on d6.id=f.d_yliopisto_id
'