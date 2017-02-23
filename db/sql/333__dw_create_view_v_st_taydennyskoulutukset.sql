


CREATE view [dw].[v_st_taydennyskoulutukset] as


select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.yo_nimi_fi
	,Sukupuoli = null
	,koulutukset = jarjestettyjen_koulutusten_lkm
	,osallistuneet = null
	,[Koodit Yliopisto] = d1.yo_tunnus
	,sukupuoli_jarjestys = 9
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_jarjestetty] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.yo_nimi_fi
	,Sukupuoli = sukupuoli_fi
	,koulutukset = null
	,osallistuneet = osallistujien_lkm
	,[Koodit Yliopisto] = d1.yo_tunnus
	,sukupuoli_jarjestys = d2.sukupuoli_koodi
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
left join dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
