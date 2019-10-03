USE [ANTERO]
GO
ALTER TABLE [dw].[d_amk] ADD [amk_nykyinen_tunnus] [varchar] (5) 
;
ALTER TABLE [dw].[d_amk] ADD [amk_vanha_nimi_fi] [varchar] (100)
;
ALTER TABLE [dw].[d_amk] ADD [amk_vanha_nimi_sv] [varchar] (100)
;
ALTER TABLE [dw].[d_amk] ADD [amk_vanha_nimi_en] [varchar] (100)
;
ALTER TABLE [dw].[d_amk] ADD [alkupvm] [datetime2]
;
ALTER TABLE [dw].[d_amk] ADD [loppupvm] [datetime2]
;
