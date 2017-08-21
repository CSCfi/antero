IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.harjoittelukoulut'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.harjoittelukoulut AS
SELECT 1 AS a
'
GO

ALTER view api.harjoittelukoulut as

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.yo_nimi_fi

,[Henkilöstöryhmä] = null

,[Koulutusala] = 'Tieto puuttuu'
,[Ohjauksen ala] = 'Tieto puuttuu'

--mittarit
,f.harjoittelukoulun_oppilaat_esiopetus
,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6
,f.harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9
,f.harjoittelukoulun_oppilaat_lukio
,f.harjoittelukoulun_oppilaat_yhteensa
,f.harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit
,f.harjoittelukoulun_kokonaistuntimaara

,[opintopisteet_lastentarha] = null
,[opintopisteet_luokanopettaja] = null
,[opintopisteet_aineenopettaja] = null
,[opintopisteet_erityisopettaja] = null
,[opintopisteet_opinto_ohjaaja] = null
,[opintopisteet_aikuiskoulutus] = null
,[opintopisteet_muut] = null

,henkilotyovuosi = null

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Koulutusala] = 99
,[Koodit Ohjauksen ala] = 99
,[Koodit Henkilöstöryhmä] = 99


from [dw].[f_yo_harjoittelukoulut] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.yo_nimi_fi

,null

,[Koulutusala] = 'Tieto puuttuu'
,[Ohjauksen ala] = 'Tieto puuttuu'

--mittarit
,null
,null
,null
,null
,null
,null
,null

,f.suoritetut_opintopisteet_lastentarhanopettajat
,f.suoritetut_opintopisteet_luokanopettajaharjoittelu
,f.suoritetut_opintopisteet_aineenopettajaharjoittelu
,f.suoritetut_opintopisteet_erityisopettajat
,f.suoritetut_opintopisteet_opinto_ohjaajat
,f.suoritetut_opintopisteet_aikuiskoulutus_harjoittelu
,f.suoritetut_opintopisteet_muut_opettajankoulutusryhmat

,null

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Koulutusala] = 99
,[Koodit Ohjauksen ala] = 99
,[Koodit Henkilöstöryhmä] = 99


from [dw].[f_yo_harjoittelukoulujen_opintopisteet] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

select 
[Tilastovuosi] = vuosi
,[Yliopisto] = d1.yo_nimi_fi

,[Henkilöstöryhmä] = d3.selite_fi

,[Koulutusala] = d4.selite_fi
,[Ohjauksen ala] = d5.ohjauksenala_nimi_fi
--mittarit
,null
,null
,null
,null
,null
,null
,null

,null
,null
,null
,null
,null
,null
,null

,henkilotyovuosi

--koodit
,[Koodit Yliopisto] = d1.yo_tunnus
,[Koodit Koulutusala] = case d4.koodi when -1 then 99 else d4.koodi end
,[Koodit Ohjauksen ala] = case d5.ohjauksenala_koodi when -1 then 99 else d5.ohjauksenala_koodi end
,[Koodit Henkilöstöryhmä] = d3.koodi


from [dw].[f_yo_henkilon_tyo] f
join dw.d_yo d1 on d1.id=f.d_yliopisto_id
join dw.d_yo_tehtavanjaottelu d2 on d2.id=f.d_tehtavanjaottelu_id
join dw.d_yo_harjoittelukoulujen_henkilostoryhma d3 on d3.id=f.d_harjoittelukoulujen_henkilostoryhma_id
join dw.d_koulutusala_1995 d4 on d4.id=f.d_koulutusala_id
join dw.d_ohjauksenala d5 on d5.id=f.d_ohjauksenala_id
where d2.selite_fi='Harjoittelukoulujen henkilöstö'




GO

/* revert
drop view api.harjoittelukoulut
--*/
