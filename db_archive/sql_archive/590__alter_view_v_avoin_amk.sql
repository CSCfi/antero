
ALTER view [dw].[v_avoin_amk] as

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = d1.sukupuoli_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,f.osallistuneet
,null as opintopisteet_yht
,null as opintopisteet_amk
,null as opintopisteet_kansalaisopistot
,null as opintopisteet_kansanopistot
,null as opintopisteet_kesayo
,null as opintopisteet_muut
,null as opintopisteet_yo


--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi


from [dw].[f_amk_avoimen_opiskelijat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id


UNION ALL

select 

[Tilastovuosi] = vuosi

,[Sukupuoli] = null

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala] = d3.selite_fi

,[Ammattikorkeakoulu] = d6.amk_nimi_fi

--mittarit
,null
,f.avoinamk_op_lkm
,f.avoinamk_op_amk_lkm
,f.avoinamk_op_kansal_lkm
,f.avoinamk_op_kansan_lkm
,f.avoinamk_op_kesa_lkm
,f.avoinamk_op_muut_lkm
,f.avoinamk_op_yliop_lkm


--koodit
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Sukupuoli] = null
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Koulutusala] = d3.koodi


from [dw].[f_amk_opintopisteet] f

join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
join dw.d_amk d6 on d6.id=f.d_amk_id







