USE [ANTERO]
GO
/****** Object:  StoredProcedure [dbo].[lataa_sources_TK]    Script Date: 13.12.2022 19:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[lataa_sources_TK] as


insert into [dbo].[sources] (
	[source_avain]
	,[source]
	,[source2]
)
select distinct 
	replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_')
    ,'TK-aineisto ' + replace(replace(replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_'),'TK_',''),'_','.')
    ,'Tilastokeskus'
from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto]
where replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_') not in (select source_avain from [dbo].[sources])
--order by replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_')


insert into [dbo].[tabular_source] (
	[tabular]
	,[source_avain]
)
select distinct 
	[kuutio_nimi]
	,replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_')
from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] ak
join [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio] k on k.kuutio_avain = ak.kuutio_avain
where concat([kuutio_nimi], '|', replace(replace([aineisto_avain],'TK_K','TK_'),'TK_R','TK_')) not in (select concat([tabular], '|', [source_avain]) from [dbo].[tabular_source])
--order by [kuutio_nimi]