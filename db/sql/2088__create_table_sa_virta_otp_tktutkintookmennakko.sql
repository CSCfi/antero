-- TK OKM tutkintoennakko sarakkeet csv-tiedoston mukaan
USE ANTERO
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.TABLES 
	WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_tkTUTKINTOOKMEnnakko'
)  
BEGIN

CREATE TABLE sa.sa_virta_otp_tkTUTKINTOOKMEnnakko(

			[tilv] [varchar](4) NULL,
			[aineisto] [varchar](1) NULL,
			[lahde] [varchar](2) NULL,
			[tunn] [varchar](5) NULL,
			[jarj] [varchar](10) NULL,
			[koulk] [varchar](6) NULL,
			[kkun] [varchar](3) NULL,
			[sp] [varchar](1) NULL,
			[aikielir1x] [varchar](2) NULL,
			[syntv] [varchar](4) NULL,
			[tilvaskun] [varchar](3) NULL,
			[tilvaskunx] [varchar](3) NULL,
			[kansalr2] [varchar](1) NULL,
			[alvv] [varchar](4) NULL,
			[allk] [varchar](1) NULL,
			[suorv] [varchar](4) NULL,
			[suorlk] [varchar](1) NULL,
			[rahlahde] [varchar](1) NULL,
			[alvvkksek] [varchar](4) NULL,
			[alvvkkseklasna] [varchar](4) NULL,
			[alvvsek] [varchar](4) NULL,
			[alvvseklasna] [varchar](4) NULL,
			[alvvkk] [varchar](4) NULL,
			[alvvkklasna] [varchar](4) NULL,
			[alvvopa] [varchar](4) NULL,
			[alvvopalasna] [varchar](4) NULL,
			[lkm] [int] NULL,
			[koultyp] [varchar](1) NULL,
			[kkieli] [varchar](2) NULL,
			[lasnalk] [int] NULL,
			[poissalk] [int] NULL,
			[oplaaj] [int] NULL,
			[kirtu1v] [varchar](4) NULL,
			[kirtu1k] [varchar](1) NULL,
			[opyhtamk] [int] NULL,
			[opylamamk] [int] NULL,
			[opmuuamk] [int] NULL,
			[opoamk] [int] NULL,
			[opmamk] [int] NULL,
			[opyliopamk] [int] NULL,
			[opulkomamk] [int] NULL,
			[tilmaa] [varchar](1) NULL,
			[om] [varchar](1) NULL,
			[opkelp] [varchar](1) NULL,
			[opyhtyo] [int] NULL,
			[opulkyo] [int] NULL,
			[opmuuyo] [int] NULL,
			[opoylio] [int] NULL,
			[opaylio] [int] NULL,
			[opmylio] [int] NULL,
			[opamkyo] [int] NULL,
			[ltop] [varchar](1) NULL,
			[opmopa] [varchar](3) NULL,
			[luontipvm] [varchar](10) NULL 
)


END
