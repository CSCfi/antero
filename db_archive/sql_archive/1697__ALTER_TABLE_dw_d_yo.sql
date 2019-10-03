USE [ANTERO]
GO
ALTER TABLE [dw].[d_yo] ADD [yo_nykyinen_tunnus] [varchar] (5)
;
ALTER TABLE [dw].[d_yo] ADD [yo_vanha_nimi_fi] [varchar] (100)
;
ALTER TABLE [dw].[d_yo] ADD [yo_vanha_nimi_sv] [varchar] (100)
;
ALTER TABLE [dw].[d_yo] ADD [yo_vanha_nimi_en] [varchar] (100)
;
ALTER TABLE [dw].[d_yo] ADD [alkupvm] [datetime2]
;
ALTER TABLE [dw].[d_yo] ADD [loppupvm] [datetime2] 
