


CREATE view [dw].[v_st_julkaisut_f_i] as

select 

[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = d3.julkaisunpaaluokka_nimi_fi
,[Julkaisutyyppi] = d3.julkaisutyyppi_nimi_fi
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi


,[Ammattikorkeakoulu] = d6.amk_nimi_fi
,[Yliopisto] = null

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'AMK'

--mittarit
,f.julkaisujen_maara

--koodit
,[Koodit Julkaisun pääluokka] = d3.julkaisunpaaluokka_koodi
,[Koodit Julkaisutyyppi] = d3.julkaisutyyppi_koodi
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = d9.koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Päätieteenala] = d5.paatieteenala_koodi
,[Koodit Tieteenala] = d5.tieteenala_koodi


from [dw].[f_amk_julkaisut_f_i] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_amk d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id


UNION ALL

select 
[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = d3.julkaisunpaaluokka_nimi_fi
,[Julkaisutyyppi] = d3.julkaisutyyppi_nimi_fi
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = d9.selite_fi
,[Koulutusala 02] = null

,[Ammattikorkeakoulu] = null
,[Yliopisto] = d6.yo_nimi_fi

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'Yliopisto'

--mittarit
,f.julkaisujen_maara


--koodit
,[Koodit Julkaisun pääluokka] = d3.julkaisunpaaluokka_koodi
,[Koodit Julkaisutyyppi] = d3.julkaisutyyppi_koodi
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = d9.koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Päätieteenala] = d5.paatieteenala_koodi
,[Koodit Tieteenala] = d5.tieteenala_koodi

from [dw].[f_yo_julkaisut_f_i] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id






