USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_taydennyskoulutukset]    Script Date: 10.3.2025 10.11.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dw].[v_st_taydennyskoulutukset] as

/*
select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.organisaatio_fi
	,osallistujat_miehet = koulutukseen_osallistuneet_miehet
	,osallistujat_naiset = koulutukseen_osallistuneet_naiset
	,koulutukset = koulutuksia
from [ANTERO].[dw].[f_yo_taydennyskoulutukset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION 
*/
select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.organisaatio_fi
	,Sukupuoli = null
	,koulutukset = jarjestettyjen_koulutusten_lkm
	,osallistuneet = null
	,[Koodit Yliopisto] = d1.organisaatio_koodi
	,sukupuoli_jarjestys = 9

	-- Ruotsi
	,Statistikår = vuosi
	,Universitet = d1.organisaatio_sv
	,Kön = null

	--Englanti
	,[Statistical year] = vuosi
	,University = d1.organisaatio_en
	,Gender = null
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_jarjestetty] f
left join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.organisaatio_fi
	,Sukupuoli = sukupuoli_fi
	,koulutukset = null
	,osallistuneet = osallistujien_lkm
	,[Koodit Yliopisto] = d1.organisaatio_koodi
	,sukupuoli_jarjestys = d2.sukupuoli_koodi

	-- Ruotsi
	,Statistikår = vuosi
	,Universitet = d1.organisaatio_sv
	,Kön = sukupuoli_sv

	--Englanti
	,[Statistical year] = vuosi
	,University = d1.organisaatio_en
	,Gender = sukupuoli_en
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
left join dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
left join dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
--where d2.sukupuoli_fi='mies'
--group by vuosi,d1.organisaatio_fi

/*
UNION ALL

select 
	Tilastovuosi = vuosi
	,Yliopisto = d1.organisaatio_fi
	,osallistujat_miehet = null
	,osallistujat_naiset = sum(osallistujien_lkm)
	,koulutukset = null
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
left join dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
--where d2.sukupuoli_fi='nainen'
--group by vuosi,d1.organisaatio_fi
*/
/*
select 
	Tilastovuosi
	,case sukupuoli when 'koulutukseen_osallistuneet_miehet' then 'Mies' when 'koulutukseen_osallistuneet_naiset' then 'Nainen' else 'Tuntematon' end as Sukupuoli
	,Yliopisto
	,osallistujat_lkm
	,koulutukset_lkm
from
(
select
	[vuosi] as Tilastovuosi
	,f.koulutukseen_osallistuneet_miehet
	,f.koulutukseen_osallistuneet_naiset
	,d1.organisaatio_fi as Yliopisto
	,koulutuksia as koulutukset_lkm
	

from [ANTERO].[dw].[f_yo_taydennyskoulutukset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
) f2

unpivot
(
  osallistujat_lkm
  for sukupuoli in (
  [koulutukseen_osallistuneet_miehet]
  ,[koulutukseen_osallistuneet_naiset] 
  )
) unpiv
*/

GO

USE [ANTERO]