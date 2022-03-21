USE [VipunenTK_lisatiedot]
GO

DELETE FROM [dbo].[Vipunen_aineisto_fakta_proseduuri]
      WHERE aineisto_avain = 'TK_K3_9'
	  and fakta = 'f_aloittaneiden_lapaisy'
	  and proseduuri = 'p_lataa_f_aloittaneiden_lapaisy'
GO

UPDATE [dbo].[Vipunen_aineisto_fakta_proseduuri]
   SET [fakta] = NULL
      ,[proseduuri] = NULL
 WHERE aineisto_avain = 'TK_K3_9'
	  and fakta = 'f_aloittaneiden_lapaisy'
	  and proseduuri = 'p_lataa_f_aloittaneiden_lapaisy_esivalmistelu'
GO

USE [ANTERO]
