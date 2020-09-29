USE [ANTERO]
GO
/****** Object:  View [sa].[v_rahoitusmalli_iscfi_rahoitusmalliala]    Script Date: 29.9.2020 14:54:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[sa].[v_rahoitusmalli_iscfi_rahoitusmalliala]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [sa].[v_rahoitusmalli_iscfi_rahoitusmalliala] AS

SELECT distinct
	 iscfi2013_koodi
	,alkaa = case when isnumeric(right(sar_nimi2,4))=0 then 2017 else right(sar_nimi2,4) end
	,paattyy = 
		case 
			when sar_nimi like ''ammatti%'' then null
			when sar_nimi like ''yli%'' and right(sar_nimi2,4)=''2021'' then null
			else 2020
		end
	,sektori = case when sar_nimi like ''%ammatti%'' then ''amk'' else ''yo'' end
	,rahoitusala_koodi
	,rahoitusala_nimi

FROM [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala]
UNPIVOT (rahoitusala_koodi FOR sar_nimi IN (
	[Ammattikorkeakoulut_tutkintotavoitteet_koodi]
	,[Yliopistot_tutkintotavoitteet_koodi]
	,[Yliopistot_tutkintotavoitteet2021_koodi]
)) unpvt

UNPIVOT (rahoitusala_nimi FOR sar_nimi2 IN (
	[Ammattikorkeakoulut_tutkintotavoitteet]
	,[Yliopistot_tutkintotavoitteet]
	,[Yliopistot_tutkintotavoitteet2021]
)) unpvt
WHERE 1=1
and replace(sar_nimi,''_koodi'','''')=sar_nimi2
and rahoitusala_koodi not in (998,999)' 
