use antero
go

IF NOT EXISTS (
  SELECT * 
  FROM   sys.columns 
  WHERE  object_id = OBJECT_ID(N'[dw].[f_koski_oppivelvolliset]') 
         AND name = 'koulutusmoduuli_koodiarvo_hv'
)

begin
	alter table [ANTERO].[dw].[f_koski_oppivelvolliset]
	add [koulutusmoduuli_koodiarvo_hv] varchar(50) null
end