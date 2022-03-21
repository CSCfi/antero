USE [AnteroAPI]
GO

/****** Object:  Table [dw].[api_koulutusluokitus]    Script Date: 15.11.2021 10:25:40 ******/
DROP TABLE IF EXISTS [dw].[api_koulutusluokitus]
GO

/****** Object:  Table [dw].[api_koulutusluokitus]    Script Date: 15.11.2021 10:25:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_koulutusluokitus](
	[koulutusluokitus_avain] [varchar](50) NOT NULL,
	[koulutusluokitus_koodi] [varchar](6) NOT NULL,
	[koulutusluokitus_fi] [nvarchar](200) NOT NULL,
	[koulutusluokitus_sv] [nvarchar](200) NOT NULL,
	[koulutusluokitus_en] [nvarchar](200) NOT NULL,
	[koulutusastetaso1_koodi] [varchar](2) NULL,
	[koulutusastetaso1_fi] [nvarchar](200) NULL,
	[koulutusastetaso1_sv] [nvarchar](200) NULL,
	[koulutusastetaso1_en] [nvarchar](200) NULL,
	[koulutusastetaso2_koodi] [varchar](2) NULL,
	[koulutusastetaso2_fi] [nvarchar](200) NULL,
	[koulutusastetaso2_sv] [nvarchar](200) NULL,
	[koulutusastetaso2_en] [nvarchar](200) NULL,
	[koulutusalataso1_koodi] [varchar](2) NULL,
	[koulutusalataso1_fi] [nvarchar](200) NULL,
	[koulutusalataso1_sv] [nvarchar](200) NULL,
	[koulutusalataso1_en] [nvarchar](200) NULL,
	[koulutusalataso2_koodi] [varchar](3) NULL,
	[koulutusalataso2_fi] [nvarchar](200) NULL,
	[koulutusalataso2_sv] [nvarchar](200) NULL,
	[koulutusalataso2_en] [nvarchar](200) NULL,
	[koulutusalataso3_koodi] [varchar](4) NULL,
	[koulutusalataso3_fi] [nvarchar](200) NULL,
	[koulutusalataso3_sv] [nvarchar](200) NULL,
	[koulutusalataso3_en] [nvarchar](200) NULL,
	[okmohjauksenala_koodi] [varchar](2) NULL,
	[okmohjauksenala_fi] [nvarchar](200) NULL,
	[okmohjauksenala_sv] [nvarchar](200) NULL,
	[okmohjauksenala_en] [nvarchar](200) NULL,
	[koulutussektori_koodi] [varchar](2) NULL,
	[koulutussektori_fi] [nvarchar](60) NULL,
	[koulutussektori_sv] [nvarchar](60) NULL,
	[koulutussektori_en] [nvarchar](60) NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[tutkintotyyppi_sv] [nvarchar](60) NULL,
	[tutkintotyyppi_en] [nvarchar](60) NULL,
	[Rahoitusmallialat amk 2021-2024_koodi] [nvarchar](10) NULL,
	[Rahoitusmallialat amk 2021-2024_fi] [nvarchar](255) NULL,
	[Rahoitusmallialat amk 2021-2024_sv] [nvarchar](255) NULL,
	[Rahoitusmallialat amk 2021-2024_en] [nvarchar](255) NULL,
	[Rahoitusmallialat yo 2021-2024_koodi] [nvarchar](10) NULL,
	[Rahoitusmallialat yo 2021-2024_fi] [nvarchar](255) NULL,
	[Rahoitusmallialat yo 2021-2024_sv] [nvarchar](255) NULL,
	[Rahoitusmallialat yo 2021-2024_en] [nvarchar](255) NULL
) ON [PRIMARY]

GO


