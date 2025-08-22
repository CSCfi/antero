use [ANTERO]
go 

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_kalenteri]') 
  AND name = 'rahoituskausi_amm_1'
)
BEGIN
	alter table [dw].[d_kalenteri]
	add [rahoituskausi_amm_1] nvarchar(50)
END
;

IF NOT EXISTS (
  SELECT * 
  FROM sys.columns 
  WHERE object_id = OBJECT_ID(N'[dw].[d_kalenteri]') 
  AND name = 'rahoituskausi_amm_2'
)
BEGIN
	alter table [dw].[d_kalenteri]
	add [rahoituskausi_amm_2] nvarchar(50)
END
