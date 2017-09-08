IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.henkilosto'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.henkilosto AS
SELECT 1 AS a
'
GO

ALTER view api.henkilosto as

--amk
select
Tilastovuosi = vuosi

,Sukupuoli = d1.sukupuoli_fi
,Kansalaisuus = case when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' else d2.maanosa_fi end
,Tehtäväjaottelu = d3.selite_fi
,[Tutkijanuravaihe tai tuntiopettajuus] = null
,[Henkilöstöryhmä] = null
,[Henkilöstöryhmä (harjoittelukoulut)] = null
,[Merkittävimmän tutkinnon taso] = d8.selite_fi
,[Muun henkilöstön henkilöstöryhmä] = d9.selite_fi
,[Työsuhteen nimitystapa] = d10.selite_fi

,[Sektori] = 'Ammattikorkeakoulutus'
,[Koulutusala 02] = d4.selite_fi
,[Koulutusala 95] = null
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
,Päätieteenala = d6.paatieteenala_nimi_fi
,Tieteenala = d6.tieteenala_nimi_fi

,Ammattikorkeakoulu = d7.amk_nimi_fi
,Yliopisto = null

--mittarit
,[henkilotyovuosi]

--koodit
,[Koodit Tehtäväjaottelu] = d3.koodi
,[Koodit Ammattikorkeakoulu] = d7.amk_tunnus
,[Koodit Yliopisto] = null
,[Koodit Henkilöstöryhmä] = null
,[Koodit OKM ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
,[Koodit Tieteenala] = d6.tieteenala_koodi
,[Koodit Päätieteenala] = d6.paatieteenala_koodi
,[Koodit Merkittävimmän tutkinnon taso] = d8.koodi
,[Koodit Muun henkilöstön henkilöstöryhmä] = d9.koodi
,[Koodit Työsuhteen nimitystapa] = d10.koodi

--järjestykset
,[Kansalaisuus järj] =
  case
  when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 1
  when d2.maatjavaltiot2_koodi = '-1' then 9
  when d2.maanosa_koodi = '-1' then 9
  when d2.maanosa_koodi in ('2A','2B') then 2+1
  else cast(d2.maanosa_koodi as int)+1
  end

  --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
  ,1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d3.id ASC,  d4.id ASC,  d5.id ASC,  d6.id ASC,  d7.id ASC,  d8.id ASC,  d9.id ASC, d10.id ASC) as defaultorder


from [dw].[f_amk_henkilon_tyo] f
left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
left join dw.d_maatjavaltiot2 d2 on d2.id=f.d_maa_id
left join dw.d_amk_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu
left join dw.d_koulutusala_2002 d4 on d4.id=f.d_koulutusala02_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
left join dw.d_amk d7 on d7.id=f.d_amk_id
left join dw.d_tutkinnon_taso d8 on d8.id=f.d_tutkinnon_taso
left join dw.d_amk_muun_henkilokunnan_henkilostoryhma d9 on d9.id=f.d_muun_henkiloston_henkilostoryhma_id
left join dw.d_yo_nimitystapa d10 on d10.id=f.d_nimitystapa_id

UNION ALL

--yo
select
Tilastovuosi = vuosi

,Sukupuoli = d1.sukupuoli_fi
,Kansalaisuus = case when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 'Suomi' else d2.maanosa_fi end
,Tehtäväjaottelu = d3.selite_fi
,[Tutkijanuravaihe tai tuntiopettajuus] = d8.selite_fi
,[Henkilöstöryhmä] = d9.selite_fi
,[Henkilöstöryhmä (harjoittelukoulut)] = d10.selite_fi
,[Tutkinnon taso] = null
,[Muun henkilöstön henkilöstöryhmä] = null
,[Työsuhteen nimitystapa] = d11.selite_fi

,[Sektori] = 'Yliopistokoulutus'
,[Koulutusala 02] = null
,[Koulutusala 95] = d4.selite_fi
,[OKM ohjauksen ala] = d5.ohjauksenala_nimi_fi
,Päätieteenala = d6.paatieteenala_nimi_fi
,Tieteenala = d6.tieteenala_nimi_fi

,Ammattikorkeakoulu = null
,Yliopisto = d7.yo_nimi_fi

--mittarit
,[henkilotyovuosi]

--koodit
,[Koodit Tehtäväjaottelu] = case when d3.selite_fi='Muu henkilökunta' then 3 else d3.koodi end
,[Koodit Ammattikorkeakoulu] = null
,[Koodit Yliopisto] = d7.yo_tunnus
,[Koodit Henkilöstöryhmä] = d10.koodi
,[Koodit OKM ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
,[Koodit Tieteenala] = d6.tieteenala_koodi
,[Koodit Päätieteenala] = d6.paatieteenala_koodi
,[Koodit Merkittävimmän tutkinnon taso] = 9
,[Koodit Muun he
nkilöstön henkilöstöryhmä] = 9
,[Koodit Työsuhteen nimitystapa] = d11.koodi

--järjestykset
,[Kansalaisuus järj] =
  case
  when d2.maatjavaltiot2_fi in ('Suomi','Ahvenanmaa') then 1
  when d2.maatjavaltiot2_koodi = '-1' then 9
  when d2.maanosa_koodi = '-1' then 9
  when d2.maanosa_koodi in ('2A','2B') then 2+1
  else cast(d2.maanosa_koodi as int)+1
  end

  --oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset

  ,2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d3.id ASC,  d4.id ASC,  d5.id ASC,  d6.id ASC,  d7.id ASC,  d8.id ASC,  d9.id ASC, d10.id ASC, d11.id ASC) as defaultorder

from [dw].[f_yo_henkilon_tyo] f
left join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
left join dw.d_maatjavaltiot2 d2 on d2.id=f.d_kansalaisuus_id
left join dw.d_yo_tehtavanjaottelu d3 on d3.id=f.d_tehtavanjaottelu_id
left join dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
left join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
left join dw.d_tieteenala d6 on d6.id=f.d_tieteenala_id
left join dw.d_yo d7 on d7.id=f.d_yliopisto_id
left join dw.d_yo_tutkijanuravaihe d8 on d8.id=f.d_tutkijanuravaihe_id
left join dw.d_yo_henkilostoryhma d9 on d9.id=f.d_henkilostoryhma_id
left join dw.d_yo_harjoittelukoulujen_henkilostoryhma d10 on d10.id=f.d_harjoittelukoulujen_henkilostoryhma_id
left join dw.d_yo_nimitystapa d11 on d11.id=f.d_nimitystapa_id



GO



/* revert
drop view api.henkilosto
--*/
