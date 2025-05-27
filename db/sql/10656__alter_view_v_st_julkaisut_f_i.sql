USE [ANTERO]
GO

/****** Object:  View [dw].[v_st_julkaisut_f_i]    Script Date: 10.3.2025 10.03.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER view [dw].[v_st_julkaisut_f_i] as

select 

[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = d3.julkaisunpaaluokka_nimi_fi
,[Julkaisutyyppi] = d3.julkaisutyyppi_nimi_fi
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi


,[Ammattikorkeakoulu] = d6.organisaatio_fi
,[Yliopisto] = null

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'AMK'

--ruotsi
,[Publikationens huvudklass] = d3.julkaisunpaaluokka_nimi_sv
,[Typ av publikation] = d3.julkaisutyyppi_nimi_sv
,[Publikationens internationalitet] = d4.julkaisun_kansainvalisyys_sv
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 1995] = null
,[Utbildningsområde 2002] = d9.selite_sv
,[Yrkeshögskola] = d6.organisaatio_sv
,[Universitet] = null
,[Huvudsakligt vetenskapsområde] = d5.paatieteenala_nimi_sv
,[Vetenskapsområde] = d5.tieteenala_nimi_sv

--englanti
,[Main publication category] = d3.julkaisunpaaluokka_nimi_en
,[Publication type] = d3.julkaisutyyppi_nimi_en
,[Internationality of publication] = d4.julkaisun_kansainvalisyys_en
,[Field of education, HE steering] = d2.ohjauksenala_nimi_en
,[Field of education 1995] = null
,[Field of education 2002] = d9.selite_en
,[University of applied sciences] = d6.organisaatio_en
,[University] = null
,[Main discipline] = d5.paatieteenala_nimi_en
,[Discipline] = d5.tieteenala_nimi_en

--mittarit
,f.julkaisujen_maara
,[h22] = null
,[h23] = null
,[h24] = null


--koodit
,[Koodit Julkaisun pääluokka] = d3.julkaisunpaaluokka_koodi
,[Koodit Julkaisutyyppi] = d3.julkaisutyyppi_koodi
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end


from [dw].[f_amk_julkaisut_f_i] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id
where julkaisutyyppi_koodi not like 'H2'


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
,[Yliopisto] = d6.organisaatio_fi

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'Yliopisto'

--ruotsi
,[Publikationens huvudklass] = d3.julkaisunpaaluokka_nimi_sv
,[Typ av publikation] = d3.julkaisutyyppi_nimi_sv
,[Publikationens internationalitet] = d4.julkaisun_kansainvalisyys_sv
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 1995] = d9.selite_sv
,[Utbildningsområde 2002] = null
,[Yrkeshögskola] = null
,[Universitet] = d6.organisaatio_sv
,[Huvudsakligt vetenskapsområde] = d5.paatieteenala_nimi_sv
,[Vetenskapsområde] = d5.tieteenala_nimi_sv

--englanti
,[Main publication category] = d3.julkaisunpaaluokka_nimi_en
,[Publication type] = d3.julkaisutyyppi_nimi_en
,[Internationality of publication] = d4.julkaisun_kansainvalisyys_en
,[Field of education, HE steering] = d2.ohjauksenala_nimi_en
,[Field of education 1995] = d9.selite_en
,[Field of education 2002] = null
,[University of applied sciences] = null
,[University] = d6.organisaatio_en
,[Main discipline] = d5.paatieteenala_nimi_en
,[Discipline] = d5.tieteenala_nimi_en


--mittarit
,f.julkaisujen_maara
,[h22] = null
,[h23] = null
,[h24] = null


--koodit
,[Koodit Julkaisun pääluokka] = d3.julkaisunpaaluokka_koodi
,[Koodit Julkaisutyyppi] = d3.julkaisutyyppi_koodi
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit Koulutusala 2002] = null
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = d6.organisaatio_koodi
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end

from [dw].[f_yo_julkaisut_f_i] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id
join dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
where julkaisutyyppi_koodi not like 'H2'

/*
union all

--H21
select 

[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = 'H Patentit ja keksintöilmoitukset'
,[Julkaisutyyppi] = 'H21 Keksintöilmoitusten määrä'
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi


,[Ammattikorkeakoulu] = d6.amk_nimi_fi
,[Yliopisto] = null

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'YO'

--mittarit
,[julkaisujen maara] = f.h21

--koodit
,[Koodit Julkaisun pääluokka] = 'H'
,[Koodit Julkaisutyyppi] = 'H21'
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.amk_tunnus
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end


from [dw].[f_amk_keksintoilmoitukset] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
--join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_amk d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id


union all

--H21
select 

[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = 'H Patentit ja keksintöilmoitukset'
,[Julkaisutyyppi] = 'H21 Keksintöilmoitusten määrä'
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = d9.selite_fi
,[Koulutusala 02] = null


,[Ammattikorkeakoulu] = null
,[Yliopisto] = d6.yo_nimi_fi

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'YO'

--mittarit
,[julkaisujen maara] = h21


--koodit
,[Koodit Julkaisun pääluokka] = 'H'
,[Koodit Julkaisutyyppi] = 'H21'
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.yo_tunnus
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end


from [dw].[f_yo_keksintoilmoitukset] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
--join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id
join dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
*/
union all

--H amk
select 
[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = 'H Patentit ja keksintöilmoitukset'
,[Julkaisutyyppi] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Tuntematon'
					end
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = null
,[Koulutusala 02] = d9.selite_fi


,[Ammattikorkeakoulu] = d6.organisaatio_fi
,[Yliopisto] = null

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'AMK'

--ruotsi
,[Publikationens huvudklass] = 'H Patent och uppfinningsanmälningar'
,[Typ av publikation] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 *SV*Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 *SV*Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 *SV*Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 *SV*Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Information saknas'
					end
,[Publikationens internationalitet] = d4.julkaisun_kansainvalisyys_sv
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 1995] = null
,[Utbildningsområde 2002] = d9.selite_sv
,[Yrkeshögskola] = d6.organisaatio_sv
,[Universitet] = null
,[Huvudsakligt vetenskapsområde] = d5.paatieteenala_nimi_sv
,[Vetenskapsområde] = d5.tieteenala_nimi_sv

--englanti
,[Main publication category] = 'H Patents and innovation announcements'
,[Publication type] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 *EN*Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 *EN*Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 *EN*Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 *EN*Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Missing data'
					end
,[Internationality of publication] = d4.julkaisun_kansainvalisyys_en
,[Field of education, HE steering] = d2.ohjauksenala_nimi_en
,[Field of education 1995] = null
,[Field of education 2002] = d9.selite_en
,[University of applied sciences] = d6.organisaatio_en
,[University] = null
,[Main discipline] = d5.paatieteenala_nimi_en
,[Discipline] = d5.tieteenala_nimi_en

--mittarit
,[julkaisujen maara] = f.h21
,[h22]
,[h23]
,[h24]

--koodit
,[Koodit Julkaisun pääluokka] = 'H'
,[Koodit Julkaisutyyppi] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24'
						else '-1'
					end
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = null
,[Koodit Koulutusala 2002] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = null
,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end


from [dw].[f_amk_keksintoilmoitukset] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
--join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
join dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id
where h21<>0 or h22<>0 or h23<>0 or h24<>0

union all

--H YO
select 
[Tilastovuosi] = vuosi

,[Julkaisun pääluokka] = 'H Patentit ja keksintöilmoitukset'
,[Julkaisutyyppi] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Tuntematon'
					end
,[Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_fi

,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
,[Koulutusala 95] = d9.selite_fi
,[Koulutusala 02] = null


,[Ammattikorkeakoulu] = null
,[Yliopisto] = d6.organisaatio_fi

,[Päätieteenala] = d5.paatieteenala_nimi_fi
,[Tieteenala] = d5.tieteenala_nimi_fi

,[Sektori] = 'Yliopisto'

--ruotsi
,[Publikationens huvudklass] = 'H Patent och uppfinningsanmälningar'
,[Typ av publikation] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 *SV*Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 *SV*Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 *SV*Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 *SV*Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Information saknas'
					end
,[Publikationens internationalitet] = d4.julkaisun_kansainvalisyys_sv
,[UKM-styrningsområde] = d2.ohjauksenala_nimi_sv
,[Utbildningsområde 1995] = d9.selite_sv
,[Utbildningsområde 2002] = null
,[Yrkeshögskola] = null
,[Universitet] = d6.organisaatio_sv
,[Huvudsakligt vetenskapsområde] = d5.paatieteenala_nimi_sv
,[Vetenskapsområde] = d5.tieteenala_nimi_sv

--englanti
,[Main publication category] = 'H Patents and innovation announcements'
,[Publication type] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21 *EN*Keksintöilmoitusten määrä'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22 *EN*Jatkotyöstetyt keksintöilmoitukset'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23 *EN*Korkeakoulun itselleen ottamat jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24 *EN*Korkeakoulun edelleen siirtämät jatkotyöstettyjen keksintöilmoitusten hyödyntämisilmoitukset'
						else 'Missing data'
					end
,[Internationality of publication] = d4.julkaisun_kansainvalisyys_en
,[Field of education, HE steering] = d2.ohjauksenala_nimi_en
,[Field of education 1995] = d9.selite_en
,[Field of education 2002] = null
,[University of applied sciences] = null
,[University] = d6.organisaatio_en
,[Main discipline] = d5.paatieteenala_nimi_en
,[Discipline] = d5.tieteenala_nimi_en

--mittarit
,[julkaisujen maara] = h21
,[h22]
,[h23]
,[h24]

--koodit
,[Koodit Julkaisun pääluokka] = 'H'
,[Koodit Julkaisutyyppi] = 
					case
						when h21<>0 and h22=0 and h23=0 and h24=0 then 'H21'
						when h21=0 and h22<>0 and h23=0 and h24=0 then 'H22'
						when h21=0 and h22=0 and h23<>0 and h24=0 then 'H23'
						when h21=0 and h22=0 and h23=0 and h24<>0 then 'H24'
						else '-1'
					end
,[Koodit Julkaisun kansainvälisyys] = d4.julkaisun_kansainvalisyys_koodi
,[Koodit Koulutusala 1995] = case d9.koodi when -1 then 99 else d9.koodi end
,[Koodit Koulutusala 2002] = null
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 9 else d2.ohjauksenala_koodi end
,[Koodit Yliopisto] = d6.organisaatio_koodi
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Päätieteenala] = case d5.paatieteenala_koodi when -1 then 9 else d5.paatieteenala_koodi end
,[Koodit Tieteenala] = case d5.tieteenala_koodi when -1 then 9999 else d5.tieteenala_koodi end


from [dw].[f_yo_keksintoilmoitukset] f
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
--join dw.d_julkaisutyyppi d3 on d3.id=f.d_julkaisutyyppi_id
join dw.d_julkaisun_kansainvalisyys d4 on d4.id=f.d_julkaisun_kansainvalisyys_id
join dw.d_tieteenala d5 on d5.id=f.d_tieteenala_id
join dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id
join dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
where h21<>0 or h22<>0 or h23<>0 or h24<>0


GO

USE [ANTERO]