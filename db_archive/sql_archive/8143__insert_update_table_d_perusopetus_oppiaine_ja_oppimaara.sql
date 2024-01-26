use antero
go

begin
	insert [dw].[d_perusopetus_oppiaine_ja_oppimaara]
	select 
		[koodisto]
		,k.[koodi]--='NO'
		,k.[nimi]--='norja'
		,[nimi_sv] = coalesce(k.[nimi_sv],k.[nimi])--='norska'
		,k.[nimi_en]--='Norwegian'
		,[jarjestys]=3710
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
	from [sa].[sa_koodistot] k
	cross apply (
		select [ryhma_koodi],[ryhma_nimi],[ryhma_nimi_sv],[ryhma_nimi_en],[jarjestys_ryhma],[ryhma2_koodi],[ryhma2_nimi],[ryhma2_nimi_sv],[ryhma2_nimi_en],[jarjestys_ryhma2] 
		from dw.d_perusopetus_oppiaine_ja_oppimaara
		where koodisto='kielivalikoima' and koodi='NE' --nepali yhteisten tietojen pohjaksi
	) ca
	where koodisto='kielivalikoima'
	and koodi not in (select koodi from dw.d_perusopetus_oppiaine_ja_oppimaara where koodisto='kielivalikoima')
end

update dw.d_perusopetus_oppiaine_ja_oppimaara 
set jarjestys = 3710 
where koodisto='kielivalikoima'
and koodi not in ('XX','97')

update dw.d_perusopetus_oppiaine_ja_oppimaara 
set ryhma2_koodi = 'toi', ryhma2_nimi='Toinen kotimainen kieli', ryhma2_nimi_sv='Det andra inhemska språket', jarjestys_ryhma2=1
where koodisto='kielivalikoima'
and koodi in ('XAI8','XAI7')

update dw.d_perusopetus_oppiaine_ja_oppimaara 
set ryhma2_koodi = lower(koodi), ryhma2_nimi=nimi, ryhma2_nimi_sv=nimi_sv, jarjestys_ryhma2=0
where (koodisto='kielivalikoima' and koodi in ('XAI12','XAI11'))
or (koodisto='koskioppiaineetyleissivistava' and koodi='AOM')
