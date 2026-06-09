use [Koski_SA]
go

drop table if exists [dbo].TK_amm_tutkinnot
drop table if exists [dbo].[TK_K1_12_amm_tutkinnot]
drop table if exists [dbo].[TK_K1_13_amm_tutkinnon_suorittaneet]

drop proc if exists [dbo].[TK_K1_12_amm_tutkinnot]
drop proc if exists [dbo].[TK_K1_13_amm_tutkinnon_suorittaneet]
drop proc if exists [dbo].[p_lataa_TK_K1_14_amm_uudet_opiskelijat]

--varsinaiset poiminnat arkistopalvelimella
drop table if exists [dbo].TK_amm_tutkinnot_rahoituskausittain
drop table if exists [dbo].[TK_K1_12_amm_tutkinnot_rahoituskausittain]
drop table if exists [dbo].[TK_K1_13_amm_tutkinnon_suorittaneet_rahoituskausittain]

go
