use antero
go

update t 
set [Toiminnanohjauksen kokeilu] = oa.[Toiminnanohjauksen_kokeilu] 
from [sa].[sa_amos_siirtotiedosto_okm8] t
outer apply (
    select top 1 [Toiminnanohjauksen_kokeilu]
    from [sa].[sa_amos_siirtotiedosto_okm8_toiminnanohjauksen_kokeilu]
    where [koul_jarj] = t.[koul_jarj]
    order by voimaan_alkaen desc
) oa
where t.voimaan_alkaen >= '2025-01-01'
and [Toiminnanohjauksen kokeilu] is null
