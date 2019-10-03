--
--  alter table f_amk_rekrytointi_valitut
--

USE [ANTERO]
GO


ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  [hakunumero] [nvarchar](30) NOT NULL
ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  [sopimusnumero] [nvarchar](30) NULL
ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  [henkilonumero] [nvarchar](30) NOT NULL
ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  [sopimus_alkupvm] [datetime] NULL
ALTER TABLE [dw].[f_amk_rekrytointi_valitut] ADD  [sopimus_loppupvm] [datetime] NULL
