USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_toisen_asteen_hakijat]    Script Date: 13.11.2019 13:09:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--TÄMÄ PROSEDUURI TYHJENTÄÄ JA TÄYTTÄÄ TAULUN [sa].[sa_haku_ja_valinta_hakijat_toinen_aste]


ALTER procedure [sa].[p_lataa_sa_hakeneet_toisen_asteen_hakijat] 
@vuosi int
,@haku1_oid varchar(255) = NULL
,@haku2_oid varchar(255) = NULL
,@haku3_oid varchar(255) = NULL
,@haku4_oid varchar(255) = NULL
,@haku5_oid varchar(255) = NULL
,@haku6_oid varchar(255) = NULL AS


--aputaulut
declare @valintaLista table (teksti varchar(50))
insert into @valintaLista values ('HYVAKSYTTY') 
insert into @valintaLista values ('PERUNUT') 
insert into @valintaLista values ('VARASIJALTA_HYVAKSYTTY') 

declare @vastaanottoLista table (teksti varchar(50))
insert into @vastaanottoLista values ('VASTAANOTTANUT_SITOVASTI') 


--poistetaan ko. vuoden tiedot
delete from [sa].[sa_haku_ja_valinta_hakijat_toinen_aste] where vuosi=@vuosi


--kirjoitetaan henkilö-oidit ko. vuodelta
insert into [sa].[sa_haku_ja_valinta_hakijat_toinen_aste](oid,vuosi)
select distinct HenkiloOID
				,vuosi=@vuosi 		
from sa.sa_odw_hakeneet sa
left join ANTERO.dw.d_haku d on d.haku_oid=sa.HakuOid
where korkeakouluhaku=0 and HakuOid in (@haku1_oid,@haku2_oid,@haku3_oid,@haku4_oid,@haku5_oid,@haku6_oid)


--Haut per henkilö-oid
update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set haut=(case 
			when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid=@haku1_oid or h.HakuOid=@haku2_oid))
				then case 
						  when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid =@haku3_oid or h.HakuOid=@haku4_oid)) then 'Hakenut vain valmaan'
						  when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid =@haku5_oid or h.HakuOid=@haku6_oid)) then 'Hakenut vain erityisopetukseen'
						  else 'Hakenut erityisopetukseen ja valmaan'
					  end
			else case 
					  when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid =@haku3_oid or h.HakuOid=@haku4_oid))
						   then case 
									 when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid =@haku5_oid or h.HakuOid=@haku6_oid)) then 'Hakenut vain amm/lukioon'
							         else 'Hakenut amm/lukioon ja valmaan'
								 end
					  else case when not exists (select HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and (h.HakuOid =@haku5_oid or h.HakuOid=@haku6_oid)) then 'Hakenut amm/lukioon ja erityisopetukseen'
								else 'Hakenut kaikissa kolmessa haussa'
						   end
				 end
			
		end)
where vuosi=@vuosi

--Valinnat per henkilö-oid
update sa.sa_haku_ja_valinta_hakijat_toinen_aste 
set valinnat= (case 
			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu amm/lukioon'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu erityisopetukseen'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu valmaan'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu amm/lukioon ja erityisopetukseen'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu amm/lukioon ja valmaan'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu erityisopetukseen ja valmaan'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.ValinnanTila in (SELECT teksti FROM @valintaLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Valittu kaikkiin kolmeen'

			else 'Ei valittu'
		end)
where vuosi=@vuosi


--Vastaanotto per henkilö-oid
update sa.sa_haku_ja_valinta_hakijat_toinen_aste 
set vastaanotto= (case 
			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut amm/lukioon'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut erityisopetukseen'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut valmaan'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut amm/lukioon ja erityisopetukseen'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut amm/lukioon ja valmaan'

			when ( not exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut erityisopetukseen ja valmaan'

			when ( exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku2_oid or h.HakuOid = @haku1_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku3_oid or h.HakuOid = @haku4_oid))
					and exists (select distinct HakuOid from sa.sa_odw_hakeneet h where h.HenkiloOID=oid and h.VastaanotonTila in (SELECT teksti FROM @vastaanottoLista) and (h.HakuOid = @haku5_oid or h.HakuOid = @haku6_oid)) ) then 'Vastaanottanut kaikkiin kolmeen'

			else 
				case 
					when valinnat <> 'Ei valittu' then 'Valittiin mutta ei vastaanottanut'
					else 'Ei valittu'
				 end
		end)
--from sa.sa_haku_ja_valinta_hakijat_toinen_aste f 
where vuosi=@vuosi



update sa.sa_haku_ja_valinta_hakijat_toinen_aste 
set haut_jarjestys=(case haut
						when 'Hakenut vain amm/lukioon' then 1
						when 'Hakenut vain erityisopetukseen' then 2
						when 'Hakenut vain valmaan' then 3
						when 'Hakenut amm/lukioon ja erityisopetukseen' then 4
						when 'Hakenut amm/lukioon ja valmaan' then 5
						when 'Hakenut erityisopetukseen ja valmaan' then 6
						when 'Hakenut kaikissa kolmessa haussa' then 7
						else '99'
					end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste 
set valinnat_jarjestys=(case valinnat
						when 'Valittu amm/lukioon' then 1
						when 'Valittu erityisopetukseen' then 2
						when 'Valittu valmaan' then 3
						when 'Valittu amm/lukioon ja erityisopetukseen' then 4
						when 'Valittu amm/lukioon ja valmaan' then 5
						when 'Valittu erityisopetukseen ja valmaan' then 6
						when 'Valittu kaikkiin kolmeen' then 7
						when 'Ei valittu' then 8
						else '99'
					end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste 
set vastaanotto_jarjestys=(case vastaanotto
						when 'Vastaanottanut amm/lukioon' then 1
						when 'Vastaanottanut erityisopetukseen' then 2
						when 'Vastaanottanut valmaan' then 3
						when 'Vastaanottanut amm/lukioon ja erityisopetukseen' then 4
						when 'Vastaanottanut amm/lukioon ja valmaan' then 5
						when 'Vastaanottanut erityisopetukseen ja valmaan' then 6
						when 'Vastaanottanut kaikkiin kolmeen' then 7
						when 'Valittiin mutta ei vastaanottanut' then 8
						when 'Ei valittu' then 9
						else '99'
					end)
where vuosi=@vuosi


/* Tekstikenttien päivitys */

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set haut=(case haut_jarjestys
			when 1 then 'Haki vain ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa'
			when 2 then 'Haki vain erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 3 then 'Haki vain perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 4 then 'Haki ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 5 then 'Haki ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 6 then 'Haki erityisopetuksena järjestettävän ammatillisen koulutuksen haussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 7 then 'Haki kaikissa kolmessa haussa'
			else 'Tuntematon'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set haut_SV=(case haut_jarjestys
			when 1 then 'Ansökte endast till yrkes-/gymnasieutbildning' 
			when 2 then 'Ansökte endast till specialundervisning'
			when 3 then 'Ansökte endast till förberedande utbildning'
			when 4 then 'Ansökte till yrkes-/gymnasieutbildning och specialundervisning'
			when 5 then 'Ansökte till yrkes-/gymnasieutbildning och förberedande utbildning'
			when 6 then 'Ansökte till specialundervisning och förberedande utbildning'
			when 7 then 'Ansökte till alla tre utbildningar'
			else 'Information saknas'
		end)

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set haut_EN=(case haut_jarjestys
			when 1 then 'Applied only for vocational or general upper secondary education'
			when 2 then 'Applied only for vocational special needs education and training'
			when 3 then 'Applied only for preparatory training'
			when 4 then 'Applied for vocational or general upper secondary education and vocational special needs education and training'
			when 5 then 'Applied for vocational or general upper secondary education and preparatory training'
			when 6 then 'Applied for vocational special needs education and training and preparatory training'
			when 7 then 'Applied for all three'
			else 'Missing data'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set valinnat=(case valinnat_jarjestys
			when 1 then 'Valittiin ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa'
			when 2 then 'Valittiin erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 3 then 'Valittiin perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 4 then 'Valittiin ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 5 then 'Valittiin ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 6 then 'Valittiin erityisopetuksena järjestettävän ammatillisen koulutuksen haussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 7 then 'Valittiin kaikissa kolmessa haussa'
			when 8 then 'Ei valittu'
			else 'Tuntematon'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set valinnat_SV=(case valinnat_jarjestys
			when 1 then 'Blev antagen till yrkes-/gymnasieutbildning' -- vid vårens gemensamma ansökan
			when 2 then 'Blev antagen till specialundervisning'
			when 3 then 'Blev antagen till förberedande utbildning'
			when 4 then 'Blev antagen till yrkes-/gymnasieutbildning och specialundervisning'
			when 5 then 'Blev antagen till yrkes-/gymnasieutbildning och förberedande utbildning'
			when 6 then 'Blev antagen till specialundervisning och förberedande utbildning'
			when 7 then 'Blev antagen till alla tre utbildningar' --vid alla tre ansökningar
			when 8 then 'Blev inte antagen'
			else 'Information saknas'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set valinnat_EN=(case valinnat_jarjestys
			when 1 then 'Was selected to vocational or general upper secondary education'
			when 2 then 'Was selected to vocational special needs education and training'
			when 3 then 'Was selected to preparatory training'
			when 4 then 'Was selected to vocational or general upper secondary education and vocational special needs education and training'
			when 5 then 'Was selected to vocational or general upper secondary education and preparatory training'
			when 6 then 'Was selected to vocational special needs education and training and preparatory training'
			when 7 then 'Was selected to all three'
			when 8 then 'Was not selected'
			else 'Missing data'
		end)
where vuosi=@vuosi


update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set vastaanotto=(case vastaanotto_jarjestys
			when 1 then 'Vastaanotti paikan ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa'
			when 2 then 'Vastaanotti paikan erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 3 then 'Vastaanotti paikan perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 4 then 'Vastaanotti paikan ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja erityisopetuksena järjestettävän ammatillisen koulutuksen haussa'
			when 5 then 'Vastaanotti paikan ammatillisen koulutuksen ja lukiokoulutuksen kevään yhteishaussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 6 then 'Vastaanotti paikan erityisopetuksena järjestettävän ammatillisen koulutuksen haussa ja perusopetuksen jälkeisen valmistavan koulutuksen haussa'
			when 7 then 'Vastaanotti paikan kaikissa kolmessa haussa'
			when 8 then 'Valittiin mutta ei vastaanottanut'
			when 9 then 'Ei valittu'
			else 'Tuntematon'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set vastaanotto_SV=(case vastaanotto_jarjestys
			when 1 then 'Tog emot plats i yrkes-/gymnasieutbildning antagningen' --vid yrkes-/gymnasieutbildning ansökan
			when 2 then 'Tog emot plats i specialundervisning antagningen'
			when 3 then 'Tog emot plats i förberedande utbildning antagningen'
			when 4 then 'Tog emot plats i yrkes-/gymnasieutbildning och specialundervisning antagningen'
			when 5 then 'Tog emot plats i yrkes-/gymnasieutbildning och förberedande utbildning antagningen'
			when 6 then 'Tog emot plats i specialundervisning och förberedande utbildning antagningen'
			when 7 then 'Tog emot plats i alla tre ansökningar antagningen'
			when 8 then 'Blev antagen men tog inte emot platsen'
			when 9 then 'Blev inte antagen'
		end)
where vuosi=@vuosi

update sa.sa_haku_ja_valinta_hakijat_toinen_aste
set vastaanotto_EN=(case vastaanotto_jarjestys
			when 1 then 'Accepted a place for vocational or general upper secondary education'
			when 2 then 'Accepted a place for vocational special needs education and training'
			when 3 then 'Accepted a place for preparatory training'
			when 4 then 'Accepted a place for vocational or general upper secondary education and vocational special needs education and training'
			when 5 then 'Accepted a place for vocational or general upper secondary education and preparatory training'
			when 6 then 'Accepted a place for vocational special needs education and training and preparatory training'
			when 7 then 'Accepted a place for all three'
			when 8 then 'Was selected but did not accept a place'
			when 9 then 'Was not selected'
			else 'Missing data'
		end)
where vuosi=@vuosi