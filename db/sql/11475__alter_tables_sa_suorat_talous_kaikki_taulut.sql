USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 22.12.2025 8.15.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


USE VipunenKK_SA
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN POISTOT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN LIIKEVAIHTO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KVARASTOJENL BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN OMKAYTT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUTTUOT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN AITATA BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN OSTOTILAIK BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VARASTLIS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN ULKPAL BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MATYHT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN PALKAT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN HSIVUKULUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN ELAKEKULUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MSIVUKULUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN HKULUTYHT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN AALENNUKSET BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VVPAALENNUKSET BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUTKULUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN LVOITTO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KONSTUOT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TUOTOSUU BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TUOTSAMAKONS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TUOTOTMUILT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUTKORKSAMKONS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUTKORKMUILT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN ARVOVASTAASIJO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN ARVOVAIHTVASTRAH BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KORKRAHKULUKONS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KORKRAHKULUMUUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VOITTO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN SATYHT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN SATTUOT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN SATKULUT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VOITENVEROJA BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN POISTOERO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VAPEHTVARA BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN RAHASIIRT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TULOVERO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUTVEROT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TILVOITTO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN OKMPERUS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN AKATEMIA BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN TEKES BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUOKM BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN SOSTURVARAH BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUVALTIO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KUNNAT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN VOTTAVOITTELEMATON BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KOTIYRITYS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KOTIRAH BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN KOTITALOUS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN EURAH BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN EURAHYRIT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN EURAHMUU BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUULKYRITYS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUUULKMUURAH BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MAKSUASETUS BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN MUULIIKEVAIHTO BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_1_tuloslaskelma ALTER COLUMN POIARVOYHT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ALTER COLUMN KULUTYHT BIGINT
ALTER TABLE sa.sa_suorat_amk_talous_5_kustannustiedot ALTER COLUMN OHJALA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ARVALPAL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ARVONAL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN AVUSTUST BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ELAKEK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN EUMUUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN EUSUORA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN EUYRITYS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN HLOKULUY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KERAKULU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KERATULO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KONEVUOK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KORKOK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KORKOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KOTILAHJ BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KOTITALT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KRAHALT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KUNNAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN KYRITYST BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN LAHJKULU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN LAHJTULO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MTAPPIO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUUJULKH BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUULAHJ BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUUSIVUK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUUTILAK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MVOITTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN OSINKOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN PALKKAK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN PALVOSTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN POISTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRJAAMA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRLIIKEK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRLIIKET BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRMUUK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRMUUTUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SROSUUS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SRVAHEM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN TAVAOSTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN TEKES BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ULKMUU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ULKYRITY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VALTIO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VASTIKEK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHJAAMA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHLIIKEK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHLIIKET BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHMUUK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHMUUTUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHOSUUST BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VHVAHEM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTJAAMA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTKULUTY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTLIIKEK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTLIIKET BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTMUUK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTMUUTUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTOSUUST BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VTVAHEM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VUOKRAK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VUOKRAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VYHTEISO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SATTUOTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SATKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN YOLAKI49 BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUUYAVUS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN OMAKRAHM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN TILIKTUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN POISTOEM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN SIDOTTRM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN TULOVERO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN TILIKJAAM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN YVARULKOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MVARULKOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN ALV BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN OKMALV BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VMALV BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN MUUALV BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN VMHAR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN OKMHAR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN HARLIIK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN APTEMKA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_1_tuloslaskelma ALTER COLUMN APTEVER BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN TUOTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN TTAVUSTU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN LIIKETUO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN MUUTTUOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN KULUTYHT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN HLOKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN TTPOISTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN MUUTKULU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN OSUUSYKU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN TUTMENOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN OMATR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ULKOPTR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN AKATEMIA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN MUUOKM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN TEKES BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN MUUTEM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ULKOMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN OIKMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN SISÄMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN PUOLMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN VALTVMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN MMM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN LVM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN STM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN YMPMIN BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN KUNNAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN MUUJULKR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN KOTIRAHA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN KOTIYRIT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ULKOYRIT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN EUPUITER BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN EAKR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ESR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN MUUEUR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ULKORAHA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN KVJARJ BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN ULKOMUUR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN KOTIKK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_4_tutkimusmenot ALTER COLUMN HYVINVOINTIALUEET BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN PTUTKOUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN VTKUSTY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN KOULUTUS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN PTUTOSAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN MUUKOUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN TUTKIMUS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN JTUTKKOU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN TIETTUTK BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN TAITTOIM BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN MUUYHTEI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN JULOIKSU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN YLEISTOI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN HARJKOUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN OPETUSY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN ESIOPE BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN PERUSOPE BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN LUKIOOPE BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN OPEKOULY BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN HARJHKOU BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN HARJULKO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN OPEKEHIT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN KIRJYHT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN YLAKIYHT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN KULTPER BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN KANPAKIR BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN YOTOTTEH BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN ERIKKOUL BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot ALTER COLUMN MUUTTUTOSAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN harjkoul BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN opetusy BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN esiope BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN perusope BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN lukioope BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN opekouly BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN harjhkou BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN harjulko BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN opekehit BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN kirjyht BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN ylakiyht BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN kultper BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN kanpakir BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_5_kustannustiedot_harjoittelukoulut ALTER COLUMN yototteh BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN LIIKEVAIHTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN VARASTOJEN_LISAYS_TAI_VAHENNYS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN VALMISTUS_OMAAN_KAYTTOON BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN LIIKETOIMINNAN_MUUT_TUOTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MATERIAALIT_JA_PALVELUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN AINEET_TARVIKKEET_JA_TAVARAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN OSTOT_TILIKAUDEN_AIKANA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTTEET_VARASTOJEN_LISAYS_TAI_VAHENNYS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN ULKOPUOLISET_PALVELUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN HENKILOSTOKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN PALKAT_JA_PALKKIOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN HENKILOSTOSIVUKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN ELAKEKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MUUT_HENKILOSTOSIVUKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN POISTOT_JA_ARVONALENNUKSET BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SUUNNITELMAN_MUKAISET_POISTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SIJOITUKSET_ARVONALENTUMISET_PYSYVAT_VASTAAVAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SIJOITUKSET_ARVONALENTUMISET_VAIHTUVAT_VASTAAVAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN LIIKETOIMINNAN_MUUT_KULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN LIIKEVOITTO BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN RAHOITUSTUOTOT_JA_KULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTOT_OSUUKSISTA_KONSERNI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTOT_OSUUKSISTA_OMISTUSYHTEISTYOYRITYKSISSA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTOT_MUISTA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTOT_SAMA_KONSERNI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TUOTOT_MUILTA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MUUT_KORKOTUOTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MUUT_KORKOTUOTOT_SAMA_KONSERNI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MUUT_KORKOTUOTOT_MUILTA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN ARVONALENTUMISET_PYSYVAT_VASTAAVAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN ARVONALENTUMISET_VAIHTUVAT_VASTAAVAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN KORKOKULUT_JA_MUUT_RAHOITUSKULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN KORKOKULUT_SAMA_KONSERNI BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN KORKOKULUT_MUILLE BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN VOITTO_ENNEN_SATUNNAISIA_ERIA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SATUNNAISET_ERAT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SATUNNAISET_TUOTOT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN SATUNNAISET_KULUT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN VOITOT_ENNEN_TILINPAATOSSIIRTOJA BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TILINPAATOSSIIRROT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN POISTOERON_LISAYS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN VAPAAEHTOISTEN_VARAUSTEN_LISAYS BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TULOVEROT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN MUUT_VALITTOMAT_VEROT BIGINT
ALTER TABLE sa.sa_suorat_yo_talous_6_liiketoiminnan_tuloslaskelma ALTER COLUMN TILKAUDEN_VOITTO BIGINT




























ALTER PROCEDURE [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely] AS

/*
*/

EXEC sa.p_lataa_sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet

EXEC dw.p_lataa_d_amos_tase_ja_tunnusluvut

DECLARE @cols92_kaikki AS NVARCHAR(MAX), @cols92_eitase AS NVARCHAR(MAX), @cols12 AS NVARCHAR(MAX), @colsSP AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX), @max_vuosi as int

SET @max_vuosi = (SELECT max(vuosi) FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet])


-- Muuttuja sarakkeiden nimille järkestäjäkohtaiselle lomakkeelle
SELECT @cols92_kaikki =
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K92'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)')
	,1,1,'')

SELECT @cols92_eitase =
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K92' and taso0 != 'Tase-erät'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)')
	,1,1,'')


-- Muuttuja sarakkeiden nimille seurantaryhmäkohtaiselle lomakkeelle
SELECT @cols12 =
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='K12'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)')
	,1,1,'')



-- Muuttuja sarakkeiden nimille suoritepäätöslaskennasta haettaville tiedoille
SELECT @colsSP =
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_tase_ja_tunnusluvut
			WHERE lomake='SuorP'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)')
	,1,1,'')



SET @query = '


	TRUNCATE TABLE dw.f_amos_tase_ja_tunnusluvut_kustannuskysely

	INSERT INTO dw.f_amos_tase_ja_tunnusluvut_kustannuskysely

	SELECT DISTINCT
		 Q.vuosi
		,Q.ytunnus
		,tili = tilitunnus
		,sarake = d1.sarake
		,Q.lomake
		,omistajatyyppi_nimi
		,maara_euroa = Q.maara_euroa



	FROM (

		SELECT

			 [vuosi]
			,[ytunnus]
			,[lomake] = ''K92''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]

		FROM (
			SELECT * FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] WHERE omistaja != ''4 Kuntayhtymä'') sa1
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols92_kaikki + ')
		) tp1


		UNION ALL

		SELECT

			 [vuosi]
			,[ytunnus]
			,[lomake] = ''K92''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,[maara_euroa]

		FROM (
			SELECT * FROM [sa].[sa_amos_kustannuskysely_jarjestajakohtainen_kaikki_vuodet] WHERE omistaja = ''4 Kuntayhtymä'') sa2
		UNPIVOT (
			[maara_euroa] FOR [tilitunnus]
			IN (' + @cols92_eitase + ')
		) tp2


		UNION ALL

		SELECT
			[vuosi]
			,[ytunnus]
			,[lomake] = ''K12''
			,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
			FROM [ANTERO].[sa].[sa_amos_kustannuskysely_seurantaryhmat] sa3
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @cols12 + ')
		) tp3

		GROUP BY vuosi, ytunnus, SUBSTRING(omistaja,3,LEN(omistaja)), tilitunnus

		UNION ALL
		SELECT
			[vuosi]
			,[Y-tunnus]
			,[lomake] = ''SuorP''
			,[omistajatyyppi]
			,[tilitunnus]
			,SUM([summattava_euroa]) maara_euroa
		FROM [ANTERO].[sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus] sa4
		UNPIVOT (
			[summattava_euroa] FOR [tilitunnus]
			IN (' + @colsSP + ')
		) tp4

		GROUP BY vuosi, "Y-tunnus", omistajatyyppi, tilitunnus
		HAVING vuosi < = ' +cast( @max_vuosi as varchar(10)) + '

	) Q

	LEFT JOIN dw.d_amos_tase_ja_tunnusluvut d1 ON d1.koodi = Q.tilitunnus
	WHERE Q.vuosi > 2020

'

EXEC (@query)
