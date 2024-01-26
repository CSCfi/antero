USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_valtio_nykytila]    Script Date: 4.3.2022 11:48:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_valtio_nykytila] as

/*
truncate table VipunenTK.dbo.d_valtio
insert into VipunenTK.dbo.d_valtio
select * from [VipunenTK_DW].dbo.[v_valtio_nykytila]

drop table VipunenTK.dbo.d_valtio
select * into VipunenTK.dbo.d_valtio from [VipunenTK_DW].dbo.[v_valtio_nykytila]
*/

SELECT
	id = row_number() over (order by maanimi_s),
	valtio_avain = sa.maa,
	maa_koodi = sa.maa,
	--päivitä tarvittaessa tuplanimet
	maa = case when sa.maa in (736) then 'Entinen ' + maanimi_s else maanimi_s end, 
	maa_SV = case when sa.maa in (736) then 'Det forna ' + maanimi_r else maanimi_r end,
	maa_EN = case when sa.maa in (736) then 'Former ' + maanimi_e else maanimi_e end,
	eumaa_koodi = eumaa,
	eumaa = case eumaa when 1 then 'EU-maan kansalainen' when 2 then 'Ei EU-maan kansalainen' else 'Tuntematon' end,
	eumaa_SV = case eumaa when 1 then 'Ja' when 2 then 'Inte' else 'Information saknas' end,
	eumaa_EN = case eumaa when 1 then 'Yes' when 2 then 'No' else 'Missing data' end,
	etamaa_koodi = etamaa,
	etamaa = case etamaa when 1 then 'ETA-maan kansalainen' when 2 then 'Ei ETA-maan kansalainen' else 'Tuntematon' end,
	etamaa_SV = case etamaa when 1 then 'Ja' when 2 then 'Inte' else 'Information saknas' end,
	etamaa_EN = case etamaa when 1 then 'Yes' when 2 then 'No' else 'Missing data' end,
	maanosa_koodi = coalesce(mosa, 9),
	maanosa = coalesce(mosanim, 'Muut'),
	maanosa_SV = 
		case mosa
			when 1 then 'Europa'
			when 2 then 'Amerika'
			when 3 then 'Afrika'
			when 4 then 'Asien'
			when 5 then 'Oceanien'
			when 6 then 'Antarktis'
			else 'Övrig'
		end,
	maanosa_EN = 
		case mosa
			when 1 then 'Europe'
			when 2 then 'America'
			when 3 then 'Africa'
			when 4 then 'Asia'
			when 5 then 'Oceania'
			when 6 then 'Antarctic'
			else 'Other'
		end,
	maanosa2_koodi = coalesce(mosa_2, '99'),
	maanosa2 = coalesce(mosanim_2, 'Muut'),
	maanosa2_SV = 
		case mosa_2
			when '1A' then 'Nordeuropa'
			when '1B' then 'Västeuropa'
			when '1C' then 'Östeuropa'
			when '1D' then 'Sydeuropa'
			when '2A' then 'Nordamerika'
			when '2B' then 'Latinamerika och Karibia'
			when '3A' then 'Nordafrika'
			when '3B' then 'Västafrika'
			when '3C' then 'Centralafrika'
			when '3D' then 'Östafrika'
			when '3E' then 'Sydafrika'
			when '4A' then 'Västasien'
			when '4C' then 'Mellanöstern'
			when '4D' then 'Sydostasien'
			when '4E' then 'Sydasien'
			when '4F' then 'Centralasien'
			when '5A' then 'Australien och Nya Zeeland'
			when '5B' then 'Melanesien'
			when '5C' then 'Mikronesien'
			when '5D' then 'Polynesien'
			else 'Övrig'
		end,
	maanosa2_EN = 
		case mosa_2
			when '1A' then 'Northern Europe'
			when '1B' then 'Western Europe'
			when '1C' then 'Eastern Europe'
			when '1D' then 'Southern Europe'
			when '2A' then 'North America'
			when '2B' then 'Latin America and Caribbean'
			when '3A' then 'North Africa'
			when '3B' then 'West Africa'
			when '3C' then 'Central Africa'
			when '3D' then 'East Africa'
			when '3E' then 'South Africa'
			when '4A' then 'Western Asia'
			when '4C' then 'Middle East'
			when '4D' then 'Southeast Asia'
			when '4E' then 'South Asia'
			when '4F' then 'Central Asia'
			when '5A' then 'Australia and New Zealand'
			when '5B' then 'Melanesia'
			when '5C' then 'Micronesia'
			when '5D' then 'Polynesia'
			else 'Other'
		end,
	maanosa3_koodi = coalesce(mosa_3, '999'),
	maanosa3 = coalesce(mosanim_3, 'Muut'),
	maanosa3_SV =
		case mosa_3
			when '1AA' then 'Norden'
			when '1AB' then 'Baltikum'
			when '1AC' then 'Brittiska öarna'
			when '2BA' then 'Karibia'
			when '2BB' then 'Centralamerika'
			when '2BC' then 'Sydamerika'
			else 'Övrig'
		end,
	maanosa3_EN = 
		case mosa_3
			when '1AA' then 'Nordic countries'
			when '1AB' then 'Baltic states'
			when '1AC' then 'British Isles'
			when '2BA' then 'Caribbean'
			when '2BB' then 'Central America'
			when '2BC' then 'South America'
			else 'Other'
		end,
	jarjestys = 100 + row_number() over (order by maanimi_s),
	jarjestys_eumaa = case when eumaa in (1,2) then eumaa else 9998 end,
	jarjestys_etamaa = case when etamaa in (1,2) then eumaa else 9998 end,
	jarjestys_maanosa = case when mosa in (1,2,3,4,5,6) then mosa else 9998 end,
	jarjestys_maanosa2 = case when mosa_2 in ('1A','1B','1C','1D','2A','2B','3A','3B','3C','3D','3E','4A','4C','4D','4E','4F','5A','5B','5C','5D') then dense_rank() over (order by mosa_2) else '9998' end,
	jarjestys_maanosa3 = case when mosa_3 in ('1AA','1AB','1AC','2BA','2BB','2BC') then dense_rank() over (order by mosa_3) else '9998' end,
	virhetilanne='E',poistettu='0',tietolahde='TK 6_9',kommentti='CSC Juha 4.3.2022'

FROM VipunenTK_SA.dbo.v_sa_6_9_Valtiot sa
JOIN (
	select maa, maxtilv = max(tilv)
	from VipunenTK_SA.dbo.v_sa_6_9_Valtiot
	group by maa
) nykyselitteet ON sa.maa = nykyselitteet.maa and sa.tilv =  nykyselitteet.maxtilv


UNION


-- -1, -2, ryhmittelyavaimet, entiset (vanhat)
SELECT
	id = case when v.virhetilanne = 'K' then v.id else 1000 + rank() over (order by v.id) end, 
	v.valtio_avain,
	nullif(v.maa_koodi,''),
	v.maa,
	v.maa_SV,
	v.maa_EN,
	v2.eumaa_koodi,
	v2.eumaa,
	v2.eumaa_SV,
	v2.eumaa_EN,
	v2.etamaa_koodi,
	v2.etamaa,
	v2.etamaa_SV,
	v2.etamaa_EN,
	v2.maanosa_koodi,
	v.maanosa,
	v.maanosa_SV,
	v.maanosa_EN,
	v2.maanosa2_koodi,
	v2.maanosa2,
	v2.maanosa2_SV,
	v2.maanosa2_EN,
	v2.maanosa3_koodi,
	v2.maanosa3,
	v2.maanosa3_SV,
	v2.maanosa3_EN,
	jarjestys = case when v.virhetilanne = 'K' or isnumeric(v.valtio_avain) = 0 then v.jarjestys else 1100 + row_number() over (order by v.maa) end,
	v2.jarjestys_eumaa,
	v2.jarjestys_etamaa,
	v.jarjestys_maanosa,
	v2.jarjestys_maanosa2,
	v2.jarjestys_maanosa3,
	v.virhetilanne,
	v.poistettu,
	v.tietolahde,
	v.kommentti 
	
FROM VipunenTK_lisatiedot..v_valtio v
LEFT JOIN VipunenTK_lisatiedot..v_valtio v2 on v2.id = '-1'

WHERE v.virhetilanne = 'K' 
  or isnumeric(v.valtio_avain) = 0 
  or (v.maa like 'Entinen%' and v.valtio_avain not in (select distinct maa from VipunenTK_SA.dbo.v_sa_6_9_Valtiot))



GO

