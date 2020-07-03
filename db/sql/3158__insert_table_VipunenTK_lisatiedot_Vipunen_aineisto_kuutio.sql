USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] where kuutio_avain='TIM_TAB')

BEGIN

	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_3a','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_3b','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_3c','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_4a','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_4b','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_4c','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_8b','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_9c','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_2_11','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K2_22','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K3_12','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K4_3','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K4_2a','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K4_2b','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K4_2c','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K4_9','TIM_TAB')
	
	 insert [VipunenTK_lisatiedot].[dbo].[Vipunen_aineisto_kuutio] (aineisto_avain, kuutio_avain) values ('TK_K5_5','TIM_TAB')

END

GO

USE [ANTERO]
