if not exists (
	select * FROM INFORMATION_SCHEMA.COLUMNS
    where TABLE_CATALOG  = 'antero'
	  and TABLE_SCHEMA = 'dw'
	  and TABLE_NAME = 'd_kieli'
	  and COLUMN_NAME like 'suorituskieli_%'
)
begin
  alter table [ANTERO].[dw].[d_kieli] 
  add suorituskieli_yleissivistava_fi [nvarchar](100) NULL,
	suorituskieli_yleissivistava_sv [nvarchar](100) NULL,
	suorituskieli_yleissivistava_en [nvarchar](100) NULL,
	suorituskieli_ammatillinen_fi [nvarchar](100) NULL,
	suorituskieli_ammatillinen_sv [nvarchar](100) NULL,
	suorituskieli_ammatillinen_en [nvarchar](100) NULL
end