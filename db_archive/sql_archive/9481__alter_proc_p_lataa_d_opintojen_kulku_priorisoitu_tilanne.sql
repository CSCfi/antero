USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_opintojen_kulku_priorisoitu_tilanne]    Script Date: 15.1.2024 8:37:22 ******/
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
	[priorisoitu_tilanne_fi] [varchar](max) NULL,
	[priorisoitu_tilanne_se] [varchar](max) NULL,
	[priorisoitu_tilanne_en] [varchar](max) NULL
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
('ammatillinen','1','Valmistunut alkuperäisestä tutkinnosta',NULL,NULL),
('ammatillinen','2','Valmistunut toisesta ammatillisesta tutkinnosta',NULL,NULL),
('ammatillinen','3','Jatkaa alkuperäisessä tutkinnossa',NULL,NULL),
('ammatillinen','4','Jatkaa toisessa amm. tutkinnossa',NULL,NULL),
('ammatillinen','5','Jatkaa amm. valmentavassa koulutuksessa',NULL,NULL),
('ammatillinen','6','Jatkaa TELMA-koulutuksessa',NULL,NULL),
('ammatillinen','7','Jatkaa muussa ammatillisessa koulutuksessa',NULL,NULL),
('ammatillinen','8','Keskeyttänyt ammatillisen koulutuksen',NULL,NULL),
--('yleissivistava2aste','99','Tieto puuttuu',NULL,NULL),
('yleissivistava2aste','1','Suorittanut aloitetun oppimäärän',NULL,NULL),
('yleissivistava2aste','2','Suorittanut eri yleissiv. oppimäärän',NULL,NULL),
('yleissivistava2aste','3','Jatkaa alkuperäisessä oppimäärässä',NULL,NULL),
('yleissivistava2aste','4','Jatkaa toisessa yleissiv. oppimäärässä',NULL,NULL),
('yleissivistava2aste','6','Jatkaa ammatillisessa koulutuksessa',NULL,NULL),
('yleissivistava2aste','8','Keskeyttänyt toisen asteen',NULL,NULL),
--('yleissivistava2aste','99','Tieto puuttuu',NULL,NULL),
('yleissivistava2aste','5','Suorittanut ammatillisen tutkinnon',NULL,NULL),
('oppivelvolliset','1','Valmistunut alkuperäisestä koko tutkintoon johtavasta koulutuksesta','Utexaminerad från den ursprungliga utbildningen som leder till hela examen',NULL),
('oppivelvolliset','2','Valmistunut muusta koko tutkintoon johtavasta koulutuksesta','Utexaminerad från en annan utbildning som leder till hela examen',NULL),
('oppivelvolliset','3','Jatkaa alkuperäisessä koko tutkintoon johtavassa koulutuksessa','Fortsätter i den ursprungliga utbildningen som leder till hela examen',NULL),
('oppivelvolliset','4','Jatkaa muussa koko tutkintoon johtavassa koulutuksessa','Fortsätter i annan utbildning som leder till hela examen',NULL),
('oppivelvolliset','5','Valmistunut alkuperäisestä valmentavasta koulutuksesta','Utexaminerad från den ursprungliga förberedande utbildningen',NULL),
('oppivelvolliset','6','Valmistunut muusta valmentavasta koulutuksesta','Utexaminerad från en annan förberedande utbildning',NULL),
('oppivelvolliset','7','Jatkaa alkuperäisessä valmentavassa koulutuksessa','Fortsätter i den ursprungliga förberedande utbildningen',NULL),
('oppivelvolliset','8','Jatkaa muussa valmentavassa koulutuksessa','Fortsätter i annan förberedande utbildning',NULL),
('oppivelvolliset','9','Valmistunut ammatillisen tutkinnon osan/osien koulutuksesta','Utexaminerad från utbildning för en eller flera delar av en yrkesexamen',NULL),
('oppivelvolliset','10','Jatkaa ammatillisen tutkinnon osan/osien koulutuksessa','Fortsätter i utbildningen för en eller flera delar av en yrkesexamen',NULL),
('oppivelvolliset','11','Valmistunut perusopetuksen oppimäärän koulutuksesta','Utexaminerad från utbildning i lärokursen för den grundläggande utbildningen',NULL),
('oppivelvolliset','12','Jatkaa perusopetuksen oppimäärän koulutuksessa','Fortsätter i utbildning för den grundläggande utbildningens lärokurs',NULL),
('oppivelvolliset','13','Vapautettu oppivelvollisuudesta (ei koulutuksessa)','Befriad från läroplikt (deltar inte i utbildning)' ,NULL),
('oppivelvolliset','14','Opiskeluoikeus oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa ja päätös oppivelvollisuuden suorittamisen keskeyttämisestä','Studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, beslut om avbrytande av fullgörandet av läroplikten',NULL),
('oppivelvolliset','15','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä','Ingen studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, beslut om avbrytande av fullgörandet av läroplikten',NULL),
('oppivelvolliset','16','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, eikä päätöstä oppivelvollisuuden suorittamisen keskeyttämisestä','Ingen studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, inget beslut om avbrytande av fullgörandet av läroplikten',NULL)

GO

USE [ANTERO]