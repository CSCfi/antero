USE [ARVO_SA]


ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[tutkinto];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[toimipaikka];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[kunta];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[koulutusmuoto];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[kieli];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[henkilonumero];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[haun_numero];
ALTER TABLE [sa].[sa_virta_taustatiedot] DROP COLUMN 	[hankintakoulutuksen_toteuttaja];

ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[tutkinto] [varchar](100) NULL
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[toimipaikka] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[kunta] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[koulutusmuoto] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[kieli] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[henkilonumero] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[haun_numero] [varchar](100) NULL;
ALTER TABLE [sa].[sa_arvo_vastaajat] ADD	[hankintakoulutuksen_toteuttaja] [varchar](100) NULL;

USE [ANTERO]
