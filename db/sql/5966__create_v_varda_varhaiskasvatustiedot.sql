USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE or ALTER VIEW [dw].[v_varda_varhaiskasvatustiedot] AS
 select * from (
      select vaka.tilastovuosi,
	  vaka.henkilo_id,
	  alue.kunta_fi as kotikunta_fi,
	  alue.kunta_en as kotikunta_en,
	  alue.kunta_sv as kotikunta_sv,
	  alue.kunta_koodi as kotikunta_koodi,
	  --When changing ikä check tilastointi-column as well
	  DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) AS ika,
	  ikar.kuvaus_fi as ikaryhma_fi,
	  ikar.kuvaus_en as ikaryhma_en,
	  ikar.kuvaus_sv as ikaryhma_sv,	  
	  --Only the following languages are wanted on the report, rest are masked
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV', 'EN','VK') then kieli.nimi_fi
		   else (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_fi,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV', 'EN','VK') then kieli.nimi_en
		   else (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_en,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV', 'EN','VK') then kieli.nimi_sv
		   else (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_sv,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV', 'EN','VK') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = kieli.koodi)
		   else (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_jarj,
	  case	when sukup.sukupuoli_koodi = 1 then 'Poika'
			when sukup.sukupuoli_koodi = 2 then 'Tyttö'
			end as sukupuoli_fi,
	case when sukup.sukupuoli_koodi = 1 then 'Male'
		when sukup.sukupuoli_koodi = 2 then 'Female'
	end as sukupuoli_en,
		case when sukup.sukupuoli_koodi = 1 then 'Man'
			when sukup.sukupuoli_koodi = 2 then 'Kvinna'
			end  as   sukupuoli_sv,
	  --vakapaatos_hakemus_pvm,
	  --vakapaatos_alkamis_pvm,
	  --vakapaatos_paattymis_pvm,
	  jm.koodi as jarjestamismuoto_koodi,
	  jm.nimi_fi as jarjestamismuoto_fi,
	  jm.nimi_en as jarjestamismuoto_en,
	  jm.nimi_sv as jarjestamismuoto_sv,
	  kytkin.kytkin_fi as vuorohoito_kytkin_fi,
	  kytkin.kytkin_en as vuorohoito_kytkin_en,
	  kytkin.kytkin_sv as vuorohoito_kytkin_sv,
	  va_kytkin2.kytkin_fi as kokopaivainen_vaka_kytkin_fi,
	  va_kytkin2.kytkin_en as kokopaivainen_vaka_kytkin_en,
	  va_kytkin2.kytkin_sv as kokopaivainen_vaka_kytkin_sv,
	  va_kytkin3.kytkin_fi as paivittainen_vaka_kytkin_fi,
	  va_kytkin3.kytkin_en as paivittainen_vaka_kytkin_en,
	  va_kytkin3.kytkin_sv as paivittainen_vaka_kytkin_sv,
	  kytkin4.kytkin_fi as pikakasittely_kytkin_fi,
	  kytkin4.kytkin_en as pikakasittely_kytkin_en,
	  kytkin4.kytkin_sv as pikakasittely_kytkin_sv,
	  vakapaatos_tuntimaara_viikossa as tuntimaara_viikossa,
	  tunti_ast.nimi_fi as tuntimaara_asteikko_fi,
	  tunti_ast.nimi_en as tuntimaara_asteikko_en,
	  tunti_ast.nimi_sv as tuntimaara_asteikko_sv,
	  vaka.vakasuhde_id,
	  vaka.lapsi_id,
	  --vakasuhde_alkamis_pvm,
	  --vakasuhde_paattymis_pvm,
	  case when yl.yritys_tyyppi = 'Yksityinen' then NULL
	       else tp.vakajarjestaja_nimi 
		   end as vakajarjestaja_nimi,
	  yl.nimi_fi as yritysmuoto_fi,
	  yl.nimi_en as yritysmuoto_en,
	  yl.nimi_sv as yritysmuoto_sv,
	  yl.yritysmuoto_ryhma_fi,
	  yl.yritysmuoto_ryhma_en,
	  yl.yritysmuoto_ryhma_sv,
	  yl.yritys_tyyppi as yritystyyppi,
	  alue2.kunta_fi as vakajarjestaja_kunta_fi,
	  alue2.kunta_sv as vakajarjestaja_kunta_sv,
	  alue2.kunta_en as vakajarjestaja_kunta_en,
	  --tp.toimipaikka_nimi,
	  tp.toimipaikka_oid,
	  tp_alue.maakunta_fi as toimipaikka_maakunta_fi,
	  tp_alue.maakunta_en as toimipaikka_maakunta_en,
	  tp_alue.maakunta_sv as toimipaikka_maakunta_sv,
	  tp_alue.kunta_fi as toimipaikka_kunta_fi,
	  tp_alue.kunta_en as toimipaikka_kunta_en,
	  tp_alue.kunta_sv as toimipaikka_kunta_sv,
	  kj.nimi_fi as kasvatusopillinen_jarjestelma_fi,
	  kj.nimi_en as kasvatusopillinen_jarjestelma_en,
	  kj.nimi_sv as kasvatusopillinen_jarjestelma_sv,
	  tm.nimi_fi as toimintamuoto_fi,
	  tm.nimi_en as toimintamuoto_en,
	  tm.nimi_sv as toimintamuoto_sv,
	  tl.nimi_fi as toimipaikkaluokitus_fi,
	  tl.nimi_en as toimipaikkaluokitus_en,
	  tl.nimi_sv as toimipaikkaluokitus_sv,
	  --tp.varhaiskasvatuspaikat,
	  --tp.alkamis_pvm,
	  --tp.paattymis_pvm,
	  tunti_ast.jarj_nro as tuntimaara_asteikko_jarj,
	  ikar.jarj_nro as ikaryhma_jarj,
	  tm.jarjestys as toimintamuoto_jarj,
	  jm.jarj_nro as jarjestamismuoto_jarj,
	  maksutieto_id,
	  mp.nimi_fi as maksun_peruste_fi,
	  mp.nimi_en as maksun_peruste_en,
	  mp.nimi_sv as maksun_peruste_sv,
	  ml.nimi_fi as maksun_luokka_fi,
	  ml.nimi_en as maksun_luokka_en,
	  ml.nimi_sv as maksun_luokka_sv,
	  ml.jarjestysnumero as maksun_luokka_jarjestys_nro,
	  ht.palveluseteli_arvo,
	  ht.asiakasmaksu,
	  ht.perheen_koko,
	  --ht.alkamis_pvm as maksutieto_alkamis_pvm,
	  --ht.paattymis_pvm as maksutieto_paattymis_pvm,
	  ht.cum_sum,

	  -- Field for linking data
	  cast(tp.tilastovuosi as varchar) + '_' + tp.toimipaikka_oid as tilastovuosi_oid,
	  
	  null as vaesto,

	  case when DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) > 10 then 0
	       else 1
		   END as tilastointi


	  --faktat
	  FROM [ANTERO].[dw].[f_varda_vakasuhteet_vakapaatokset] vaka

	  inner Join dw.f_varda_vakajarjestajat_toimipaikat tp on tp.toimipaikka_id = vaka.vakasuhde_toimipaikka_id and vaka.tilastovuosi = tp.tilastovuosi
	  left join dw.f_varda_huoltajatiedot ht on ht.lapsi_id = vaka.lapsi_id and vaka.tilastovuosi = ht.tilastovuosi

	  --dimensiot
	  --toimipaikat ja vakajarjestajat
	  left join dw.d_alueluokitus alue2 on alue2.id = tp.d_alueluokitus_vakajarjestaja_kunta_id
	  left join dw.d_alueluokitus alue3 on alue3.id = tp.d_alueluokitus_toimipaikka_kunta_id
	  left join dw.d_varda_kasvatusopillinenjarjestelma kj on kj.id = tp.d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
	  left join dw.d_varda_toimintamuoto tm on tm.id = tp.d_varda_toimipaikka_toimintamuoto_id
	  left join dw.d_varda_toimipaikkaluokitus tl on tl.id = tp.d_varda_toimipaikkaluokitus_id

	  --varhaiskasvatustiedot
		LEFT JOIN dw.d_varda_kielikoodistoopetushallinto kieli on vaka.d_kieli_aidinkieli = kieli.id
		LEFT JOIN dw.d_sukupuoli sukup ON vaka.d_sukupuoli = sukup.id
		LEFT JOIN dw.d_varda_jarjestamismuoto jm ON d_jarjestamismuoto_id_vakapaatos = jm.id
		left join dw.d_kytkin kytkin on kytkin.id = vaka.d_kytkin_vakapaatos_vuorohoito
		left join dw.d_varda_kytkin va_kytkin2 on va_kytkin2.id = vaka.d_varda_kytkin_vakapaatos_kokopaivainen_vaka
		left join dw.d_varda_kytkin va_kytkin3 on va_kytkin3.id = vaka.d_varda_kytkin_vakapaatos_paivittainen_vaka
		left join dw.d_kytkin kytkin4 on kytkin4.id = vaka.d_kytkin_vakapaatos_pikakasittely
		LEFT JOIN dw.d_alueluokitus alue on alue.id = vaka.d_alueluokitus_kotikunta
		LEFT JOIN dw.d_alueluokitus tp_alue on tp_alue.id = tp.d_alueluokitus_toimipaikka_kunta_id
		LEFT JOIN dw.d_varda_maksunperuste mp on mp.id = ht.d_maksun_peruste_id
		LEFT JOIN dw.d_varda_yritysluokitus as yl on yl.id = vaka.d_varda_yritysluokitus_id
		LEFT JOIN dw.d_varda_maksuluokka as ml on ml.id = ht.d_maksun_luokka_id
		LEFT JOIN dw.d_varda_ikaryhma as ikar on ikar.id = vaka.d_ikaryhma_id
		LEFT JOIN dw.d_varda_tuntimaara_asteikko as tunti_ast on tunti_ast.id = vaka.d_tuntimaara_asteikko_id

		--Filters not NULL
		where vaka.tilastovuosi = 2021

union all

select

	va.tilastointivuosi as tilastovuosi,
	null				as henkilo_id,
	al.kunta			as kotikunta_fi,
	al.kunta_en			as	kotikunta_en,
	al.kunta_sv			as	kotikunta_sv,
	al.kunta_koodi		as kotikunta_koodi,
	va.ika				as ika,
	case
		when va.ika < 3 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 1)
		when va.ika between 3 and 5 then	(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 2)
		when va.ika = 6 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 3)	
		when va.ika > 6 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 4)	
	end as ikaryhma_fi,
		case
		when va.ika < 3 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 1)
		when va.ika between 3 and 5 then	(select	kuvaus_en from dw.d_varda_ikaryhma where id = 2)
		when va.ika = 6 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 3)	
		when va.ika > 6 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 4)	
	end as ikaryhma_en,
		case
		when va.ika < 3 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 1)
		when va.ika between 3 and 5 then	(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 2)
		when va.ika = 6 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 3)	
		when va.ika > 6 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 4)	
	end as ikaryhma_sv,
	'suomi' as		aidinkieli_fi,
	'finnish' as		aidinkieli_en,
	'finska' as		aidinkieli_sv,
	1 as aidinkieli_jarj,
	case when va.sukupuoli = 1 then 'Poika'
		when va.sukupuoli = 2 then 'Tyttö'
	end as	sukupuoli_fi,
	case when va.sukupuoli = 1 then 'Male'
		when va.sukupuoli = 2 then 'Female'
	end as sukupuoli_en,
	case when va.sukupuoli = 1 then 'Man'
		when va.sukupuoli = 2 then 'Kvinna'
	end  as   sukupuoli_sv,
	'JM01' as   jarjestamismuoto_koodi,
	'Kunnan tai kuntayhtymän järjestämä' as	  jarjestamismuoto_fi,
	NULL as	  jarjestamismuoto_en,
	'Anordnas av kommunen eller samkommunen' as	  jarjestamismuoto_sv,
	'Ei' as	  vuorohoito_kytkin_fi,
	'No' as	  vuorohoito_kytkin_en,
	'Ej' as	  vuorohoito_kytkin_sv,
	'Ei' as	  kokopaivainen_vaka_kytkin_fi,
	'No' as	  kokopaivainen_vaka_kytkin_en,
	'Ej' as	  kokopaivainen_vaka_kytkin_sv,
	'Ei' as	  paivittainen_vaka_kytkin_fi,
	'No' as	  paivittainen_vaka_kytkin_en,
	'Ej' as	  paivittainen_vaka_kytkin_sv,
	'Ei' as	  pikakasittely_kytkin_fi,
	'No' as	  pikakasittely_kytkin_en,
	'Ej' as	  pikakasittely_kytkin_sv,
	null as	  tuntimaara_viikossa,
	null as	  tuntimaara_asteikko_fi,
	null as   tuntimaara_asteikko_en,
	null as   tuntimaara_asteikko_sv,
	null as	  vakasuhde_id,
	null as   lapsi_id,
	null as	  vakajarjestaja_nimi,
	'Kunta' as   yritysmuoto_fi,
	'Kunta' as   yritysmuoto_en,
	'Kommun' as	 yritysmuoto_sv,
	'Kunta' as   yritysmuoto_ryhma_fi,
	'Kunta' as   yritysmuoto_ryhma_en,
	'Kommun' as   yritysmuoto_ryhma_sv,
	'Kunta' as   yritystyyppi,
	al.kunta		as	  vakajarjestaja_kunta_fi,
	al.kunta_EN		as	  vakajarjestaja_kunta_sv,
	al.kunta_SV		as	  vakajarjestaja_kunta_en,
	null as	  toimipaikka_oid,
	al.maakunta		as	  toimipaikka_maakunta_fi,
	al.maakunta_EN	as   toimipaikka_maakunta_en,
	al.maakunta_SV	as   toimipaikka_maakunta_sv,
	al.kunta		as   toimipaikka_kunta_fi,
	al.kunta_EN		as   toimipaikka_kunta_en,
	al.kunta_SV		as   toimipaikka_kunta_sv,
	'Muu' as	  kasvatusopillinen_jarjestelma_fi,
	'Muu' as	  kasvatusopillinen_jarjestelma_en,
	'Övrig inriktning' as	  kasvatusopillinen_jarjestelma_sv,
	'Päiväkoti' as	  toimintamuoto_fi,
	'Päiväkoti' as	  toimintamuoto_en,
	'Daghem' as	  toimintamuoto_sv,
	'11-20 toimipaikkaa' as   toimipaikkaluokitus_fi,
	'11-20 toimipaikkaa' as   toimipaikkaluokitus_en,
	'11-20 toimipaikkaa' as   toimipaikkaluokitus_sv,
	-1 as	  tuntimaara_asteikko_jarj,
	case	when va.ika < 3				then (select jarj_nro from dw.d_varda_ikaryhma where id = 1)		
			when va.ika between 3 and 5	then (select jarj_nro from dw.d_varda_ikaryhma where id = 2)
			when va.ika = 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 3)
			when va.ika > 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 4)
	end as ikaryhma_jarj,
	1 as toimintamuoto_jarj,
	1 as jarjestamismuoto_jarj,
	null as maksutieto_id,
	'Maksu' as maksun_peruste_fi,
	'Maksu' as maksun_peruste_en,
	'Avgift' as maksun_peruste_sv,
	'Maksu 0 e' as maksun_luokka_fi,
	'Maksua ei peritä' as maksun_luokka_en,
	'Avgift 0 e' as maksun_luokka_sv,
	1 as maksun_luokka_jarjestys_nro,
	null as palveluseteli_arvo,
	null as asiakasmaksu,
	null as perheen_koko,
	null as cum_sum,
	null as tilastovuosi_oid,
	sum(lukumaara) as vaesto,
	0 as tilastointi


	from vipunentk.dbo.f_4_9_Vaestorakenne_kunnittain va
	LEFT JOIN vipunentk.dbo.d_alueluokitus al on al.id = va.kotikunta_id
	where va.ika < 8 and va.tilastointivuosi > 2019 and al.maakunta not like 'Ahvenanmaa%'
	group by
	va.tilastointivuosi, al.kunta, al.kunta_en, al.kunta_sv, al.maakunta, al.maakunta_en, al.maakunta_sv, al.kunta_koodi, va.ika,
	case
		when va.ika < 3 then				1
		when va.ika between 3 and 5 then	2
		when va.ika = 6 then				3
		when va.ika > 6 then				4
	end,
	case when va.sukupuoli = 1 then 'Poika'
		when va.sukupuoli = 2 then 'Tyttö'
	end,
	case when va.sukupuoli = 1 then 'Male'
		when va.sukupuoli = 2 then 'Female'
	end,
	case when va.sukupuoli = 1 then 'Man'
		when va.sukupuoli = 2 then 'Kvinna'
	end,
	case	when va.ika < 3				then  1
			when va.ika between 3 and 5	then  2
			when va.ika = 6				then  3
			when va.ika > 6				then  4
	end) a
