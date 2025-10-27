use ANTERO
go

IF NOT EXISTS (
    SELECT 1
    FROM sys.columns
    WHERE name = N'Toiminnanohjauksen kokeilu'
    AND object_ID = object_ID(N'sa.sa_amos_siirtotiedosto_okm8')
)
alter table [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8]
add [Toiminnanohjauksen kokeilu] nvarchar(50) 
go

update t 
set [Toiminnanohjauksen kokeilu] = oa.[Toiminnanohjauksen_kokeilu] 
from [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8] t
outer apply (
    select top 1 [Toiminnanohjauksen_kokeilu]
    from [ANTERO].[sa].[sa_amos_siirtotiedosto_okm8_toiminnanohjauksen_kokeilu]
    where [koul_jarj] = t.[koul_jarj]
    order by voimaan_alkaen desc
) oa
where t.voimaan_alkaen >= '2025-01-01'
and [Toiminnanohjauksen_kokeilu] is null
