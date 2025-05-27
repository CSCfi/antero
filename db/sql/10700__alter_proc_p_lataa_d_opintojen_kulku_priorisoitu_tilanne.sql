USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_opintojen_kulku_priorisoitu_tilanne]    Script Date: 21.3.2025 13.53.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dw].[p_lataa_d_opintojen_kulku_priorisoitu_tilanne] AS 

DROP TABLE IF EXISTS [dw].[d_opintojen_kulku_priorisoitu_tilanne]

CREATE TABLE [dw].[d_opintojen_kulku_priorisoitu_tilanne](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koulutus_kytkin] [varchar](50) NULL,
	[priorisoitu_tilanne_koodi] [int] NULL,
	[priorisoitu_tilanne_fi] [varchar](255) NULL,
	[priorisoitu_tilanne_se] [varchar](255) NULL,
	[priorisoitu_tilanne_en] [varchar](255) NULL
) ON [PRIMARY]

set identity_insert dw.d_opintojen_kulku_priorisoitu_tilanne on

insert into dw.d_opintojen_kulku_priorisoitu_tilanne (
	id,
	koulutus_kytkin,
	priorisoitu_tilanne_koodi,
	priorisoitu_tilanne_fi,
	priorisoitu_tilanne_se,
	priorisoitu_tilanne_en
)
select
	-1,
	'tuntematon',
	99,
	nimi,
	nimi_sv,
	nimi_en
from sa.sa_koodistot
where koodisto='vipunenmeta'
and koodi='-1'

set identity_insert dw.d_opintojen_kulku_priorisoitu_tilanne off


INSERT INTO ANTERO.dw.d_opintojen_kulku_priorisoitu_tilanne

VALUES 
--('ammatillinen', 1, N'Valmistunut alkuperäisestä tutkinnosta', NULL, NULL),
--('ammatillinen', 2, N'Valmistunut toisesta ammatillisesta tutkinnosta', NULL, NULL),
--('ammatillinen', 3, N'Jatkaa alkuperäisessä tutkinnossa', NULL, NULL),
--('ammatillinen', 4, N'Jatkaa toisessa amm. tutkinnossa', NULL, NULL),
--('ammatillinen', 5, N'Jatkaa amm. valmentavassa koulutuksessa', NULL, NULL),
--('ammatillinen', 6, N'Jatkaa TELMA-koulutuksessa', NULL, NULL),
--('ammatillinen', 7, N'Jatkaa muussa ammatillisessa koulutuksessa', NULL, NULL),
--('ammatillinen', 8, N'Keskeyttänyt ammatillisen koulutuksen', NULL, NULL),
('ammatillinen', 10, N'Valmistunut alkuperäisestä koko tutkinnosta', NULL, NULL),
('ammatillinen', 20, N'Valmistunut toisesta amm. koko tutkinnosta', NULL, NULL),
('ammatillinen', 30, N'Jatkaa alkuperäisessä koko tutkinnossa', NULL, NULL),
('ammatillinen', 40, N'Jatkaa toisessa amm. koko tutkinnossa', NULL, NULL),
('ammatillinen', 50, N'Jatkaa amm. valmentavassa koulutuksessa', NULL, NULL),
('ammatillinen', 70, N'Jatkaa muussa ammatillisessa koulutuksessa', NULL, NULL),
('ammatillinen', 80, N'Keskeyttänyt ammatillisen koulutuksen', NULL, NULL),
('ammatillinen', 41, N'Valmistunut amm. tutkinnon osan/osien koulutuksesta', NULL, NULL),
('ammatillinen', 42, N'Jatkaa amm. tutkinnon osan/osien koulutuksessa', NULL, NULL),
('ammatillinen', 43, N'Valmistunut amm. valmentavasta koulutuksesta', NULL, NULL),
('yleissivistava2aste', 1, N'Suorittanut aloitetun oppimäärän', NULL, NULL),
('yleissivistava2aste', 2, N'Suorittanut eri yleissiv. oppimäärän', NULL, NULL),
('yleissivistava2aste', 3, N'Jatkaa alkuperäisessä oppimäärässä', NULL, NULL),
('yleissivistava2aste', 4, N'Jatkaa toisessa yleissiv. oppimäärässä', NULL, NULL),
('yleissivistava2aste', 5, N'Suorittanut ammatillisen tutkinnon', NULL, NULL),
('yleissivistava2aste', 6, N'Jatkaa ammatillisessa koulutuksessa', NULL, NULL),
('yleissivistava2aste', 8, N'Keskeyttänyt toisen asteen', NULL, NULL),
('oppivelvolliset', 1, N'Valmistunut alkuperäisestä koko tutkintoon johtavasta koulutuksesta', N'Utexaminerad från den ursprungliga utbildningen som leder till hela examen', NULL),
('oppivelvolliset', 2, N'Valmistunut muusta koko tutkintoon johtavasta koulutuksesta', N'Utexaminerad från en annan utbildning som leder till hela examen', NULL),
('oppivelvolliset', 3, N'Jatkaa alkuperäisessä koko tutkintoon johtavassa koulutuksessa', N'Fortsätter i den ursprungliga utbildningen som leder till hela examen', NULL),
('oppivelvolliset', 4, N'Jatkaa muussa koko tutkintoon johtavassa koulutuksessa', N'Fortsätter i annan utbildning som leder till hela examen', NULL),
('oppivelvolliset', 5, N'Valmistunut alkuperäisestä valmentavasta koulutuksesta', N'Utexaminerad från den ursprungliga förberedande utbildningen', NULL),
('oppivelvolliset', 6, N'Valmistunut muusta valmentavasta koulutuksesta', N'Utexaminerad från en annan förberedande utbildning', NULL),
('oppivelvolliset', 7, N'Jatkaa alkuperäisessä valmentavassa koulutuksessa', N'Fortsätter i den ursprungliga förberedande utbildningen', NULL),
('oppivelvolliset', 8, N'Jatkaa muussa valmentavassa koulutuksessa', N'Fortsätter i annan förberedande utbildning', NULL),
('oppivelvolliset', 9, N'Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta', N'Utexaminerad från utbildning för en eller flera delar av en yrkesexamen', NULL),
('oppivelvolliset', 10, N'Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa', N'Fortsätter i utbildningen för en eller flera delar av en yrkesexamen', NULL),
('oppivelvolliset', 11, N'Valmistunut perusopetuksen oppimäärän koulutuksesta', N'Utexaminerad från utbildning i lärokursen för den grundläggande utbildningen', NULL),
('oppivelvolliset', 12, N'Jatkaa perusopetuksen oppimäärän koulutuksessa', N'Fortsätter i utbildning för den grundläggande utbildningens lärokurs', NULL),
('oppivelvolliset', 13, N'Vapautettu oppivelvollisuudesta (ei koulutuksessa)', N'Befriad från läroplikt (deltar inte i utbildning)', NULL),
('oppivelvolliset', 14, N'Opiskeluoikeus oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä', N'Opisk.oikeus oppivel. suorittamiseen kelpaavassa koul. ja päätös oppivelv. suorittamisen keskeyttämisestä_SV', NULL),
('oppivelvolliset', 15, N'Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä', N'Ei opisk.oikeutta oppivelv. suorittamiseen kelpaavassa koul., päätös oppivelv. suorittamisen keskeyttämisestä_SV', NULL),
('oppivelvolliset', 16, N'Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, ei päätöstä oppivelvollisuuden suorittamisen keskeyttämisestä', N'Ei opisk.oikeutta oppivelv. suorittamiseen kelpaavassa koul., eikä päätöstä oppivelv. suorittamisen keskeyttämisestä_SV', NULL),
('toinen_aste', 1, N'Valmistunut alkuperäisestä koko tutkintoon johtavasta koulutuksesta', N'Utexaminerad från den ursprungliga utbildningen som leder till hela examen', NULL),
('toinen_aste', 2, N'Valmistunut muusta koko tutkintoon johtavasta koulutuksesta', N'Utexaminerad från en annan utbildning som leder till hela examen', NULL),
('toinen_aste', 3, N'Jatkaa alkuperäisessä koko tutkintoon johtavassa koulutuksessa', N'Fortsätter i den ursprungliga utbildningen som leder till hela examen', NULL),
('toinen_aste', 4, N'Jatkaa muussa koko tutkintoon johtavassa koulutuksessa', N'Fortsätter i annan utbildning som leder till en hel examen', NULL),
('toinen_aste', 5, N'Jatkaa alkuperäisessä valmentavassa koulutuksessa', N'Fortsätter i den ursprungliga utbildningen som handleder för examen', NULL),
('toinen_aste', 6, N'Jatkaa muussa valmentavassa koulutuksessa', N'Fortsätter i annan utbildning som handleder för examen', NULL),
('toinen_aste', 7, N'Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta', N'Utexaminerad från utbildning för en eller flera delar av en yrkesexamen', NULL),
('toinen_aste', 8, N'Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa', N'Fortsätter i utbildningen för en eller flera delar av en yrkesexamen', NULL),
('toinen_aste', 98, N'Ei valmistunut eikä edellä mainituissa koulutuksissa', N'Varken utexaminerad eller i ovan nämnda utbildningar', NULL)

GO

USE [ANTERO]