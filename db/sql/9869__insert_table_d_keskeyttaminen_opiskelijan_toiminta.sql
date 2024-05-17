use antero
go

if not exists (
	select * from [dw].[d_keskeyttaminen_opiskelijan_toiminta]
	where id = -1
)
begin

	set identity_insert [dw].[d_keskeyttaminen_opiskelijan_toiminta] on

	insert [dw].[d_keskeyttaminen_opiskelijan_toiminta] (
		id
		,[keskeyttaminen_opiskelijan_toiminta_koodi]
		,[keskeyttaminen_opiskelijan_toiminta_fi]
		,[keskeyttaminen_opiskelijan_toiminta_sv]
		,[keskeyttaminen_opiskelijan_toiminta_en]
		,[keskeyttaminen_opiskelijan_toiminta_taso1_fi]
		,[keskeyttaminen_opiskelijan_toiminta_taso1_sv]
		,[keskeyttaminen_opiskelijan_toiminta_taso1_en]
		,[keskeyttaminen_opiskelijan_toiminta_taso0_fi]
		,[keskeyttaminen_opiskelijan_toiminta_taso0_sv]
		,[keskeyttaminen_opiskelijan_toiminta_taso0_en]
		,[keskeyttaminen_opiskelijan_toiminta_jarjestys]
		,[kuutioon_ammatillinen]
		,[kuutioon_lukio]
		,[source]
	)
	values ( 
		-1
		,'-1'
		,'Tieto puuttuu'
		,'Information saknas'
		,'Missing information'
		,'Tieto puuttuu'
		,'Information saknas'
		,'Missing information'
		,'Tieto puuttuu'
		,'Information saknas'
		,'Missing information'
		,99
		,1
		,1
		,'manuaalinen'
	)

	set identity_insert [dw].[d_keskeyttaminen_opiskelijan_toiminta] off

end
