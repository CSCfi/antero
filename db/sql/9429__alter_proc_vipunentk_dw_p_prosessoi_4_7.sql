USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_prosessoi_4_7]    Script Date: 21.12.2023 12:30:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_prosessoi_4_7] AS


TRUNCATE TABLE VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus
INSERT INTO VipunenTK_DW.dbo.f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus
  SELECT * FROM VipunenTK_DW.dbo.v_f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus


-- Poimitaan korkein aiemmin suoritettu tutkinto. Case lause suoritetaan ylh‰‰lt‰ alas ja p‰‰ttyy ensimm‰iseen osumaan (tai else osaan)

UPDATE [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
SET [korkein_aiempi_koulutus_taso2_tunnus] =
    case 
    when [toht_aiempi_tutkinto_suoritettu] = 'K' then '82'
    when [lis_aiempi_tutkinto_suoritettu] = 'K' then '81'
    when [laaker_aiempi_tutkinto_suoritettu] = 'K' then '73'
    when [ykk_aiempi_tutkinto_suoritettu] = 'K' then '72'
    when [ylamk_aiempi_tutkinto_suoritettu] = 'K' then '71'
    when [akk_aiempi_tutkinto_suoritettu] = 'K' then '63'
    when [amk_aiempi_tutkinto_suoritettu] = 'K' then '62'
    when [ammka_aiempi_tutkinto_suoritettu] = 'K' then '61'
    when [opist_aiempi_tutkinto_suoritettu] = 'K' then '50'
    when [amm_aiempi_tutkinto_suoritettu] = 'K' then '32'
    when [lu_aiempi_tutkinto_suoritettu] = 'K' then '31'
    else '91'
    end 

-- Asetetaan korkeimman aiemmin suoritettu tutkinnon taso 1

UPDATE f
   SET f.[korkein_aiempi_koulutus_taso1_tunnus] = m.[iscle2011_koodi]
FROM [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus] f
JOIN v_koulutusaste_2_1_map m on f.[korkein_aiempi_koulutus_taso2_tunnus] = m.Koulutusaste_taso2_koodi

-- Onko nykyinen tutkinto tasoltaan korkeampi kuin aiempi tason 1 ja tason 2 mukaan. 
-- Jos ei aiempaa tutkintoa tai se on tuntematon niin uusi tutkinto on aina korkeampi
-- Suuruusvertailu on merkkijonovertailu ja se toimii t‰ss‰ tapauksessa (esim. '31' < '32')

UPDATE [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
SET [koulutustason2_nousu] = case 
    when [korkein_aiempi_koulutus_taso2_tunnus] = '91' then 'K'
    when [koulutustaso2_koodi] > [korkein_aiempi_koulutus_taso2_tunnus] then 'K'
    else 'E'
    end,
    [koulutustason1_nousu] = case 
    when [korkein_aiempi_koulutus_taso1_tunnus] = '9' then 'K'
    when [koulutustaso1_koodi] > [korkein_aiempi_koulutus_taso1_tunnus] then 'K'
    else 'E'
    end

Truncate table VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7 
Insert into VipunenTK_DW.dbo.f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7
  Select * from VipunenTK_DW.dbo.v_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7 



GO


