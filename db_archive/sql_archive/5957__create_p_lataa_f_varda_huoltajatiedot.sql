USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_huoltajatiedot]    Script Date: 28.2.2022 16.44.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
















CREATE or ALTER procedure [dw].[p_lataa_f_varda_huoltajatiedot] AS

BEGIN TRANSACTION;

truncate table dw.f_varda_huoltajatiedot;



with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when alkamis_pvm <= '2020-12-31' and
		                  (paattymis_pvm >= '2020-12-31' or paattymis_pvm < '1900-12-30')
						  then 2020
				else NULL end as tilastovuosi,
		maksutieto_id,
		mt.lapsi_id,
		la.henkilo_id * 50 as henkilo_id,
		yksityinen_jarjestaja,
		coalesce(mp.id, '-1') as d_maksun_peruste_id,
		-1 as d_maksun_luokka_id,
		palveluseteli_arvo,
		asiakasmaksu,
		perheen_koko,
		CAST(alkamis_pvm as date) as alkamis_pvm,
		Case when paattymis_pvm < '1900-12-30' then '9999-01-01'
			 else CAST(paattymis_pvm as date)
			 end as paattymis_pvm,
		null as cum_sum,
		'p_lataa_varda_huoltajatiedot' as source

--faktat
from varda_sa.sa.sa_varda_maksutieto mt
-- dimensiot
left join dw.d_varda_maksunperuste mp on mp.koodi = UPPER(mt.maksun_peruste_koodi)
join varda_sa.sa.sa_varda_lapsi la on la.lapsi_id = mt.lapsi_id

UNION ALL
	Select aloitusvuosi + 1,
	Case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	          paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
		then aloitusvuosi + 1
		else null end as tilastovuosi,
	maksutieto_id,
	lapsi_id,
	henkilo_id,
	yksityinen_jarjestaja,
	d_maksun_peruste_id,
	d_maksun_luokka_id,
	palveluseteli_arvo,
	asiakasmaksu,
	perheen_koko,
	alkamis_pvm,
	paattymis_pvm,
	cum_sum,
	source

	from    CTE
        where   aloitusvuosi + 1 <= datepart(year, getdate()) 
		and alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
		paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)

)

INSERT INTO [dw].[f_varda_huoltajatiedot] (
		   tilastovuosi
		   ,[maksutieto_id]
           ,[lapsi_id]
		   ,henkilo_id
           ,[yksityinen_jarjestaja]
           ,[d_maksun_peruste_id]
		   ,[d_maksun_luokka_id]
           ,[palveluseteli_arvo]
           ,[asiakasmaksu]
           ,[perheen_koko]
           ,[alkamis_pvm]
           ,[paattymis_pvm]
		   ,cum_sum
           ,[source]
 )
 
select tilastovuosi,
	maksutieto_id,
	lapsi_id,
	henkilo_id,
	yksityinen_jarjestaja,
	d_maksun_peruste_id,
	d_maksun_luokka_id,
	palveluseteli_arvo,
	asiakasmaksu,
	perheen_koko,
	alkamis_pvm,
	paattymis_pvm,
	cum_sum,
	source
	
	from CTE;

Update dw.f_varda_huoltajatiedot
       set d_maksun_luokka_id = case
	    when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu < (select min(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 1 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
		when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu >= (select min(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') and asiakasmaksu < (select max(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 2 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
	    when upper(vap.jarjestamismuoto_koodi) in ('JM01', 'JM02','JM03') and asiakasmaksu >= (select max(max_arvo) from dw.d_varda_maksuluokka where tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta') then (select id from dw.d_varda_maksuluokka where koodi = 3 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Kunta')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu < 290 then (select id from dw.d_varda_maksuluokka where koodi = 4 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
		when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu >= 290 and asiakasmaksu <= 400 then (select id from dw.d_varda_maksuluokka where koodi = 5 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu >= 401 and asiakasmaksu <= 500 then (select id from dw.d_varda_maksuluokka where koodi = 6 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    when upper(vap.jarjestamismuoto_koodi) NOT in ('JM01', 'JM02','JM03') and asiakasmaksu > 500 then (select id from dw.d_varda_maksuluokka where koodi = 7 and tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and yritystyyppi = 'Yksityinen')
	    else -1 END
	   From dw.f_varda_huoltajatiedot
	   left join varda_sa.sa.sa_varda_lapsi la on la.lapsi_id = f_varda_huoltajatiedot.lapsi_id
	   left join varda_sa.sa.sa_varda_varhaiskasvatuspaatos vap on vap.lapsi_id = la.lapsi_id
	   where tilastovuosi >= 2020;


with CTE2 as (
  select alkamis_pvm,
  year(alkamis_pvm) as tilastovuosi,
  case when paattymis_pvm > '2100-12-30' then Dateadd(year, 1, getdate())
	   else paattymis_pvm
	   end as paattymis_pvm,
  lapsi_id,
  cast(asiakasmaksu as float) as asiakasmaksu
  from varda_sa.sa.sa_varda_maksutieto
  where  alkamis_pvm  <= '2021-01-01' and paattymis_pvm >= '2020-01-01'
  Union all
  Select DATEADD(Month, 1, alkamis_pvm),
         year(DATEADD(Month, 1, alkamis_pvm)) as tilastovuosi,
		 paattymis_pvm,
		 lapsi_id,
		 asiakasmaksu
  from CTE2
  where dateadd(month, 1, alkamis_pvm) < paattymis_pvm
  )

update dw.f_varda_huoltajatiedot
		set cum_sum = CTE2_S.cum_sum
		from dw.f_varda_huoltajatiedot
		join (select  tilastovuosi, lapsi_id, sum(asiakasmaksu) AS cum_sum
	    from CTE2 where tilastovuosi > 2019 and tilastovuosi <= Year(getdate()) group by tilastovuosi, lapsi_id) CTE2_S 
		on CTE2_S.tilastovuosi = f_varda_huoltajatiedot.tilastovuosi and CTE2_S.lapsi_id = f_varda_huoltajatiedot.lapsi_id
		option (maxrecursion 32000)

COMMIT;



