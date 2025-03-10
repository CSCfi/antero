USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_opinnaytetyot]    Script Date: 10.3.2025 10.05.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER view [dw].[v_st_opinnaytetyot] as

select 

[Tilastovuosi] = vuosi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 02] = d9.selite_fi
,[Koulutustyyppi] = d1.selite_fi
,Koulutusaste = case d1.selite_fi when 'Amk-tutkintoon johtava nuorten koulutus' then 'Ammattikorkeakoulututkinto' when 'Amk-tutkintoon johtava aikuiskoulutus' then 'Ammattikorkeakoulututkinto' when 'Ylempi ammattikorkeakoulututkinto' then 'Ylempi ammattikorkeakoulututkinto' else 'Tuntematon' end
,[Ammattikorkeakoulu] = d6.organisaatio_fi

--ruotsi

,[Statistikår] = vuosi

,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 02] = d9.selite_sv
,[Typ av utbildning] = d1.selite_sv
,Utbildningsnivå = case d1.selite_sv when '*SV*Amk-tutkintoon johtava nuorten koulutus' then 'Yrkeshögskoleexamen' when '*SV*Amk-tutkintoon johtava aikuiskoulutus' then 'Yrkeshögskoleexamen' when '*SV*Ylempi ammattikorkeakoulututkinto' then 'Högre yrkeshögskoleexamen' else 'Okänt' end
,[Yrkeshögskola] = d6.organisaatio_sv

--englanti

,[Statistical year] = vuosi

,[Field of education - HE steering] = d2.ohjauksenala_nimi_en
,[Field of education 02] = d9.selite_en
,[Type of education] = d1.selite_en
,[Level of education] = case d1.selite_en when '*EN*Amk-tutkintoon johtava nuorten koulutus' then 'University of applied sciences bachelor degree' when '*EN*Amk-tutkintoon johtava aikuiskoulutus' then 'University of applied sciences bachelor degree' when '*EN*Ylempi ammattikorkeakoulututkinto' then 'University of applied sciences master degree' else 'Unknown' end
,[University of applied sciences] = d6.organisaatio_en

--mittarit
,[hankkeistetut_opinnaytetyot]
,[opinnaytetyot_ei_hankkeistetut]

--koodit
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Koulutustyyppi] = d1.koodi



from [dw].[f_amk_opinnaytetyot] f
join dw.d_amk_koulutustyyppi d1 on d1.id=f.d_koulutustyyppi_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id

GO

USE [ANTERO]