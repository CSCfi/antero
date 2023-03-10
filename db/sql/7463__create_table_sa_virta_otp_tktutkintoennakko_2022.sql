USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_tktutkintoennakko_2022]    Script Date: 10.3.2023 9:11:09 ******/
DROP TABLE IF EXISTS [sa].[sa_virta_otp_tktutkintoennakko_2022]
GO

/****** Object:  Table [sa].[sa_virta_otp_tktutkintoennakko_2022]    Script Date: 10.3.2023 9:11:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_tktutkintoennakko_2022](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[aikielir1x] [varchar](2) NULL,
	[aineisto] [varchar](1) NULL,
	[allk] [varchar](1) NULL,
	[alvv] [varchar](4) NULL,
	[alvvkk] [varchar](4) NULL,
	[alvvkklasna] [varchar](4) NULL,
	[alvvkksek] [varchar](4) NULL,
	[alvvkkseklasna] [varchar](4) NULL,
	[alvvopa] [varchar](4) NULL,
	[alvvopalasna] [varchar](4) NULL,
	[alvvsek] [varchar](4) NULL,
	[alvvseklasna] [varchar](4) NULL,
	[jarj] [varchar](10) NULL,
	[kansalr2] [varchar](1) NULL,
	[kirtu1k] [varchar](1) NULL,
	[kirtu1v] [varchar](4) NULL,
	[kkieli] [varchar](2) NULL,
	[kkun] [varchar](3) NULL,
	[koulk] [varchar](6) NULL,
	[koultyp] [varchar](1) NULL,
	[lahde] [varchar](2) NULL,
	[lasnalk] [int] NULL,
	[lkm] [int] NULL,
	[ltop] [varchar](1) NULL,
	[luontipvm] [varchar](10) NULL,
	[om] [varchar](1) NULL,
	[opamkyo] [int] NULL,
	[opaylio] [int] NULL,
	[opkelp] [varchar](1) NULL,
	[oplaaj] [int] NULL,
	[opmamk] [int] NULL,
	[opmopa] [varchar](3) NULL,
	[opmuuamk] [int] NULL,
	[opmuuyo] [int] NULL,
	[opmylio] [int] NULL,
	[opoamk] [int] NULL,
	[opoylio] [int] NULL,
	[opulkomamk] [int] NULL,
	[opulkyo] [int] NULL,
	[opyhtamk] [int] NULL,
	[opyhtyo] [int] NULL,
	[opylamamk] [int] NULL,
	[opyliopamk] [int] NULL,
	[poissalk] [int] NULL,
	[rahlahde] [varchar](1) NULL,
	[sp] [varchar](1) NULL,
	[suorlk] [varchar](1) NULL,
	[suorv] [varchar](4) NULL,
	[syntv] [varchar](4) NULL,
	[tilmaa] [varchar](1) NULL,
	[tilv] [varchar](4) NULL,
	[tilvaskun] [varchar](3) NULL,
	[tilvaskunx] [varchar](3) NULL,
	[tunn] [varchar](5) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]