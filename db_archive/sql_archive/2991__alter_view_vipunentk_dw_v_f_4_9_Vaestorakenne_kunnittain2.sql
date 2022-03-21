USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_4_9_Vaestorakenne_kunnittain2]    Script Date: 15.4.2020 16:53:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_4_9_Vaestorakenne_kunnittain2] AS

-- truncate table f_4_9_Vaestorakenne_kunnittain
-- insert into f_4_9_Vaestorakenne_kunnittain select * from v_f_4_9_Vaestorakenne_kunnittain

SELECT 
	tilastointivuosi = f.tilastointivuosi
	,sukupuoli = f.sukupuoli
	,kotikunta  = f.kotikunta
	,aidinkieli_versio2 = f.aidinkieli_versio2
	,kansalaisuus_versio1 = f.kansalaisuus_versio1
	,maanosa = f.maanosa
	,pohjoismaa = f.pohjoismaa
	,eumaa  = f.eumaa
	,etamaa = f.etamaa
	,ika  = cast(f.ika as nvarchar(5))
	,lukumaara = f.lukumaara
	,tietolahde = f.tietolahde
	,aineistotunnus = f.aineistotunnus
	,aidinkieli = f.aidinkieli

FROM (

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 0
	,lukumaara = ika0
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika0>0


UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 1
	,lukumaara = ika1
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika1>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 2
	,lukumaara = ika2
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika2>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 3
	,lukumaara = ika3
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika3>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 4
	,lukumaara = ika4
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika4>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 5
	,lukumaara = ika5
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika5>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 6
	,lukumaara = ika6
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika6>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 7
	,lukumaara = ika7
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika7>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 8
	,lukumaara = ika8
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika8>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 9
	,lukumaara = ika9
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika9>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 10
	,lukumaara = ika10
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika10>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 11
	,lukumaara = ika11
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika11>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 12
	,lukumaara = ika12
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika12>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 13
	,lukumaara = ika13
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika13>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 14
	,lukumaara = ika14
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika14>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 15
	,lukumaara = ika15
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika15>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 16
	,lukumaara = ika16
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika16>0


UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 17
	,lukumaara = ika17
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika17>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 18
	,lukumaara = ika18
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika18>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 19
	,lukumaara = ika19
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika19>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 20
	,lukumaara = ika20
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika20>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 21
	,lukumaara = ika21
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika21>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 22
	,lukumaara = ika22
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika22>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 23
	,lukumaara = ika23
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika23>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 24
	,lukumaara = ika24
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika24>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 25
	,lukumaara = ika25
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika25>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 26
	,lukumaara = ika26
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika26>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 27
	,lukumaara = ika27
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika27>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 28
	,lukumaara = ika28
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika28>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 29
	,lukumaara = ika29
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika29>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 30
	,lukumaara = ika30
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika30>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 31
	,lukumaara = ika31
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika31>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 32
	,lukumaara = ika32
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika32>0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 33
	,lukumaara = ika33
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika33 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 34
	,lukumaara = ika34
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika34 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 35
	,lukumaara = ika35
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika35 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 36
	,lukumaara = ika36
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika36 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 37
	,lukumaara = ika37
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika37 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 38
	,lukumaara = ika38
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika38 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 39
	,lukumaara = ika39
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika39 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 40
	,lukumaara = ika40
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika40 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 41
	,lukumaara = ika41
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika41 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 42
	,lukumaara = ika42
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika42 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 43
	,lukumaara = ika43
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika43 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 44
	,lukumaara = ika44
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika44 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 45
	,lukumaara = ika45
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika45 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 46
	,lukumaara = ika46
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika46 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 47
	,lukumaara = ika47
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika47 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 48
	,lukumaara = ika48
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika48 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 49
	,lukumaara = ika49
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika49 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 50
	,lukumaara = ika50
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika50 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 51
	,lukumaara = ika51
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika51 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 52
	,lukumaara = ika52
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika52 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 53
	,lukumaara = ika53
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika53 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 54
	,lukumaara = ika54
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika54 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 55
	,lukumaara = ika55
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika55 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 56
	,lukumaara = ika56
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika56 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 57
	,lukumaara = ika57
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika57 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 58
	,lukumaara = ika58
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika58 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 59
	,lukumaara = ika59
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika59 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 60
	,lukumaara = ika60
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika60 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 61
	,lukumaara = ika61
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika61 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 62
	,lukumaara = ika62
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika62 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 63
	,lukumaara = ika63
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika63 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 64
	,lukumaara = ika64
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika64 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 65
	,lukumaara = ika65
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika65 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 66
	,lukumaara = ika66
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika66 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 67
	,lukumaara = ika67
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika67 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 68
	,lukumaara = ika68
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika68 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 69
	,lukumaara = ika69
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika69 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 70
	,lukumaara = ika70
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika70 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 71
	,lukumaara = ika71
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika71 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 72
	,lukumaara = ika72
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika72 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 73
	,lukumaara = ika73
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika73 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 74
	,lukumaara = ika74
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika74 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 75
	,lukumaara = ika75
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika75 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 76
	,lukumaara = ika76
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika76 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 77
	,lukumaara = ika77
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika77 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 78
	,lukumaara = ika78
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika78 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 79
	,lukumaara = ika79
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika79 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 80
	,lukumaara = ika80
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika80 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 81
	,lukumaara = ika81
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika81 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 82
	,lukumaara = ika82
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika82 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 83
	,lukumaara = ika83
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika83 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 84
	,lukumaara = ika84
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika84 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 85
	,lukumaara = ika85
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika85 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 86
	,lukumaara = ika86
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika86 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 87
	,lukumaara = ika87
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika87 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 88
	,lukumaara = ika88
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika88 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 89
	,lukumaara = ika89
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika89 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 90
	,lukumaara = ika90
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika90 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 91
	,lukumaara = ika91
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika91 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 92
	,lukumaara = ika92
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika92 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 93
	,lukumaara = ika93
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika93 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 94
	,lukumaara = ika94
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika94 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 95
	,lukumaara = ika95
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika95 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 96
	,lukumaara = ika96
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika96 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 97
	,lukumaara = ika97
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika97 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 98
	,lukumaara = ika98
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika98 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 99
	,lukumaara = ika99
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika99 > 0

UNION ALL

SELECT
	 tilastointivuosi = tilv
	,sukupuoli = sp
	,kotikunta = tilvaskun
	,aidinkieli_versio2 = aikielir2
	,kansalaisuus_versio1 = kansalr1
	,maanosa = mosa
	,pohjoismaa = pohjmaa
	,eumaa = eumaa
	,etamaa = etamaa
	,ika = 100
	,lukumaara = ika100_
	,tietolahde = tietolahde
-- johdetut
	,aineistotunnus = '4.9'
	,aidinkieli = cast(
	(
		case
		when aikielir2 in ('fi','se') then 'fs'
		when aikielir2 = 'sv' then 'sv'
		else '99'
		end
	)
	as nvarchar(2))
FROM VipunenTK_DW.[dbo].[sa_4_9_Vaestorakenne_kunnittain] f
WHERE ika100_ > 0



) F




GO


USE [ANTERO]