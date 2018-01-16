USE [ANTERO]
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_yo_kv_ranking]'))
EXEC dbo.sp_executesql @statement = N'

create view dw.v_yo_kv_ranking as




/************* OPISKELIJAT ***************/

Select

--- Luokittelevat ---

 tilastointivuosi
,case 
	when d1.oppilaitos='Tampereen tekn. yliopisto' then 'Tampereen teknillinen yliopisto'
	when d1.oppilaitos='Lappeenrannan tekn. yliopisto' then 'Lappeenrannan teknillinen yliopisto'
	else d1.oppilaitos
	end as Yliopisto
,d5.sukupuoli
,d6.kansalaisuus_versio2
,d7.opiskelijan_olo as ''Opiskelijan olo syys''
,d8.opiskelijan_olo_tamm as ''Opiskelijan olo tammi''
,d9.opiskelijan_fte_tieto
,d2.koulutus
,d2.koulutus_koodi
,d2.koulutusala2002
,d2.koulutusala2002_koodi
,d2.Koulutusaste_taso2
,d2.Koulutusaste_taso2_koodi
,d2.OKM_ohjauksen_ala
,d2.OKM_ohjauksen_ala_koodi
,d3.koulutustyyppi
,d4.koulutussektori
,null as ''henkilön nimike''
,null as ''koodi henkiilön nimikekoodi''
,null as ''Tutkijanuravaihe''
,null as ''Tehtävänjaottelu''
,null as ''Tiedekunta''
,null as ''Tieteenala''
,null as ''Paatieteenala''

--- lkm muuttujat---

,opiskelijat as ''Opiskelijat lkm''
,opiskelijat_fte
,opiskelijat_lasna
,null as ''tutkinnot''
,null as ''THE AS''
,null as ''THE RS''
,null as ''QS FS''
,null as ''institutional income''
,null as ''research income''
,null as ''research income industry commerce''
from VipunenTK.dbo.f_OTV_2_8_Korkeakouluopiskelijat as f
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on f.oppilaitos_id=d1.id
left join vipunentk.dbo.d_koulutusluokitus as d2 on f.koulutusluokitus_id=d2.id
left join vipunenTK.dbo.d_koulutustyyppi as d3 on f.koulutustyyppi_id=d3.id
left join VipunenTK.dbo.d_koulutussektori as d4 on f.koulutussektori_id=d4.id
left join VipunenTK.dbo.d_sukupuoli as d5 on f.sukupuoli_id=d5.id
left join VipunenTK.dbo.d_kansalaisuus_versio2 as d6 on f.kansalaisuus_versio2_id=d6.id
left join VipunenTK.dbo.d_opiskelijan_olo as d7 on f.opiskelijan_olo_syys_id=d7.id
left join vipunentk.dbo.d_opiskelijan_olo_tamm as d8 on f.opiskelijan_olo_tamm_id=d8.id
left join VipunenTK.dbo.d_opiskelijan_fte_tieto as d9 on f.opiskelijan_fte_tieto_id=d9.id
left join VipunenTK.dbo.d_tutkinto_yo as d10 on f.tutkinto_yo_id=d10.id
where d4.koulutussektori=''Yliopistokoulutus''

UNION ALL

/************* TUTKINNOT ***************/

select

---Luokittelevat---

f.tilastointivuosi
,case 
	when d1.oppilaitos='Tampereen tekn. yliopisto' then 'Tampereen teknillinen yliopisto'
	when d1.oppilaitos='Lappeenrannan tekn. yliopisto' then 'Lappeenrannan teknillinen yliopisto'
	else d1.oppilaitos
	end as Yliopisto
,d5.sukupuoli
,d6.kansalaisuus_versio2
,null --Opiskelijan olo syys
,null --opiskelijan olo tammi
,null --opiskelijan fte tieto
,d2.koulutus
,d2.koulutus_koodi
,d2.koulutusala2002
,d2.koulutusala2002_koodi
,d2.Koulutusaste_taso2
,d2.Koulutusaste_taso2_koodi
,d2.OKM_ohjauksen_ala
,d2.OKM_ohjauksen_ala_koodi
,d3.koulutustyyppi
,d4.koulutussektori
,null --d4.selite_fi henkilön nimike
,null --d4.koodi henkiilön nimikekoodi
,null -- as ''Tutkijanuravaihe''
,null -- as ''Tehtävänjaottelu''
,null -- as ''Tiedekunta''
,null -- as ''Tieteenala''
,null -- as ''Paatieteenala''

--- lkm muuttujat ---

,null --opiskelijat lkm
,null --opiskelijat fte
,null --opiskelijat lasna
,tutkinnot
,null --THE AS
,null --THE RS
,null --QS FS
,null --institutional income
,null --research income
,null --research income industry commerce
from vipunenTK.dbo.f_OTV_2_9_Korkeakoulututkinnot as f
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot as d1 on f.oppilaitos_id=d1.id
left join vipunentk.dbo.d_koulutusluokitus as d2 on f.koulutusluokitus_id=d2.id
left join vipunenTK.dbo.d_koulutustyyppi as d3 on f.koulutustyyppi_id=d3.id
left join VipunenTK.dbo.d_koulutussektori as d4 on f.koulutussektori_id=d4.id
left join VipunenTK.dbo.d_sukupuoli as d5 on f.sukupuoli_id=d5.id
left join VipunenTK.dbo.d_kansalaisuus_versio2 as d6 on f.kansalaisuus_versio2_id=d6.id
left join VipunenTK.dbo.d_tutkinto_yo as d10 on f.tutkinto_yo_id=d10.id
where d4.koulutussektori=''Yliopistokoulutus''

union all

/************* HENKILÖSTÖ ***************/


select

---Luokittelevat---

f.vuosi
,d1.yo_nimi_fi as Oppilaitos
,d2.sukupuoli_fi
,case when d3.maatjavaltiot2_fi in (''Suomi'',''Ahvenanmaa'') then ''Suomi'' else d3.maanosa_fi end as Kansalaisuus
,null --Opiskelijan olo syys
,null --opiskelijan olo tammi
,null --opiskelijan fte tieto
,null --d2.koulutus
,null --d2.koulutus_koodi
,null --d2.koulutusala2002
,null --d2.koulutusala2002_koodi
,null --d2.Koulutusaste_taso2
,null --d2.Koulutusaste_taso2_koodi
,null --d2.OKM_ohjauksen_ala
,null --d2.OKM_ohjauksen_ala_koodi
,null --d3.koulutustyyppi
,null --d4.koulutussektori
,d4.selite_fi as ''Henkilon nimike''
,d4.koodi as ''Henkilon nimikekoodi''
,d5.selite_fi as ''Tutkijanuravaihe''
,d6.selite_fi as ''Tehtävänjaottelu''
,d7.tiedekunta as ''Tiedekunta''
,d8.tieteenala_nimi_fi as ''Tieteenala''
,d8.paatieteenala_nimi_fi as ''Paatieteenala''

--- lkm muuttujat ---

,null --opiskelijat lkm
,null --opiskelijat fte
,null --opiskelijat lasna
,null --tutkinnot
,case (select am.Kansallinen from sa.sa_ammattinimikkeet_the_qs as am where am.Ammattinumero=d4.koodi AND am.Kansallinen=''AS'') when ''AS'' then f.henkilotyovuosi end as ''THE AS''
,case (select am.Kansallinen from sa.sa_ammattinimikkeet_the_qs as am where am.Ammattinumero=d4.koodi AND am.Kansallinen=''RS'') when ''RS'' then f.henkilotyovuosi end as ''THE RS''
,case (select am.Kansallinen from sa.sa_ammattinimikkeet_the_qs as am where am.Ammattinumero=d4.koodi AND am.Kansallinen=''FS'') when ''FS'' then f.henkilotyovuosi end as ''QS FS''
,null --institutional income
,null --research income
,null --research income industry commerce

from ANTERO.dw.f_yo_henkilon_tyo as f
left join antero.dw.d_yo as d1 on f.d_yliopisto_id=d1.id
left join antero.dw.d_sukupuoli as d2 on f.d_sukupuoli_id=d2.id
left join antero.dw.d_maatjavaltiot2 d3 on f.d_kansalaisuus_id=d3.id
left join antero.dw.d_ek_nimike d4 on f.d_nimike_id=d4.id
left join antero.dw.d_yo_tutkijanuravaihe d5 on f.d_tutkijanuravaihe_id=d5.id
left join antero.dw.d_yo_tehtavanjaottelu d6 on f.d_tehtavanjaottelu_id=d6.id
left join antero.dw.d_yo_tiedekunta d7 on f.d_tiedekunta_id=d7.id
left join antero.dw.d_tieteenala d8 on f.d_tieteenala_id=d8.id
where d4.koodi in (select am.Ammattinumero from sa.sa_ammattinimikkeet_the_qs as am)

UNION ALL

/************* TALOUS ***************/

select

---Luokittelevat---

f.tilikausi
,d1.yo_nimi_fi as Oppilaitos
,null -- as d2.sukupuoli_fi
,null-- as Kansalaisuus
,null --Opiskelijan olo syys
,null --opiskelijan olo tammi
,null --opiskelijan fte tieto
,null --d2.koulutus
,null --d2.koulutus_koodi
,null --d2.koulutusala2002
,null --d2.koulutusala2002_koodi
,null --d2.Koulutusaste_taso2
,null --d2.Koulutusaste_taso2_koodi
,null --d2.OKM_ohjauksen_ala
,null --d2.OKM_ohjauksen_ala_koodi
,null --d3.koulutustyyppi
,null --d4.koulutussektori
,null -- as ''Henkilon nimike''
,null -- as ''Henkilon nimikekoodi''
,null -- as ''Tutkijanuravaihe''
,null -- as ''Tehtävänjaottelu''
,null -- as ''Tiedekunta''
,null -- as ''Tieteenala''
,null -- as ''Paatieteenala''

--- lkm muuttujat ---

,null --opiskelijat lkm
,null --opiskelijat fte
,null --opiskelijat lasna
,null --tutkinnot
,null --THE AS
,null --THE RS
,null --QS FS
,case when 
	d10.tili_taso0_fi=''Tuloslaskelma'' and
		(d10.tili_taso3_fi=''Avustustuotot'') OR
		(d10.tili_taso5_fi in 
			(''Yliopiston varsinaiseen toimintaan kuuluvan liiketoiminnan tuotot'',
			''Muut varsinaisen toiminnan tuotot'',
			''Tuotto-/ kulujäämä (varainhankinta)'',
			''Tuotto-/ kulujäämä (sijoitus- ja rahoitustoiminta)'',
			''Yliopistolain mukainen valtionrahoitus'',
			''Muut yleisavustukset''))
	then f.arvo else null
	end as ''Institutional income''
,case when d10.tili_taso1_fi in (''Kotimainen ulkopuolinen rahoitus'',''Ulkomainen ulkopuolinen rahoitus'')
	then f.arvo else null
	end as ''Research income''
,case when (d10.tili_taso0_fi=''Tutkimusmenot'' and tili_taso5_fi=''Kotimaiset yritykset'') OR
	(d10.tili_taso5_fi=''Ulkomaiset yritykset'')
	then f.arvo else null
	end as ''Research income from industry and commerce''
from ANTERO.dw.f_yo_talous as f
left join antero.dw.d_yo as d1 on f.d_yo_id=d1.id
left join antero.dw.d_aineistotyyppi d9 on f.d_aineistotyyppi_id=d9.id
left join antero.dw.d_tili d10 on f.d_tili_id=d10.id
where f.konserni=''E'' and d9.aineistotyyppi_koodi=''L''


'