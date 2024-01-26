USE [ANTERO]
GO
/****** Object:  StoredProcedure [dbo].[lataa_sources_TK]    Script Date: 13.12.2022 19:30:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[lataa_tabular_source_TK] as

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