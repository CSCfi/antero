use VipunenTK_lisatiedot
go

--aineisto
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K1_23'))
begin
  insert [dbo].[Vipunen_aineisto]
  select 'K1.23 Aikuiskoulutukseen osallistuneet (edellisen 12 kuukauden aikana)', 'TK_K1_23', 'Valtionosuus- ja rahoitusaineistot', '12', '-1'
end
;
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_1_24'))
begin
  insert [dbo].[Vipunen_aineisto]
  select '1.24 Tutkintoon johtavaan ja/tai kurssikoulutukseen osallistuneet (edellisen 4 viikon aikana)', 'TK_1_24', 'Valtionosuus- ja rahoitusaineistot', '12', '-1'
end
;

--afp
if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K1_23'))
begin
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K1_23', 'f_1_23_Jatkuva_oppiminen_aikuiskoulutukseen_osallistuneet', 'p_lataa_f_1_23'
end
;

--kuutio
if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'JVA_AKT_TAB')
begin
  insert [dbo].[Vipunen_kuutio] (
	[kuutio_nimi]
    ,[kuutio_avain]
    ,[kuutio_toteutustyyppi]
    ,[kuutio_projekti]
    ,[kuutio_prosessointiryhma]
    ,[ajotunnus]
  )
  values (
	'Jatkuva oppiminen aikuiskoulutukseen osallistuneet cultures'
    ,'JVA_AKT_TAB'
    ,'tabular'
    ,'Jatkuva oppiminen'
    ,'TK'
    ,'vipunen'
  )
end
;
if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'JVA_TVT_TAB')
begin
  insert [dbo].[Vipunen_kuutio] (
	[kuutio_nimi]
    ,[kuutio_avain]
    ,[kuutio_toteutustyyppi]
    ,[kuutio_projekti]
    ,[kuutio_prosessointiryhma]
    ,[ajotunnus]
  )
  values (
	'Jatkuva oppiminen tutk joht tai kurssikoul osallistuneet cultures'
    ,'JVA_TVT_TAB'
    ,'tabular'
    ,'Jatkuva oppiminen'
    ,'TK'
    ,'vipunen'
  )
end
;

--ak
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_AKT_TAB' and [aineisto_avain] in ('TK_K1_23'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K1_23', 'JVA_AKT_TAB'
end
;
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_TVT_TAB' and [aineisto_avain] in ('TK_1_24'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_1_24', 'JVA_TVT_TAB'
end
;
