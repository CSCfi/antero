USE [ANTERO]
GO
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [organisaatio_nykyinen_koodi] [varchar] (20)
;
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [organisaatio_vanha_fi] [nvarchar] (255)
;
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [organisaatio_vanha_sv] [nvarchar] (255)
;
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [organisaatio_vanha_en] [nvarchar] (255)
;
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [alkupvm] [datetime2] (7)
;
ALTER TABLE [dw].[d_organisaatioluokitus] ADD [loppupvm] [datetime2] (7)
