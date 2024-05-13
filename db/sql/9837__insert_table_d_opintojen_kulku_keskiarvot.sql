use antero
go

if not exists (select 1 from [dw].[d_opintojen_kulku_keskiarvot] where [tyyppi]='keskiarvo' and [keskiarvo_koodi]=11)
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
		,11
		,'4,5 - 5,0'
		,''
		,''
		,11
	)
end

if not exists (select 1 from [dw].[d_opintojen_kulku_keskiarvot] where [tyyppi]='keskiarvo' and [keskiarvo_koodi]=12)
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
		,12
		,'4,0 - 4,5'
		,''
		,''
		,12
	)
end

