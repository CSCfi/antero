USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_varhaiskasvatustiedot]    Script Date: 31.3.2023 12:59:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--exec [dbo].[tarkista_kaannokset2] 'v_varda_varhaiskasvatustiedot_test'

ALTER VIEW [dw].[v_varda_varhaiskasvatustiedot] AS

 select * from (

      select vaka.tilastovuosi,

	  vaka.henkilo_id as apusarake_henkilo_id,

	  alue.kunta_fi as kotikunta_fi,
	  alue.kunta_en as kotikunta_en,
	  alue.kunta_sv as kotikunta_sv,
	  alue.kunta_koodi as koodit_kotikunta,

	  --When changing ikä check tilastointi-column as well
	  DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) AS ika,

	  ikar.ikaryhma7_fi as ikaryhma_fi,
	  ikar.ikaryhma7_en as ikaryhma_en,
	  ikar.ikaryhma7_sv as ikaryhma_sv,	  

	  --Only the following languages are wanted on the report, rest are masked
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_fi
		   else (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_fi,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_en
		   else (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_en,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_sv
		   else (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieli_sv,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = kieli.koodi)
		   else (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as jarjestys_aidinkieli,

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

	  jm.koodi as koodit_jarjestamismuoto,
	  jm.nimi_fi as jarjestamismuoto_fi,
	  jm.nimi_en as jarjestamismuoto_en,
	  jm.nimi_sv as jarjestamismuoto_sv,

	  kytkin.kytkin_fi as vuorohoito_fi,
	  kytkin.kytkin_en as vuorohoito_en,
	  kytkin.kytkin_sv as vuorohoito_sv,

	  va_kytkin2.kytkin_fi as kokopaivainen_varhaiskasvatus_fi,
	  va_kytkin2.kytkin_en as kokopaivainen_varhaiskasvatus_en,
	  va_kytkin2.kytkin_sv as kokopaivainen_varhaiskasvatus_sv,

	  va_kytkin3.kytkin_fi as paivittainen_varhaiskasvatus_fi,
	  va_kytkin3.kytkin_en as paivittainen_varhaiskasvatus_en,
	  va_kytkin3.kytkin_sv as paivittainen_varhaiskasvatus_sv,

	  kytkin4.kytkin_fi as apusarake_pikakasittely_kytkin_fi,
	  kytkin4.kytkin_en as apusarake_pikakasittely_kytkin_en,
	  kytkin4.kytkin_sv as apusarake_pikakasittely_kytkin_sv,

	  vakapaatos_tuntimaara_viikossa as apusarake_tuntimaara_viikossa,

	  tunti_ast.nimi_fi as tuntimaara_asteikko_fi,
	  tunti_ast.nimi_en as tuntimaara_asteikko_en,
	  tunti_ast.nimi_sv as tuntimaara_asteikko_sv,

	  vaka.vakasuhde_id as apusarake_vakasuhde_id,
	  vaka.lapsi_id as apusarake_lapsi_id,
	  --vakasuhde_alkamis_pvm,
	  --vakasuhde_paattymis_pvm,

	  case when yl.yritys_tyyppi = 'Yksityinen' then NULL
	       else ol.organisaatio_fi
		   end as varhaiskasvatustoimijan_nimi_fi,

	  case when yl.yritys_tyyppi = 'Yksityinen' then NULL
	       else ol.organisaatio_sv
		   end as varhaiskasvatustoimijan_nimi_sv,

	  case when yl.yritys_tyyppi = 'Yksityinen' then NULL
	       else ol.organisaatio_en 
		   end as varhaiskasvatustoimijan_nimi_en,


	  yl.nimi_fi as yritysmuoto_fi,
	  yl.nimi_en as yritysmuoto_en,
	  yl.nimi_sv as yritysmuoto_sv,

	  yl.yritysmuoto_ryhma_fi as yritysmuotoryhma_fi,
	  yl.yritysmuoto_ryhma_en as yritysmuotoryhma_en,
	  yl.yritysmuoto_ryhma_sv as yritysmuotoryhma_sv,


	  yl.yritys_tyyppi as yritystyyppi_fi,
	  case when yl.yritys_tyyppi = 'Yksityinen' then 'Privat' else 'Kommun' end as yritystyyppi_sv,
	  case when yl.yritys_tyyppi = 'Yksityinen' then 'Private' else 'Municipality' end as yritystyyppi_en,

	  alue2.kunta_fi as varhaiskasvatustoimijan_kunta_fi,
	  alue2.kunta_sv as varhaiskasvatustoimijan_kunta_sv,
	  alue2.kunta_en as varhaiskasvatustoimijan_kunta_en,

	  --tp.toimipaikka_nimi,
	  tp.toimipaikka_oid as apusarake_toimipaikka_oid,

	  tp_alue.maakunta_fi as toimipaikan_maakunta_fi,
	  tp_alue.maakunta_en as toimipaikan_maakunta_en,
	  tp_alue.maakunta_sv as toimipaikan_maakunta_sv,

	  tp_alue.kunta_fi as toimipaikan_kunta_fi,
	  tp_alue.kunta_en as toimipaikan_kunta_en,
	  tp_alue.kunta_sv as toimipaikan_kunta_sv,

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

	  tunti_ast.jarjestys as jarjestys_tuntimaara_asteikko,
	  ikar.jarjestys_ikaryhma7 as jarjestys_ikaryhma,
	  tm.jarjestys as jarjestys_toimintamuoto,
	  jm.jarj_nro as jarjestys_jarjestamismuoto,

	  maksutieto_id as apusarake_maksutieto_id,

	  coalesce(mp.nimi_fi,'Tieto puuttuu') as maksun_peruste_fi,
	  coalesce(mp.nimi_en,'Information missing') as maksun_peruste_en,
	  coalesce(mp.nimi_sv,'Information saknas') as maksun_peruste_sv,

	  ml.nimi_fi as maksun_luokka_fi,
	  ml.nimi_en as maksun_luokka_en,
	  ml.nimi_sv as maksun_luokka_sv,

	  ml.jarjestys as jarjestys_maksun_luokka,

	  case 
		when left(ml.nimi_fi, 6) in ('0-290 '/*€*/, '291-40'/*0 €*/, '401-50'/*0 €*/, 'Yli 50'/*0 €*/) 
		then 1 
		else 0 
	  end as apusarake_maksun_luokka_avausnakyma_1_0,

	  ht.palveluseteli_arvo as apusarake_palveluseteli_arvo,
	  ht.asiakasmaksu as apusarake_asiakasmaksu,

	  --apusarake? numeerinen?
	  ht.perheen_koko as perheen_koko_fi,
	  ht.perheen_koko as perheen_koko_en,
	  ht.perheen_koko as perheen_koko_sv,

	  --ht.alkamis_pvm as maksutieto_alkamis_pvm,
	  --ht.paattymis_pvm as maksutieto_paattymis_pvm,
	  ht.cum_sum as apusarake_kumulatiivinen_summa,

	  -- Field for linking data
	  cast(tp.tilastovuosi as varchar) + '_' + tp.toimipaikka_oid as apusarake_tilastovuosi_oid,
	  
	  null as apusarake_vaesto,

	  case when DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) > 10 then 0
	       else 1
		   END as apusarake_tilastointi,

	  apusarake_yritystyyppi_1_0 = case when yl.yritys_tyyppi = 'Kunta' then 1 else 0 end
	  
	  --faktat
	  FROM [ANTERO].[dw].[f_varda_vakasuhteet_vakapaatokset] vaka

	  inner Join dw.f_varda_vakajarjestajat_toimipaikat tp on tp.toimipaikka_id = vaka.vakasuhde_toimipaikka_id and vaka.tilastovuosi = tp.tilastovuosi
	  left join dw.f_varda_huoltajatiedot ht on ht.lapsi_id = vaka.lapsi_id and vaka.tilastovuosi = ht.tilastovuosi

	  --dimensiot
	  --toimipaikat ja vakajarjestajat
	  
	  left join dw.d_alueluokitus alue2 on alue2.id = tp.d_alueluokitus_vakajarjestaja_kunta_id
	  --left join dw.d_alueluokitus alue3 on alue3.id = tp.d_alueluokitus_toimipaikka_kunta_id
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
		LEFT JOIN dw.d_ika as ikar on ikar.id = vaka.d_ikaryhma_id
		LEFT JOIN dw.d_varda_tuntimaara_asteikko as tunti_ast on tunti_ast.id = vaka.d_tuntimaara_asteikko_id
		LEFT JOIN dw.d_organisaatioluokitus as ol on tp.d_organisaatioluokitus_vakajarjestaja_id = ol.id

		--Filters not NULL
		where vaka.tilastovuosi = 2021

union all

select

	va.tilastointivuosi as tilastovuosi,
	null				as henkilo_id,
	al.kunta_fi			as kotikunta_fi,
	al.kunta_en			as	kotikunta_en,
	al.kunta_sv			as	kotikunta_sv,
	al.kunta_koodi		as koodit_kotikunta,
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
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'muu kieli'
	else d.aidinkieli_versio2 end as aidinkieli_fi,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'Other languages'
	else d.aidinkieli_versio2_EN end as		aidinkieli_en,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'övrigt språk'
	else d.aidinkieli_versio2_SV end as	aidinkieli_sv,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 9 
	else d.jarjestys end as jarjestys_aidinkieli,
	case when va.sukupuoli = 1 then 'Poika'
		when va.sukupuoli = 2 then 'Tyttö'
	end as	sukupuoli_fi,
	case when va.sukupuoli = 1 then 'Male'
		when va.sukupuoli = 2 then 'Female'
	end as sukupuoli_en,
	case when va.sukupuoli = 1 then 'Man'
		when va.sukupuoli = 2 then 'Kvinna'
	end  as   sukupuoli_sv,
	'JM01' as koodit_jarjestamismuoto,
	'Kunnan tai kuntayhtymän järjestämä' as	  jarjestamismuoto_fi,
	NULL as	  jarjestamismuoto_en,
	'Anordnas av kommunen eller samkommunen' as	  jarjestamismuoto_sv,
	'Ei' as	  vuorohoito_fi,
	'No' as	  vuorohoito_en,
	'Ej' as	  vuorohoito_sv,
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
	null as	  vakajarjestaja_nimi_fi,
	null as	  vakajarjestaja_nimi_sv,
	null as	  vakajarjestaja_nimi_en,
	'Kunta' as   yritysmuoto_fi,
	'Kunta' as   yritysmuoto_en,
	'Kommun' as	 yritysmuoto_sv,
	'Kunta' as   yritysmuoto_ryhma_fi,
	'Kunta' as   yritysmuoto_ryhma_en,
	'Kommun' as   yritysmuoto_ryhma_sv,
	'Kunta' as   yritystyyppi_fi,
	'Kommun' as yritystyyppi_sv,
	'Municipality' as yritystyyppi_en,
	al.kunta_FI		as	  vakajarjestaja_kunta_fi,
	al.kunta_EN		as	  vakajarjestaja_kunta_sv,
	al.kunta_SV		as	  vakajarjestaja_kunta_en,
	null as	  toimipaikka_oid,
	al.maakunta_FI		as	  toimipaikka_maakunta_fi,
	al.maakunta_EN	as   toimipaikka_maakunta_en,
	al.maakunta_SV	as   toimipaikka_maakunta_sv,
	al.kunta_FI		as   toimipaikka_kunta_fi,
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
	-1 as jarjestys_tuntimaara_asteikko,
	case	when va.ika < 3				then (select jarj_nro from dw.d_varda_ikaryhma where id = 1)		
			when va.ika between 3 and 5	then (select jarj_nro from dw.d_varda_ikaryhma where id = 2)
			when va.ika = 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 3)
			when va.ika > 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 4)
	end as jarjestys_ikaryhma,
	1 as jarjestys_toimintamuoto,
	1 as jarjestys_jarjestamismuoto,
	null as maksutieto_id,
	'Tieto puuttuu' as maksun_peruste_fi,
	'Information missing' as maksun_peruste_en,
	'Information saknas' as maksun_peruste_sv,
	'Tieto puuttuu' as maksun_luokka_fi,
	'Information missing' as maksun_luokka_en,
	'Information saknas' as maksun_luokka_sv,
	999 as maksun_luokka_jarjestys_nro,
	null as maksun_luokka_avausnakyma_1_0,
	null as palveluseteli_arvo,
	null as asiakasmaksu,
	null as perheen_koko_fi,
	null as perheen_koko_en,
	null as perheen_koko_sv,
	null as cum_sum,
	null as tilastovuosi_oid,
	sum(lukumaara) as vaesto,
	0 as tilastointi,
	apusarake_yritystyyppi_1_0 =  1 


	from vipunentk.dbo.f_4_9_Vaestorakenne_kunnittain va
	LEFT JOIN dw.d_alueluokitus al on al.kunta_koodi = va.kotikunta
	LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio2 d on va.aidinkieli_versio2_id = d.id 
	where va.ika < 11 and va.tilastointivuosi > 2020 and al.maakunta_fi not like 'Ahvenanmaa%'
	group by
	va.tilastointivuosi, al.kunta_fi, al.kunta_en, al.kunta_sv, al.maakunta_fi, al.maakunta_en, al.maakunta_sv, al.kunta_koodi, va.ika, d.aidinkieli_versio2, d.aidinkieli_versio2_EN, d.aidinkieli_versio2_SV,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'muu kieli'
	else d.aidinkieli_versio2 end,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'Other languages'
	else d.aidinkieli_versio2_EN end,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 'övrigt språk'
	else d.aidinkieli_versio2_SV end,
	case when d.aidinkieli_versio2 not in ('suomi', 'ruotsi') then 9 
	else d.jarjestys end,
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


GO


