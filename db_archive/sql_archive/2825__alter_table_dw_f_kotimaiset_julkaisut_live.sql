USE ANTERO


ALTER TABLE [ANTERO].[dw].[f_kotimaiset_julkaisut_live] ALTER COLUMN julkaisunNimi  NVARCHAR(MAX) null
GO
ALTER TABLE [ANTERO].[dw].[f_kotimaiset_julkaisut_live] ALTER COLUMN tekijat  NVARCHAR(MAX) null
GO
ALTER TABLE [ANTERO].[dw].[f_kotimaiset_julkaisut_live] ALTER COLUMN lehdenNimi  NVARCHAR(MAX) null
GO
ALTER TABLE [ANTERO].[dw].[f_kotimaiset_julkaisut_live] ALTER COLUMN kustantajanNimi  NVARCHAR(MAX) null
GO
