use [VipunenTK_lisatiedot]
go

if not exists (
	select * 
	from [dbo].[Vipunen_aineisto_fakta_proseduuri] 
	where aineisto_avain = 'TK_1_24'
)
insert [dbo].[Vipunen_aineisto_fakta_proseduuri] (
	[aineisto_avain]
	,[fakta]
	,[proseduuri]
)
values (
	'TK_1_24'
	,'ei faktataulua'
	,'p_lataa_f_ei_faktataulua_metadata'
)