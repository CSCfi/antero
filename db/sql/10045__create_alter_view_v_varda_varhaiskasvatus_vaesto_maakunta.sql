USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_varhaiskasvatus_vaesto_maakunta]    Script Date: 19.8.2024 12:45:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

















CREATE OR ALTER VIEW [dw].[v_varda_varhaiskasvatus_vaesto_maakunta] AS

 select * from (
 
	 select

		  vaka.tilastovuosi,
	  
		  vaka.henkilo_id as apusarake_henkilo_id,

		  alue.maakunta_fi as maakunta_fi,
		  alue.maakunta_en as maakunta_en,
		  alue.maakunta_sv as maakunta_sv,
		  alue.maakunta_koodi as koodit_maakunta,

		  --When changing ikä check tilastointi-column as well
		  DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) AS ika,

		  ikar.ikaryhma7_fi as ikaryhma_fi,
		  ikar.ikaryhma7_en as ikaryhma_en,
		  ikar.ikaryhma7_sv as ikaryhma_sv,	  

		  case when kieli.nimi_fi is null then 'tuntematon'
		  else kieli.nimi_fi
		  end as aidinkieli_fi,	 
		  
		  case when kieli.nimi_sv is null then 'okänt'
		  else kieli.nimi_sv
		  end as aidinkieli_sv,	
		  
		  case when kieli.nimi_en is null then 'Unknown'
		  else kieli.nimi_en
		  end as aidinkieli_en,	 
		  
	--	  kieli.nimi_fi as aidinkieli_fi,
	--	  kieli.nimi_sv as aidinkieli_sv,
	--	  kieli.nimi_en as aidinkieli_en,
		  kieli.id as jarjestys_aidinkieli,

		  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_fi
		   else (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_fi,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_en
		   else (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_en,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then kieli.nimi_sv
		   else (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_sv,
	  case when kieli.koodi in ('SEIN','SEPO','SEKO','SE') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when kieli.koodi in ('FI','SV') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = kieli.koodi)
		   else (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as jarjestys_aidinkieliryhma,

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

		  vaka.vakasuhde_id as apusarake_vakasuhde_id,
		  vaka.lapsi_id as apusarake_lapsi_id,

		  tp_alue.maakunta_fi as toimipaikan_maakunta_fi,
		  tp_alue.maakunta_en as toimipaikan_maakunta_en,
	      tp_alue.maakunta_sv as toimipaikan_maakunta_sv,

		  kj.nimi_fi as kasvatusopillinen_jarjestelma_fi,
		  kj.nimi_en as kasvatusopillinen_jarjestelma_en,
		  kj.nimi_sv as kasvatusopillinen_jarjestelma_sv,

		  tm.nimi_fi as toimintamuoto_fi,
		  tm.nimi_en as toimintamuoto_en,
		  tm.nimi_sv as toimintamuoto_sv,

		  tl.nimi_fi as toimipaikkaluokitus_fi,
		  tl.nimi_en as toimipaikkaluokitus_en,
		  tl.nimi_sv as toimipaikkaluokitus_sv,

		  yl.yritys_tyyppi as yritystyyppi_fi,
		  case when yl.yritys_tyyppi = 'Yksityinen' then 'Privat' else 'Kommun' end as yritystyyppi_sv,
		  case when yl.yritys_tyyppi = 'Yksityinen' then 'Private' else 'Municipality' end as yritystyyppi_en,

		  
		  ikar.jarjestys_ikaryhma7 as jarjestys_ikaryhma,
		  tm.jarjestys as jarjestys_toimintamuoto,
		  jm.jarj_nro as jarjestys_jarjestamismuoto,

		  -- Field for linking data
		  cast(tp.tilastovuosi as varchar) + '_' + tp.toimipaikka_oid as apusarake_tilastovuosi_oid,
	  
		  null as apusarake_vaesto,

		  case when DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) > 10 then 0
			   else 1
			   END as apusarake_tilastointi,

		  apusarake_yritystyyppi_1_0 = case when yl.yritys_tyyppi = 'Kunta' then 1 else 0 end,

		  case when vaka.tilastovuosi = 2021 then 0 else 1 end as apusarake_vuosi

	  
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
			LEFT JOIN dw.d_varda_jarjestamismuoto jm ON d_jarjestamismuoto_id_vakapaatos = jm.id
			left join dw.d_kytkin kytkin on kytkin.id = vaka.d_kytkin_vakapaatos_vuorohoito
			left join dw.d_varda_kytkin va_kytkin2 on va_kytkin2.id = vaka.d_varda_kytkin_vakapaatos_kokopaivainen_vaka
			left join dw.d_varda_kytkin va_kytkin3 on va_kytkin3.id = vaka.d_varda_kytkin_vakapaatos_paivittainen_vaka
			left join dw.d_kytkin kytkin4 on kytkin4.id = vaka.d_kytkin_vakapaatos_pikakasittely
			LEFT JOIN dw.d_alueluokitus alue on alue.id = vaka.d_alueluokitus_kotikunta
			LEFT JOIN dw.d_alueluokitus tp_alue on tp_alue.id = tp.d_alueluokitus_toimipaikka_kunta_id
			LEFT JOIN dw.d_varda_yritysluokitus as yl on yl.id = vaka.d_varda_yritysluokitus_id
			LEFT JOIN dw.d_ika as ikar on ikar.id = vaka.d_ikaryhma_id
			LEFT JOIN dw.d_organisaatioluokitus as ol on tp.d_organisaatioluokitus_vakajarjestaja_id = ol.id

			--Filters not NULL
			where vaka.tilastovuosi between 2021 and 2023

union all

	select

		va.tilastovuosi as tilastovuosi,
		null				as henkilo_id,
		al.maakunta_fi			as maakunta_fi, --(select top 1 maakunta_fi from .. where .. ) as ..
		al.maakunta_en			as	maakunta_en,
		al.maakunta_sv			as	maakunta_sv,
		al.maakunta_koodi		as koodit_maakunta,
		va.ika1v_avain				as ika,
		case
			when va.ika1v_avain < 3 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 1)
			when va.ika1v_avain between 3 and 5 then	(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 2)
			when va.ika1v_avain = 6 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 3)	
			when va.ika1v_avain > 6 then				(select	kuvaus_fi from dw.d_varda_ikaryhma where id = 4)	
		end as ikaryhma_fi,
			case
			when va.ika1v_avain < 3 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 1)
			when va.ika1v_avain between 3 and 5 then	(select	kuvaus_en from dw.d_varda_ikaryhma where id = 2)
			when va.ika1v_avain = 6 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 3)	
			when va.ika1v_avain > 6 then				(select	kuvaus_en from dw.d_varda_ikaryhma where id = 4)	
		end as ikaryhma_en,
			case
			when va.ika1v_avain < 3 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 1)
			when va.ika1v_avain between 3 and 5 then	(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 2)
			when va.ika1v_avain = 6 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 3)	
			when va.ika1v_avain > 6 then				(select	kuvaus_sv from dw.d_varda_ikaryhma where id = 4)	
		end as ikaryhma_sv,
		
		d0.nimi_fi as aidinkieli_fi,
		  d0.nimi_sv as aidinkieli_sv,
		  d0.nimi_en as aidinkieli_en,
		  d0.id as jarjestys_aidinkieli,

	  case when d0.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when d0.koodi in ('FI','SV') then d0.nimi_fi
		   else (select nimi_fi from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_fi,
	  case when d0.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when d0.koodi in ('FI','SV') then d0.nimi_en
		   else (select nimi_en from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_en,
	  case when d0.koodi in ('SEIN','SEPO','SEKO','SE') then (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when d0.koodi in ('FI','SV') then d0.nimi_sv
		   else (select nimi_sv from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as aidinkieliryhma_sv,
	  case when d0.koodi in ('SEIN','SEPO','SEKO','SE') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'se')
		   when d0.koodi in ('FI','SV') then (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = d0.koodi)
		   else (select jarj_nro from dw.d_varda_kielikoodistoopetushallinto where koodi = 'XX')
		   end as jarjestys_aidinkieliryhma,
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
		null as	  vakasuhde_id,
		null as   lapsi_id,
		al.maakunta_FI		as	  toimipaikka_maakunta_fi,
		al.maakunta_EN	as   toimipaikka_maakunta_en,
		al.maakunta_SV	as   toimipaikka_maakunta_sv,
		'Muu' as	  kasvatusopillinen_jarjestelma_fi,
		'Muu' as	  kasvatusopillinen_jarjestelma_en,
		'Övrig inriktning' as	  kasvatusopillinen_jarjestelma_sv,
		'Päiväkoti' as	  toimintamuoto_fi,
		'Päiväkoti' as	  toimintamuoto_en,
		'Daghem' as	  toimintamuoto_sv,
		'11-20 toimipaikkaa' as   toimipaikkaluokitus_fi,
		'11-20 toimipaikkaa' as   toimipaikkaluokitus_en,
		'11-20 toimipaikkaa' as   toimipaikkaluokitus_sv,
		'Kunta' as   yritystyyppi_fi,
		'Kommun' as yritystyyppi_sv,
		'Municipality' as yritystyyppi_en,
		case	when va.ika1v_avain < 3				then (select jarj_nro from dw.d_varda_ikaryhma where id = 1)		
				when va.ika1v_avain between 3 and 5	then (select jarj_nro from dw.d_varda_ikaryhma where id = 2)
				when va.ika1v_avain = 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 3)
				when va.ika1v_avain > 6				then (select jarj_nro from dw.d_varda_ikaryhma where id = 4)
		end as jarjestys_ikaryhma,
		1 as jarjestys_toimintamuoto,
		1 as jarjestys_jarjestamismuoto,
		null as tilastovuosi_oid,
		sum(henkiloiden_lkm) as vaesto,
		0 as tilastointi,
		apusarake_yritystyyppi_1_0 =  1,
		case when va.tilastovuosi = 2021 then 0 else 1 end as apusarake_vuosi

		--select distinct aidinkieli_versio3_koodi
		from vipunentk.dbo.f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain va
		OUTER APPLY (select top 1 * from dw.d_alueluokitus al where al.maakunta_koodi = right(va.asuinmaakunta_avain, 2)) al
		--LEFT JOIN VipunenTK.dbo.d_kieli d0 on va.aidinkieli_id = d0.id
		LEFT JOIN dw.d_varda_kielikoodistoopetushallinto d0 on va.aidinkieli_versio3_koodi = d0.koodi
		--LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio3 d on va.aidinkieli_versio3_koodi = d.aidinkieli_versio3_koodi 
		where va.ika1v_avain < 11 and va.tilastovuosi > 2020 and al.maakunta_fi not like 'Ahvenanmaa%'
		group by
		va.tilastovuosi, al.maakunta_fi, al.maakunta_en, al.maakunta_sv, al.maakunta_koodi, va.ika1v_avain,
		d0.nimi_fi,
		d0.nimi_sv,
		d0.nimi_en,
		d0.id,
		d0.koodi,
		case
			when va.ika1v_avain < 3 then				1
			when va.ika1v_avain between 3 and 5 then	2
			when va.ika1v_avain = 6 then				3
			when va.ika1v_avain > 6 then				4
		end
) a





GO


