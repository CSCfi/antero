/****** Script for SelectTopNRows command from SSMS  ******/
if not exists (select * from [ANTERO].[sa].[sa_amos_tutkinto_kustannusryhma] where [tutkinto_koodi] = '999908')
begin
	insert [ANTERO].[sa].[sa_amos_tutkinto_kustannusryhma] (
		[tutkinto_koodi]
		,[kustannusryhma_koodi]
	)
	values (
		'999908'
		,'vt'
	)
end