IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.avoin_yliopisto'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW api.avoin_yliopisto AS
SELECT 1 AS a
'
GO

alter view api.avoin_yliopisto as
select
[Tilastovuosi] = vuosi
,[Sukupuoli] = d1.sukupuoli_fi
,[Yliopisto] = d6.yo_nimi_fi
--mittarit
,f.suorittaneiden_lkm

--oletusjärjestys sorttausta varten
,ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id, d6.id ASC) as defaultorder

--koodit
,[Koodit Yliopisto] = d6.yo_tunnus
,[Koodit Sukupuoli] = d1.sukupuoli_koodi
from [dw].[f_yo_avoimen_yliopiston_kautta_opiskelevat] f
join dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
join dw.d_yo d6 on d6.id=f.d_yliopisto_id
order by defaultorder ASC
GO
/* revert
drop view api.avoin_yliopisto
--*/
