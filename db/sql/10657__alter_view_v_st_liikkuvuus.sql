USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_liikkuvuus]    Script Date: 10.3.2025 10.01.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER view [dw].[v_st_liikkuvuus] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi
,[Kansalaisuus] = d3.maatjavaltiot2_fi
,[Kansalaisuuden_maanosa] = d3.maanosa_fi 
,[Tehtäväjaottelu] = d4.selite_fi
,[Tutkijanuravaihe] = null
,[Vierailun kesto] = d8.selite_fi
,[Liikkuvuusohjelma] = d7.selite_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi

,[Maa] = d5.maatjavaltiot2_fi
,[Maanosa] = d5.maanosa_fi

,[Ammattikorkeakoulu] = d6.organisaatio_fi
,[Yliopisto] = null

,[Sektori] = 'AMK'

--sv

,[Statistikår] = vuosi

,[Kön] = d1.sukupuoli_sv
,[Medborgarskap] = d3.maatjavaltiot2_sv
,[Medborgarskaps världsdel] = d3.maanosa_sv
,[Uppgiftsindelning] = d4.selite_sv
,[Forskarkarriärens skede] = null
,[Besökets längd] = d8.selite_sv
,[Mobilitetsprogram] = 'Information saknas' -- d7.selite_sv

,[UKM-styrningsområde​] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 95] = null
,[Utbildningsområde 02] = d9.selite_sv

,[Land] = d5.maatjavaltiot2_sv
,[Världsdel] = d5.maanosa_sv

,[Yrkeshögskola] = d6.organisaatio_sv
,[Universitet] = null

,[Sektor] = 'Yrkeshögskoleutbildning'

--mittarit
,f.vierailut_ulkomaille_lkm
,f.vierailut_ulkomailta_lkm

,f.liikkuvuuden_kesto_ulkomaille
,f.liikkuvuuden_kesto_ulkomailta

--koodit
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Tehtäväjaottelu] = case d4.koodi when -1 then 99 else d4.koodi end


from [dw].[f_amk_opettaja_ja_henkilostoliikkuvuus] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
join dw.d_maatjavaltiot2 d3 on d3.id=f.d_maa_id
join dw.d_amk_tehtavanjaottelu d4 on d4.id=f.d_tehtavanjaottelu_id
join dw.d_maatjavaltiot2 d5 on d5.id=f.d_kohdemaa_lahtevat_tai_lahtomaa_saapuvat_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
join dw.d_amk_liikkuvuusohjelma d7 on d7.id=f.d_liikkuvuusohjelma_id
join dw.d_suorat_liikkuvuudentyyppi d8 on d8.id=f.d_vierailutyyppi_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id
where d5.maatjavaltiot2_fi!='Ahvenanmaa'


UNION ALL


select 
[Tilastovuosi] = vuosi

,[Sukupuoli] = 'Tieto puuttuu'
,[Kansalaisuus] = null
,[Kansalaisuuden_maanosa] = 'Tieto puuttuu'
,[Tehtäväjaottelu] = 'Tuntematon'
,[Tutkijanuravaihe] = d7.selite_fi
,[Vierailun kesto] = d8.selite_fi
,[Liikkuvuusohjelma] = null

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = d9.selite_fi
,[Koulutusala 02] = 'Tuntematon'

,[Maa] = d5.maatjavaltiot2_fi
,[Maanosa] = d5.maanosa_fi

,[Ammattikorkeakoulu] = null
,[Yliopisto] = d6.organisaatio_fi

,[Sektori] = 'Yliopisto'

--sv

,[Statistikår] = vuosi

,[Kön] = 'Information saknas'
,[Medborgarskap] = null
,[Medborgarskaps världsdel] = 'Information saknas'
,[Uppgiftsindelning] = 'Okänd'
,[Forskarkarriärens skede] = d7.selite_sv
,[Besökets längd] = d8.selite_sv
,[Mobilitetsprogram] = null

,[UKM-styrningsområde​] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 95] = d9.selite_sv
,[Utbildningsområde 02] = 'Okänd'

,[Land] = d5.maatjavaltiot2_sv
,[Världsdel] = d5.maanosa_sv

,[Yrkeshögskola] = null
,[Universitet] = d6.organisaatio_sv

,[Sektor] = 'Universitetsutbildning'

--mittarit
,f.vierailut_ulkomaille_lkm
,f.vierailut_ulkomailta_lkm
,null
,null

--koodit
,[Koodit Koulutusala 1995] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit Koulutusala 2002] = null
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = d6.organisaatio_koodi
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Tehtäväjaottelu] = null

from [dw].[f_yo_opettaja_ja_tutkijavierailut] f
--left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
--left join dw.d_maatjavaltiot2 d3 on d3.id=f.d_maa_id
--left join dw.d_amk_tehtavanjaottelu d4 on d4.id=f.d_tehtavanjaottelu_id
join dw.d_maatjavaltiot2 d5 on d5.id=f.d_maa_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id
join dw.d_yo_tutkijanuravaihe d7 on d7.id=f.d_yo_tutkijanuravaihe_id
join dw.d_suorat_liikkuvuudentyyppi d8 on d8.id=f.d_vierailutyyppi_id
join dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
where d5.maatjavaltiot2_fi!='Ahvenanmaa'

GO

USE [ANTERO]