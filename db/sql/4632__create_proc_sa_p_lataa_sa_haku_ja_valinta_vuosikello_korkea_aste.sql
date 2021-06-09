USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 8.6.2021 21:52:03 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 8.6.2021 21:52:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste] as

declare @tanaan date = getdate()

truncate table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]

insert into [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]

select [haku]
      ,[haku_oid]
      ,[koulutuksen_alkamiskausi]

	--Priorisoidaan 
	--1) viimeisin päivityspvm (käynnistysehtona "tänään", yleisemmin ehtona raporteille pääsyyn) 
	--2) vasta tulossa oleva ensimmäinen päivityspvm (ihan vaan tiedoksi)
      ,[aloituspaikat] = coalesce(max(case when [aloituspaikat] <= @tanaan then [aloituspaikat] end), min([aloituspaikat]))
      ,[hakijat] = coalesce(max(case when [hakijat] <= @tanaan then [hakijat] end), min([hakijat]))
      ,[valitut] = coalesce(max(case when [valitut] <= @tanaan then [valitut] end), min([valitut]))
      ,[vastaanottaneet] = coalesce(max(case when [vastaanottaneet] <= @tanaan then [vastaanottaneet] end), min([vastaanottaneet]))
      ,[aloittaneet] = coalesce(max(case when [aloittaneet] <= @tanaan then [aloittaneet] end), min([aloittaneet]))

from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt]

group by haku
,haku_oid
,koulutuksen_alkamiskausi



GO


