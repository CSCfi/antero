USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutuksen_maa]    Script Date: 27.9.2023 13:02:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


--exec [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutuksen_maa]

ALTER   PROCEDURE [sa].[p_lataa_sa_hakeneet_kk_pohjakoulutuksen_maa] as

DROP INDEX IF EXISTS [NC_sa_hakeneet_kk_pohjakoulutuksen_maa] ON [sa].[sa_hakeneet_kk_pohjakoulutuksen_maa]

truncate table sa.sa_hakeneet_kk_pohjakoulutuksen_maa 

insert sa.sa_hakeneet_kk_pohjakoulutuksen_maa
select t.HenkiloOID, hk.koulutuksen_alkamisvuosi, hk.koulutuksen_alkamiskausi
,[pohjakoulutus_suomessa_priorisoitu] = max(
	case
		when yo.HenkiloOID is not null then 1
		when t.PohjakoulutusKKUlkomaat = 0 and nullif(t.PohjakoulutusKKLomakeKoodi,'') != 'pohjakoulutus_muu' then 1
		when t.PohjakoulutusKKUlkomaat = 1 then 0
	end
)
from sa.sa_odw_hakeneet t
left join sa.sa_hakukohde_koulutus hk on hk.hakukohde_oid = t.HakukohdeOID
left join (	SELECT
				HenkiloOID,	
				Valmistumisvuosi = MIN(YEAR(Valmistumispaivamaara))
			FROM [ANTERO].[sa].[sa_odw_yoarvosanat] f
			WHERE Tila = 'VALMIS'
			GROUP BY HenkiloOID
) yo on yo.Valmistumisvuosi <= hk.koulutuksen_alkamisvuosi and yo.HenkiloOID = t.HenkiloOID
group by t.HenkiloOID, hk.koulutuksen_alkamisvuosi, hk.koulutuksen_alkamiskausi

CREATE NONCLUSTERED INDEX [NC_sa_hakeneet_kk_pohjakoulutuksen_maa] ON [sa].[sa_hakeneet_kk_pohjakoulutuksen_maa]
(
	[HenkiloOID] ASC
)
INCLUDE ([koulutuksen_alkamisvuosi], [koulutuksen_alkamiskausi]) WITH (
	PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]

GO

USE [ANTERO]