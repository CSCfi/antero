USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvolliset_hv_opiskelu]    Script Date: 17.10.2022 14:21:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--exec [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_opiskelutiedot] 

CREATE OR ALTER PROCEDURE [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_opiskelutiedot] AS

declare @max_ajankohta date = (select max([ajankohta]) as max_ajankohta from [dw].[f_koski_oppivelvolliset])

drop table if exists dw._temp_koski_hakeutumisvelvolliset_opiskelutiedot

select * into dw._temp_koski_hakeutumisvelvolliset_opiskelutiedot
from
(
	select distinct

	--apu
    f.oppija_oid
	,[max_ajankohta] = @max_ajankohta
	,[koodit_koulutusnimike_hv_opiskelutiedot] = coalesce(d6.koulutusluokitus_koodi, '-1')

	--aika
	,f.[tilastovuosi]
    ,[Opiskelun tarkasteluhetki] = 
		case 
			when f.ajankohta = @max_ajankohta then 'Viimeisin / Ei vielä tarkastelua tilastovuonna'
			else concat(d11.kuukausi_fi, 'n ', day(f.ajankohta), '.') 
		end 

	--hlö
	,[Täyttänyt 18 v. (opiskelun tarkasteluhetki)] = 
		case f.ika_18_tarkasteluhetkella_hv 
			when 1 then 'Kyllä' 
			when 0 then 'Ei / Ei vielä tarkastelua tilastovuonna' 
		end
		
	--koulutus
	,[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)] = case when f.oppivelvollisuuden_suorittamiseen_kelpaava_hv = 1 then 'Kyllä' else 'Ei' end
	,[Koulutustyyppi (opiskelun tarkasteluhetki)] = coalesce(
		case
			when koulutusmoduuli_koodiarvo_hv = '301101' then 'Lukiokoulutus'
			when koulutusmoduuli_koodiarvo_hv in (/*'301101',*/'301102','301103','301104') then d6.koulutusluokitus_fi
			else d9.selite_fi			
		end
		,'Tieto puuttuu'
	)
	,[Koulutusmuoto (opiskelun tarkasteluhetki)] = d7.selite_fi
	,[Suorituksen tyyppi (opiskelun tarkasteluhetki)] = d8.selite_fi

	--jarjestys
	,[jarjestys_opiskelun_tarkasteluhetki] = concat(10+month(f.ajankohta), 10+day(f.ajankohta))
	,[jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki] = d7.jarjestys
	,[jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki] = d8.jarjestys

	FROM [dw].[f_koski_oppivelvolliset] f 
	LEFT JOIN [dw].[d_koulutusluokitus] d6 on d6.koulutusluokitus_koodi = f.koulutusmoduuli_koodiarvo_hv
	LEFT JOIN [dw].[d_koski_koulutusmuoto] d7 on d7.koodi = f.koulutusmuoto_hv
	LEFT JOIN [dw].[d_koski_suorituksen_tyyppi] d8 on d8.koodi = f.suorituksen_tyyppi_hv
	LEFT JOIN [dw].[d_koulutustyyppi] d9 on d9.koodi = d6.koulutustyyppi_koodi
	LEFT JOIN [dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta

	WHERE f.tilastokuukausi between 9 and 12 
	OR f.ov_kuutioon = 0 --livetieto

) q

GO
