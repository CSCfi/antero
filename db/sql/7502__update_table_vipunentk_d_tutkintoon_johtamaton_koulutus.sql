use [VipunenTK]
go

update [dbo].[d_tutkintoon_johtamaton_koulutus]
set [tutkintoon_johtamaton_koulutus] = 'Maahanmuuttajien valmentava koulutus'
	,[tutkintoon_johtamaton_koulutus_SV] = 'Handledande utbildning för invandrare'
	,[tutkintoon_johtamaton_koulutus_EN] = 'Preparatory education for migrants'
where [tutkintoon_johtamaton_koulutus_koodi] = '17'
