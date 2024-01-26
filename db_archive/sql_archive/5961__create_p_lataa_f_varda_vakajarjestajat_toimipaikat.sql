USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat]    Script Date: 28.2.2022 16.46.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






























CREATE or ALTER procedure [dw].[p_lataa_f_varda_vakajarjestajat_toimipaikat] AS

BEGIN TRANSACTION;

truncate table dw.f_varda_vakajarjestajat_toimipaikat;

with CTE as (

		   select  
	       2020 as aloitusvuosi,
		   case when tp.alkamis_pvm <= '2020-12-31' and
		             tp.paattymis_pvm >= '2020-12-31' then 2020
				else NULL end as tilastovuosi,
	       tp.toimipaikka_id as toimipaikka_id
		   ,vaj.organisaatio_oid as vakajarjestaja_oid
		   ,vaj.vakajarjestaja_id as vakajarjestaja_id
           ,Case when vaj.nimi = 'ENONTEKIÖN KUNTA' then 'Enontekiön kunta'
				 when vaj.nimi = 'PARIKKALAN KUNTA' then 'Parikkalan kunta'
				 else vaj.nimi
				 END as vakajarjestaja_nimi
           ,coalesce(alue.id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id
           ,NULL as toimipaikka_nimi
           ,tp.organisaatio_oid as toimipaikka_oid
           ,coalesce(alue2.id, '-1') as d_alueluokitus_toimipaikka_kunta_id
           ,coalesce(kj.id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
           ,coalesce(tm.id, '-1') as d_varda_toimipaikka_toimintamuoto_id
           ,coalesce(yl.id, '-1') as d_varda_yritysluokitus_id
		   ,case when tp.varhaiskasvatuspaikat < 25   then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 1)
				 when tp.varhaiskasvatuspaikat < 50   then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 2)
				 when tp.varhaiskasvatuspaikat < 100  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 3)
				 when tp.varhaiskasvatuspaikat < 150  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 4)
				 when tp.varhaiskasvatuspaikat < 200  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 5)
				 when tp.varhaiskasvatuspaikat < 250  then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 6)
				 when tp.varhaiskasvatuspaikat >= 250 then	(select id from dw.d_varda_varhaiskasvatuspaikkaluokitus where koodi = 7)
				 else -1 end as d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,coalesce(ol.id, '-1') as d_organisaatioluokitus_vakajarjestaja_id
		   ,tp.varhaiskasvatuspaikat
		   ,Case when yritysmuoto = 'OSAKEYHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Osakeyhtiö')
				 when yritysmuoto = 'KOMMANDIITTIYHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Kommandiittiyhtiö')
				 when yritysmuoto = 'SAATIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Säätiö')
				 when yritysmuoto = 'PAIKALLISYHTEISO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Paikallisyhteisö')
				 when yritysmuoto = 'YKSITYINEN_ELINKEINONHARJOITTAJA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Yksityinen elinkeinonharjoittaja')
				 when yritysmuoto = 'ORTODOKSINEN_KIRKKO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ortodoksinen kirkko')
				 when yritysmuoto = 'OSUUSKUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Osuuskunta')
				 when yritysmuoto = 'USKONNOLLINEN_YHDYSKUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Uskonnollinen yhdyskunta')
				 when yritysmuoto = 'MUU_YHDISTYS' then (select id from dw.d_yritysmuoto where nimi_fi = 'Muu yhdistys')
				 when yritysmuoto = 'EI_YRITYSMUOTOA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ei yritysmuotoa')
				 when yritysmuoto = 'KUNTA' then (select id from dw.d_yritysmuoto where nimi_fi = 'Kunta')
				 when yritysmuoto = 'AVOIN_YHTIO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Avoin yhtiö')
				 when yritysmuoto = 'EV_LUT_KIRKKO' then (select id from dw.d_yritysmuoto where nimi_fi = 'Ev.lut.kirkko')
				 when yritysmuoto = 'AATTEELLINEN_YHDISTYS' then (select id from dw.d_yritysmuoto where nimi_fi = 'Aatteellinen yhdistys')
				 else -1
				 end as d_yritysmuoto_id
           ,tp.alkamis_pvm
           ,tp.paattymis_pvm as paattymis_pvm
           ,'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source

--faktat
from varda_sa.sa.sa_varda_vakajarjestaja vaj
inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.vakajarjestaja_id = vaj.vakajarjestaja_id

-- dimensiot
left join dw.d_alueluokitus alue on alue.kunta_koodi = vaj.kunta_koodi
left join dw.d_alueluokitus alue2 on alue2.kunta_koodi = tp.kunta_koodi
left join dw.d_varda_kasvatusopillinenjarjestelma kj on kj.koodi = tp.kasvatusopillinen_jarjestelma_koodi
left join dw.d_varda_toimintamuoto tm on tm.koodi = tp.toimintamuoto_koodi
left join dw.d_varda_yritysluokitus yl on yl.koodi = vaj.yritysmuoto
left join dw.d_organisaatioluokitus ol on ol.organisaatio_oid = vaj.organisaatio_oid

UNION ALL
	Select aloitusvuosi + 1,
	Case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
	          paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date)
		then aloitusvuosi + 1
		else null end as tilastovuosi
	,toimipaikka_id
	,vakajarjestaja_oid
	,vakajarjestaja_id
    ,vakajarjestaja_nimi
    ,coalesce(d_alueluokitus_vakajarjestaja_kotikunta_id, '-1') as d_alueluokitus_vakajarjestaja_kotikunta_id
    ,NULL as toimipaikka_nimi
    ,toimipaikka_oid
    ,coalesce(d_alueluokitus_toimipaikka_kunta_id, '-1') as d_alueluokitus_toimipaikka_kunta_id
    ,coalesce(d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id, '-1') as d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
    ,coalesce(d_varda_toimipaikka_toimintamuoto_id, '-1') as d_varda_toimipaikka_toimintamuoto_id
    ,coalesce(d_varda_yritysluokitus_id, '-1') as d_varda_yritysluokitus_id
	,coalesce(d_varda_varhaiskasvatuspaikkaluokitus_id, '-1') as d_varda_varhaiskasvatuspaikkaluokitus_id
    ,coalesce(d_organisaatioluokitus_vakajarjestaja_id, '-1') as d_organisaatioluokitus_vakajarjestaja_id
	,varhaiskasvatuspaikat
    ,d_yritysmuoto_id
    ,alkamis_pvm
    ,paattymis_pvm
    ,'p_lataa_f_varda_vakajarjestajat_toimipaikat' as source
	
	from    CTE
        where   aloitusvuosi + 1 <= datepart(year, getdate()) 
		and alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
		paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
)


INSERT INTO [dw].[f_varda_vakajarjestajat_toimipaikat]
           ( tilastovuosi
		   ,[toimipaikka_id]
		   ,[vakajarjestaja_oid]
		   ,vakajarjestaja_id
           ,[vakajarjestaja_nimi]
           ,d_alueluokitus_vakajarjestaja_kunta_id
           ,[toimipaikka_nimi]
           ,[toimipaikka_oid]
           ,[d_alueluokitus_toimipaikka_kunta_id]
           ,[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id]
           ,[d_varda_toimipaikka_toimintamuoto_id]
		   ,[d_varda_yritysluokitus_id]
		   ,d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,d_organisaatioluokitus_vakajarjestaja_id
           ,[varhaiskasvatuspaikat]
		   ,d_yritysmuoto_id
           ,[alkamis_pvm]
           ,[paattymis_pvm]
           ,[source])

select  tilastovuosi
		   ,[toimipaikka_id]
		   ,[vakajarjestaja_oid]
		   ,vakajarjestaja_id
           ,[vakajarjestaja_nimi]
           ,d_alueluokitus_vakajarjestaja_kotikunta_id
           ,[toimipaikka_nimi]
           ,[toimipaikka_oid]
           ,[d_alueluokitus_toimipaikka_kunta_id]
           ,[d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id]
           ,[d_varda_toimipaikka_toimintamuoto_id]
		   ,[d_varda_yritysluokitus_id]
		   ,d_varda_varhaiskasvatuspaikkaluokitus_id
		   ,d_organisaatioluokitus_vakajarjestaja_id
           ,[varhaiskasvatuspaikat]
		   ,d_yritysmuoto_id
           ,[alkamis_pvm]
           ,[paattymis_pvm]
           ,[source]
		 from CTE

update dw.f_varda_vakajarjestajat_toimipaikat set d_varda_toimipaikkaluokitus_id =
		case when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) = 1 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 1)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 1 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 4 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 2)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 3 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 11 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 3)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) > 10 and (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) < 21 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 4)
		     when (select count(distinct(toimipaikka_oid)) from dw.f_varda_vakajarjestajat_toimipaikat sa where sa.vakajarjestaja_id = f_varda_vakajarjestajat_toimipaikat.vakajarjestaja_id and sa.tilastovuosi = f_varda_vakajarjestajat_toimipaikat.tilastovuosi) >= 21 then (select id from dw.d_varda_toimipaikkaluokitus where koodi = 5)
		else -1 end

COMMIT;








GO


