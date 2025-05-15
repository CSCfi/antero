USE ARVO_SA
ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot] ALTER COLUMN 	[tutkinnon_osat_oppilaitosmuotoinenkoulutus] [VARCHAR](1000) NULL
ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot] ALTER COLUMN 	[tutkinnon_osat_oppisopimus] [VARCHAR](1000) NULL
ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot] ALTER COLUMN 	[tutkinnon_osat_koulutussopimus] [VARCHAR](1000) NULL

ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot_jaadytetty] ALTER COLUMN 	[tutkinnon_osat_oppilaitosmuotoinenkoulutus] [VARCHAR](1000) NULL
ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot_jaadytetty] ALTER COLUMN 	[tutkinnon_osat_oppisopimus] [VARCHAR](1000) NULL
ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot_jaadytetty] ALTER COLUMN 	[tutkinnon_osat_koulutussopimus] [VARCHAR](1000) NULL
USE ANTERO
