USE [ANTERO]
GO
/****** Object:  StoredProcedure [dbo].[lataa_sources_TK]    Script Date: 12.12.2022 14:52:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[lataa_sources_TK] as

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