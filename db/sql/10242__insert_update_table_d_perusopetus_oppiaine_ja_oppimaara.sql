use antero
go

insert [dw].[d_perusopetus_oppiaine_ja_oppimaara] (
    [koodisto]
    ,[koodi]
    ,[nimi]
    ,[nimi_sv]
    ,[nimi_en]
    ,[jarjestys]
    ,[ryhma_koodi]
    ,[ryhma_nimi]
    ,[ryhma_nimi_sv]
    ,[ryhma_nimi_en]
    ,[jarjestys_ryhma]
    ,[ryhma2_koodi]
    ,[ryhma2_nimi]
    ,[ryhma2_nimi_sv]
    ,[ryhma2_nimi_en]
    ,[jarjestys_ryhma2]
)
select
	[koodisto]
	,koodi
	,nimi
	,[nimi_sv] = coalesce([nimi_sv], [nimi])
    ,[nimi_en]
    ,[jarjestys]=null
    ,[ryhma_koodi] = 'kie'
    ,[ryhma_nimi] = 'Kielet'
    ,[ryhma_nimi_sv] = 'Språk'
    ,[ryhma_nimi_en] = null
    ,[jarjestys_ryhma] = 2
    ,[ryhma2_koodi] = 'kie'
    ,[ryhma2_nimi] = 'Vieraat kielet'
    ,[ryhma2_nimi_sv] = 'Främmande språk'
    ,[ryhma2_nimi_en] = null
    ,[jarjestys_ryhma2] = 2
from sa.sa_koodistot k 
where koodisto = 'kielivalikoima'
and not exists (
  select [koodi] 
  from [dw].[d_perusopetus_oppiaine_ja_oppimaara] 
  where koodi = k.koodi and koodisto = k.koodisto
)
;

update t
set jarjestys = 3700 + q.rnk
from [dw].[d_perusopetus_oppiaine_ja_oppimaara] t
left join (
	select koodi, rnk = rank() over(order by nimi)
	from [dw].[d_perusopetus_oppiaine_ja_oppimaara] 
	where koodisto = 'kielivalikoima'
	and coalesce(jarjestys,-1) < 3800
) q on q.koodi = t.koodi
where koodisto = 'kielivalikoima'
and coalesce(jarjestys,-1) < 3800
;

