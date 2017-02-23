



CREATE view [dw].[v_st_opinnaytetyot] as

select 

[Tilastovuosi] = vuosi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 02] = d9.selite_fi
,[Koulutustyyppi] = d1.selite_fi

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,[hankkeistetut_opinnaytetyot]
,[opinnaytetyot_ei_hankkeistetut]

--koodit
,[Koodit Koulutusala 2002] = d9.koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Koulutustyyppi] = d1.koodi



from [dw].[f_amk_opinnaytetyot] f
join dw.d_amk_koulutustyyppi d1 on d1.id=f.d_koulutustyyppi_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
join dw.d_amk d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id














