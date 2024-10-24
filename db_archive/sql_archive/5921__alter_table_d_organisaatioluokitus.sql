/****** Script for SelectTopNRows command from SSMS  ******/
use antero 
go


if not exists (

	SELECT top 1 * 
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dw'
	AND table_name = 'd_organisaatioluokitus'
	AND column_name in ('koulutuksen_jarjestajan_yritysmuoto_sv', 'koulutuksen_jarjestajan_yritysmuoto_en')

)


	alter table [dw].[d_organisaatioluokitus]
	add [koulutuksen_jarjestajan_yritysmuoto_sv] nvarchar(100) null,
		[koulutuksen_jarjestajan_yritysmuoto_en] nvarchar(100) null
		


