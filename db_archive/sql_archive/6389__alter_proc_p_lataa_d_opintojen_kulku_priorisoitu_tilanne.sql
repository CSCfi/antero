USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opintojen_kulku_priorisoitu_tilanne]    Script Date: 3.9.2022 0:50:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_opintojen_kulku_priorisoitu_tilanne] AS 


DROP TABLE IF EXISTS [dw].[d_opintojen_kulku_priorisoitu_tilanne]
CREATE TABLE [dw].[d_opintojen_kulku_priorisoitu_tilanne](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koulutus_kytkin] [varchar](50) NULL,
	[priorisoitu_tilanne_koodi] [int] NULL,
	[priorisoitu_tilanne_fi] [varchar](100) NULL,
	[priorisoitu_tilanne_se] [varchar](100) NULL,
	[priorisoitu_tilanne_en] [varchar](100) NULL
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
('yleissivistava2aste','3','Jatkaa alkuperäisessä tutkinnossa',NULL,NULL),
('yleissivistava2aste','4','Jatkaa toisessa yleissiv. tutkinnossa',NULL,NULL),
('yleissivistava2aste','6','Jatkaa ammatillisessa koulutuksessa',NULL,NULL),
('yleissivistava2aste','8','Keskeyttänyt toisen asteen',NULL,NULL),
--('yleissivistava2aste','99','Tieto puuttuu',NULL,NULL),
('yleissivistava2aste','5','Suorittanut ammatillisen tutkinnon',NULL,NULL)