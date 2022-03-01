USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_vakajarjestajat_toimipaikat]    Script Date: 1.3.2022 11.06.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE or alter VIEW [dw].[v_varda_vakajarjestajat_toimipaikat] AS

        select tp.tilastovuosi,
		case when tp.toimipaikka_oid = '""' then null else tp.toimipaikka_oid end as toimipaikka_oid,
		tp.vakajarjestaja_id,
		case when yl.yritys_tyyppi = 'Yksityinen' then NULL
		     else tp.vakajarjestaja_nimi
			 end as organisaatio_fi,
		case when yl.yritys_tyyppi = 'Yksityinen' then NULL
		     else tp.vakajarjestaja_nimi
			 end as organisaatio_en,
				case when yl.yritys_tyyppi = 'Yksityinen' then NULL
		     else tp.vakajarjestaja_nimi
			 end as organisaatio_sv,
	  yl.yritys_tyyppi as yritystyyppi,
	  yl.id as yritystyyppi_id,
	  ym.nimi_fi as yritysmuoto_fi,
	  ym.nimi_en as yritysmuoto_en,
	  ym.nimi_sv as yritysmuoto_sv,
	  alue3.kunta_fi as kotikunta_fi,
	  alue3.kunta_en as kotikunta_en,
	  alue3.kunta_sv as kotikunta_sv,
	  alue3.maakunta_fi as maakunta_fi,
	  alue3.maakunta_en as maakunta_en,
	  alue3.maakunta_sv as maakunta_sv,
	  alue3.kunta_koodi as kotikunta_koodi,

	  alue2.kunta_fi as vakajarjestaja_kunta_fi,
	  alue2.kunta_sv as vakajarjestaja_kunta_sv,
	  alue2.kunta_en as vakajarjestaja_kunta_en,
	  alue2.maakunta_fi as vakajarjestaja_maakunta_fi,
	  alue2.maakunta_en as vakajarjestaja_maakunta_en,
	  alue2.maakunta_sv as vakajarjestaja_maakunta_sv,
	  yl.nimi_fi as yritysluokitus_fi,
	  yl.nimi_en as yritysluokitus_en,
	  yl.nimi_sv as yritysluokitus_sv,
	  yl.yritysmuoto_ryhma_fi,
	  yl.yritysmuoto_ryhma_en,
	  yl.yritysmuoto_ryhma_sv,
	  kj.nimi_fi as kasvatusopillinen_jarjestelma_fi,
	  kj.nimi_en as kasvatusopillinen_jarjestelma_en,
	  kj.nimi_sv as kasvatusopillinen_jarjestelma_sv,
	  tm.nimi_fi as toimintamuoto_fi,
	  tm.nimi_en as toimintamuoto_en,
	  tm.nimi_sv as toimintamuoto_sv,	 
	  tl.nimi_fi as toimipaikka_luokittelu_fi,
	  tl.nimi_en as toimipaikka_luokittelu_en,
	  tl.nimi_sv as toimipaikka_luokittelu_sv,
	  tp.varhaiskasvatuspaikat,
	  vpl.nimi_fi as varhaiskasvatuspaikat_luokittelu_fi,
	  vpl.nimi_en as varhaiskasvatuspaikat_luokittelu_en,
	  vpl.nimi_sv as varhaiskasvatuspaikat_luokittelu_sv,
	  vpl.jarj_nro  as varhaiskasvatuspaikat_luokittelu_jarj,
	  tm.jarjestys as toimintamuoto_jarj, 
	  case when tp.toimipaikka_oid = '""' then null else CONCAT(tp.tilastovuosi, '_', tp.toimipaikka_oid) end as tilastovuosi_toimipaikkaoid,
	  c2.lapsia as lapsia,
	  CONCAT(tp.tilastovuosi,tp.toimipaikka_id) as tilastovuosi_toimipaikkaID

	  --faktat 
	  FROM ANTERO.dw.f_varda_vakajarjestajat_toimipaikat tp
												
	  --dimensiot
	  --toimipaikat ja vakajarjestajat
	  left join dw.d_alueluokitus alue2 on alue2.kunta_koodi = d_alueluokitus_vakajarjestaja_kunta_id
	  left join dw.d_alueluokitus alue3 on alue3.id = tp.d_alueluokitus_toimipaikka_kunta_id
	  left join dw.d_varda_kasvatusopillinenjarjestelma kj on kj.id = tp.d_varda_toimipaikka_kasvatusopillinen_jarjestelma_id
	  left join dw.d_varda_toimintamuoto tm on tm.id = tp.d_varda_toimipaikka_toimintamuoto_id
		--LEFT JOIN dw.d_varda_jarjestamismuoto jm ON tp. = jm.id
	  left join dw.d_varda_yritysluokitus yl on yl.id = tp.d_varda_yritysluokitus_id
	  left join dw.d_yritysmuoto ym on ym.id = tp.d_yritysmuoto_id
	  left join dw.d_varda_toimipaikkaluokitus tl on tl.id = tp.d_varda_toimipaikkaluokitus_id
	  left join dw.d_varda_varhaiskasvatuspaikkaluokitus vpl on vpl.id = tp.d_varda_varhaiskasvatuspaikkaluokitus_id

		-- Lasten lkm toiseen tauluun
	  left join
			(select tilastovuosi, vakasuhde_toimipaikka_id, count(distinct henkilo_id) as lapsia
			from dw.f_varda_vakasuhteet_vakapaatokset
			group by tilastovuosi, vakasuhde_toimipaikka_id) c2
			on tp.tilastovuosi=c2.tilastovuosi and tp.toimipaikka_id=c2.vakasuhde_toimipaikka_id

	   where tp.tilastovuosi = 2021
