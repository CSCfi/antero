IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.taydennyskoulutukset'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.taydennyskoulutukset AS
SELECT 1 AS a
'
GO

ALTER view api.taydennyskoulutukset as

/*
select
  Tilastovuosi = vuosi
  ,Yliopisto = d1.yo_nimi_fi
  ,osallistujat_miehet = koulutukseen_osallistuneet_miehet
  ,osallistujat_naiset = koulutukseen_osallistuneet_naiset
  ,koulutukset = koulutuksia
from [ANTERO].[dw].[f_yo_taydennyskoulutukset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION
*/
select
  Tilastovuosi = vuosi
  ,Yliopisto = d1.yo_nimi_fi
  ,Sukupuoli = null
  ,koulutukset = jarjestettyjen_koulutusten_lkm
  ,osallistuneet = null
  ,[Koodit Yliopisto] = d1.yo_tunnus
  ,sukupuoli_jarjestys = 9

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

  ,1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC) as defaultorder

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

  --oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset

  ,2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC) as defaultorder

from [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
left join dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id

order by defaultorder ASC


--where d2.sukupuoli_fi='mies'
--group by vuosi,d1.yo_nimi_fi

/*
UNION ALL

select
  Tilastovuosi = vuosi
  ,Yliopisto = d1.yo_nimi_fi
  ,osallistujat_miehet = null
  ,osallistujat_naiset = sum(osallistujien_lkm)
  ,koulutukset = null
from [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
left join dw.d_yo d1 on d1.id=f.d_yliopisto_id
left join dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
--where d2.sukupuoli_fi='nainen'
--group by vuosi,d1.yo_nimi_fi
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
  ,d1.yo_nimi_fi as Yliopisto
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


/* revert
drop view api.taydennyskoulutukset
--*/
