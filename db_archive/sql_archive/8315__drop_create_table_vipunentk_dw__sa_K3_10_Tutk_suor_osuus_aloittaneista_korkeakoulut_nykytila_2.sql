USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2]    Script Date: 24.11.2023 15:41:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2]

GO

CREATE TABLE [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila_2](
	[jarj] [varchar](10) NULL,
	[amksuorv_2016] [varchar](4) NULL,
	[amksuorlk_2016] [varchar](1) NULL,
	[amktutkkmaak_2016] [varchar](2) NULL,
	[amktutkjarj_2016] [varchar](10) NULL,
	[amktutkkoulk_2016] [nvarchar](6) NULL,
	[ylamksuorv_2016] [varchar](4) NULL,
	[ylamksuorlk_2016] [varchar](1) NULL,
	[ylamktutkkmaak_2016] [varchar](2) NULL,
	[ylamktutkjarj_2016] [varchar](10) NULL,
	[ylamktutkkoulk_2016] [nvarchar](6) NULL,
	[alkksuorv_2016] [varchar](4) NULL,
	[alkksuorlk_2016] [varchar](1) NULL,
	[alkktutkkmaak_2016] [varchar](2) NULL,
	[alkktutkjarj_2016] [varchar](10) NULL,
	[alkktutkkoulk_2016] [nvarchar](6) NULL,
	[ylkksuorv_2016] [varchar](4) NULL,
	[ylkksuorlk_2016] [varchar](1) NULL,
	[ylkktutkkmaak_2016] [varchar](2) NULL,
	[ylkktutkjarj_2016] [varchar](10) NULL,
	[ylkktutkkoulk_2016] [nvarchar](6) NULL,
	[tksuorv_2016] [varchar](4) NULL,
	[tksuorlk_2016] [varchar](1) NULL,
	[tktutkkmaak_2016] [varchar](2) NULL,
	[tktutkjarj_2016] [varchar](10) NULL,
	[tktutkkoulk_2016] [nvarchar](6) NULL,
	[muutasuorv_2016] [varchar](4) NULL,
	[muutasuorlk_2016] [varchar](1) NULL,
	[muutatutkkmaak_2016] [varchar](2) NULL,
	[muutatutkjarj_2016] [varchar](10) NULL,
	[muutatutkkoulk_2016] [nvarchar](6) NULL,
	[amkopiskkoulk_2016] [nvarchar](6) NULL,
	[amkopiskjarj_2016] [varchar](10) NULL,
	[amkkmaak_2016] [varchar](2) NULL,
	[amkolotamm_2016] [varchar](1) NULL,
	[amkolosyys_2016] [varchar](1) NULL,
	[ylamkopiskkoulk_2016] [nvarchar](6) NULL,
	[ylamkopiskjarj_2016] [varchar](10) NULL,
	[ylamkkmaak_2016] [varchar](2) NULL,
	[ylamkolotamm_2016] [varchar](1) NULL,
	[ylamkolosyys_2016] [varchar](1) NULL,
	[alkkopiskkoulk_2016] [nvarchar](6) NULL,
	[alkkopiskjarj_2016] [varchar](10) NULL,
	[alkkkmaak_2016] [varchar](2) NULL,
	[alkkolotamm_2016] [varchar](1) NULL,
	[alkkolosyys_2016] [varchar](1) NULL,
	[ylkkopiskkoulk_2016] [nvarchar](6) NULL,
	[ylkkopiskjarj_2016] [varchar](10) NULL,
	[ylkkkmaak_2016] [varchar](2) NULL,
	[ylkkolotamm_2016] [varchar](1) NULL,
	[ylkkolosyys_2016] [varchar](1) NULL,
	[tkopiskkoulk_2016] [nvarchar](6) NULL,
	[tkopiskjarj_2016] [varchar](10) NULL,
	[tkkmaak_2016] [varchar](2) NULL,
	[tkolotamm_2016] [varchar](1) NULL,
	[tkolosyys_2016] [varchar](1) NULL,
	[muutaopiskkoulk_2016] [nvarchar](6) NULL,
	[muutaopiskjarj_2016] [varchar](10) NULL,
	[muutakmaak_2016] [varchar](2) NULL,
	[muutaolotamm_2016] [varchar](1) NULL,
	[muutaolosyys_2016] [varchar](1) NULL,
	[ptoim1r5_2016] [varchar](2) NULL,
	[amas_2016] [varchar](1) NULL,
	[amksuorv_2017] [varchar](4) NULL,
	[amksuorlk_2017] [varchar](1) NULL,
	[amktutkkmaak_2017] [varchar](2) NULL,
	[amktutkjarj_2017] [varchar](10) NULL,
	[amktutkkoulk_2017] [nvarchar](6) NULL,
	[ylamksuorv_2017] [varchar](4) NULL,
	[ylamksuorlk_2017] [varchar](1) NULL,
	[ylamktutkkmaak_2017] [varchar](2) NULL,
	[ylamktutkjarj_2017] [varchar](10) NULL,
	[ylamktutkkoulk_2017] [nvarchar](6) NULL,
	[alkksuorv_2017] [varchar](4) NULL,
	[alkksuorlk_2017] [varchar](1) NULL,
	[alkktutkkmaak_2017] [varchar](2) NULL,
	[alkktutkjarj_2017] [varchar](10) NULL,
	[alkktutkkoulk_2017] [nvarchar](6) NULL,
	[ylkksuorv_2017] [varchar](4) NULL,
	[ylkksuorlk_2017] [varchar](1) NULL,
	[ylkktutkkmaak_2017] [varchar](2) NULL,
	[ylkktutkjarj_2017] [varchar](10) NULL,
	[ylkktutkkoulk_2017] [nvarchar](6) NULL,
	[tksuorv_2017] [varchar](4) NULL,
	[tksuorlk_2017] [varchar](1) NULL,
	[tktutkkmaak_2017] [varchar](2) NULL,
	[tktutkjarj_2017] [varchar](10) NULL,
	[tktutkkoulk_2017] [nvarchar](6) NULL,
	[muutasuorv_2017] [varchar](4) NULL,
	[muutasuorlk_2017] [varchar](1) NULL,
	[muutatutkkmaak_2017] [varchar](2) NULL,
	[muutatutkjarj_2017] [varchar](10) NULL,
	[muutatutkkoulk_2017] [nvarchar](6) NULL,
	[amkopiskkoulk_2017] [nvarchar](6) NULL,
	[amkopiskjarj_2017] [varchar](10) NULL,
	[amkkmaak_2017] [varchar](2) NULL,
	[amkolotamm_2017] [varchar](1) NULL,
	[amkolosyys_2017] [varchar](1) NULL,
	[ylamkopiskkoulk_2017] [nvarchar](6) NULL,
	[ylamkopiskjarj_2017] [varchar](10) NULL,
	[ylamkkmaak_2017] [varchar](2) NULL,
	[ylamkolotamm_2017] [varchar](1) NULL,
	[ylamkolosyys_2017] [varchar](1) NULL,
	[alkkopiskkoulk_2017] [nvarchar](6) NULL,
	[alkkopiskjarj_2017] [varchar](10) NULL,
	[alkkkmaak_2017] [varchar](2) NULL,
	[alkkolotamm_2017] [varchar](1) NULL,
	[alkkolosyys_2017] [varchar](1) NULL,
	[ylkkopiskkoulk_2017] [nvarchar](6) NULL,
	[ylkkopiskjarj_2017] [varchar](10) NULL,
	[ylkkkmaak_2017] [varchar](2) NULL,
	[ylkkolotamm_2017] [varchar](1) NULL,
	[ylkkolosyys_2017] [varchar](1) NULL,
	[tkopiskkoulk_2017] [nvarchar](6) NULL,
	[tkopiskjarj_2017] [varchar](10) NULL,
	[tkkmaak_2017] [varchar](2) NULL,
	[tkolotamm_2017] [varchar](1) NULL,
	[tkolosyys_2017] [varchar](1) NULL,
	[muutaopiskkoulk_2017] [nvarchar](6) NULL,
	[muutaopiskjarj_2017] [varchar](10) NULL,
	[muutakmaak_2017] [varchar](2) NULL,
	[muutaolotamm_2017] [varchar](1) NULL,
	[muutaolosyys_2017] [varchar](1) NULL,
	[ptoim1r5_2017] [varchar](2) NULL,
	[amas_2017] [varchar](1) NULL,
	[amksuorv_2018] [varchar](4) NULL,
	[amksuorlk_2018] [varchar](1) NULL,
	[amktutkkmaak_2018] [varchar](2) NULL,
	[amktutkjarj_2018] [varchar](10) NULL,
	[amktutkkoulk_2018] [nvarchar](6) NULL,
	[ylamksuorv_2018] [varchar](4) NULL,
	[ylamksuorlk_2018] [varchar](1) NULL,
	[ylamktutkkmaak_2018] [varchar](2) NULL,
	[ylamktutkjarj_2018] [varchar](10) NULL,
	[ylamktutkkoulk_2018] [nvarchar](6) NULL,
	[alkksuorv_2018] [varchar](4) NULL,
	[alkksuorlk_2018] [varchar](1) NULL,
	[alkktutkkmaak_2018] [varchar](2) NULL,
	[alkktutkjarj_2018] [varchar](10) NULL,
	[alkktutkkoulk_2018] [nvarchar](6) NULL,
	[ylkksuorv_2018] [varchar](4) NULL,
	[ylkksuorlk_2018] [varchar](1) NULL,
	[ylkktutkkmaak_2018] [varchar](2) NULL,
	[ylkktutkjarj_2018] [varchar](10) NULL,
	[ylkktutkkoulk_2018] [nvarchar](6) NULL,
	[tksuorv_2018] [varchar](4) NULL,
	[tksuorlk_2018] [varchar](1) NULL,
	[tktutkkmaak_2018] [varchar](2) NULL,
	[tktutkjarj_2018] [varchar](10) NULL,
	[tktutkkoulk_2018] [nvarchar](6) NULL,
	[muutasuorv_2018] [varchar](4) NULL,
	[muutasuorlk_2018] [varchar](1) NULL,
	[muutatutkkmaak_2018] [varchar](2) NULL,
	[muutatutkjarj_2018] [varchar](10) NULL,
	[muutatutkkoulk_2018] [nvarchar](6) NULL,
	[amkopiskkoulk_2018] [nvarchar](6) NULL,
	[amkopiskjarj_2018] [varchar](10) NULL,
	[amkkmaak_2018] [varchar](2) NULL,
	[amkolotamm_2018] [varchar](1) NULL,
	[amkolosyys_2018] [varchar](1) NULL,
	[ylamkopiskkoulk_2018] [nvarchar](6) NULL,
	[ylamkopiskjarj_2018] [varchar](10) NULL,
	[ylamkkmaak_2018] [varchar](2) NULL,
	[ylamkolotamm_2018] [varchar](1) NULL,
	[ylamkolosyys_2018] [varchar](1) NULL,
	[alkkopiskkoulk_2018] [nvarchar](6) NULL,
	[alkkopiskjarj_2018] [varchar](10) NULL,
	[alkkkmaak_2018] [varchar](2) NULL,
	[alkkolotamm_2018] [varchar](1) NULL,
	[alkkolosyys_2018] [varchar](1) NULL,
	[ylkkopiskkoulk_2018] [nvarchar](6) NULL,
	[ylkkopiskjarj_2018] [varchar](10) NULL,
	[ylkkkmaak_2018] [varchar](2) NULL,
	[ylkkolotamm_2018] [varchar](1) NULL,
	[ylkkolosyys_2018] [varchar](1) NULL,
	[tkopiskkoulk_2018] [nvarchar](6) NULL,
	[tkopiskjarj_2018] [varchar](10) NULL,
	[tkkmaak_2018] [varchar](2) NULL,
	[tkolotamm_2018] [varchar](1) NULL,
	[tkolosyys_2018] [varchar](1) NULL,
	[muutaopiskkoulk_2018] [nvarchar](6) NULL,
	[muutaopiskjarj_2018] [varchar](10) NULL,
	[muutakmaak_2018] [varchar](2) NULL,
	[muutaolotamm_2018] [varchar](1) NULL,
	[muutaolosyys_2018] [varchar](1) NULL,
	[ptoim1r5_2018] [varchar](2) NULL,
	[amas_2018] [varchar](1) NULL,
	[amksuorv_2019] [varchar](4) NULL,
	[amksuorlk_2019] [varchar](1) NULL,
	[amktutkkmaak_2019] [varchar](2) NULL,
	[amktutkjarj_2019] [varchar](10) NULL,
	[amktutkkoulk_2019] [nvarchar](6) NULL,
	[ylamksuorv_2019] [varchar](4) NULL,
	[ylamksuorlk_2019] [varchar](1) NULL,
	[ylamktutkkmaak_2019] [varchar](2) NULL,
	[ylamktutkjarj_2019] [varchar](10) NULL,
	[ylamktutkkoulk_2019] [nvarchar](6) NULL,
	[alkksuorv_2019] [varchar](4) NULL,
	[alkksuorlk_2019] [varchar](1) NULL,
	[alkktutkkmaak_2019] [varchar](2) NULL,
	[alkktutkjarj_2019] [varchar](10) NULL,
	[alkktutkkoulk_2019] [nvarchar](6) NULL,
	[ylkksuorv_2019] [varchar](4) NULL,
	[ylkksuorlk_2019] [varchar](1) NULL,
	[ylkktutkkmaak_2019] [varchar](2) NULL,
	[ylkktutkjarj_2019] [varchar](10) NULL,
	[ylkktutkkoulk_2019] [nvarchar](6) NULL,
	[tksuorv_2019] [varchar](4) NULL,
	[tksuorlk_2019] [varchar](1) NULL,
	[tktutkkmaak_2019] [varchar](2) NULL,
	[tktutkjarj_2019] [varchar](10) NULL,
	[tktutkkoulk_2019] [nvarchar](6) NULL,
	[muutasuorv_2019] [varchar](4) NULL,
	[muutasuorlk_2019] [varchar](1) NULL,
	[muutatutkkmaak_2019] [varchar](2) NULL,
	[muutatutkjarj_2019] [varchar](10) NULL,
	[muutatutkkoulk_2019] [nvarchar](6) NULL,
	[amkopiskkoulk_2019] [nvarchar](6) NULL,
	[amkopiskjarj_2019] [varchar](10) NULL,
	[amkkmaak_2019] [varchar](2) NULL,
	[amkolotamm_2019] [varchar](1) NULL,
	[amkolosyys_2019] [varchar](1) NULL,
	[ylamkopiskkoulk_2019] [nvarchar](6) NULL,
	[ylamkopiskjarj_2019] [varchar](10) NULL,
	[ylamkkmaak_2019] [varchar](2) NULL,
	[ylamkolotamm_2019] [varchar](1) NULL,
	[ylamkolosyys_2019] [varchar](1) NULL,
	[alkkopiskkoulk_2019] [nvarchar](6) NULL,
	[alkkopiskjarj_2019] [varchar](10) NULL,
	[alkkkmaak_2019] [varchar](2) NULL,
	[alkkolotamm_2019] [varchar](1) NULL,
	[alkkolosyys_2019] [varchar](1) NULL,
	[ylkkopiskkoulk_2019] [nvarchar](6) NULL,
	[ylkkopiskjarj_2019] [varchar](10) NULL,
	[ylkkkmaak_2019] [varchar](2) NULL,
	[ylkkolotamm_2019] [varchar](1) NULL,
	[ylkkolosyys_2019] [varchar](1) NULL,
	[tkopiskkoulk_2019] [nvarchar](6) NULL,
	[tkopiskjarj_2019] [varchar](10) NULL,
	[tkkmaak_2019] [varchar](2) NULL,
	[tkolotamm_2019] [varchar](1) NULL,
	[tkolosyys_2019] [varchar](1) NULL,
	[muutaopiskkoulk_2019] [nvarchar](6) NULL,
	[muutaopiskjarj_2019] [varchar](10) NULL,
	[muutakmaak_2019] [varchar](2) NULL,
	[muutaolotamm_2019] [varchar](1) NULL,
	[muutaolosyys_2019] [varchar](1) NULL,
	[ptoim1r5_2019] [varchar](2) NULL,
	[amas_2019] [varchar](1) NULL,
	[amksuorv_2020] [varchar](4) NULL,
	[amksuorlk_2020] [varchar](1) NULL,
	[amktutkkmaak_2020] [varchar](2) NULL,
	[amktutkjarj_2020] [varchar](10) NULL,
	[amktutkkoulk_2020] [nvarchar](6) NULL,
	[ylamksuorv_2020] [varchar](4) NULL,
	[ylamksuorlk_2020] [varchar](1) NULL,
	[ylamktutkkmaak_2020] [varchar](2) NULL,
	[ylamktutkjarj_2020] [varchar](10) NULL,
	[ylamktutkkoulk_2020] [nvarchar](6) NULL,
	[alkksuorv_2020] [varchar](4) NULL,
	[alkksuorlk_2020] [varchar](1) NULL,
	[alkktutkkmaak_2020] [varchar](2) NULL,
	[alkktutkjarj_2020] [varchar](10) NULL,
	[alkktutkkoulk_2020] [nvarchar](6) NULL,
	[ylkksuorv_2020] [varchar](4) NULL,
	[ylkksuorlk_2020] [varchar](1) NULL,
	[ylkktutkkmaak_2020] [varchar](2) NULL,
	[ylkktutkjarj_2020] [varchar](10) NULL,
	[ylkktutkkoulk_2020] [nvarchar](6) NULL,
	[tksuorv_2020] [varchar](4) NULL,
	[tksuorlk_2020] [varchar](1) NULL,
	[tktutkkmaak_2020] [varchar](2) NULL,
	[tktutkjarj_2020] [varchar](10) NULL,
	[tktutkkoulk_2020] [nvarchar](6) NULL,
	[muutasuorv_2020] [varchar](4) NULL,
	[muutasuorlk_2020] [varchar](1) NULL,
	[muutatutkkmaak_2020] [varchar](2) NULL,
	[muutatutkjarj_2020] [varchar](10) NULL,
	[muutatutkkoulk_2020] [nvarchar](6) NULL,
	[amkopiskkoulk_2020] [nvarchar](6) NULL,
	[amkopiskjarj_2020] [varchar](10) NULL,
	[amkkmaak_2020] [varchar](2) NULL,
	[amkolotamm_2020] [varchar](1) NULL,
	[amkolosyys_2020] [varchar](1) NULL,
	[ylamkopiskkoulk_2020] [nvarchar](6) NULL,
	[ylamkopiskjarj_2020] [varchar](10) NULL,
	[ylamkkmaak_2020] [varchar](2) NULL,
	[ylamkolotamm_2020] [varchar](1) NULL,
	[ylamkolosyys_2020] [varchar](1) NULL,
	[alkkopiskkoulk_2020] [nvarchar](6) NULL,
	[alkkopiskjarj_2020] [varchar](10) NULL,
	[alkkkmaak_2020] [varchar](2) NULL,
	[alkkolotamm_2020] [varchar](1) NULL,
	[alkkolosyys_2020] [varchar](1) NULL,
	[ylkkopiskkoulk_2020] [nvarchar](6) NULL,
	[ylkkopiskjarj_2020] [varchar](10) NULL,
	[ylkkkmaak_2020] [varchar](2) NULL,
	[ylkkolotamm_2020] [varchar](1) NULL,
	[ylkkolosyys_2020] [varchar](1) NULL,
	[tkopiskkoulk_2020] [nvarchar](6) NULL,
	[tkopiskjarj_2020] [varchar](10) NULL,
	[tkkmaak_2020] [varchar](2) NULL,
	[tkolotamm_2020] [varchar](1) NULL,
	[tkolosyys_2020] [varchar](1) NULL,
	[muutaopiskkoulk_2020] [nvarchar](6) NULL,
	[muutaopiskjarj_2020] [varchar](10) NULL,
	[muutakmaak_2020] [varchar](2) NULL,
	[muutaolotamm_2020] [varchar](1) NULL,
	[muutaolosyys_2020] [varchar](1) NULL,
	[ptoim1r5_2020] [varchar](2) NULL,
	[amas_2020] [varchar](1) NULL,
	[amksuorv_2021] [varchar](4) NULL,
	[amksuorlk_2021] [varchar](1) NULL,
	[amktutkkmaak_2021] [varchar](2) NULL,
	[amktutkjarj_2021] [varchar](10) NULL,
	[amktutkkoulk_2021] [nvarchar](6) NULL,
	[ylamksuorv_2021] [varchar](4) NULL,
	[ylamksuorlk_2021] [varchar](1) NULL,
	[ylamktutkkmaak_2021] [varchar](2) NULL,
	[ylamktutkjarj_2021] [varchar](10) NULL,
	[ylamktutkkoulk_2021] [nvarchar](6) NULL,
	[alkksuorv_2021] [varchar](4) NULL,
	[alkksuorlk_2021] [varchar](1) NULL,
	[alkktutkkmaak_2021] [varchar](2) NULL,
	[alkktutkjarj_2021] [varchar](10) NULL,
	[alkktutkkoulk_2021] [nvarchar](6) NULL,
	[ylkksuorv_2021] [varchar](4) NULL,
	[ylkksuorlk_2021] [varchar](1) NULL,
	[ylkktutkkmaak_2021] [varchar](2) NULL,
	[ylkktutkjarj_2021] [varchar](10) NULL,
	[ylkktutkkoulk_2021] [nvarchar](6) NULL,
	[tksuorv_2021] [varchar](4) NULL,
	[tksuorlk_2021] [varchar](1) NULL,
	[tktutkkmaak_2021] [varchar](2) NULL,
	[tktutkjarj_2021] [varchar](10) NULL,
	[tktutkkoulk_2021] [nvarchar](6) NULL,
	[muutasuorv_2021] [varchar](4) NULL,
	[muutasuorlk_2021] [varchar](1) NULL,
	[muutatutkkmaak_2021] [varchar](2) NULL,
	[muutatutkjarj_2021] [varchar](10) NULL,
	[muutatutkkoulk_2021] [nvarchar](6) NULL,
	[amkopiskkoulk_2021] [nvarchar](6) NULL,
	[amkopiskjarj_2021] [varchar](10) NULL,
	[amkkmaak_2021] [varchar](2) NULL,
	[amkolotamm_2021] [varchar](1) NULL,
	[amkolosyys_2021] [varchar](1) NULL,
	[ylamkopiskkoulk_2021] [nvarchar](6) NULL,
	[ylamkopiskjarj_2021] [varchar](10) NULL,
	[ylamkkmaak_2021] [varchar](2) NULL,
	[ylamkolotamm_2021] [varchar](1) NULL,
	[ylamkolosyys_2021] [varchar](1) NULL,
	[alkkopiskkoulk_2021] [nvarchar](6) NULL,
	[alkkopiskjarj_2021] [varchar](10) NULL,
	[alkkkmaak_2021] [varchar](2) NULL,
	[alkkolotamm_2021] [varchar](1) NULL,
	[alkkolosyys_2021] [varchar](1) NULL,
	[ylkkopiskkoulk_2021] [nvarchar](6) NULL,
	[ylkkopiskjarj_2021] [varchar](10) NULL,
	[ylkkkmaak_2021] [varchar](2) NULL,
	[ylkkolotamm_2021] [varchar](1) NULL,
	[ylkkolosyys_2021] [varchar](1) NULL,
	[tkopiskkoulk_2021] [nvarchar](6) NULL,
	[tkopiskjarj_2021] [varchar](10) NULL,
	[tkkmaak_2021] [varchar](2) NULL,
	[tkolotamm_2021] [varchar](1) NULL,
	[tkolosyys_2021] [varchar](1) NULL,
	[muutaopiskkoulk_2021] [nvarchar](6) NULL,
	[muutaopiskjarj_2021] [varchar](10) NULL,
	[muutakmaak_2021] [varchar](2) NULL,
	[muutaolotamm_2021] [varchar](1) NULL,
	[muutaolosyys_2021] [varchar](1) NULL,
	[ptoim1r5_2021] [varchar](2) NULL,
	[amas_2021] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](13) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL,
	[rivinro] [int] NULL
) ON [PRIMARY]

GO

