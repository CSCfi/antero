USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_muu_henkilosto_amk]    Script Date: 10.3.2025 10.04.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_muu_henkilosto_amk] as

select 

 [Tilastovuosi] = vuosi
,[Henkilöstöryhmä] = null
,Koulutusala = d2.selite_fi
,[OKM ohjauksen ala] = d3.ohjauksenala_nimi_fi
,[Ammattikorkeakoulu] = d6.organisaatio_fi

--en---
,[Statistical year] = vuosi
,[Personnel group] = null
,[Field of education] = d2.selite_en
,[Field of education - HE steering] = d3.ohjauksenala_nimi_en
,[University of applied sciences] = d6.organisaatio_en

--sv--
,[Statistikår] = vuosi
,[Personalgrupp] = null
,Utbildningsområde = d2.selite_sv
,[UKM-styrningsområde​] = d3.ohjauksenala_nimi_sv
,Yrkeshögskola = d6.organisaatio_sv

--mittarit
,f.sivutoimisten_tuntiopettajien_opetustunnit
,f.ostopalveluna_hankittu_tuntiopetus
,null as henkilostoryhman_tunnit_lkm


--koodit
,[Koodit Koulutusala] = d2.koodi
,[Koodit OKM ohjauksen ala] = d3.ohjauksenala_koodi
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Henkilöstöryhmä] = null



from [dw].[f_amk_sivutoimiset_opettajat] f
join dw.d_koulutusala_2002 d2 on d2.id=f.d_koulutusala_id
join dw.d_ohjauksenala d3 on d3.id=f.d_ohjauksenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id


union all

select 

 [Tilastovuosi] = vuosi
,[Henkilöstöryhmä] = d1.selite_fi
,Koulutusala = null
,[OKM ohjauksen ala] = null
,[Ammattikorkeakoulu] = d6.organisaatio_fi

--en---
,[Statistical year] = vuosi
,[Personnel group] = d1.selite_en
,[Field of education] = null
,[Field of education - HE steering] = null
,[University of applied sciences] = d6.organisaatio_en

--sv--
,[Statistikår] = vuosi
,[Personalgrupp] = d1.selite_sv
,Utbildningsområde = null
,[UKM-styrningsområde​] = null
,Yrkeshögskola = d6.organisaatio_sv

--mittarit
,null
,null
,henkilostoryhman_tunnit_lkm


--koodit
,[Koodit Koulutusala] = null
,[Koodit OKM ohjauksen ala] = null
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Henkilöstöryhmä] = d1.koodi



from [dw].[f_amk_ostopalveluna_hankittu_tyo] f
join dw.d_amk_muun_henkilokunnan_henkilostoryhma d1 on d1.id=f.d_henkilostoryhma_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id


GO

USE [ANTERO]