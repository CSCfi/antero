USE [ANTERO]
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.aidinkieli" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.arvosana" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.asteikko" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.asuinkunta_koodi" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.kansalaisuus" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.kieli" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.koulutusalakoodi" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.kunta" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.laajuus" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.lasnaolo_lukukausia" VARCHAR(100);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.paaaine" VARCHAR(1000);
GO
ALTER TABLE sa.sa_arvo_uraseuranta ALTER COLUMN "taustatiedot.valmistumisajankohta" VARCHAR(100);
GO
