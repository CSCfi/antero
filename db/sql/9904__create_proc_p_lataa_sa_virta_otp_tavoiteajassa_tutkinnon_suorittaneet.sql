USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]    Script Date: 4.6.2024 13:28:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [sa].[p_lataa_sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet] AS

TRUNCATE TABLE sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet

INSERT INTO sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet
SELECT 
	[alkamispvm]
    ,[aloitusvuosi]
    ,[ika]
    ,[kaytetytlukukaudet]
    ,[kaytetytpoissakoodi2kaudet]
    ,[kaytetytpoissakoodi2paivia]
    ,[kaytetytpoissakoodi3kaudet]
    ,[kaytetytpoissakoodi3paivia]
    ,[kk]
    ,[lasnaololukukaudet]
    ,[onaiempitutkinto]
    ,[opintosuoritusavain]
    ,[opiskelijaavain]
    ,[opiskeluoikeusAvain]
    ,[oppilaitosnro]
    ,[paivia]
    ,[sukupuoli]
    ,[tavoiteaikavuosia]
    ,[tavoiteajassavalmistunut]
    ,[tavoitelukukaudet]
    ,[tutkinnonsuorituspvm]
    ,[tutkintokerroin]
    ,[tutkintokoodi]
    ,[tutkintovuosi]
    ,[vaadittuop]
    ,[vuosia]
    ,[xkoulutuskieli]
    ,[xkoulutuskunta]
    ,[xonenintaan12kk]
    ,[xonryhmaa]
    ,[xonryhmab]
    ,[xonryhmac]
    ,[xonyli12kk]
    ,[xxalasnaololukukaudet]
    ,[xxblasnaolokuukaudet]
    ,[xxcpoissaololukukaudet]
    ,[xxdpoissaolokuukaudet]
    ,[xxetavoiteaikakuukausia]
    ,[xxfkaytettyaikakk]
    ,[xxgkokonaisaikakk]
    ,[xxhaiempitutkintokoodi]
    ,[xxiaiempitutkintosuorituspvm]
    ,[xxjaiempikk]
    ,[xxksiirtoopiskelija]
    ,[xxlavoimenvayla]
    ,[xxlkoulutustyyppi]
    ,[xxltutkintoryhma]
    ,[xxmikatutkinnonaloitusajankohtana]
    ,[xxmrahoituslahde]
    ,[xxxsamakoodi]
    ,[xxxvaihdossalyhyt]
    ,[xxxvaihdossapitka]
    ,[xxxvaihdossavirtuaalinenblended]
    ,[xxxxvaihdonkestopaivissa]
    ,[loadtime]
    ,[source]
    ,[username]
FROM [VirtaSiirto].[sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_uusi_rahoitusmalli]

GO

USE [ANTERO]