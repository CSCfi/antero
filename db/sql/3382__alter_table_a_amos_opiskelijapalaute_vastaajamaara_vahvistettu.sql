USE ANTERO
GO
ALTER TABLE sa.sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu ALTER COLUMN Tilastokausi VARCHAR(100) NULL
GO
ALTER TABLE sa.sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu ALTER COLUMN "Koulutuksen järjestäjän nimi" VARCHAR(100) NULL
GO
ALTER TABLE sa.sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu ALTER COLUMN username VARCHAR(100) NULL
