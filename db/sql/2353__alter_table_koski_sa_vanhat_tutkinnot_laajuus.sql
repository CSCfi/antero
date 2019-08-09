USE [Koski_SA]
GO
/****** Object:  Table [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus]    Script Date: 9.8.2019 14:50:22 ******/
DROP TABLE IF EXISTS [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus]
GO
/****** Object:  Table [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus]    Script Date: 9.8.2019 14:50:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus](
	[diaarinumero] [varchar](50) NULL,
	[tutkinnonosa_laajuus] [float] NULL,
	[lahde] [varchar](255) NULL,
	[pvm] [date] NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'1/011/2007', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'1/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'10/011/2003', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'10/011/2007', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'10/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'10/011/2012', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'10/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'100/011/2014', 22.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2003', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2006', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2007', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'11/011/2015', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2003', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2006', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2008', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2009', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2011', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2012', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'12/011/2015', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2002', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2007', 25.71428571, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2008', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2009', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2011', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2012', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2013', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'13/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2003', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2005', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2008', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2011', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2013', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2014', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'14/011/2016', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2007', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2011', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2013', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2014', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'15/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2004', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2005', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2008', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2009', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2011', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2012', 21.42857143, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2013', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'16/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2004', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2005', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2012', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2015', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'17/011/2016', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2005', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2008', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2011', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2012', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'18/011/2016', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2004', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2005', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2007', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2008', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2011', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'19/011/2012', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2006', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2007', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2008', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2011', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2014', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'2/011/2015', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'20/011/2005', 25.71428571, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'20/011/2007', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'20/011/2008', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'20/011/2011', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'20/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2003', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2005', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2007', 21.42857143, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2008', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2013', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2014', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'21/011/2016', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'22/011/1998', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'22/011/2005', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'22/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'22/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'22/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2003', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2004', 25.71428571, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2010', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2011', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2012', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2014', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'23/011/2016', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'24/011/2002', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'24/011/2003', 22.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'24/011/2007', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'24/011/2008', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'24/011/2014', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2002', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2003', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2004', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2006', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2012', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'25/011/2014', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2002', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2005', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2006', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2007', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'26/011/2013', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2007', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2011', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'27/011/2013', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2002', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2005', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2006', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2007', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2008', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2010', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2011', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2012', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'28/011/2013', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2002', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'29/011/2015', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2005', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2008', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'3/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2006', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2008', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2012', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2013', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'30/011/2015', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2001', 18.75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2002', 21.42857143, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2011', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2014', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'31/011/2015', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2007', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2011', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2013', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2014', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2015', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'32/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2007', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2008', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2011', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2014', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'33/011/2015', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2005', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2010', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2013', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2014', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'34/011/2015', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'35/011/2007', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'35/011/2011', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'35/011/2012', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'35/011/2014', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'35/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2005', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2008', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2011', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2014', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'36/011/2015', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'37/011/2004', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'37/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'37/011/2013', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'37/011/2015', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2001', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2004', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2005', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2006', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2013', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'38/011/2016', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'39/011/2001', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'39/011/2004', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'39/011/2009', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'39/011/2012', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'39/011/2015', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2002', 21.42857143, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2005', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2008', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2011', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'4/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2001', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2004', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2009', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2013', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'40/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'41/011/2005', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'41/011/2006', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'41/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'41/011/2013', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'41/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'42/011/2005', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'42/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'42/011/2012', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'42/011/2016', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'43/011/2009', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'43/011/2010', 20, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'43/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'43/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'44/011/2004', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'44/011/2005', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'44/011/2006', 18.75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'44/011/2009', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'44/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2004', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2009', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'45/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2004', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2005', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2006', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2009', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2010', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2012', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'46/011/2015', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2004', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2005', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2006', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2009', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2012', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2015', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'47/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'48/011/2006', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'48/011/2009', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'48/011/2010', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'48/011/2016', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'49/011/2004', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'49/011/2006', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'49/011/2009', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'49/011/2012', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2002', 22.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2005', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2006', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2009', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2011', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'5/011/2016', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'50/011/2004', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'50/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'50/011/2016', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'51/011/2002', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'51/011/2006', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'51/011/2012', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'51/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'52/011/2002', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'52/011/2009', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'52/011/2010', 90, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'52/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'52/011/2016', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2002', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2009', 25.71428571, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2010', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2015', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'53/011/2016', 25.71428571, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'54/011/2004', 18.75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'54/011/2009', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'54/011/2010', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'55/011/2009', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'55/011/2010', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'55/011/2012', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'56/011/2010', 21.42857143, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'57/011/2010', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'58/011/2010', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'59/011/2010', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'6/011/2006', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'6/011/2013', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'6/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'60/011/2010', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'61/011/2000', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'61/011/2001', 22.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'61/011/2010', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'61/011/2015', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'62/011/2015', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'63/011/2010', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'65/011/2002', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'66/011/2002', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'67/011/2015', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'68/011/2002', 0, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'68/011/2015', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'69/011/2015', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'7/011/2009', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'7/011/2012', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'7/011/2013', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'7/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2004', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2006', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2009', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2011', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2012', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2013', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2014', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'8/011/2016', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2003', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2004', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2006', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2008', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2009', 75, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2012', 25, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'9/011/2016', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'96/011/2014', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'97/011/2014', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'98/011/2014', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'99/011/2014', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1376-2017', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1377-2017', 37.5, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1378-2017', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1379-2017', 50, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1380-2017', 60, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-1886-2017', 45, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-539-2017', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-944-2017', 36, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
INSERT [sa].[f_spl_vanhat_tutkinnot_laajuus_diaarinumerokohdistus] ([diaarinumero], [tutkinnonosa_laajuus], [lahde], [pvm]) VALUES (N'OPH-945-2017', 30, N'Seppo Hänninen, email 11.7.2019', CAST(N'2019-07-11' AS Date))
GO
USE [ANTERO]