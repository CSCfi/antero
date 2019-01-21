USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_liikkuvuus]    Script Date: 19.11.2018 10:33:51 ******/
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

,[Ammattikorkeakoulu] = d6.amk_nimi_fi
,[Yliopisto] = null

,[Sektori] = 'AMK'

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
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Tehtäväjaottelu] = case d4.koodi when -1 then 99 else d4.koodi end


from [dw].[f_amk_opettaja_ja_henkilostoliikkuvuus] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
join dw.d_maatjavaltiot2 d3 on d3.id=f.d_maa_id
join dw.d_amk_tehtavanjaottelu d4 on d4.id=f.d_tehtavanjaottelu_id
join dw.d_maatjavaltiot2 d5 on d5.id=f.d_kohdemaa_lahtevat_tai_lahtomaa_saapuvat_id
join dw.d_amk d6 on d6.id=f.d_amk_id
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
,[Yliopisto] = d6.yo_nimi_fi

,[Sektori] = 'Yliopisto'

--mittarit
,f.vierailut_ulkomaille_lkm
,f.vierailut_ulkomailta_lkm
,null
,null

--koodit
,[Koodit Koulutusala 1995] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit Koulutusala 2002] = null
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Tehtäväjaottelu] = null

from [dw].[f_yo_opettaja_ja_tutkijavierailut] f
--left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
--left join dw.d_maatjavaltiot2 d3 on d3.id=f.d_maa_id
--left join dw.d_amk_tehtavanjaottelu d4 on d4.id=f.d_tehtavanjaottelu_id
join dw.d_maatjavaltiot2 d5 on d5.id=f.d_maa_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id
join dw.d_yo_tutkijanuravaihe d7 on d7.id=f.d_yo_tutkijanuravaihe_id
join dw.d_suorat_liikkuvuudentyyppi d8 on d8.id=f.d_vierailutyyppi_id
join dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
where d5.maatjavaltiot2_fi!='Ahvenanmaa'



