use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto] where [aineisto_avain] = 'TK_K2_22c')
begin
  insert into [dbo].[Vipunen_aineisto]
	(
		[aineisto_nimi]
		,[aineisto_avain]
		,[aineistoryhma]
		,[aineisto_julkaisukuukausi]
		,[aineisto_tilastovuosi]
	)
  values
	(
		'K2.22c Peruskoulujen erityisopetus'
		,'TK_K2_22c'
		,'Opiskelija- opinto- ja tutkintoaineistot'
		,'7'
		,'-1'
	)
end