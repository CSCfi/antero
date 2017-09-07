IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.erilliset_opinto_oikeudet'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.erilliset_opinto_oikeudet AS
SELECT 1 AS a
'
GO

ALTER view api.erilliset_opinto_oikeudet as


select

[Tilastovuosi] = vuosi

,Koulutusala = 'Tuntematon'
,[OKM ohjauksen ala] = 'Tuntematon'

,[Yliopisto] = d6.yo_nimi_fi

--mittarit
,f.suorittaneiden_lkm
,f.opettajakoulutus_suorittaneiden_lkm
,erillisilla_oik_op_lkm = null
,erillisilla_oik_opkoul_op_lkm = null

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Koulutusala] = 99
,[Koodit OKM ohjauksen ala] = 99


--oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset

,1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d6.id ASC) as defaultorder


from [dw].[f_yo_erillisella_opinto_oikeudella_opiskelevat] f
join dw.d_yo d6 on d6.id=f.d_yliopisto_id

union all

select

[Tilastovuosi] = f.vuosi

,Koulutusala = d1.opintoala95_nimi_fi
,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi

,[Yliopisto] = case d6.yo_nimi_fi when 'Turun yliopisto (-2009)' then 'Turun yliopisto' else d6.yo_nimi_fi end

--mittarit
,null
,null
,[erillisilla_oik_op_lkm]
,[erillisilla_oik_opkoul_op_lkm]

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Koulutusala] = case d1.opintoala95_koodi when -1 then 99 else d1.opintoala95_koodi end
,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end

--oletusjärjestys sorttausta varten, 2000000000+ lajittelee alikyselyn tulokset

,2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d6.id ASC, d7.id ASC) as defaultorder


from [dw].[f_yo_opintopisteet] f
join dw.d_opintoala95 d1 on d1.id=f.d_opintoala95_id
join dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
join dw.d_yo d6 on d6.id=f.d_yo_id
join dw.d_kalenteri d7 on d7.id=f.d_tilannepvm_id

where d7.paivays like '%-03-02'

order by defaultorder ASC

GO


/* revert
drop view api.erilliset_opinto_oikeudet
--*/
