use VipunenTK_lisatiedot
go

if not exists (select top 1 * from [dbo].[Vipunen_aineisto] where [aineisto_avain] = 'TK_K2_4h')
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
		'K2.4h Lukiokoulutuksen opiskelijat ja ammatillisen koulutuksen opiskelijat ja tutkinnon suorittaneet'
		,'TK_K2_4h'
		,'Opiskelija- opinto- ja tutkintoaineistot'
		,'7'
		,'-1'
	)
end