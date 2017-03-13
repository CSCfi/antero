IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_st_opintopisteet]'))
EXEC dbo.sp_executesql @statement = N'

create view dw.v_st_opintopisteet as

select 
[Tilastovuosi] = f.vuosi

,[Koulutusala 02] = d1.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutustyyppi] = d4.selite_fi
,[Sektori] = 'Ammattikorkeakoulutus'

,[Ammattikorkeakoulu] = d3.amk_nimi_fi
,[Yliopisto] = null

--mittarit
,[kaikki_tutk_lkm]
,[tki_pisteet_lkm]
,[tki_harj_pisteet_lkm]
,[tki_muu_pisteet_lkm]
,[vierkiel_pisteet_lkm]
,[ulkom_hyv_op_lkm]
,[ulkom_harj_op_lkm]
,[avoinamk_op_lkm]
,[avoinamk_op_amk_lkm]
,[avoinamk_op_yliop_lkm]
,[avoinamk_op_kesa_lkm]
,[avoinamk_op_kansan_lkm]
,[avoinamk_op_kansal_lkm]
,[avoinamk_op_muut_lkm]
,[avoinop_lkm] = null
,[avoinop_amk_lkm] = null
,[avoinop_yliop_lkm] = null
,[avoinop_kesa_lkm] = null
,[avoinop_kansan_lkm] = null
,[avoinop_kansal_lkm] = null
,[avoinop_muut_lkm] = null
,[kv_vaihtoopiskelijat_op_lkm]
,[kk_yhteistyo_op_lkm]
,[erilopintooik_op_lkm]
,[erillisilla_oik_opkoul_op_lkm] = null
,[mamu_op_lkm]
,[erikoul_suor_op_lkm]

--koodit
,[Koodit Koulutusala 02] = d1.koodi
,[Koodit Koulutusala 95] = null
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Ammattikorkeakoulu] = d3.amk_tunnus
,[Koodit Yliopisto] = null

from dw.f_amk_opintopisteet f
join dw.d_koulutusala_2002 d1 on d1.id=f.d_koulutusala_2002_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_amk d3 on d3.id=f.d_amk_id
join dw.d_amk_koulutustyyppi d4 on d4.id=f.d_amk_koulutustyyppi_id
join dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id
where d5.paivays like '%-03-02'

union all

select 
[Tilastovuosi] = f.vuosi

,[Koulutusala 02] = null
,[Koulutusala 95] = d1.selite_fi
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutustyyppi] = null
,[Sektori] = 'Yliopistokoulutus'

,[Ammattikorkeakoulu] = null
,[Yliopisto] = d3.yo_nimi_fi

--mittarit
,[kaikki_tutk_op_lkm]
,[tki_pisteet_lkm] = null
,[tki_harj_pisteet_lkm] = null
,[tki_muu_pisteet_lkm] = null
,[vierkielper_op_lkm]
,[ulkom_hyv_luetut_op_lkm]
,[ulkom_harj_op_lkm]
,[avoinamk_op_lkm] = null
,[avoinamk_op_amk_lkm] = null
,[avoinamk_op_yliop_lkm] = null
,[avoinamk_op_kesa_lkm] = null
,[avoinamk_op_kansan_lkm] = null
,[avoinamk_op_kansal_lkm] = null
,[avoinamk_op_muut_lkm] = null
,[avoinop_lkm]
,[avoinop_amk_lkm]
,[avoinop_yliop_lkm]
,[avoinop_kesa_lkm]
,[avoinop_kansan_lkm]
,[avoinop_kansal_lkm]
,[avoinop_muut_lkm]
,[kv_vaihtoopiskelijat_op_lkm]
,[joo_op_lkm]
,[erillisilla_oik_op_lkm]
,[erillisilla_oik_opkoul_op_lkm]
,[mamu_op_lkm] = null
,[erikoul_suor_op_lkm]

--koodit
,[Koodit Koulutusala 02] = null
,[Koodit Koulutusala 95] = d1.koodi
,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Yliopisto] = d3.yo_tunnus

from dw.f_yo_opintopisteet f
join dw.d_koulutusala_1995 d1 on d1.id=f.d_opintoala95_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_yo d3 on d3.id=f.d_yo_id
join dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id
where d5.paivays like '%-03-02'

'