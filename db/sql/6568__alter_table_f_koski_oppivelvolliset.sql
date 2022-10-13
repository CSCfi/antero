use antero
go

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvolliset]') 
         AND name = 'tyyppi'
)

begin
	alter table [ANTERO].[dw].[f_koski_oppivelvolliset]
	add [tyyppi] varchar(50) null
end