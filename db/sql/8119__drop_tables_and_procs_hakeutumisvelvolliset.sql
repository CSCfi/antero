USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_opiskelutiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__temp_koski_hakeutumisvelvolliset_hakutiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa__temp_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa__temp_koski_hakeutumisvelvolliset]
GO
/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset_opiskelutiedot]
GO
/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset_hakutiedot]
GO
/****** Object:  Table [dw].[_temp_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[_temp_koski_hakeutumisvelvolliset]
GO
--
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_hakeutumisvelvolliset_opiskelutiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_hakeutumisvelvolliset_hakutiedot]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 22:53:53 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_koski_hakeutumisvelvolliset]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset_opiskelutiedot]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset_hakutiedot]
GO
/****** Object:  Table [dw].[f_koski_hakeutumisvelvolliset]    Script Date: 28.9.2023 22:53:53 ******/
DROP TABLE IF EXISTS [dw].[f_koski_hakeutumisvelvolliset]
GO
