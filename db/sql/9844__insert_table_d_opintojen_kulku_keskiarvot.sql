use antero
go

if not exists (select 1 from [dw].[d_opintojen_kulku_keskiarvot] where [tyyppi]='keskiarvo' and [keskiarvo_koodi]=0)
begin
	insert [dw].[d_opintojen_kulku_keskiarvot] (
		[tyyppi]
		,[keskiarvo_koodi]
		,[selite_fi]
		,[selite_se]
		,[selite_en]
		,[jarj_keskiarvo]
	)
	values (
		'keskiarvo'
		,0
		,'9,5 - 10'
		,''
		,''
		,1
	)
end
