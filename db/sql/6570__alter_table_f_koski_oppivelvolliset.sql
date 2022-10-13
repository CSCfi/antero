use antero
go

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvolliset]') 
         AND name = 'd_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen_hv_id'
)

begin
	alter table [ANTERO].[dw].[f_koski_oppivelvolliset]
	add [d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen_hv_id] int null
end