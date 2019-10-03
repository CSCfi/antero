USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 18.9.2017 15:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_8e_Korkeakoulut_opiskelijat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sa_2_8e_Korkeakoulut_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](1) NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[koultyp] [nvarchar](1) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[olotamm] [nvarchar](1) NULL,
	[olosyys] [nvarchar](1) NULL,
	[kkieli] [nvarchar](2) NULL,
	[ltop] [nvarchar](1) NULL,
	[laak] [nvarchar](1) NULL,
	[alvv_kksek] [nvarchar](4) NULL,
	[kansalr2] [nvarchar](1) NULL,
	[opoikv] [nvarchar](4) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[v_f_2_8e_Korkeakouluopiskelijat]    Script Date: 18.9.2017 15:48:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_f_2_8e_Korkeakouluopiskelijat]'))
EXEC dbo.sp_executesql @statement = N'










CREATE VIEW [dbo].[v_f_2_8e_Korkeakouluopiskelijat] AS

-- truncate table f_2_8e_Korkeakouluopiskelijat
-- insert into f_2_8e_Korkeakouluopiskelijat select * from v_f_2_8e_Korkeakouluopiskelijat
-- select * into dbo.f_2_8e_Korkeakouluopiskelijat from v_f_2_8e_Korkeakouluopiskelijat

SELECT 
	 tilastointivuosi = tilv
	,tilv_date = tilv_date
	,lahde = lahde
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,koulutusluokitus = koulk
	,koulutustyyppi = koultyp
	,sukupuoli = sp
	,aidinkieli_versio1 = aikielir1
	,syntymavuosi = syntv
	,syntymakuukausi = synkk
	,kirjoihintulovuosi = alvv
	,kirjoihintulokausi = allk
	,opiskelijan_olo_tamm = olotamm
	,opiskelijan_olo_syys = olosyys
	,koulutuksen_kieli = kkieli
	,patevyys_amk = ltop
    ,erikoislaakari = laak
	,kirjoihintulovuosi_korkeakoulu = alvv_kksek
    ,kansalaisuus_versio2 = kansalr2
    ,opoikv
	,lukumaara = lkm
	,tietolahde = left(tietolahde,50)
	,rivinumero = rivinumero
-- johdetut
	,aineistotunnus = ''3.4''
	,koulutussektori = cast(
	(
		case
		when lahde = ''*1'' then ''1''
		when lahde in (''21'',''22'',''23'') then ''2''
		when lahde in (''31'',''32'',''33'',''34'',''35'') then ''3''
		when lahde in (''41'',''42'') then ''4''
		when lahde in (''51'',''52'') then ''5''
		end
	)
	as nvarchar(2))
	,ika_1v = CAST(
	(
		case
		when isnumeric(syntv)=1 and syntv<tilv
		then cast(cast(tilv as int) - cast(syntv as int) as varchar)
		end
	)
	as nvarchar(4))
	
	,aloitusika = CAST(
	(
		case
		when ISNUMERIC(syntv)=1 and LEN(syntv)=4
		and ISNUMERIC(synkk)=1 and synkk between 1 and 12
		and ISNUMERIC(alvv)=1 and LEN(alvv)=4
		and ISNUMERIC(allk)=1 --and allk between 1 and 12
		and syntv<alvv
		then
		cast(
		 cast( ( cast(alvv as integer) + (cast((case allk when 1 then 1 when 2 then 9 end) as decimal)/12) )
			 - ( cast(syntv as integer) + (cast(synkk as decimal)/12) ) as decimal(18,6))
			 as decimal(18,6))
			 ELSE cast(-1 as decimal(18,6))
		end
	)
	as decimal(18,6))

	,jarjestys_aloitusika = CAST(
	(
		case
		when ISNUMERIC(syntv)=1 and LEN(syntv)=4
		and ISNUMERIC(synkk)=1 and synkk between 1 and 12
		and ISNUMERIC(alvv)=1 and LEN(alvv)=4
		and ISNUMERIC(allk)=1 --and allk between 1 and 12
		and syntv<alvv
		then
		cast(
		 cast( ( cast(alvv as integer) + (cast((case allk when 1 then 1 when 2 then 9 end) as decimal)/12) )
			 - ( cast(syntv as integer) + (cast(synkk as decimal)/12) ) as decimal(4,1))
			 as int)
			 ELSE -1
		end
	)
	as int)

	,aloittaneet = CAST(
	(
		case

			when lahde = 41
				and alvv = tilv 
				and koultyp not in (''6'' ,''7'')
				--and ensisop = 1
			then lkm  

			when alvv = tilv 
				and koultyp in (''6'',''7'')
				and olosyys  IN (''1'',''2'')
				--and ensisop = 1
			then lkm 

			when lahde = 51
				and alvv = tilv 
				and olosyys  IN (''1'',''2'')
				and koulk NOT IN (SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus where koulutusaste2002_koodi IN (''73'',''81'',''82'',''91''))
			then lkm 
		end
	)
	as int)

	,aloittaneet_korkeakoulusektori = cast(
	case when alvv_kksek=tilv and koulk NOT IN (SELECT DISTINCT koulutusluokitus_avain FROM vipunentk_dw..d_koulutusluokitus where koulutusaste2002_koodi IN (''73'',''81'',''82'',''91'')) then lkm end
	as int)


	,koulutuslaji_OKM_avain =
		CASE
			WHEN koultyp = ''1''
				THEN 13	--Ammattikorkeakoulututkinto (nuorten koulutus)  
			WHEN koultyp = ''2''
				THEN 14	--Ammattikorkeakoulututkinto (aikuiskoulutus)  
			WHEN koultyp = ''6'' 
				THEN 15	--Ylempi ammattikorkeakoulututkinto  
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 63
							)
				THEN 16	--Alempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 72
							)
				THEN 17	--Ylempi korkeakoulututkinto  
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 73
							)
				THEN 18	--Lääkärien erikoistumiskoulutus
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 81
							)

				THEN 19	--Lisensiaatintutkinto
			WHEN koulk IN (
							SELECT [koulutusluokitus_avain]
							FROM [VipunenTK_DW].[dbo].[d_koulutusluokitus]
							where koulutusaste2002_koodi = 82
							)

				THEN 20	--Tohtorintutkinto

			ELSE -1
		END



FROM VipunenTK_DW.dbo.sa_2_8e_Korkeakoulut_opiskelijat











' 
GO

USE [ANTERO]