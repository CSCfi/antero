USE [VipunenTK_lisatiedot]
GO

DROP TABLE IF EXISTS [dbo].[aloittaneiden_lapaisy_seuranta]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[aloittaneiden_lapaisy_seuranta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alkaa] [date] NOT NULL,
	[paattyy] [date] NOT NULL,
	[koodi] [nvarchar](255) NOT NULL,
	[selite] [nvarchar](255) NOT NULL,
	[jarjestys] [nvarchar](255) NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ON 

GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (1, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_tutkinto_alkuperaisessa_tutkintolajissa', N'Tutkinto alkuperäisessä tutkintolajissa', N'10010')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (2, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_tutkinto_kandi_tutkintolajissa', N'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto', N'10015')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (3, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_tutkinto_muussa_tutkintolajissa', N'Tutkinto muussa tutkintolajissa', N'10020')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (4, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_opiskelee_alkuperaisessa_tutkintolajissa', N'Opiskelee alkuperäisessä tutkintolajissa', N'10030')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (5, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_opiskelee_muussa_tutkintolajissa', N'Opiskelee muussa tutkintolajissa', N'10040')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (6, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10050')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (7, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10060')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (8, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_tutkinto_alkuperaisessa_tutkintolajissa', N'Tutkinto alkuperäisessä tutkintolajissa', N'10070')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (9, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_opiskelee_alkuperaisessa_tutkintolajissa', N'Opiskelee alkuperäisessä tutkintolajissa', N'10080')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (10, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_tutkinto_kandi_tutkintolajissa', N'Tutkinto muussa tutkintolajissa, kandidaatin tutkinto', N'10085')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (11, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_tutkinto_muussa_tutkintolajissa', N'Tutkinto muussa tutkintolajissa', N'10090')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (12, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_opiskelee_muussa_tutkintolajissa', N'Opiskelee muussa tutkintolajissa', N'10100')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (13, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10110')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (14, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10120')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (15, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_tutkinto_lukiokoulutuksesta', N'Tutkinto lukiokoulutuksesta', N'10130')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (16, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ammatillinen_perustutkinto', N'Ammatillinen perustutkinto', N'10140')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (17, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto', N'Ammatillinen lisäkoulutus ammattitutkinto tai erikoisammattitutkinto', N'10150')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (18, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto', N'Muu korkein ja viimeisimmäksi suoritettu tutkinto, korkeakoulututkinto', N'10160')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (19, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ammattikorkeakoulututkinto', N'Ammattikorkeakoulututkinto', N'10170')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (20, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_alempi_korkeakoulututkinto', N'Alempi korkeakoulututkinto', N'10180')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (21, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ylempi_ammattikorkeakoulututkinto', N'Ylempi ammattikorkeakoulututkinto', N'10190')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (22, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ylempi_korkeakoulututkinto', N'Ylempi korkeakoulututkinto', N'10200')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (23, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_tutkijakoulutusasteen_tutkinto', N'Tutkijakoulutusasteen tutkinto', N'10210')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (24, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste', N'Muu korkein ja viimeisimmäksi suoritettu tutkinto, toinen aste', N'10220')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (25, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1c_ei_tutkintoa', N'Ei tutkintoa', N'10230')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (26, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_lukiokoulutuksessa', N'Opiskelee lukiokoulutuksessa', N'10240')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (27, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_ammatillista_perustutkintoa', N'Opiskelee ammatillista perustutkintoa', N'10250')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (28, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_ammatillisessa_lisakoulutuksessa', N'Opiskelee ammatillisessa lisäkoulutuksessa', N'10260')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (29, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto', N'Opiskelee muussa koulutuksessa korkeakoulututkinto', N'10270')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (30, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_ammattikorkeakoulututkintoa', N'Opiskelee ammattikorkeakoulututkintoa', N'10280')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (31, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_alempaa_korkeakoulututkintoa', N'Opiskelee alempaa korkeakoulututkintoa', N'10290')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (32, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa', N'Opiskelee ylempää ammattikorkeakoulututkintoa', N'10300')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (33, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_ylempaa_korkeakoulututkintoa', N'Opiskelee ylempää korkeakoulututkintoa', N'10310')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (34, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelee_tieteellista_jatkotutkintoa', N'Opiskelee tieteellistä jatkotutkintoa', N'10320')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (35, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij', N'Opiskelu muuhun kuin korkeakoulututkintoon johtavassa koulutuksessa, toisen asteen opiskelu, ensisijaisesti ammatillinen', N'10330')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (36, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1d_ei_opiskele', N'Ei opiskele', N'10340')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (37, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1e_kylla', N'Kyllä', N'10350')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (38, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1e_ei', N'Ei', N'10360')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (39, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1f_kylla', N'Kyllä', N'10370')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (40, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1f_ei', N'Ei', N'10380')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (41, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1g_kylla', N'Kyllä', N'10390')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (42, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1g_ei', N'Ei', N'10400')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (43, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1h_kylla', N'Kyllä', N'10410')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (44, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1h_ei', N'Ei', N'10420')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (45, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_tutkinto_alkuperaisella_koulutusalalla_2002', N'Tutkinto alkuperäisellä koulutusalalla, 2002 luokitus', N'10430')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (46, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_tutkinto_muulla_koulutusalalla_2002', N'Tutkinto muulla koulutusalalla, 2002 luokitus', N'10440')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (47, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_opiskelee_alkuperaisella_koulutusalalla_2002', N'Opiskelee alkuperäisellä koulutusalalla, 2002 luokitus', N'10450')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (48, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_opiskelee_muulla_koulutusalalla_2002', N'Opiskelee muulla koulutusalalla, 2002 luokitus', N'10460')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (49, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10470')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (50, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10480')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (51, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_tutkinto_alkuperaisella_koulutusalalla_2002', N'Tutkinto alkuperäisellä koulutusalalla, 2002 luokitus', N'10490')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (52, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_opiskelee_alkuperaisella_koulutusalalla_2002', N'Opiskelee alkuperäisellä koulutusalalla, 2002 luokitus', N'10500')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (53, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_tutkinto_muulla_koulutusalalla_2002', N'Tutkinto muulla koulutusalalla, 2002 luokitus', N'10510')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (54, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_opiskelee_muulla_koulutusalalla_2002', N'Opiskelee muulla koulutusalalla, 2002 luokitus', N'10520')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (55, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10530')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (56, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10540')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (57, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2e_kylla', N'Kyllä', N'10550')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (58, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2e_ei', N'Ei', N'10560')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (59, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2f_kylla', N'Kyllä', N'10570')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (60, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2f_ei', N'Ei', N'10580')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (61, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2g_kylla', N'Kyllä', N'10590')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (62, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2g_ei', N'Ei', N'10600')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (63, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2h_kylla', N'Kyllä', N'10610')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (64, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2h_ei', N'Ei', N'10620')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (65, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_tutkinto_alkuperaisella_opintoalalla_2002', N'Tutkinto alkuperäisellä opintoalalla, 2002 luokitus', N'10630')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (66, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_tutkinto_muulla_opintoalalla_2002', N'Tutkinto muulla opintoalalla, 2002 luokitus', N'10640')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (67, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_opiskelee_alkuperaisella_opintoalalla_2002', N'Opiskelee alkuperäisellä opintoalalla, 2002 luokitus', N'10650')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (68, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_opiskelee_muulla_opintoalalla_2002', N'Opiskelee muulla opintoalalla, 2002 luokitus', N'10660')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (69, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10670')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (70, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10680')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (71, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_tutkinto_alkuperaisella_opintoalalla_2002', N'Tutkinto alkuperäisellä opintoalalla, 2002 luokitus', N'10690')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (72, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_opiskelee_alkuperaisella_opintoalalla_2002', N'Opiskelee alkuperäisellä opintoalalla, 2002 luokitus', N'10700')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (73, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_tutkinto_muulla_opintoalalla_2002', N'Tutkinto muulla opintoalalla, 2002 luokitus', N'10710')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (74, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_opiskelee_muulla_opintoalalla_2002', N'Opiskelee muulla opintoalalla, 2002 luokitus', N'10720')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (75, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10730')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (76, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10740')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (77, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3e_kylla', N'Kyllä', N'10750')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (78, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3e_ei', N'Ei', N'10760')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (79, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3f_kylla', N'Kyllä', N'10770')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (80, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3f_ei', N'Ei', N'10780')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (81, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3g_kylla', N'Kyllä', N'10790')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (82, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3g_ei', N'Ei', N'10800')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (83, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3h_kylla', N'Kyllä', N'10810')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (84, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3h_ei', N'Ei', N'10820')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (85, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_tutkinto_alkuperaisella_jarjestajalla', N'Tutkinto alkuperäisellä järjestäjällä', N'10830')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (86, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_tutkinto_muulla_jarjestajalla', N'Tutkinto muulla järjestäjällä', N'10840')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (87, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_opiskelee_alkuperaisella_jarjestajalla', N'Opiskelee alkuperäisellä järjestäjällä', N'10850')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (88, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_opiskelee_muulla_jarjestajalla', N'Opiskelee muulla järjestäjällä', N'10860')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (89, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10870')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (90, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10880')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (91, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_tutkinto_alkuperaisella_jarjestajalla', N'Tutkinto alkuperäisellä järjestäjällä', N'10890')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (92, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_opiskelee_alkuperaisella_jarjestajalla', N'Opiskelee alkuperäisellä järjestäjällä', N'10900')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (93, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_tutkinto_muulla_jarjestajalla', N'Tutkinto muulla järjestäjällä', N'10910')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (94, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_opiskelee_muulla_jarjestajalla', N'Opiskelee muulla järjestäjällä', N'10920')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (95, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'10930')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (96, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'10940')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (97, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4e_kylla', N'Kyllä', N'10950')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (98, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4e_ei', N'Ei', N'10960')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (99, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4f_kylla', N'Kyllä', N'10970')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (100, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4f_ei', N'Ei', N'10980')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (101, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4g_kylla', N'Kyllä', N'10990')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (102, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4g_ei', N'Ei', N'11000')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (103, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4h_kylla', N'Kyllä', N'11010')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (104, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4h_ei', N'Ei', N'11020')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (105, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_tutkinto_alkuperaisessa_oppilaitoksessa', N'Tutkinto alkuperäisessä oppilaitoksessa', N'11030')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (106, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_tutkinto_muussa_oppilaitoksessa', N'Tutkinto muussa oppilaitoksessa', N'11040')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (107, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_opiskelee_alkuperaisessa_oppilaitoksessa', N'Opiskelee alkuperäisessä oppilaitoksessa', N'11050')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (108, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_opiskelee_muussa_oppilaitoksessa', N'Opiskelee muussa oppilaitoksessa', N'11060')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (109, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11070')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (110, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11080')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (111, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_tutkinto_alkuperaisessa_oppilaitoksessa', N'Tutkinto alkuperäisessä oppilaitoksessa', N'11090')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (112, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_opiskelee_alkuperaisessa_oppilaitoksessa', N'Opiskelee alkuperäisessä oppilaitoksessa', N'11100')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (113, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_tutkinto_muussa_oppilaitoksessa', N'Tutkinto muussa oppilaitoksessa', N'11110')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (114, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_opiskelee_muussa_oppilaitoksessa', N'Opiskelee muussa oppilaitoksessa', N'11120')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (115, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11130')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (116, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11140')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (117, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5e_kylla', N'Kyllä', N'11150')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (118, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5e_ei', N'Ei', N'11160')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (119, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5f_kylla', N'Kyllä', N'11170')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (120, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5f_ei', N'Ei', N'11180')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (121, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5g_kylla', N'Kyllä', N'11190')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (122, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5g_ei', N'Ei', N'11200')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (123, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5h_kylla', N'Kyllä', N'11210')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (124, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5h_ei', N'Ei', N'11220')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (125, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_tutkinto_alkuperaisessa_maakunnassa', N'Tutkinto alkuperäisessä maakunnassa', N'11230')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (126, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_tutkinto_muussa_maakunnassa', N'Tutkinto muussa maakunnassa', N'11240')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (127, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_opiskelee_alkuperaisessa_maakunnassa', N'Opiskelee alkuperäisessä maakunnassa', N'11250')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (128, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_opiskelee_muussa_maakunnassa', N'Opiskelee muussa maakunnassa', N'11260')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (129, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11270')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (130, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11280')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (131, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_tutkinto_alkuperaisessa_maakunnassa', N'Tutkinto alkuperäisessä maakunnassa', N'11290')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (132, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_opiskelee_alkuperaisessa_maakunnassa', N'Opiskelee alkuperäisessä maakunnassa', N'11300')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (133, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_tutkinto_muussa_maakunnassa', N'Tutkinto muussa maakunnassa', N'11310')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (134, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_opiskelee_muussa_maakunnassa', N'Opiskelee muussa maakunnassa', N'11320')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (135, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11330')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (136, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11340')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (137, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6e_kylla', N'Kyllä', N'11350')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (138, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6e_ei', N'Ei', N'11360')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (139, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6f_kylla', N'Kyllä', N'11370')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (140, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6f_ei', N'Ei', N'11380')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (141, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6g_kylla', N'Kyllä', N'11390')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (142, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6g_ei', N'Ei', N'11400')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (143, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6h_kylla', N'Kyllä', N'11410')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (144, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6h_ei', N'Ei', N'11420')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (145, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_tutkinto_alkuperaisella_koulutussektorilla', N'Tutkinto alkuperäisellä koulutussektorilla', N'11430')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (146, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_tutkinto_muulla_koulutussektorilla', N'Tutkinto muulla koulutussektorilla', N'11440')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (147, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_opiskelee_alkuperaisella_koulutussektorilla', N'Opiskelee alkuperäisellä koulutussektorilla', N'11450')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (148, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_opiskelee_muulla_koulutussektorilla', N'Opiskelee muulla koulutussektorilla', N'11460')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (149, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11470')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (150, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11480')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (151, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_tutkinto_alkuperaisella_koulutussektorilla', N'Tutkinto alkuperäisellä koulutussektorilla', N'11490')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (152, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_opiskelee_alkuperaisella_koulutussektorilla', N'Opiskelee alkuperäisellä koulutussektorilla', N'11500')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (153, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_tutkinto_muulla_koulutussektorilla', N'Tutkinto muulla koulutussektorilla', N'11510')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (154, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_opiskelee_muulla_koulutussektorilla', N'Opiskelee muulla koulutussektorilla', N'11520')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (155, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11530')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (156, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11540')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (157, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7e_kylla', N'Kyllä', N'11550')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (158, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7e_ei', N'Ei', N'11560')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (159, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7f_kylla', N'Kyllä', N'11570')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (160, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7f_ei', N'Ei', N'11580')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (161, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7g_kylla', N'Kyllä', N'11590')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (162, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7g_ei', N'Ei', N'11600')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (163, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7h_kylla', N'Kyllä', N'11610')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (164, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7h_ei', N'Ei', N'11620')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (165, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_tutkinto_alkuperaisella_opintoalalla_1995', N'Tutkinto alkuperäisellä opintoalalla, 1995 luokitus', N'11630')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (166, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_tutkinto_muulla_opintoalalla_1995', N'Tutkinto muulla opintoalalla, 1995 luokitus', N'11640')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (167, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_opiskelee_alkuperaisella_opintoalalla_1995', N'Opiskelee alkuperäisellä opintoalalla, 1995 luokitus', N'11650')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (168, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_opiskelee_muulla_opintoalalla_1995', N'Opiskelee muulla opintoalalla, 1995 luokitus', N'11660')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (169, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11670')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (170, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11680')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (171, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_tutkinto_alkuperaisella_opintoalalla_1995', N'Tutkinto alkuperäisellä opintoalalla, 1995 luokitus', N'11690')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (172, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_opiskelee_alkuperaisella_opintoalalla_1995', N'Opiskelee alkuperäisellä opintoalalla, 1995 luokitus', N'11700')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (173, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_tutkinto_muulla_opintoalalla_1995', N'Tutkinto muulla opintoalalla, 1995 luokitus', N'11710')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (174, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_opiskelee_muulla_opintoalalla_1995', N'Opiskelee muulla opintoalalla, 1995 luokitus', N'11720')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (175, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11730')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (176, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11740')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (177, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8e_kylla', N'Kyllä', N'11750')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (178, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8e_ei', N'Ei', N'11760')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (179, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8f_kylla', N'Kyllä', N'11770')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (180, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8f_ei', N'Ei', N'11780')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (181, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8g_kylla', N'Kyllä', N'11790')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (182, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8g_ei', N'Ei', N'11800')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (183, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8h_kylla', N'Kyllä', N'11810')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (184, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8h_ei', N'Ei', N'11820')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (185, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_tutkinto_alkuperaisella_koulutusalalla1', N'Tutkinto alkuperäisellä koulutusalalla, taso 1', N'11901')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (186, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_tutkinto_muulla_koulutusalalla1', N'Tutkinto muulla koulutusalalla, taso 1', N'11902')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (187, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_opiskelee_alkuperaisella_koulutusalalla1', N'Opiskelee alkuperäisellä koulutusalalla, taso 1', N'11903')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (188, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_opiskelee_muulla_koulutusalalla1', N'Opiskelee muulla koulutusalalla, taso 1', N'11904')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (189, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11905')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (190, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11906')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (191, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_tutkinto_alkuperaisella_koulutusalalla1', N'Tutkinto alkuperäisellä koulutusalalla, taso 1', N'11911')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (192, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_opiskelee_alkuperaisella_koulutusalalla1', N'Opiskelee alkuperäisellä koulutusalalla, taso 1', N'11912')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (193, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_tutkinto_muulla_koulutusalalla1', N'Tutkinto muulla koulutusalalla, taso 1', N'11913')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (194, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_opiskelee_muulla_koulutusalalla1', N'Opiskelee muulla koulutusalalla, taso 1', N'11914')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (195, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'11915')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (196, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'11916')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (197, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9e_kylla', N'Kyllä', N'11921')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (198, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9e_ei', N'Ei', N'11922')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (199, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9f_kylla', N'Kyllä', N'11931')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (200, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9f_ei', N'Ei', N'11932')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (201, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9g_kylla', N'Kyllä', N'11941')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (202, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9g_ei', N'Ei', N'11942')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (203, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9h_kylla', N'Kyllä', N'11951')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (204, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'9h_ei', N'Ei', N'11952')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (205, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_tutkinto_alkuperaisella_koulutusalalla2', N'Tutkinto alkuperäisellä koulutusalalla, taso 2', N'12101')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (206, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_tutkinto_muulla_koulutusalalla2', N'Tutkinto muulla koulutusalalla, taso 2', N'12102')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (207, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_opiskelee_alkuperaisella_koulutusalalla2', N'Opiskelee alkuperäisellä koulutusalalla, taso 2', N'12103')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (208, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_opiskelee_muulla_koulutusalalla2', N'Opiskelee muulla koulutusalalla, taso 2', N'12104')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (209, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'12105')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (210, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'12106')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (211, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_tutkinto_alkuperaisella_koulutusalalla2', N'Tutkinto alkuperäisellä koulutusalalla, taso 2', N'12111')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (212, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_opiskelee_alkuperaisella_koulutusalalla2', N'Opiskelee alkuperäisellä koulutusalalla, taso 2', N'12112')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (213, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_tutkinto_muulla_koulutusalalla2', N'Tutkinto muulla koulutusalalla, taso 2', N'12113')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (214, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_opiskelee_muulla_koulutusalalla2', N'Opiskelee muulla koulutusalalla, taso 2', N'12114')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (215, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'12115')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (216, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'12116')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (217, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10e_kylla', N'Kyllä', N'12121')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (218, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10e_ei', N'Ei', N'12122')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (219, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10f_kylla', N'Kyllä', N'12131')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (220, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10f_ei', N'Ei', N'12132')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (221, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10g_kylla', N'Kyllä', N'12141')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (222, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10g_ei', N'Ei', N'12142')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (223, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10h_kylla', N'Kyllä', N'12151')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (224, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'10h_ei', N'Ei', N'12152')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (225, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_tutkinto_alkuperaisella_koulutusalalla3', N'Tutkinto alkuperäisellä koulutusalalla, taso 3', N'13101')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (226, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_tutkinto_muulla_koulutusalalla3', N'Tutkinto muulla koulutusalalla, taso 3', N'13102')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (227, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_opiskelee_alkuperaisella_koulutusalalla3', N'Opiskelee alkuperäisellä koulutusalalla, taso 3', N'13103')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (228, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_opiskelee_muulla_koulutusalalla3', N'Opiskelee muulla koulutusalalla, taso 3', N'13104')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (229, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'13105')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (230, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11a_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'13106')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (231, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_tutkinto_alkuperaisella_koulutusalalla3', N'Tutkinto alkuperäisellä koulutusalalla, taso 3', N'13111')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (232, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_opiskelee_alkuperaisella_koulutusalalla3', N'Opiskelee alkuperäisellä koulutusalalla, taso 3', N'13112')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (233, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_tutkinto_muulla_koulutusalalla3', N'Tutkinto muulla koulutusalalla, taso 3', N'13113')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (234, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_opiskelee_muulla_koulutusalalla3', N'Opiskelee muulla koulutusalalla, taso 3', N'13114')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (235, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_keskeyttanyt_tyollinen', N'Ei tutkintoa, ei opiskele, työllinen', N'13115')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (236, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11b_keskeyttanyt_ei_tyollinen', N'Ei tutkintoa, ei opiskele, ei työllinen', N'13116')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (237, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11e_kylla', N'Kyllä', N'13121')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (238, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11e_ei', N'Ei', N'13122')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (239, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11f_kylla', N'Kyllä', N'13131')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (240, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11f_ei', N'Ei', N'13132')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (241, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11g_kylla', N'Kyllä', N'13141')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (242, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11g_ei', N'Ei', N'13142')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (243, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11h_kylla', N'Kyllä', N'13151')
GO
INSERT [dbo].[aloittaneiden_lapaisy_seuranta] ([id], [alkaa], [paattyy], [koodi], [selite], [jarjestys]) VALUES (244, CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'11h_ei', N'Ei', N'13152')
GO
SET IDENTITY_INSERT [dbo].[aloittaneiden_lapaisy_seuranta] OFF
GO
