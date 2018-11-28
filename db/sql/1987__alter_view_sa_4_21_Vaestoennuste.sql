USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




/*
select * into VipunenTK_DW.dbo.f_4_21_Vaestoennuste from VipunenTK_SA.dbo.[v_sa_4_21_Vaestoennuste]
*/



ALTER VIEW [dbo].[v_sa_4_21_Vaestoennuste] AS


SELECT [ennv]
      ,[tilvaskun]
      ,[sp]
      ,[ika2] = 
				case 
					when ltrim([ika2]) between 95 and 99 then ltrim([ika2])+'v2'
					else ltrim([ika2])
				end
      ,[lkm]
	  ,[Ennustemalli]='Ennuste 2015'

      
  FROM [TK_H9098_CSC].[dbo].[TK_4_21_sopv_15]

Union ALL

/*
Luetaan Tilastokeskuksen rajapinnan kautta haettu data osaksi näkymää. Muutetaan sukupuoli ja ikä vastaamaan luokituksia.
*/

select
	[ennv] = Vuosi
	,[tilvaskun] = NULL
	,[sp] = 
			case 
				when Sukupuoli='Miehet' then 1 
				when Sukupuoli='Naiset' then 2 
			end
	,[ika2] = 
			case
				when ltrim([Ika]) in ('95','96','97','98','99') then ltrim([Ika])+'v2'
				when ltrim([Ika])='100-' then '100'
				else ltrim([Ika]) 
			end
	,[lkm]
	,[Ennustemalli]

FROM [VipunenTK_SA].[dbo].[sa_api_vaestoennuste]
Where Sukupuoli <> 'Sukupuolet yhteensä' and Ika <> 'Ikäluokat yhteensä'



GO
USE [ANTERO]

