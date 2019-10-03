USE [VipunenTK_lisatiedot]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tieteenalan_TTHV', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tieteenalan_TTHV'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tieteenalan_TTHV', N'COLUMN',N'Tieteenala2010'))
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tieteenalan_TTHV', @level2type=N'COLUMN',@level2name=N'Tieteenala2010'

GO
/****** Object:  Table [dbo].[tieteenalan_TTHV]    Script Date: 7.5.2018 17:01:13 ******/
DROP TABLE IF EXISTS [dbo].[tieteenalan_TTHV]
GO
/****** Object:  Table [dbo].[koulutuskoodin_tieteenala]    Script Date: 7.5.2018 17:01:13 ******/
DROP TABLE IF EXISTS [dbo].[koulutuskoodin_tieteenala]
GO
/****** Object:  Table [dbo].[haku_valinta_kandi_maisteri]    Script Date: 7.5.2018 17:01:13 ******/
DROP TABLE IF EXISTS [dbo].[haku_valinta_kandi_maisteri]
GO
/****** Object:  Table [dbo].[haku_valinta_kandi_maisteri]    Script Date: 7.5.2018 17:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[haku_valinta_kandi_maisteri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[haku_valinta_kandi_maisteri](
	[I_sykli_kandi] [nvarchar](6) NULL,
	[I_sykli_maisteri] [nchar](6) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[koulutuskoodin_tieteenala]    Script Date: 7.5.2018 17:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[koulutuskoodin_tieteenala]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[koulutuskoodin_tieteenala](
	[koulutuskoodi] [nvarchar](6) NOT NULL,
	[tieteenala_avain] [nvarchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[tieteenalan_TTHV]    Script Date: 7.5.2018 17:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tieteenalan_TTHV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tieteenalan_TTHV](
	[Tieteenala2010] [varchar](50) NOT NULL,
	[TTHV] [varchar](50) NOT NULL,
	[TTHV_koodi] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642101', N'742101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655301', N'751301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642201', N'742201')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655203', N'751203')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642301', N'742301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642401', N'742401')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642501', N'742501')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642601', N'742601')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642703', N'742703')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642701', N'742701')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642702', N'742702')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'642999', N'742999')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655801', N'754101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655501', N'751501')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655202', N'751202')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655201', N'751201')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655101', N'751101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655401', N'751401')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655402', N'751402')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655408', N'751408')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655102', N'751102')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655403', N'751403')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655409', N'751409')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655999', N'751999')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655204', N'751204')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655601', N'751601')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'672501', N'772501')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'662101', N'762201')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'662201', N'762301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'662199', N'762299')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633102', N'733102')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633202', N'733202')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'632101', N'732101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'632199', N'732199')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633103', N'733103')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633203', N'733203')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633501', N'733501')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612202', N'712202')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612103', N'712102')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612203', N'712203')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612201', N'712201')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612104', N'712104')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612105', N'712105')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612102', N'712101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612108', N'712109')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612299', N'712299')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612205', N'712205')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'612204', N'712204')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633301', N'733301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633101', N'733101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633201', N'733201')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623601', N'726601')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633199', N'733199')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'633209', N'733211')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623701', N'726701')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623103', N'726103')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623403', N'726403')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623404', N'726404')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623102', N'726102')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623109', N'726109')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623104', N'726104')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623101', N'726101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623199', N'726199')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623502', N'726502')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'622101', N'722101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'622501', N'725111')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'624101', N'727101')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623301', N'726301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623402', N'726402')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'623999', N'726999')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'699999', N'799999')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'672301', N'772301')
GO
INSERT [dbo].[haku_valinta_kandi_maisteri] ([I_sykli_kandi], [I_sykli_maisteri]) VALUES (N'655410', N'751410')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511251', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511252', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511253', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511254', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511299', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511351', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511352', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511353', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511354', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511399', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511451', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511501', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511601', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511602', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511603', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511604', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511605', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511606', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511903', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511904', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511905', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'511999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521101', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521151', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521152', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521153', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521154', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521155', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521156', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521157', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521158', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521159', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521160', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521161', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521162', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521163', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521164', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521165', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521199', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521201', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521251', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521252', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521253', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521254', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521299', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521351', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521352', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521353', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521399', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521554', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521555', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521599', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521601', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521651', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521652', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521653', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'521654', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'529901', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'529999', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531151', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531154', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531157', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531158', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531159', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531160', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531163', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531401', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531402', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'531499', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'539901', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'539951', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'539952', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'539999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'541101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'541152', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'541199', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551103', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551104', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551201', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551202', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551301', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551302', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551402', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551403', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551404', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551405', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551406', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551411', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551501', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551502', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551901', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551902', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'551999', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559901', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559902', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559903', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559904', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559905', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559906', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'559999', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561101', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561151', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561152', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561153', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561154', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561199', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561201', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561251', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561252', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561299', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561401', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561951', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561952', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561953', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561954', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561955', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561956', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561957', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'561999', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571101', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571103', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571104', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571105', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571106', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571107', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571108', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571112', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571152', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571154', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571160', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571161', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571164', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571165', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571199', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571201', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571202', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571253', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571254', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571255', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571267', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571299', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571801', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'571999', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581102', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581103', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581104', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581151', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581152', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581153', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581154', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581155', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581156', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581201', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581202', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581203', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581204', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581205', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581207', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581251', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581299', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581302', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581399', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581451', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581499', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581501', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581514', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581515', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581516', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581599', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581601', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581602', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581603', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581604', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581699', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'581999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'599999', N'TTHV_9')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'611101', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'611201', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612101', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612102', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612103', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612104', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612105', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612107', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612108', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612199', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612201', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612202', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612203', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612204', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612205', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612299', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'612999', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613101', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613201', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613352', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613353', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613354', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613355', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613356', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613357', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613399', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613401', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613402', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613501', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613651', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613652', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613653', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613654', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613699', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613811', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613951', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613952', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'613999', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621101', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621102', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621103', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621104', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621199', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621201', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621299', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621399', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621501', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621599', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621601', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621701', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621702', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621703', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621704', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621799', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'621999', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622101', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622199', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622201', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622251', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622252', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622253', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622299', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622301', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622399', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622502', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622551', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622552', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622553', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622554', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622555', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622599', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622951', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'622999', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623101', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623102', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623103', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623104', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623105', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623106', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623107', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623108', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623109', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623110', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623111', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623112', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623113', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623114', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623115', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623199', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623201', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623202', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623203', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623204', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623205', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623206', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623207', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623208', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623299', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623301', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623302', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623401', N'TTHV_6122')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623402', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623403', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623404', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623502', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623503', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623599', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623601', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623701', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'623999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'624101', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'624199', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628151', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628152', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628153', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628154', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628155', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'628199', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'629999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631104', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631107', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631109', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631110', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'631199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632101', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632105', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632114', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632115', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632199', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632201', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632205', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632214', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632215', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632299', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632451', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632452', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'632999', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633101', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633102', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633103', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633105', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633106', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633107', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633108', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633199', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633201', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633202', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633203', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633205', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633206', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633207', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633208', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633209', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633210', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633299', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633301', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633310', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633399', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633401', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633402', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633403', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633404', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633405', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633407', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633408', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633409', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633499', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633501', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633651', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'633999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'634101', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'634102', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'634199', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639151', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639152', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639153', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639154', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639155', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639156', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639157', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639158', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639159', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639160', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639161', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'639999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642101', N'TTHV_111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642102', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642201', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642301', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642302', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642303', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642304', N'TTHV_115')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642401', N'TTHV_116')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642501', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642601', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642701', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642702', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642703', N'TTHV_1172')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642901', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'642999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'649999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651102', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651103', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651104', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651105', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651199', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651201', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651202', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651203', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651299', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651301', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651302', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651399', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651402', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651403', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651404', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651408', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651409', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651410', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651499', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651501', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651502', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651503', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651504', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651599', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651601', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651602', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651699', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651901', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651902', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651903', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'651999', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652202', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652301', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652501', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'652999', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653102', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653103', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653104', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653201', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653202', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653301', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653302', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653402', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653403', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653404', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653405', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653409', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653411', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653501', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653502', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653601', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653901', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653902', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'653999', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'654101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655101', N'TTHV_214')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655102', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655201', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655202', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655203', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655204', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655301', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655302', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655401', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655402', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655403', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655404', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655408', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655409', N'TTHV_220')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655499', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655501', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655502', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655601', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655801', N'TTHV_211')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655901', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'659999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661101', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661201', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661301', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661401', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661501', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'661999', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662101', N'TTHV_4111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662102', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662103', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662104', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662105', N'TTHV_414')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662151', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662199', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662201', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662551', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662552', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662599', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'662999', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671101', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671103', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671104', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671105', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671106', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671107', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671108', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671111', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671112', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671113', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671114', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671115', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671116', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671117', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671118', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671119', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671199', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671201', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671202', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671299', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671901', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'671999', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672101', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672201', N'TTHV_313')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672301', N'TTHV_413')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672401', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672501', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672651', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'672999', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681102', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681103', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681104', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681201', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681202', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681501', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681502', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681901', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'681999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682201', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682251', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682402', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682499', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682601', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682651', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'682999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'691999', N'TTHV_9')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'692999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'699999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'711101', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'711201', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712101', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712102', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712104', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712105', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712108', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712109', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712199', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712201', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712202', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712203', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712204', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712205', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'712299', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'719951', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'719952', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'719953', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'719999', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721101', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721102', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721103', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721104', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721201', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721399', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721501', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721599', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721601', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721701', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721702', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721703', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721704', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721799', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'721999', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722101', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722951', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722952', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722953', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722954', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722955', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722956', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722957', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722958', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722959', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'722999', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'723111', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'723951', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'723952', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'723999', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'724101', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'724999', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'725111', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'725201', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'725999', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726101', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726102', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726103', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726104', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726105', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726106', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726107', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726108', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726109', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726110', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726111', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726112', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726113', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726114', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726115', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726199', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726201', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726202', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726203', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726204', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726205', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726206', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726207', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726208', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726299', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726301', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726302', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726401', N'TTHV_6122')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726402', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726403', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726404', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726502', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726503', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726599', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726601', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726701', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'726999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'727101', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'727999', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'729999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'731101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'731199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'731201', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'731207', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'731299', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732101', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732105', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732114', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732115', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732199', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732201', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732205', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732214', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732215', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732299', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732351', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732355', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732364', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732365', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732399', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'732999', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733101', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733102', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733103', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733105', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733106', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733107', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733108', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733110', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733199', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733201', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733202', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733203', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733205', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733206', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733207', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733208', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733209', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733210', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733211', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733299', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733301', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733310', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733399', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733401', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733402', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733403', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733404', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733405', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733407', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733408', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733499', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733501', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733651', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'733999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'734101', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'734102', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'739999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742101', N'TTHV_111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742102', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742201', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742301', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742302', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742303', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742304', N'TTHV_115')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742401', N'TTHV_116')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742501', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742601', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742701', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742702', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742703', N'TTHV_1172')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742901', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'742999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'749999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750101', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750102', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750103', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750199', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750201', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750205', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750302', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750303', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750503', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750601', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750701', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750702', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750802', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750803', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750899', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'750904', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751101', N'TTHV_214')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751102', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751201', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751202', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751203', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751204', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751301', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751302', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751401', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751402', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751403', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751404', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751408', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751409', N'TTHV_220')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751501', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751502', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751601', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751901', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'754101', N'TTHV_211')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'754201', N'TTHV_211')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'759999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'761101', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'761201', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'761301', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'761501', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'761999', N'TTHV_4')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762201', N'TTHV_4111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762202', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762203', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762204', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762205', N'TTHV_414')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762251', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762299', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762301', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762451', N'TTHV_4111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762551', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'762999', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771101', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771102', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771103', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771201', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771203', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771204', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771205', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771206', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771207', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771208', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771211', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771212', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771213', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771214', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771215', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771216', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771217', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771218', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771219', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771299', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771301', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771399', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771901', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'771999', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772101', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772201', N'TTHV_313')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772301', N'TTHV_413')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772401', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772451', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772501', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'772999', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'775101', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'775201', N'TTHV_313')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'775301', N'TTHV_413')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'775999', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781101', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781102', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781103', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781199', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781202', N'TTHV_3')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781301', N'TTHV_6')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781401', N'TTHV_2')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781901', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'781999', N'TTHV_5')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782201', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782601', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782602', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782603', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782604', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'782999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'791999', N'TTHV_9')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'792999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'799999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812101', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812102', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812103', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812105', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812199', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'812201', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815101', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815102', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815103', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815105', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815199', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'815201', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'819999', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'822101', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'822211', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'822401', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'822501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823101', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823102', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823103', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823104', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823105', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823106', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823107', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823108', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823109', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823110', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823111', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823113', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823114', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823199', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823202', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823203', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823204', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823205', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823206', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823299', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823301', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823302', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823401', N'TTHV_6122')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823402', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823403', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823404', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823502', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823503', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823599', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823601', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823701', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'823999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'824101', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825101', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825211', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825301', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825401', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'825901', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826101', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826102', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826103', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826104', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826105', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826106', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826107', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826108', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826109', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826110', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826111', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826113', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826114', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826115', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826199', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826202', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826203', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826204', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826205', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826206', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826299', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826301', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826302', N'TTHV_615')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826401', N'TTHV_6122')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826402', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826403', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826404', N'TTHV_6121')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826501', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826502', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826503', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826599', N'TTHV_613')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826601', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826701', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826901', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'826999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'827101', N'TTHV_614')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'829999', N'TTHV_616')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832101', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832105', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832114', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832115', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832199', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832351', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832355', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832364', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832365', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832399', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'832999', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833101', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833102', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833103', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833105', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833106', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833107', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833108', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833110', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833199', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833201', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833202', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833203', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833205', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833206', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833207', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833208', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833209', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833210', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833299', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833301', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833310', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833399', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833401', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833402', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833403', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833404', N'TTHV_516')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833405', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833407', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833408', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833499', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833501', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'833999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'834101', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835101', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835105', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835114', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835115', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835199', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835351', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835355', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835365', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835399', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'835999', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836101', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836102', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836103', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836105', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836106', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836107', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836108', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836110', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836199', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836201', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836202', N'TTHV_511')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836203', N'TTHV_514')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836205', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836206', N'TTHV_518')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836207', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836208', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836210', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836211', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836299', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836301', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836310', N'TTHV_519')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836399', N'TTHV_517')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836501', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'836999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'837301', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839101', N'TTHV_512')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839102', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839103', N'TTHV_515')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839104', N'TTHV_513')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839199', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'839999', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842101', N'TTHV_111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842102', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842201', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842301', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842302', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842303', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842304', N'TTHV_115')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842401', N'TTHV_116')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842501', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842601', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842701', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842702', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842703', N'TTHV_1172')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842901', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'842999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845101', N'TTHV_111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845102', N'TTHV_112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845201', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845301', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845302', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845303', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845304', N'TTHV_115')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845401', N'TTHV_116')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845501', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845601', N'TTHV_1171')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845701', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845702', N'TTHV_118')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845703', N'TTHV_1172')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845901', N'TTHV_611')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'845999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'849999', N'TTHV_119')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851101', N'TTHV_214')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851102', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851201', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851202', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851203', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851204', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851301', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851302', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851401', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851402', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851403', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851404', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851408', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851409', N'TTHV_220')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851501', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851502', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851601', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851801', N'TTHV_211')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851901', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'851999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855101', N'TTHV_214')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855102', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855201', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855202', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855203', N'TTHV_114')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855204', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855301', N'TTHV_113')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855302', N'TTHV_213')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855401', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855402', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855403', N'TTHV_218')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855404', N'TTHV_215')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855408', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855409', N'TTHV_220')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855501', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855502', N'TTHV_212')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855601', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855801', N'TTHV_211')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855901', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'855999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'856101', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'859999', N'TTHV_222')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862201', N'TTHV_4111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862202', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862203', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862204', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862251', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862299', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862301', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'862999', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865201', N'TTHV_4111')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865202', N'TTHV_4112')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865203', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865204', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865205', N'TTHV_414')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865251', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865299', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865301', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865501', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'865999', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'869999', N'TTHV_415')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'872401', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'872501', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'872999', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875101', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875201', N'TTHV_313')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875301', N'TTHV_413')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875401', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875501', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875601', N'TTHV_300')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875602', N'TTHV_313')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875603', N'TTHV_413')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875604', N'TTHV_317')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875605', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'875999', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'879999', N'TTHV_314')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'882201', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'885201', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'885301', N'TTHV_315')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'885601', N'TTHV_520')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'885999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'889999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'892999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'895999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'899999', N'TTHV_999')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'655410', N'TTHV_216')
GO
INSERT [dbo].[koulutuskoodin_tieteenala] ([koulutuskoodi], [tieteenala_avain]) VALUES (N'751410', N'TTHV_216')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_111', N'TTHV_111', N'111')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_112', N'TTHV_112', N'112')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_113', N'TTHV_113', N'113')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_114', N'TTHV_114', N'114')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_115', N'TTHV_115', N'115')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_116', N'TTHV_116', N'116')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1171', N'TTHV_1171', N'1171')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1172', N'TTHV_1172', N'1172')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1181', N'TTHV_118', N'118')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1182', N'TTHV_118', N'118')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1183', N'TTHV_118', N'118')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_1184', N'TTHV_118', N'118')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_119', N'TTHV_119', N'119')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_211', N'TTHV_211', N'211')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_212', N'TTHV_212', N'212')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_213', N'TTHV_213', N'213')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_214', N'TTHV_214', N'214')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_215', N'TTHV_215', N'215')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_216', N'TTHV_216', N'216')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_217', N'TTHV_222', N'222')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_218', N'TTHV_218', N'218')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_219', N'TTHV_220', N'220')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_220', N'TTHV_220', N'220')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_221', N'TTHV_114', N'114')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_222', N'TTHV_222', N'222')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3111', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3112', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3121', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3122', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3123', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3124', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3125', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3126', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_313', N'TTHV_313', N'313')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3141', N'TTHV_314', N'314')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_3142', N'TTHV_314', N'314')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_315', N'TTHV_315', N'315')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_316', N'TTHV_314', N'314')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_317', N'TTHV_317', N'317')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_318', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_319', N'TTHV_300', N'300')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_4111', N'TTHV_4111', N'4111')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_4112', N'TTHV_4112', N'4112')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_412', N'TTHV_413', N'413')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_413', N'TTHV_413', N'413')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_414', N'TTHV_414', N'414')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_415', N'TTHV_415', N'415')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_511', N'TTHV_511', N'511')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_512', N'TTHV_512', N'512')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_513', N'TTHV_513', N'513')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_5141', N'TTHV_514', N'514')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_5142', N'TTHV_514', N'514')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_515', N'TTHV_515', N'515')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_516', N'TTHV_516', N'516')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_517', N'TTHV_517', N'517')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_518', N'TTHV_518', N'518')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_519', N'TTHV_519', N'519')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_520', N'TTHV_520', N'520')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_611', N'TTHV_611', N'611')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_6121', N'TTHV_6121', N'6121')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_6122', N'TTHV_6122', N'6122')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_6131', N'TTHV_613', N'613')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_6132', N'TTHV_613', N'613')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_614', N'TTHV_614', N'614')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_615', N'TTHV_615', N'615')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_616', N'TTHV_616', N'616')
GO
INSERT [dbo].[tieteenalan_TTHV] ([Tieteenala2010], [TTHV], [TTHV_koodi]) VALUES (N'TA10_999', N'TTHV_999', N'999')
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tieteenalan_TTHV', N'COLUMN',N'Tieteenala2010'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tieteenalan_TTHV', @level2type=N'COLUMN',@level2name=N'Tieteenala2010'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'tieteenalan_TTHV', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tieteenala 2010 ja TTHV luokitusten yhdistäminen' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tieteenalan_TTHV'
GO
use [antero]