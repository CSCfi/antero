use vipunentk_dw
go

Drop table [dbo].[_aloittaneiden_lapaisy_avaimet]

CREATE TABLE [dbo].[_aloittaneiden_lapaisy_avaimet](
	id int IDENTITY(1,1),
	[tyyppi] [varchar] (100) NULL,
	[tilv] [varchar](100) NULL,
	[lahde] [varchar](100) NULL,
-- avaintyyppi1, 5 kenttää	3.9 ja 3.10
	[suorv] [varchar](100) NULL,
	[suorlk] [varchar](100) NULL,
	[tutkmaak] [varchar](100) NULL,
	[tutkjarj] [varchar](100) NULL,
	[tutkkoulk] [varchar](100) NULL,
-- avaintyyppi2a, 3 kenttää  3.9
	[opiskkoulk] [varchar](100) NULL,
	[opiskjarj] [varchar](100) NULL,
	[kmaak] [varchar](100) NULL,	
-- avaintyyppi2b, 3+2 kenttää  3.10
	[opiskkoulk_2] [varchar](100) NULL,
	[opiskjarj_2] [varchar](100) NULL,
	[kmaak_2] [varchar](100) NULL,	
    --[olotamm_2] [varchar](100) NULL,  
    --[olosyys_2] [varchar](100) NULL,
-- avaintyyppi3, 2 kenttää  3.9 ja 3.10
	[ptoim1r5] [varchar](100) NULL,
	--[amas] [varchar](100) NULL,
-- johdetut lisätiedot avaintyypeille 1 ja 2	
	[opp] [varchar](100) NULL,
	[opmala] [varchar](100) NULL,
	[opmopa] [varchar](100) NULL,
	[opmast] [varchar](100) NULL,
	[opm95opa] [varchar](100) NULL,
	[koulutussektori] [varchar](100) NULL,
	[kalat1] [varchar](100) NULL,
	[kalat2] [varchar](100) NULL,
	[kalat3] [varchar](100) NULL,
 CONSTRAINT [PK___aloittaneiden_lapaisy_avaimet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]