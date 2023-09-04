use [ANTERO]
go

update d
set [nimi_en] = k.nimi_en
from [dw].[d_perusopetus_oppiaine_ja_oppimaara]  d
join sa.sa_koodistot k on k.koodisto = d.koodisto and k.koodi = d.koodi

go
