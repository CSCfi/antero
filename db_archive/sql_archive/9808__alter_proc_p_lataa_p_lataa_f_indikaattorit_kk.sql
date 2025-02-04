USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk]    Script Date: 24.4.2024 14:51:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk] as

EXEC dw.p_lataa_f_indikaattorit_kk_55_op
EXEC dw.p_lataa_f_indikaattorit_kk_haku_ja_valintatiedot
EXEC dw.p_lataa_f_indikaattorit_kk_henkilostotiedot_amk
EXEC dw.p_lataa_f_indikaattorit_kk_henkilostotiedot_yliopisto
EXEC dw.p_lataa_f_indikaattorit_kk_julkaisutiedot
EXEC dw.p_lataa_f_indikaattorit_kk_lapaisy
EXEC dw.p_lataa_f_indikaattorit_kk_otv
EXEC dw.p_lataa_f_indikaattorit_kk_taloustiedot
EXEC dw.p_lataa_f_indikaattorit_kk_tavoiteaikatiedot
EXEC dw.p_lataa_f_indikaattorit_kk_top_10_indeksi
EXEC dw.p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneet_vaihdossa
EXEC dw.p_lataa_f_indikaattorit_kk_tutkinnon_suorittaneiden_tyollistyminen
EXEC dw.p_lataa_f_indikaattorit_kk_avop

GO

USE [ANTERO]
