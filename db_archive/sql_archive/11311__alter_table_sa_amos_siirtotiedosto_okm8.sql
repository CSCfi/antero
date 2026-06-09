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