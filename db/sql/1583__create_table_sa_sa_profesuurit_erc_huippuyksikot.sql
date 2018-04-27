USE [ANTERO]
go

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
) ON [PRIMARY]
END
GO

USE [ANTERO]
