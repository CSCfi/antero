use antero
go

update [ANTERO].[dw].[d_kalenteri]
  set lukukausi_fi = 'Kevät'	
	,lukukausi_sv = 'Vår'
	,lukukausi_en = 'Spring'
	,jarjestys_lukukausi_reverse = '2'
where kuukausi between 1 and 7;

update [ANTERO].[dw].[d_kalenteri]
  set lukukausi_fi = 'Syksy'	
	,lukukausi_sv = 'Höst'
	,lukukausi_en = 'Autumn'
	,jarjestys_lukukausi_reverse = '1'
where kuukausi between 8 and 12;

update [ANTERO].[dw].[d_kalenteri]
  set lukuvuosi =	case lukukausi_fi 
						when 'Syksy' then cast(vuosi as varchar) + '/' + cast(vuosi+1 as varchar)
						when 'Kevät' then cast(vuosi-1 as varchar) + '/' + cast(vuosi as varchar)
					end
where id <> -1