USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_opintopisteet]    Script Date: 10.3.2025 10.07.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_opintopisteet] as

select
[Tilastovuosi] = f.vuosi

,[Koulutusala 02] = d1.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutustyyppi] = d4.selite_fi
,[Sektori] = 'Ammattikorkeakoulutus'

,[Ammattikorkeakoulu] = d3.organisaatio_fi
,[Yliopisto] = null

--ruotsi

,[Statistikår] = f.vuosi

,[Utbildningsområde 02] = d1.selite_sv
,[Utbildningsområde 95] = null
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Typ av utbildning] = d4.selite_sv
,[Sektorn] = 'Yrkeshögskoleutbildning'

,[Yrkeshögskola] = d3.organisaatio_sv
,[Universitet] = null

-- englanti

,[Statistical year] = f.vuosi

,[Field of education 02] = d1.selite_en
,[Field of education 95] = null
,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
,[Type of education] = d4.selite_en
,[Sector] = 'University of applied sciences education'

,[University of applied sciences] = d3.organisaatio_en
,[University] = null

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
,[muu_kuin_kk_yhteistyo_op_lkm]
,[kv_suomi_vieraana_op_lkm]
,[kv_ruotsi_vieraana_op_lkm]

--koodit
,[Koodit Koulutusala 02] = d1.koodi
,[Koodit Koulutusala 95] = null
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Ammattikorkeakoulu] = d3.organisaatio_koodi
,[Koodit Yliopisto] = null

from dw.f_amk_opintopisteet f
left join dw.d_koulutusala_2002 d1 on d1.id=f.d_koulutusala_2002_id
left join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
left join dw.d_organisaatioluokitus d3 on d3.id=f.d_amk_id
left join dw.d_amk_koulutustyyppi d4 on d4.id=f.d_amk_koulutustyyppi_id
left join dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id

union all

select 
[Tilastovuosi] = f.vuosi

,[Koulutusala 02] = null
,[Koulutusala 95] = d1.opintoala95_nimi_fi
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutustyyppi] = null
,[Sektori] = 'Yliopistokoulutus'

,[Ammattikorkeakoulu] = null
,[Yliopisto] = d3.organisaatio_fi

-- ruotsi

,[Statistikår] = f.vuosi

,[Utbildningsområde 02] = null
,[Utbildningsområde 95] = d1.opintoala95_nimi_sv
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Typ av utbildning] = null
,[Sektorn] = 'Universitetsutbildning'

,[Yrkeshögskola] = null
,[Universitet] = d3.organisaatio_sv

-- englanti

,[Statistical year] = f.vuosi

,[Field of education 02] = null
,[Field of education 95] = d1.opintoala95_nimi_en
,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
,[Type of education] = null
,[Sector] = 'University education'

,[University of applied sciences] = null
,[University] = d3.organisaatio_en

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
,[muu_kuin_kk_yhteistyo_op_lkm]
,[kv_suomi_vieraana_op_lkm]
,[kv_ruotsi_vieraana_op_lkm]

--koodit
,[Koodit Koulutusala 02] = null
,[Koodit Koulutusala 95] = d1.opintoala95_koodi
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Yliopisto] = d3.organisaatio_koodi

from dw.f_yo_opintopisteet f
left join dw.d_opintoala95 d1 on d1.id=f.d_opintoala95_id
left join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
left join dw.d_organisaatioluokitus d3 on d3.id=f.d_yo_id
left join dw.d_kalenteri d5 on d5.id=f.d_tilannepvm_id

GO

USE [ANTERO]