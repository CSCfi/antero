USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste]    Script Date: 3.2.2023 12:38:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste] as

declare @tanaan date = getdate()

truncate table [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]

insert into [sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]

select [haku]
      ,[haku_oid]
      ,[koulutuksen_alkamiskausi]

	--1) viimeisin päivityspvm (käynnistysehtona "tänään", yleisemmin ehtona raporteille pääsyyn)
	--2) seuraava tuleva ko. haun ko. tiedon päivityspvm
      ,[aloituspaikat] = coalesce(max(case when [aloituspaikat] <= @tanaan then [aloituspaikat] end), min([aloituspaikat]))
      ,[hakijat] = coalesce(max(case when [hakijat] <= @tanaan then [hakijat] end), min([hakijat]))
      ,[valitut] = coalesce(max(case when [valitut] <= @tanaan then [valitut] end), min([valitut]))
      ,[vastaanottaneet] = coalesce(max(case when [vastaanottaneet] <= @tanaan then [vastaanottaneet] end), min([vastaanottaneet]))
      ,[aloittaneet] = coalesce(max(case when [aloittaneet] <= @tanaan then [aloittaneet] end), min([aloittaneet]))
	  ,[visualisoinnit] = coalesce(max(case when [visualisoinnit] <= @tanaan then [visualisoinnit] end), min([visualisoinnit]))
	--seuraava tuleva ko. haun minkä tahansa tiedon päivityspvm
	  ,[seuraava_kaynnistys] = 
		coalesce(
					min(case when [aloituspaikat] > @tanaan then [aloituspaikat] end)
					,min(case when [hakijat] > @tanaan then [hakijat] end)
					,min(case when [valitut] > @tanaan then [valitut] end)
					,min(case when [vastaanottaneet] > @tanaan then [vastaanottaneet] end)
					,min(case when [aloittaneet] > @tanaan then [aloittaneet] end)
		)

from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt]

group by haku
,haku_oid
,koulutuksen_alkamiskausi

GO

USE [ANTERO]