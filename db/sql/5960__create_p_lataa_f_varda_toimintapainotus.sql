USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_toimintapainotus]    Script Date: 28.2.2022 16.46.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










Create or ALTER procedure [dw].[p_lataa_f_varda_toimintapainotus] AS

delete from dw.f_varda_toimintapainotus;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when topa.alkamis_pvm <= '2020-12-31' and
		         (topa.paattymis_pvm >= '2020-12-31' or topa.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when topa.alkamis_pvm <= '2020-12-31' and
		         (topa.paattymis_pvm >= '2020-12-31' or topa.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		coalesce(toim.id, '-1') as d_varda_toiminnallinenpainotus_id,
		topa.alkamis_pvm,
	    case when topa.paattymis_pvm = '' then '9999-01-01'
		     else cast(topa.paattymis_pvm as date) end as paattymis_pvm,
		'p_lataa_f_varda_toimintapainotus' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_toimintapainotus topa
	  inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.toimipaikka_id = topa.toimipaikka_id

	  --dimensiot
	  left join dw.d_varda_toiminnallinenpainotus toim on toim.koodi = UPPER(topa.toimintapainotus_koodi)

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
		coalesce(d_varda_toiminnallinenpainotus_id, '-1') as d_varda_toiminnallinenpainotus_id,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_toimintapainotus] (
			tilastovuosi,
			d_varda_toiminnallinenpainotus_id,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_toiminnallinenpainotus_id,
       alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE


