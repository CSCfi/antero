USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]    Script Date: 24.11.2023 15:28:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE VipunenTK_DW.dbo.[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]

GO

CREATE TABLE [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila](
	[tilv] [varchar](4) NULL,
	[lahde] [varchar](2) NULL,
	[sp] [varchar](1) NULL,
	[syntv] [varchar](4) NULL,
	[aikielir1] [varchar](2) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[klaji] [varchar](2) NULL,
	[ophal] [varchar](1) NULL,
	[jarj] [varchar](10) NULL,
	[kkun] [nvarchar](3) NULL,
	[koulk] [nvarchar](6) NULL,
	[pohjkoulk] [nvarchar](6) NULL,
	[lusuorv_2004] [varchar](4) NULL,
	[lusuorlk_2004] [varchar](1) NULL,
	[lututkmaak_2004] [varchar](2) NULL,
	[lututkjarj_2004] [varchar](10) NULL,
	[lututkkoulk_2004] [nvarchar](6) NULL,
	[amptsuorv_2004] [varchar](4) NULL,
	[amptsuorlk_2004] [varchar](1) NULL,
	[ampttutkmaak_2004] [varchar](2) NULL,
	[ampttutkjarj_2004] [varchar](10) NULL,
	[ampttutkkoulk_2004] [nvarchar](6) NULL,
	[amlksuorv_2004] [varchar](4) NULL,
	[amlksuorlk_2004] [varchar](1) NULL,
	[amlktutkmaak_2004] [varchar](2) NULL,
	[amlktutkjarj_2004] [varchar](10) NULL,
	[amlktutkkoulk_2004] [nvarchar](6) NULL,
	[muukksuorv_2004] [varchar](4) NULL,
	[muukksuorlk_2004] [varchar](1) NULL,
	[muukktutkmaak_2004] [varchar](2) NULL,
	[muukktutkjarj_2004] [varchar](10) NULL,
	[muukktutkkoulk_2004] [nvarchar](6) NULL,
	[lusuorv_2005] [varchar](4) NULL,
	[lusuorlk_2005] [varchar](1) NULL,
	[lututkmaak_2005] [varchar](2) NULL,
	[lututkjarj_2005] [varchar](10) NULL,
	[lututkkoulk_2005] [nvarchar](6) NULL,
	[amptsuorv_2005] [varchar](4) NULL,
	[amptsuorlk_2005] [varchar](1) NULL,
	[ampttutkmaak_2005] [varchar](2) NULL,
	[ampttutkjarj_2005] [varchar](10) NULL,
	[ampttutkkoulk_2005] [nvarchar](6) NULL,
	[amlksuorv_2005] [varchar](4) NULL,
	[amlksuorlk_2005] [varchar](1) NULL,
	[amlktutkmaak_2005] [varchar](2) NULL,
	[amlktutkjarj_2005] [varchar](10) NULL,
	[amlktutkkoulk_2005] [nvarchar](6) NULL,
	[muukksuorv_2005] [varchar](4) NULL,
	[muukksuorlk_2005] [varchar](1) NULL,
	[muukktutkmaak_2005] [varchar](2) NULL,
	[muukktutkjarj_2005] [varchar](10) NULL,
	[muukktutkkoulk_2005] [nvarchar](6) NULL,
	[lusuorv_2006] [varchar](4) NULL,
	[lusuorlk_2006] [varchar](1) NULL,
	[lututkmaak_2006] [varchar](2) NULL,
	[lututkjarj_2006] [varchar](10) NULL,
	[lututkkoulk_2006] [nvarchar](6) NULL,
	[amptsuorv_2006] [varchar](4) NULL,
	[amptsuorlk_2006] [varchar](1) NULL,
	[ampttutkmaak_2006] [varchar](2) NULL,
	[ampttutkjarj_2006] [varchar](10) NULL,
	[ampttutkkoulk_2006] [nvarchar](6) NULL,
	[amlksuorv_2006] [varchar](4) NULL,
	[amlksuorlk_2006] [varchar](1) NULL,
	[amlktutkmaak_2006] [varchar](2) NULL,
	[amlktutkjarj_2006] [varchar](10) NULL,
	[amlktutkkoulk_2006] [nvarchar](6) NULL,
	[muukksuorv_2006] [varchar](4) NULL,
	[muukksuorlk_2006] [varchar](1) NULL,
	[muukktutkmaak_2006] [varchar](2) NULL,
	[muukktutkjarj_2006] [varchar](10) NULL,
	[muukktutkkoulk_2006] [nvarchar](6) NULL,
	[lusuorv_2007] [varchar](4) NULL,
	[lusuorlk_2007] [varchar](1) NULL,
	[lututkmaak_2007] [varchar](2) NULL,
	[lututkjarj_2007] [varchar](10) NULL,
	[lututkkoulk_2007] [nvarchar](6) NULL,
	[amptsuorv_2007] [varchar](4) NULL,
	[amptsuorlk_2007] [varchar](1) NULL,
	[ampttutkmaak_2007] [varchar](2) NULL,
	[ampttutkjarj_2007] [varchar](10) NULL,
	[ampttutkkoulk_2007] [nvarchar](6) NULL,
	[amlksuorv_2007] [varchar](4) NULL,
	[amlksuorlk_2007] [varchar](1) NULL,
	[amlktutkmaak_2007] [varchar](2) NULL,
	[amlktutkjarj_2007] [varchar](10) NULL,
	[amlktutkkoulk_2007] [nvarchar](6) NULL,
	[muukksuorv_2007] [varchar](4) NULL,
	[muukksuorlk_2007] [varchar](1) NULL,
	[muukktutkmaak_2007] [varchar](2) NULL,
	[muukktutkjarj_2007] [varchar](10) NULL,
	[muukktutkkoulk_2007] [nvarchar](6) NULL,
	[lusuorv_2008] [varchar](4) NULL,
	[lusuorlk_2008] [varchar](1) NULL,
	[lututkmaak_2008] [varchar](2) NULL,
	[lututkjarj_2008] [varchar](10) NULL,
	[lututkkoulk_2008] [nvarchar](6) NULL,
	[amptsuorv_2008] [varchar](4) NULL,
	[amptsuorlk_2008] [varchar](1) NULL,
	[ampttutkmaak_2008] [varchar](2) NULL,
	[ampttutkjarj_2008] [varchar](10) NULL,
	[ampttutkkoulk_2008] [nvarchar](6) NULL,
	[amlksuorv_2008] [varchar](4) NULL,
	[amlksuorlk_2008] [varchar](1) NULL,
	[amlktutkmaak_2008] [varchar](2) NULL,
	[amlktutkjarj_2008] [varchar](10) NULL,
	[amlktutkkoulk_2008] [nvarchar](6) NULL,
	[muukksuorv_2008] [varchar](4) NULL,
	[muukksuorlk_2008] [varchar](1) NULL,
	[muukktutkmaak_2008] [varchar](2) NULL,
	[muukktutkjarj_2008] [varchar](10) NULL,
	[muukktutkkoulk_2008] [nvarchar](6) NULL,
	[lusuorv_2009] [varchar](4) NULL,
	[lusuorlk_2009] [varchar](1) NULL,
	[lututkmaak_2009] [varchar](2) NULL,
	[lututkjarj_2009] [varchar](10) NULL,
	[lututkkoulk_2009] [nvarchar](6) NULL,
	[amptsuorv_2009] [varchar](4) NULL,
	[amptsuorlk_2009] [varchar](1) NULL,
	[ampttutkmaak_2009] [varchar](2) NULL,
	[ampttutkjarj_2009] [varchar](10) NULL,
	[ampttutkkoulk_2009] [nvarchar](6) NULL,
	[amlksuorv_2009] [varchar](4) NULL,
	[amlksuorlk_2009] [varchar](1) NULL,
	[amlktutkmaak_2009] [varchar](2) NULL,
	[amlktutkjarj_2009] [varchar](10) NULL,
	[amlktutkkoulk_2009] [nvarchar](6) NULL,
	[muukksuorv_2009] [varchar](4) NULL,
	[muukksuorlk_2009] [varchar](1) NULL,
	[muukktutkmaak_2009] [varchar](2) NULL,
	[muukktutkjarj_2009] [varchar](10) NULL,
	[muukktutkkoulk_2009] [nvarchar](6) NULL,
	[luopiskkoulk_2004] [nvarchar](6) NULL,
	[luopiskjarj_2004] [varchar](10) NULL,
	[lukmaak_2004] [varchar](2) NULL,
	[amptopiskkoulk_2004] [nvarchar](6) NULL,
	[amptopiskjarj_2004] [varchar](10) NULL,
	[amptkmaak_2004] [varchar](2) NULL,
	[amlkopiskkoulk_2004] [nvarchar](6) NULL,
	[amlkopiskjarj_2004] [varchar](10) NULL,
	[amlkkmaak_2004] [varchar](2) NULL,
	[muukkopiskkoulk_2004] [nvarchar](6) NULL,
	[muukkopiskjarj_2004] [varchar](10) NULL,
	[muukkkmaak_2004] [varchar](2) NULL,
	[luopiskkoulk_2005] [nvarchar](6) NULL,
	[luopiskjarj_2005] [varchar](10) NULL,
	[lukmaak_2005] [varchar](2) NULL,
	[amptopiskkoulk_2005] [nvarchar](6) NULL,
	[amptopiskjarj_2005] [varchar](10) NULL,
	[amptkmaak_2005] [varchar](2) NULL,
	[amlkopiskkoulk_2005] [nvarchar](6) NULL,
	[amlkopiskjarj_2005] [varchar](10) NULL,
	[amlkkmaak_2005] [varchar](2) NULL,
	[muukkopiskkoulk_2005] [nvarchar](6) NULL,
	[muukkopiskjarj_2005] [varchar](10) NULL,
	[muukkkmaak_2005] [varchar](2) NULL,
	[luopiskkoulk_2006] [nvarchar](6) NULL,
	[luopiskjarj_2006] [varchar](10) NULL,
	[lukmaak_2006] [varchar](2) NULL,
	[amptopiskkoulk_2006] [nvarchar](6) NULL,
	[amptopiskjarj_2006] [varchar](10) NULL,
	[amptkmaak_2006] [varchar](2) NULL,
	[amlkopiskkoulk_2006] [nvarchar](6) NULL,
	[amlkopiskjarj_2006] [varchar](10) NULL,
	[amlkkmaak_2006] [varchar](2) NULL,
	[muukkopiskkoulk_2006] [nvarchar](6) NULL,
	[muukkopiskjarj_2006] [varchar](10) NULL,
	[muukkkmaak_2006] [varchar](2) NULL,
	[luopiskkoulk_2007] [nvarchar](6) NULL,
	[luopiskjarj_2007] [varchar](10) NULL,
	[lukmaak_2007] [varchar](2) NULL,
	[amptopiskkoulk_2007] [nvarchar](6) NULL,
	[amptopiskjarj_2007] [varchar](10) NULL,
	[amptkmaak_2007] [varchar](2) NULL,
	[amlkopiskkoulk_2007] [nvarchar](6) NULL,
	[amlkopiskjarj_2007] [varchar](10) NULL,
	[amlkkmaak_2007] [varchar](2) NULL,
	[muukkopiskkoulk_2007] [nvarchar](6) NULL,
	[muukkopiskjarj_2007] [varchar](10) NULL,
	[muukkkmaak_2007] [varchar](2) NULL,
	[luopiskkoulk_2008] [nvarchar](6) NULL,
	[luopiskjarj_2008] [varchar](10) NULL,
	[lukmaak_2008] [varchar](2) NULL,
	[amptopiskkoulk_2008] [nvarchar](6) NULL,
	[amptopiskjarj_2008] [varchar](10) NULL,
	[amptkmaak_2008] [varchar](2) NULL,
	[amlkopiskkoulk_2008] [nvarchar](6) NULL,
	[amlkopiskjarj_2008] [varchar](10) NULL,
	[amlkkmaak_2008] [varchar](2) NULL,
	[muukkopiskkoulk_2008] [nvarchar](6) NULL,
	[muukkopiskjarj_2008] [varchar](10) NULL,
	[muukkkmaak_2008] [varchar](2) NULL,
	[luopiskkoulk_2009] [nvarchar](6) NULL,
	[luopiskjarj_2009] [varchar](10) NULL,
	[lukmaak_2009] [varchar](2) NULL,
	[amptopiskkoulk_2009] [nvarchar](6) NULL,
	[amptopiskjarj_2009] [varchar](10) NULL,
	[amptkmaak_2009] [varchar](2) NULL,
	[amlkopiskkoulk_2009] [nvarchar](6) NULL,
	[amlkopiskjarj_2009] [varchar](10) NULL,
	[amlkkmaak_2009] [varchar](2) NULL,
	[muukkopiskkoulk_2009] [nvarchar](6) NULL,
	[muukkopiskjarj_2009] [varchar](10) NULL,
	[muukkkmaak_2009] [varchar](2) NULL,
	[ptoim1r5_2004] [varchar](2) NULL,
	[amas_2004] [varchar](1) NULL,
	[ptoim1r5_2005] [varchar](2) NULL,
	[amas_2005] [varchar](1) NULL,
	[ptoim1r5_2006] [varchar](2) NULL,
	[amas_2006] [varchar](1) NULL,
	[ptoim1r5_2007] [varchar](2) NULL,
	[amas_2007] [varchar](1) NULL,
	[ptoim1r5_2008] [varchar](2) NULL,
	[amas_2008] [varchar](1) NULL,
	[ptoim1r5_2009] [varchar](2) NULL,
	[amas_2009] [varchar](1) NULL,
	[lusuorv_2010] [varchar](4) NULL,
	[lusuorlk_2010] [varchar](1) NULL,
	[lututkmaak_2010] [varchar](2) NULL,
	[lututkjarj_2010] [varchar](10) NULL,
	[lututkkoulk_2010] [nvarchar](6) NULL,
	[amptsuorv_2010] [varchar](4) NULL,
	[amptsuorlk_2010] [varchar](1) NULL,
	[ampttutkmaak_2010] [varchar](2) NULL,
	[ampttutkjarj_2010] [varchar](10) NULL,
	[ampttutkkoulk_2010] [nvarchar](6) NULL,
	[amlksuorv_2010] [varchar](4) NULL,
	[amlksuorlk_2010] [varchar](1) NULL,
	[amlktutkmaak_2010] [varchar](2) NULL,
	[amlktutkjarj_2010] [varchar](10) NULL,
	[amlktutkkoulk_2010] [nvarchar](6) NULL,
	[muukksuorv_2010] [varchar](4) NULL,
	[muukksuorlk_2010] [varchar](1) NULL,
	[muukktutkmaak_2010] [varchar](2) NULL,
	[muukktutkjarj_2010] [varchar](10) NULL,
	[muukktutkkoulk_2010] [nvarchar](6) NULL,
	[luopiskkoulk_2010] [nvarchar](6) NULL,
	[luopiskjarj_2010] [varchar](10) NULL,
	[lukmaak_2010] [varchar](2) NULL,
	[amptopiskkoulk_2010] [nvarchar](6) NULL,
	[amptopiskjarj_2010] [varchar](10) NULL,
	[amptkmaak_2010] [varchar](2) NULL,
	[amlkopiskkoulk_2010] [nvarchar](6) NULL,
	[amlkopiskjarj_2010] [varchar](10) NULL,
	[amlkkmaak_2010] [varchar](2) NULL,
	[muukkopiskkoulk_2010] [nvarchar](6) NULL,
	[muukkopiskjarj_2010] [varchar](10) NULL,
	[muukkkmaak_2010] [varchar](2) NULL,
	[ptoim1r5_2010] [varchar](2) NULL,
	[amas_2010] [varchar](1) NULL,
	[lusuorv_2011] [varchar](4) NULL,
	[lusuorlk_2011] [varchar](1) NULL,
	[lututkmaak_2011] [varchar](2) NULL,
	[lututkjarj_2011] [varchar](10) NULL,
	[lututkkoulk_2011] [nvarchar](6) NULL,
	[amptsuorv_2011] [varchar](4) NULL,
	[amptsuorlk_2011] [varchar](1) NULL,
	[ampttutkmaak_2011] [varchar](2) NULL,
	[ampttutkjarj_2011] [varchar](10) NULL,
	[ampttutkkoulk_2011] [nvarchar](6) NULL,
	[amlksuorv_2011] [varchar](4) NULL,
	[amlksuorlk_2011] [varchar](1) NULL,
	[amlktutkmaak_2011] [varchar](2) NULL,
	[amlktutkjarj_2011] [varchar](10) NULL,
	[amlktutkkoulk_2011] [nvarchar](6) NULL,
	[muukksuorv_2011] [varchar](4) NULL,
	[muukksuorlk_2011] [varchar](1) NULL,
	[muukktutkmaak_2011] [varchar](2) NULL,
	[muukktutkjarj_2011] [varchar](10) NULL,
	[muukktutkkoulk_2011] [nvarchar](6) NULL,
	[luopiskkoulk_2011] [nvarchar](6) NULL,
	[luopiskjarj_2011] [varchar](10) NULL,
	[lukmaak_2011] [varchar](2) NULL,
	[amptopiskkoulk_2011] [nvarchar](6) NULL,
	[amptopiskjarj_2011] [varchar](10) NULL,
	[amptkmaak_2011] [varchar](2) NULL,
	[amlkopiskkoulk_2011] [nvarchar](6) NULL,
	[amlkopiskjarj_2011] [varchar](10) NULL,
	[amlkkmaak_2011] [varchar](2) NULL,
	[muukkopiskkoulk_2011] [nvarchar](6) NULL,
	[muukkopiskjarj_2011] [varchar](10) NULL,
	[muukkkmaak_2011] [varchar](2) NULL,
	[ptoim1r5_2011] [varchar](2) NULL,
	[amas_2011] [varchar](1) NULL,
	[lusuorv_2012] [varchar](4) NULL,
	[lusuorlk_2012] [varchar](1) NULL,
	[lututkmaak_2012] [varchar](2) NULL,
	[lututkjarj_2012] [varchar](10) NULL,
	[lututkkoulk_2012] [nvarchar](6) NULL,
	[amptsuorv_2012] [varchar](4) NULL,
	[amptsuorlk_2012] [varchar](1) NULL,
	[ampttutkmaak_2012] [varchar](2) NULL,
	[ampttutkjarj_2012] [varchar](10) NULL,
	[ampttutkkoulk_2012] [nvarchar](6) NULL,
	[amlksuorv_2012] [varchar](4) NULL,
	[amlksuorlk_2012] [varchar](1) NULL,
	[amlktutkmaak_2012] [varchar](2) NULL,
	[amlktutkjarj_2012] [varchar](10) NULL,
	[amlktutkkoulk_2012] [nvarchar](6) NULL,
	[muukksuorv_2012] [varchar](4) NULL,
	[muukksuorlk_2012] [varchar](1) NULL,
	[muukktutkmaak_2012] [varchar](2) NULL,
	[muukktutkjarj_2012] [varchar](10) NULL,
	[muukktutkkoulk_2012] [nvarchar](6) NULL,
	[luopiskkoulk_2012] [nvarchar](6) NULL,
	[luopiskjarj_2012] [varchar](10) NULL,
	[lukmaak_2012] [varchar](2) NULL,
	[amptopiskkoulk_2012] [nvarchar](6) NULL,
	[amptopiskjarj_2012] [varchar](10) NULL,
	[amptkmaak_2012] [varchar](2) NULL,
	[amlkopiskkoulk_2012] [nvarchar](6) NULL,
	[amlkopiskjarj_2012] [varchar](10) NULL,
	[amlkkmaak_2012] [varchar](2) NULL,
	[muukkopiskkoulk_2012] [nvarchar](6) NULL,
	[muukkopiskjarj_2012] [varchar](10) NULL,
	[muukkkmaak_2012] [varchar](2) NULL,
	[ptoim1r5_2012] [varchar](2) NULL,
	[amas_2012] [varchar](1) NULL,
	[lusuorv_2013] [varchar](4) NULL,
	[lusuorlk_2013] [varchar](1) NULL,
	[lututkmaak_2013] [varchar](2) NULL,
	[lututkjarj_2013] [varchar](10) NULL,
	[lututkkoulk_2013] [nvarchar](6) NULL,
	[amptsuorv_2013] [varchar](4) NULL,
	[amptsuorlk_2013] [varchar](1) NULL,
	[ampttutkmaak_2013] [varchar](2) NULL,
	[ampttutkjarj_2013] [varchar](10) NULL,
	[ampttutkkoulk_2013] [nvarchar](6) NULL,
	[amlksuorv_2013] [varchar](4) NULL,
	[amlksuorlk_2013] [varchar](1) NULL,
	[amlktutkmaak_2013] [varchar](2) NULL,
	[amlktutkjarj_2013] [varchar](10) NULL,
	[amlktutkkoulk_2013] [nvarchar](6) NULL,
	[muukksuorv_2013] [varchar](4) NULL,
	[muukksuorlk_2013] [varchar](1) NULL,
	[muukktutkmaak_2013] [varchar](2) NULL,
	[muukktutkjarj_2013] [varchar](10) NULL,
	[muukktutkkoulk_2013] [nvarchar](6) NULL,
	[luopiskkoulk_2013] [nvarchar](6) NULL,
	[luopiskjarj_2013] [varchar](10) NULL,
	[lukmaak_2013] [varchar](2) NULL,
	[amptopiskkoulk_2013] [nvarchar](6) NULL,
	[amptopiskjarj_2013] [varchar](10) NULL,
	[amptkmaak_2013] [varchar](2) NULL,
	[amlkopiskkoulk_2013] [nvarchar](6) NULL,
	[amlkopiskjarj_2013] [varchar](10) NULL,
	[amlkkmaak_2013] [varchar](2) NULL,
	[muukkopiskkoulk_2013] [nvarchar](6) NULL,
	[muukkopiskjarj_2013] [varchar](10) NULL,
	[muukkkmaak_2013] [varchar](2) NULL,
	[ptoim1r5_2013] [varchar](2) NULL,
	[amas_2013] [varchar](1) NULL,
	[lusuorv_2014] [varchar](4) NULL,
	[lusuorlk_2014] [varchar](1) NULL,
	[lututkmaak_2014] [varchar](2) NULL,
	[lututkjarj_2014] [varchar](10) NULL,
	[lututkkoulk_2014] [nvarchar](6) NULL,
	[amptsuorv_2014] [varchar](4) NULL,
	[amptsuorlk_2014] [varchar](1) NULL,
	[ampttutkmaak_2014] [varchar](2) NULL,
	[ampttutkjarj_2014] [varchar](10) NULL,
	[ampttutkkoulk_2014] [nvarchar](6) NULL,
	[amlksuorv_2014] [varchar](4) NULL,
	[amlksuorlk_2014] [varchar](1) NULL,
	[amlktutkmaak_2014] [varchar](2) NULL,
	[amlktutkjarj_2014] [varchar](10) NULL,
	[amlktutkkoulk_2014] [nvarchar](6) NULL,
	[muukksuorv_2014] [varchar](4) NULL,
	[muukksuorlk_2014] [varchar](1) NULL,
	[muukktutkmaak_2014] [varchar](2) NULL,
	[muukktutkjarj_2014] [varchar](10) NULL,
	[muukktutkkoulk_2014] [nvarchar](6) NULL,
	[luopiskkoulk_2014] [nvarchar](6) NULL,
	[luopiskjarj_2014] [varchar](10) NULL,
	[lukmaak_2014] [varchar](2) NULL,
	[amptopiskkoulk_2014] [nvarchar](6) NULL,
	[amptopiskjarj_2014] [varchar](10) NULL,
	[amptkmaak_2014] [varchar](2) NULL,
	[amlkopiskkoulk_2014] [nvarchar](6) NULL,
	[amlkopiskjarj_2014] [varchar](10) NULL,
	[amlkkmaak_2014] [varchar](2) NULL,
	[muukkopiskkoulk_2014] [nvarchar](6) NULL,
	[muukkopiskjarj_2014] [varchar](10) NULL,
	[muukkkmaak_2014] [varchar](2) NULL,
	[ptoim1r5_2014] [varchar](2) NULL,
	[amas_2014] [varchar](1) NULL,
	[lusuorv_2015] [varchar](4) NULL,
	[lusuorlk_2015] [varchar](1) NULL,
	[lututkmaak_2015] [varchar](2) NULL,
	[lututkjarj_2015] [varchar](10) NULL,
	[lututkkoulk_2015] [nvarchar](6) NULL,
	[amptsuorv_2015] [varchar](4) NULL,
	[amptsuorlk_2015] [varchar](1) NULL,
	[ampttutkmaak_2015] [varchar](2) NULL,
	[ampttutkjarj_2015] [varchar](10) NULL,
	[ampttutkkoulk_2015] [nvarchar](6) NULL,
	[amlksuorv_2015] [varchar](4) NULL,
	[amlksuorlk_2015] [varchar](1) NULL,
	[amlktutkmaak_2015] [varchar](2) NULL,
	[amlktutkjarj_2015] [varchar](10) NULL,
	[amlktutkkoulk_2015] [nvarchar](6) NULL,
	[muukksuorv_2015] [varchar](4) NULL,
	[muukksuorlk_2015] [varchar](1) NULL,
	[muukktutkmaak_2015] [varchar](2) NULL,
	[muukktutkjarj_2015] [varchar](10) NULL,
	[muukktutkkoulk_2015] [nvarchar](6) NULL,
	[luopiskkoulk_2015] [nvarchar](6) NULL,
	[luopiskjarj_2015] [varchar](10) NULL,
	[lukmaak_2015] [varchar](2) NULL,
	[amptopiskkoulk_2015] [nvarchar](6) NULL,
	[amptopiskjarj_2015] [varchar](10) NULL,
	[amptkmaak_2015] [varchar](2) NULL,
	[amlkopiskkoulk_2015] [nvarchar](6) NULL,
	[amlkopiskjarj_2015] [varchar](10) NULL,
	[amlkkmaak_2015] [varchar](2) NULL,
	[muukkopiskkoulk_2015] [nvarchar](6) NULL,
	[muukkopiskjarj_2015] [varchar](10) NULL,
	[muukkkmaak_2015] [varchar](2) NULL,
	[ptoim1r5_2015] [varchar](2) NULL,
	[amas_2015] [varchar](1) NULL,
	[lusuorv_2016] [varchar](4) NULL,
	[lusuorlk_2016] [varchar](1) NULL,
	[lututkmaak_2016] [varchar](2) NULL,
	[lututkjarj_2016] [varchar](10) NULL,
	[lututkkoulk_2016] [nvarchar](6) NULL,
	[amptsuorv_2016] [varchar](4) NULL,
	[amptsuorlk_2016] [varchar](1) NULL,
	[ampttutkmaak_2016] [varchar](2) NULL,
	[ampttutkjarj_2016] [varchar](10) NULL,
	[ampttutkkoulk_2016] [nvarchar](6) NULL,
	[amlksuorv_2016] [varchar](4) NULL,
	[amlksuorlk_2016] [varchar](1) NULL,
	[amlktutkmaak_2016] [varchar](2) NULL,
	[amlktutkjarj_2016] [varchar](10) NULL,
	[amlktutkkoulk_2016] [nvarchar](6) NULL,
	[muukksuorv_2016] [varchar](4) NULL,
	[muukksuorlk_2016] [varchar](1) NULL,
	[muukktutkmaak_2016] [varchar](2) NULL,
	[muukktutkjarj_2016] [varchar](10) NULL,
	[muukktutkkoulk_2016] [nvarchar](6) NULL,
	[luopiskkoulk_2016] [nvarchar](6) NULL,
	[luopiskjarj_2016] [varchar](10) NULL,
	[lukmaak_2016] [varchar](2) NULL,
	[amptopiskkoulk_2016] [nvarchar](6) NULL,
	[amptopiskjarj_2016] [varchar](10) NULL,
	[amptkmaak_2016] [varchar](2) NULL,
	[amlkopiskkoulk_2016] [nvarchar](6) NULL,
	[amlkopiskjarj_2016] [varchar](10) NULL,
	[amlkkmaak_2016] [varchar](2) NULL,
	[muukkopiskkoulk_2016] [nvarchar](6) NULL,
	[muukkopiskjarj_2016] [varchar](10) NULL,
	[muukkkmaak_2016] [varchar](2) NULL,
	[ptoim1r5_2016] [varchar](2) NULL,
	[amas_2016] [varchar](1) NULL,
	[lusuorv_2017] [varchar](4) NULL,
	[lusuorlk_2017] [varchar](1) NULL,
	[lututkmaak_2017] [varchar](2) NULL,
	[lututkjarj_2017] [varchar](10) NULL,
	[lututkkoulk_2017] [nvarchar](6) NULL,
	[amptsuorv_2017] [varchar](4) NULL,
	[amptsuorlk_2017] [varchar](1) NULL,
	[ampttutkmaak_2017] [varchar](2) NULL,
	[ampttutkjarj_2017] [varchar](10) NULL,
	[ampttutkkoulk_2017] [nvarchar](6) NULL,
	[amlksuorv_2017] [varchar](4) NULL,
	[amlksuorlk_2017] [varchar](1) NULL,
	[amlktutkmaak_2017] [varchar](2) NULL,
	[amlktutkjarj_2017] [varchar](10) NULL,
	[amlktutkkoulk_2017] [nvarchar](6) NULL,
	[muukksuorv_2017] [varchar](4) NULL,
	[muukksuorlk_2017] [varchar](1) NULL,
	[muukktutkmaak_2017] [varchar](2) NULL,
	[muukktutkjarj_2017] [varchar](10) NULL,
	[muukktutkkoulk_2017] [nvarchar](6) NULL,
	[luopiskkoulk_2017] [nvarchar](6) NULL,
	[luopiskjarj_2017] [varchar](10) NULL,
	[lukmaak_2017] [varchar](2) NULL,
	[amptopiskkoulk_2017] [nvarchar](6) NULL,
	[amptopiskjarj_2017] [varchar](10) NULL,
	[amptkmaak_2017] [varchar](2) NULL,
	[amlkopiskkoulk_2017] [nvarchar](6) NULL,
	[amlkopiskjarj_2017] [varchar](10) NULL,
	[amlkkmaak_2017] [varchar](2) NULL,
	[muukkopiskkoulk_2017] [nvarchar](6) NULL,
	[muukkopiskjarj_2017] [varchar](10) NULL,
	[muukkkmaak_2017] [varchar](2) NULL,
	[ptoim1r5_2017] [varchar](2) NULL,
	[amas_2017] [varchar](1) NULL,
	[lusuorv_2018] [varchar](4) NULL,
	[lusuorlk_2018] [varchar](1) NULL,
	[lututkmaak_2018] [varchar](2) NULL,
	[lututkjarj_2018] [varchar](10) NULL,
	[lututkkoulk_2018] [nvarchar](6) NULL,
	[amptsuorv_2018] [varchar](4) NULL,
	[amptsuorlk_2018] [varchar](1) NULL,
	[ampttutkmaak_2018] [varchar](2) NULL,
	[ampttutkjarj_2018] [varchar](10) NULL,
	[ampttutkkoulk_2018] [nvarchar](6) NULL,
	[amlksuorv_2018] [varchar](4) NULL,
	[amlksuorlk_2018] [varchar](1) NULL,
	[amlktutkmaak_2018] [varchar](2) NULL,
	[amlktutkjarj_2018] [varchar](10) NULL,
	[amlktutkkoulk_2018] [nvarchar](6) NULL,
	[muukksuorv_2018] [varchar](4) NULL,
	[muukksuorlk_2018] [varchar](1) NULL,
	[muukktutkmaak_2018] [varchar](2) NULL,
	[muukktutkjarj_2018] [varchar](10) NULL,
	[muukktutkkoulk_2018] [nvarchar](6) NULL,
	[luopiskkoulk_2018] [nvarchar](6) NULL,
	[luopiskjarj_2018] [varchar](10) NULL,
	[lukmaak_2018] [varchar](2) NULL,
	[amptopiskkoulk_2018] [nvarchar](6) NULL,
	[amptopiskjarj_2018] [varchar](10) NULL,
	[amptkmaak_2018] [varchar](2) NULL,
	[amlkopiskkoulk_2018] [nvarchar](6) NULL,
	[amlkopiskjarj_2018] [varchar](10) NULL,
	[amlkkmaak_2018] [varchar](2) NULL,
	[muukkopiskkoulk_2018] [nvarchar](6) NULL,
	[muukkopiskjarj_2018] [varchar](10) NULL,
	[muukkkmaak_2018] [varchar](2) NULL,
	[ptoim1r5_2018] [varchar](2) NULL,
	[amas_2018] [varchar](1) NULL,
	[lusuorv_2019] [varchar](4) NULL,
	[lusuorlk_2019] [varchar](1) NULL,
	[lututkmaak_2019] [varchar](2) NULL,
	[lututkjarj_2019] [varchar](10) NULL,
	[lututkkoulk_2019] [nvarchar](6) NULL,
	[amptsuorv_2019] [varchar](4) NULL,
	[amptsuorlk_2019] [varchar](1) NULL,
	[ampttutkmaak_2019] [varchar](2) NULL,
	[ampttutkjarj_2019] [varchar](10) NULL,
	[ampttutkkoulk_2019] [nvarchar](6) NULL,
	[amlksuorv_2019] [varchar](4) NULL,
	[amlksuorlk_2019] [varchar](1) NULL,
	[amlktutkmaak_2019] [varchar](2) NULL,
	[amlktutkjarj_2019] [varchar](10) NULL,
	[amlktutkkoulk_2019] [nvarchar](6) NULL,
	[muukksuorv_2019] [varchar](4) NULL,
	[muukksuorlk_2019] [varchar](1) NULL,
	[muukktutkmaak_2019] [varchar](2) NULL,
	[muukktutkjarj_2019] [varchar](10) NULL,
	[muukktutkkoulk_2019] [nvarchar](6) NULL,
	[luopiskkoulk_2019] [nvarchar](6) NULL,
	[luopiskjarj_2019] [varchar](10) NULL,
	[lukmaak_2019] [varchar](2) NULL,
	[amptopiskkoulk_2019] [nvarchar](6) NULL,
	[amptopiskjarj_2019] [varchar](10) NULL,
	[amptkmaak_2019] [varchar](2) NULL,
	[amlkopiskkoulk_2019] [nvarchar](6) NULL,
	[amlkopiskjarj_2019] [varchar](10) NULL,
	[amlkkmaak_2019] [varchar](2) NULL,
	[muukkopiskkoulk_2019] [nvarchar](6) NULL,
	[muukkopiskjarj_2019] [varchar](10) NULL,
	[muukkkmaak_2019] [varchar](2) NULL,
	[ptoim1r5_2019] [varchar](2) NULL,
	[amas_2019] [varchar](1) NULL,
	[lusuorv_2020] [varchar](4) NULL,
	[lusuorlk_2020] [varchar](1) NULL,
	[lututkmaak_2020] [varchar](2) NULL,
	[lututkjarj_2020] [varchar](10) NULL,
	[lututkkoulk_2020] [nvarchar](6) NULL,
	[amptsuorv_2020] [varchar](4) NULL,
	[amptsuorlk_2020] [varchar](1) NULL,
	[ampttutkmaak_2020] [varchar](2) NULL,
	[ampttutkjarj_2020] [varchar](10) NULL,
	[ampttutkkoulk_2020] [nvarchar](6) NULL,
	[amlksuorv_2020] [varchar](4) NULL,
	[amlksuorlk_2020] [varchar](1) NULL,
	[amlktutkmaak_2020] [varchar](2) NULL,
	[amlktutkjarj_2020] [varchar](10) NULL,
	[amlktutkkoulk_2020] [nvarchar](6) NULL,
	[muukksuorv_2020] [varchar](4) NULL,
	[muukksuorlk_2020] [varchar](1) NULL,
	[muukktutkmaak_2020] [varchar](2) NULL,
	[muukktutkjarj_2020] [varchar](10) NULL,
	[muukktutkkoulk_2020] [nvarchar](6) NULL,
	[luopiskkoulk_2020] [nvarchar](6) NULL,
	[luopiskjarj_2020] [varchar](10) NULL,
	[lukmaak_2020] [varchar](2) NULL,
	[amptopiskkoulk_2020] [nvarchar](6) NULL,
	[amptopiskjarj_2020] [varchar](10) NULL,
	[amptkmaak_2020] [varchar](2) NULL,
	[amlkopiskkoulk_2020] [nvarchar](6) NULL,
	[amlkopiskjarj_2020] [varchar](10) NULL,
	[amlkkmaak_2020] [varchar](2) NULL,
	[muukkopiskkoulk_2020] [nvarchar](6) NULL,
	[muukkopiskjarj_2020] [varchar](10) NULL,
	[muukkkmaak_2020] [varchar](2) NULL,
	[ptoim1r5_2020] [varchar](2) NULL,
	[amas_2020] [varchar](1) NULL,
	[lusuorv_2021] [varchar](4) NULL,
	[lusuorlk_2021] [varchar](1) NULL,
	[lututkmaak_2021] [varchar](2) NULL,
	[lututkjarj_2021] [varchar](10) NULL,
	[lututkkoulk_2021] [nvarchar](6) NULL,
	[amptsuorv_2021] [varchar](4) NULL,
	[amptsuorlk_2021] [varchar](1) NULL,
	[ampttutkmaak_2021] [varchar](2) NULL,
	[ampttutkjarj_2021] [varchar](10) NULL,
	[ampttutkkoulk_2021] [nvarchar](6) NULL,
	[amlksuorv_2021] [varchar](4) NULL,
	[amlksuorlk_2021] [varchar](1) NULL,
	[amlktutkmaak_2021] [varchar](2) NULL,
	[amlktutkjarj_2021] [varchar](10) NULL,
	[amlktutkkoulk_2021] [nvarchar](6) NULL,
	[muukksuorv_2021] [varchar](4) NULL,
	[muukksuorlk_2021] [varchar](1) NULL,
	[muukktutkmaak_2021] [varchar](2) NULL,
	[muukktutkjarj_2021] [varchar](10) NULL,
	[muukktutkkoulk_2021] [nvarchar](6) NULL,
	[luopiskkoulk_2021] [nvarchar](6) NULL,
	[luopiskjarj_2021] [varchar](10) NULL,
	[lukmaak_2021] [varchar](2) NULL,
	[amptopiskkoulk_2021] [nvarchar](6) NULL,
	[amptopiskjarj_2021] [varchar](10) NULL,
	[amptkmaak_2021] [varchar](2) NULL,
	[amlkopiskkoulk_2021] [nvarchar](6) NULL,
	[amlkopiskjarj_2021] [varchar](10) NULL,
	[amlkkmaak_2021] [varchar](2) NULL,
	[muukkopiskkoulk_2021] [nvarchar](6) NULL,
	[muukkopiskjarj_2021] [varchar](10) NULL,
	[muukkkmaak_2021] [varchar](2) NULL,
	[ptoim1r5_2021] [varchar](2) NULL,
	[amas_2021] [varchar](1) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](12) NOT NULL,
	[rivinumero] [bigint] NULL,
	[aineistorivinumero] [bigint] NULL
) ON [PRIMARY]

GO


