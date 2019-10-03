USE [ANTERO]
GO
/****** Object:  Table [sa].[SA_profesuurit_erc_huippuyksikot]    Script Date: 7.5.2018 17:08:43 ******/
DROP TABLE IF EXISTS [sa].[SA_profesuurit_erc_huippuyksikot]
GO
/****** Object:  Table [sa].[SA_profesuurit_erc_huippuyksikot]    Script Date: 7.5.2018 17:08:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[SA_profesuurit_erc_huippuyksikot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[SA_profesuurit_erc_huippuyksikot](
	[Tieteenala] [nvarchar](max) NOT NULL,
	[TA10] [nvarchar](50) NOT NULL,
	[TTHV] [nvarchar](50) NOT NULL,
	[Yliopisto] [nvarchar](50) NOT NULL,
	[Organisaatio_koodi] [nvarchar](50) NOT NULL,
	[Osal_hui_yks_14-19_18-25] [nvarchar](50) NULL,
	[SA_prof_13-16] [nvarchar](50) NULL,
	[ERC_StG_CoG_AdG_15-17] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'AALTO', N'10076', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'HY', N'01901', N'2', N'1', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'ISY', N'10088', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'JY', N'01906', N'2', NULL, N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'LTY', N'01914', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'OY', N'01904', N'2', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Matematiikka', N'TA10_111', N'TTHV_111', N'TTY', N'01915', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Tietojenkäsittely ja informaatiotieteet', N'TA10_113', N'TTHV_113', N'AALTO', N'10076', NULL, N'1', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Tietojenkäsittely ja informaatiotieteet', N'TA10_113', N'TTHV_113', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Fysiikka', N'TA10_114', N'TTHV_114', N'AALTO', N'10076', N'1', N'2', N'5')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Fysiikka', N'TA10_114', N'TTHV_114', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Fysiikka', N'TA10_114', N'TTHV_114', N'JY', N'01906', NULL, NULL, N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Fysiikka', N'TA10_114', N'TTHV_114', N'TY', N'10089', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kemia', N'TA10_116', N'TTHV_116', N'AALTO', N'10076', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kemia', N'TA10_116', N'TTHV_116', N'JY', N'01906', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kemia', N'TA10_116', N'TTHV_116', N'OY', N'01904', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Geotieteet', N'TA10_1171', N'TTHV_1171', N'AALTO', N'10076', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Geotieteet', N'TA10_1171', N'TTHV_1171', N'HY', N'01901', N'3', N'1', N'4')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Geotieteet', N'TA10_1171', N'TTHV_1171', N'ISY', N'10088', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Geotieteet', N'TA10_1171', N'TTHV_1171', N'OY', N'01904', N'1', NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Geotieteet', N'TA10_1171', N'TTHV_1171', N'TY', N'10089', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ympäristötiede', N'TA10_1172', N'TTHV_1172', N'HY', N'01901', NULL, N'1', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ekologia, evoluutiobiologia', N'TA10_1181', N'TTHV_118', N'HY', N'01901', NULL, N'2', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ekologia, evoluutiobiologia', N'TA10_1181', N'TTHV_118', N'JY', N'01906', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ekologia, evoluutiobiologia', N'TA10_1181', N'TTHV_118', N'TY', N'10089', NULL, N'2', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biokemia, solu- ja molekyylibiologia', N'TA10_1182', N'TTHV_118', N'HY', N'01901', N'2', N'1', N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biokemia, solu- ja molekyylibiologia', N'TA10_1182', N'TTHV_118', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biokemia, solu- ja molekyylibiologia', N'TA10_1182', N'TTHV_118', N'TTY', N'01915', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biokemia, solu- ja molekyylibiologia', N'TA10_1182', N'TTHV_118', N'TY', N'10089', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biokemia, solu- ja molekyylibiologia', N'TA10_1182', N'TTHV_118', N'ÅA', N'01903', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kasvibiologia, mikrobiologia, virologia', N'TA10_1183', N'TTHV_118', N'HY', N'01901', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kasvibiologia, mikrobiologia, virologia', N'TA10_1183', N'TTHV_118', N'TY', N'10089', N'1', N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Genetiikka, kehitysbiologia, fysiologia', N'TA10_1184', N'TTHV_118', N'HY', N'01901', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Sähkö-, automaatio- ja tietoliikennetekniikka, elektroniikka', N'TA10_213', N'TTHV_213', N'AALTO', N'10076', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Sähkö-, automaatio- ja tietoliikennetekniikka, elektroniikka', N'TA10_213', N'TTHV_213', N'OY', N'01904', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Materiaalitekniikka', N'TA10_216', N'TTHV_216', N'AALTO', N'10076', N'1', NULL, N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Materiaalitekniikka', N'TA10_216', N'TTHV_216', N'TTY', N'01915', NULL, NULL, N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Lääketieteen tekniikka', N'TA10_217', N'TTHV_222', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Lääketieteen tekniikka', N'TA10_217', N'TTHV_222', N'TTY', N'01915', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ympäristötekniikka', N'TA10_218', N'TTHV_218', N'AALTO', N'10076', N'1', NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ympäristötekniikka', N'TA10_218', N'TTHV_218', N'HY', N'01901', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Ympäristötekniikka', N'TA10_218', N'TTHV_218', N'OY', N'01904', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Nanoteknologia', N'TA10_221', N'TTHV_114', N'JY', N'01906', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biolääketieteet', N'TA10_3111', N'TTHV_300', N'HY', N'01901', N'4', N'2', N'7')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biolääketieteet', N'TA10_3111', N'TTHV_300', N'ISY', N'10088', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biolääketieteet', N'TA10_3111', N'TTHV_300', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Biolääketieteet', N'TA10_3111', N'TTHV_300', N'TY', N'10089', N'1', N'2', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Neurotieteet', N'TA10_3112', N'TTHV_300', N'AALTO', N'10076', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Neurotieteet', N'TA10_3112', N'TTHV_300', N'HY', N'01901', NULL, N'2', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Neurotieteet', N'TA10_3112', N'TTHV_300', N'ISY', N'10088', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kliiniset lääketieteet', N'TA10_312', N'TTHV_300', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kliiniset lääketieteet', N'TA10_312', N'TTHV_300', N'ISY', N'10088', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kliiniset lääketieteet', N'TA10_312', N'TTHV_300', N'TY', N'10089', N'1', NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kansanterveystiede, ympäristö ja työterveys', N'TA10_3142', N'TTHV_314', N'JY', N'01906', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Eläinlääketiede', N'TA10_412', N'TTHV_413', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Liiketaloustiede', N'TA10_512', N'TTHV_512', N'AALTO', N'10076', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Oikeustiede', N'TA10_513', N'TTHV_513', N'HY', N'01901', N'1', NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Oikeustiede', N'TA10_513', N'TTHV_513', N'ISY', N'10088', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Oikeustiede', N'TA10_513', N'TTHV_513', N'TY', N'10089', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Sosiaalitieteet', N'TA10_514', N'TTHV_514', N'HY', N'01901', N'1', NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Sosiaalitieteet', N'TA10_514', N'TTHV_514', N'JY', N'01906', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Sosiaalitieteet', N'TA10_514', N'TTHV_514', N'TAY', N'01905', N'1', N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Psykologia', N'TA10_515', N'TTHV_515', N'HY', N'01901', NULL, N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Yhteiskuntamaantiede, talousmaantiede', N'TA10_519', N'TTHV_519', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Yhteiskuntamaantiede, talousmaantiede', N'TA10_519', N'TTHV_519', N'OY', N'01904', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Yhteiskuntamaantiede, talousmaantiede', N'TA10_519', N'TTHV_519', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Muut yhteiskuntatieteet', N'TA10_520', N'TTHV_520', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Filosofia', N'TA10_611', N'TTHV_611', N'HY', N'01901', NULL, NULL, N'3')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Filosofia', N'TA10_611', N'TTHV_611', N'JY', N'01906', NULL, N'1', N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Kielitieteet', N'TA10_6121', N'TTHV_6121', N'HY', N'01901', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Taiteiden tutkimus', N'TA10_613', N'TTHV_613', N'AALTO', N'10076', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Taiteiden tutkimus', N'TA10_613', N'TTHV_613', N'ISY', N'10088', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Taiteiden tutkimus', N'TA10_613', N'TTHV_613', N'JY', N'01906', N'1', N'1', NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Taiteiden tutkimus', N'TA10_613', N'TTHV_613', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Taiteiden tutkimus', N'TA10_613', N'TTHV_613', N'TY', N'10089', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Teologia', N'TA10_614', N'TTHV_614', N'HY', N'01901', N'2', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Historia ja arkeologia', N'TA10_615', N'TTHV_615', N'HY', N'01901', N'1', N'1', N'2')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Historia ja arkeologia', N'TA10_615', N'TTHV_615', N'OY', N'01904', NULL, NULL, N'1')
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Historia ja arkeologia', N'TA10_615', N'TTHV_615', N'TAY', N'01905', N'1', NULL, NULL)
GO
INSERT [sa].[SA_profesuurit_erc_huippuyksikot] ([Tieteenala], [TA10], [TTHV], [Yliopisto], [Organisaatio_koodi], [Osal_hui_yks_14-19_18-25], [SA_prof_13-16], [ERC_StG_CoG_AdG_15-17]) VALUES (N'Historia ja arkeologia', N'TA10_615', N'TTHV_615', N'TY', N'10089', NULL, N'1', NULL)
GO
use [antero]