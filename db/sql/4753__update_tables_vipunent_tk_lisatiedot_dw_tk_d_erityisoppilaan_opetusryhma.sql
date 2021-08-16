  update [VipunenTK_lisatiedot].[dbo].[erityisoppilaan_opetusryhma]
  set [erityisoppilaan_opetusryhma] = 'Ei tietoa, näyttötutkintoon valmistava koulutus (-2017), oppisopimuskoulutus (-2018)'
	,[erityisoppilaan_opetusryhma_SV] = 'Inga uppgifter, förberedande utbildning för fristående examen (-2017), läroavtalsutbildning (-2018)'
	,[erityisoppilaan_opetusryhma_EN] = 'Unknown, preparatory training for competence-based qualification (-2017), apprenticeship training (-2018)'
  where [erityisoppilaan_opetusryhma_avain] = '9'

  update [VipunenTK_DW].[dbo].[d_erityisoppilaan_opetusryhma]
  set [erityisoppilaan_opetusryhma] = 'Ei tietoa, näyttötutkintoon valmistava koulutus (-2017), oppisopimuskoulutus (-2018)'
	,[erityisoppilaan_opetusryhma_SV] = 'Inga uppgifter, förberedande utbildning för fristående examen (-2017), läroavtalsutbildning (-2018)'
	,[erityisoppilaan_opetusryhma_EN] = 'Unknown, preparatory training for competence-based qualification (-2017), apprenticeship training (-2018)'
  where [erityisoppilaan_opetusryhma_avain] = '9'

  update [VipunenTK].[dbo].[d_erityisoppilaan_opetusryhma]
  set [erityisoppilaan_opetusryhma] = 'Ei tietoa, näyttötutkintoon valmistava koulutus (-2017), oppisopimuskoulutus (-2018)'
	,[erityisoppilaan_opetusryhma_SV] = 'Inga uppgifter, förberedande utbildning för fristående examen (-2017), läroavtalsutbildning (-2018)'
	,[erityisoppilaan_opetusryhma_EN] = 'Unknown, preparatory training for competence-based qualification (-2017), apprenticeship training (-2018)'
  where [erityisoppilaan_opetusryhma_avain] = '9'