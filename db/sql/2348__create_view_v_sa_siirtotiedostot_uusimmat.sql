USE [ANTERO]
GO

/****** Object:  View [sa].[v_sa_siirtotiedostot_uusimmat]    Script Date: 5.8.2019 9:50:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP VIEW IF EXISTS 
[sa].[v_sa_siirtotiedostot_uusimmat]
GO 

CREATE VIEW [sa].[v_sa_siirtotiedostot_uusimmat]
AS
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm1]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm1
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 
UNION
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm2]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm2
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 

/* kolmonen puuttuu vielä sa-puolelta
UNION
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm3]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm3
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 
*/
UNION
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm4]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm4
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 
UNION
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm5]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm5
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 


UNION
  SELECT 'Amos rahoitus'                                 AS project,
         source                                          AS mud_id,
         tiedostonimi                                    AS filename,
         lastmodified                                       AS load_date,
         username,
         '[ANTERO].[sa].[v_sa_amos_siirtotiedosto_okm6]' AS view_name,
         Count(id)                                       AS rows
  FROM   sa.sa_amos_siirtotiedosto_okm6
  GROUP  BY source,
            tiedostonimi,
            lastmodified,
            username 



GO


