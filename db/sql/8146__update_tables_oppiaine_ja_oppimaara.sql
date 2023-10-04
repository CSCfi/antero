use antero
go

update d
set jarjestys = 2710 + rnk --select d.koodisto, d.koodi, d.nimi, 2710+rnk
from dw.d_lukio_oppiaine_ja_oppimaara d
left join (
	select koodisto, koodi, nimi
		,rnk = row_number() over(partition by koodisto order by nimi) 
	from dw.d_lukio_oppiaine_ja_oppimaara dd 
	group by koodisto, koodi, nimi
) q on q.koodisto = d.koodisto and q.koodi = d.koodi
where d.koodisto='kielivalikoima'
and d.koodi not in ('XX', '97')
--order by d.nimi

update d
set jarjestys = 3710 + rnk --select d.koodisto, d.koodi, d.nimi, 3710+rnk
from dw.d_perusopetus_oppiaine_ja_oppimaara d
left join (
	select koodisto, koodi, nimi
		,rnk = row_number() over(partition by koodisto order by nimi) 
	from dw.d_perusopetus_oppiaine_ja_oppimaara dd 
	group by koodisto, koodi, nimi
) q on q.koodisto = d.koodisto and q.koodi = d.koodi
where d.koodisto='kielivalikoima'
and d.koodi not in ('XX', '97')
--order by d.nimi
