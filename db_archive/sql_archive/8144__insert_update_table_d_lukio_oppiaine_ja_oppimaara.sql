use antero
go

begin
	insert [dw].[d_lukio_oppiaine_ja_oppimaara]
	select 
		[koodisto]
		,k.[koodi]--='NO'
		,k.[nimi]--='norja'
		,[nimi_sv] = coalesce(k.[nimi_sv],k.[nimi])--='norska'
		,k.[nimi_en]--='Norwegian'
		,[jarjestys]=2710
		,[ryhma_koodi]
		,[ryhma_nimi]
		,[ryhma_nimi_sv]
		,[ryhma_nimi_en]
		,[jarjestys_ryhma]
		,kommentti=null
	from [sa].[sa_koodistot] k
	cross apply (
		select [ryhma_koodi],[ryhma_nimi],[ryhma_nimi_sv],[ryhma_nimi_en],[jarjestys_ryhma]
		from dw.d_lukio_oppiaine_ja_oppimaara
		where koodisto='kielivalikoima' and koodi='NE' --nepali yhteisten tietojen pohjaksi
	) ca
	where koodisto='kielivalikoima'
	and koodi not in (select koodi from dw.d_lukio_oppiaine_ja_oppimaara where koodisto='kielivalikoima')
end

update dw.d_lukio_oppiaine_ja_oppimaara 
set jarjestys = 2710 
where koodisto='kielivalikoima'
and koodi not in ('XX','97')

update dw.d_lukio_oppiaine_ja_oppimaara 
set ryhma_nimi='Kielet', jarjestys_ryhma = 2
where ryhma_koodi='kie'
