use VipunenTK_lisatiedot
go

if not exists (select * from dbo.AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys where koulutuksen_jarjestajakoodi = '0116845-4')

insert dbo.AL_koulutuksen_jarjestaja_nykytila_OKM_selvitys
(
	luotu,
	koulutuksen_jarjestajakoodi,
	tiedoksi_koulutuksen_jarjestaja,
	koulutuksen_jarjestajakoodi_nykytila,
	tiedoksi_koulutuksen_jarjestaja_nykytila,
	tietolahde,
	kommentti,
	kommentti2
)
values(
	'2022-06-27',
	'0116845-4',
	'Haaga instituutti-säätiö',
	'2029188-8',
	'Haaga-Helia Ammattikorkeakoulu',
	'manuaalinen',
	'CSC Juha',
	''
)
