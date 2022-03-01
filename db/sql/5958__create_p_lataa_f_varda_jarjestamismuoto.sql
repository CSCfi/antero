USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_jarjestamismuoto]    Script Date: 28.2.2022 16.44.49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE or ALTER procedure [dw].[p_lataa_f_varda_jarjestamismuoto] AS

truncate table dw.f_varda_jarjestamismuoto;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when tp.alkamis_pvm <= '2020-12-31' and
		         (tp.paattymis_pvm >= '2020-12-31' or tp.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when tp.alkamis_pvm <= '2020-12-31' and
		         (tp.paattymis_pvm >= '2020-12-31' or tp.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm01%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm01')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm01,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm02%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm02')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm02,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm03%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm03')
		     else null
			 end as d_varda_jarjestamismuoto_id_jm03,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm04%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm04')
		     else null
			  end as d_varda_jarjestamismuoto_id_jm04,
		case when lower(tp.jarjestamismuoto_koodi) like '%jm05%' then (select id from dw.d_varda_jarjestamismuoto where koodi = 'jm05')
		     else null
			  end as d_varda_jarjestamismuoto_id_jm05,
		tp.alkamis_pvm,
	    Case when tp.paattymis_pvm = '' then '9999-01-01'
			 else CAST(tp.paattymis_pvm as date)
			 end as paattymis_pvm,
		'p_lataa_f_varda_jarjestamismuoto' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_toimipaikka tp

	  union all
		select
		aloitusvuosi + 1,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then aloitusvuosi + 1
				 else NULL end as tilastovuosi,
		case when alkamis_pvm <= cast(concat(aloitusvuosi + 1, '-12-31') as Date) and
		         paattymis_pvm >= cast(concat(aloitusvuosi + 1, '-12-31') as Date) then Concat(aloitusvuosi + 1, '_', toimipaikka_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		toimipaikka_oid,
		toimipaikka_id,
		d_varda_jarjestamismuoto_id_jm01,
		d_varda_jarjestamismuoto_id_jm02,
		d_varda_jarjestamismuoto_id_jm03,
		d_varda_jarjestamismuoto_id_jm04,
		d_varda_jarjestamismuoto_id_jm05,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_jarjestamismuoto] (
			tilastovuosi,
			d_varda_jarjestamismuoto_id_jm01,
			d_varda_jarjestamismuoto_id_jm02,
			d_varda_jarjestamismuoto_id_jm03,
			d_varda_jarjestamismuoto_id_jm04,
			d_varda_jarjestamismuoto_id_jm05,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_jarjestamismuoto_id_jm01,
	   d_varda_jarjestamismuoto_id_jm02,
	   d_varda_jarjestamismuoto_id_jm03,
	   d_varda_jarjestamismuoto_id_jm04,
	   d_varda_jarjestamismuoto_id_jm05,
	   alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE


