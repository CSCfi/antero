use VipunenTK_lisatiedot
go

--aineisto
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K1_21'))
begin
  insert [dbo].[Vipunen_aineisto]
  select 'K1.21 Ammatillisen tai korkeakoulujen koulutuksen uudet opiskelijat', 'TK_K1_21', 'Valtionosuus- ja rahoitusaineistot', '8', '-1'
end;
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K1_21b'))
begin
  insert [dbo].[Vipunen_aineisto]
  select 'K1.21b Ammatillisen tai korkeakoulujen koulutuksen uudet opiskelijat (sis. toimiala)', 'TK_K1_21b', 'Valtionosuus- ja rahoitusaineistot', '12', '-1'
end;
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K1_22'))
begin
  insert [dbo].[Vipunen_aineisto]
  select 'K1.22 Muun kuin tutkintoon johtavan koulutuksen uudet opiskelijat', 'TK_K1_22', 'Valtionosuus- ja rahoitusaineistot', '8', '-1'
end;
if not exists (select * from [dbo].[Vipunen_aineisto] where aineisto_avain in ('TK_K1_22b'))
begin
  insert [dbo].[Vipunen_aineisto]
  select 'K1.22b Muun kuin tutkintoon johtavan koulutuksen uudet opiskelijat (sis. toimiala)', 'TK_K1_22b', 'Valtionosuus- ja rahoitusaineistot', '12', '-1'
end;

--afp
if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K1_21'))
begin
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K1_21', 'f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat', 'p_lataa_f_1_21_1_22'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K1_21b'))
begin
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K1_21b', 'f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat', 'p_lataa_f_1_21_1_22'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K1_22'))
begin
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K1_22', 'f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat', 'p_lataa_f_1_21_1_22'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_fakta_proseduuri] where aineisto_avain in ('TK_K1_22b'))
begin
  insert [dbo].[Vipunen_aineisto_fakta_proseduuri]
  select 'TK_K1_22b', 'f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat', 'p_lataa_f_1_21_1_22'
end;

--kuutio
if not exists (select * from [dbo].[Vipunen_kuutio] where [kuutio_avain] = 'JVA_TAB')
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
	'Jatkuva oppiminen uusien opiskelijoiden tausta cultures'
    ,'JVA_TAB'
    ,'tabular'
    ,'Jatkuva oppiminen'
    ,'TK'
    ,'vipunen'
  )
end;

--ak
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_TAB' and [aineisto_avain] in ('TK_K1_21'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K1_21', 'JVA_TAB'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_TAB' and [aineisto_avain] in ('TK_K1_21b'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K1_21b', 'JVA_TAB'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_TAB' and [aineisto_avain] in ('TK_K1_22'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K1_22', 'JVA_TAB'
end;
if not exists (select * from [dbo].[Vipunen_aineisto_kuutio] where [kuutio_avain] = 'JVA_TAB' and [aineisto_avain] in ('TK_K1_22b'))
begin
  insert [dbo].[Vipunen_aineisto_kuutio] 
  select 'TK_K1_22b', 'JVA_TAB'
end;
