USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_varda_kielipainotus]    Script Date: 28.2.2022 16.45.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










CREATE or ALTER procedure [dw].[p_lataa_f_varda_kielipainotus] AS

truncate table dw.f_varda_kielipainotus;

with  CTE as
		(select 
		2020 as aloitusvuosi,
		case when kp.alkamis_pvm <= '2020-12-31' and
		         (kp.paattymis_pvm >= '2020-12-31' or kp.paattymis_pvm = '') then 2020
				 else NULL end as tilastovuosi,
		case when kp.alkamis_pvm <= '2020-12-31' and
		         (kp.paattymis_pvm >= '2020-12-31' or kp.paattymis_pvm = '') then Concat(2020, '_', tp.organisaatio_oid)
				 else NULL end as tilastovuosi_toimipaikka_oid,
		tp.organisaatio_oid as toimipaikka_oid,
		tp.toimipaikka_id,
		coalesce(kk.id, '-1') as d_varda_kielikoodistoopetushallinto_id,
		kp.alkamis_pvm,
	    Case when kp.paattymis_pvm = '' then '9999-01-01'
			 else CAST(kp.paattymis_pvm as date)
			 end as paattymis_pvm,
		'p_lataa_f_varda_kielipainotus' as source

	  --faktat
	  FROM varda_sa.sa.sa_varda_kielipainotus kp
	  inner join varda_sa.sa.sa_varda_toimipaikka tp on tp.toimipaikka_id = kp.toimipaikka_id

	  --dimensiot
	  left join dw.d_varda_kielikoodistoopetushallinto kk on kk.koodi = UPPER(kp.kielipainotus_koodi)

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
		coalesce(d_varda_kielikoodistoopetushallinto_id, '-1') as d_varda_kielikoodistoopetushallinto_id,
		alkamis_pvm,
		paattymis_pvm,
		source

		from    CTE
			where   (aloitusvuosi + 1) <= datepart(year, getdate()) and
			        alkamis_pvm <= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date) and 
					paattymis_pvm >= CAST(Concat(aloitusvuosi + 1, '-12-31') as Date)
	  )

INSERT INTO [dw].[f_varda_kielipainotus] (
			tilastovuosi,
			d_varda_kielikoodistoopetushallinto_id,
			alkamis_pvm,
			paattymis_pvm,
			toimipaikka_id,
			tilastovuosi_toimipaikka_oid,
			source
 )
 
select tilastovuosi,
	   d_varda_kielikoodistoopetushallinto_id,
       alkamis_pvm,
	   paattymis_pvm,
	   toimipaikka_id,
	   tilastovuosi_toimipaikka_oid,
	   source
	
	from CTE


