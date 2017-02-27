IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_liikkuvuus]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dw].[v_st_liikkuvuus] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi
,[Kansalaisuus] = d3.maatjavaltiot2_fi
,[Tehtäväjaottelu] = d4.selite_fi
,[Tutkijanuravaihe] = null
,[Vierailun kesto] = d8.selite_fi
,[Liikkuvuusohjelma] = d7.selite_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi

,[Maa] = d5.maatjavaltiot2_fi
,[Maanosa] = null

,[Ammattikorkeakoulu] = d6.amk_nimi_fi
,[Yliopisto] = null

,[Sektori] = ''AMK''

--mittarit
,f.vierailut_ulkomaille_lkm
,f.vierailut_ulkomailta_lkm

,f.liikkuvuuden_kesto_ulkomaille
,f.liikkuvuuden_kesto_ulkomailta

--koodit
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = d9.koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus


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


UNION ALL

select 
[Tilastovuosi] = vuosi

,[Sukupuoli] = null
,[Kansalaisuus] = null
,[Tehtäväjaottelu] = null
,[Tutkijanuravaihe] = d7.selite_fi
,[Vierailun kesto] = d8.selite_fi
,[Liikkuvuusohjelma] = null

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = d9.selite_fi
,[Koulutusala 02] = null

,[Maa] = d5.maatjavaltiot2_fi
,[Maanosa] = null

,[Ammattikorkeakoulu] = null
,[Yliopisto] = d6.yo_nimi_fi

,[Sektori] = ''Yliopisto''

--mittarit
,f.vierailut_ulkomaille_lkm
,f.vierailut_ulkomailta_lkm
,null
,null

--koodit
,[Koodit Koulutusala 1995] = d9.koodi
,[Koodit Koulutusala 2002] = null
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Ammattikorkeakoulu] = null

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

'
