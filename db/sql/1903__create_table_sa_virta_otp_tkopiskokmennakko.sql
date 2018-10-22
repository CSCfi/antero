--  Tilastokeskus OPISKelijatiedonkeruu OKM Ennakkoaineisto, TK tietuekuvauksen sarakejärjestys
USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_virta_otp_tkOPISKOKMEnnakko'
) BEGIN 

CREATE TABLE [sa].[sa_virta_otp_tkOPISKOKMEnnakko](

	[tilv] [varchar](50) NULL,
	[aineisto] [varchar](50) NULL,
	[lahde] [varchar](50) NULL,
	[tunn] [varchar](50) NULL,
	[jarj] [varchar](50) NULL,
	[koulk] [varchar](50) NULL,
	[kkun] [varchar](50) NULL,
	[sp] [varchar](50) NULL,
	[aikielir1x] [varchar](50) NULL,
	[syntv] [varchar](50) NULL,
	[tilvaskun] [varchar](50) NULL,
	[tilvaskunx] [varchar](50) NULL,
	[tilvaskun2x] [varchar](50) NULL,
	[kansalr2] [varchar](50) NULL,
	[alvv] [varchar](50) NULL,
	[allk] [varchar](50) NULL,
	[olotamm] [varchar](50) NULL,
	[olosyys] [varchar](50) NULL,
	[rahlahde] [varchar](50) NULL,
	[fte] [varchar](50) NULL,
	[alvv_kksek] [varchar](50) NULL,
	[alvv_kksek_lasna] [varchar](50) NULL,
	[alvv_sek] [varchar](50) NULL,
	[alvv_sek_lasna] [varchar](50) NULL,
	[alvv_kk] [varchar](50) NULL,
	[alvv_kk_lasna] [varchar](50) NULL,
	[alvv_opa] [varchar](50) NULL,
	[alvv_opa_lasna] [varchar](50) NULL,
	[lkm] [varchar](50) NULL,
	[opyht0] [varchar](50) NULL,
	[opyht14] [varchar](50) NULL,
	[opyht29] [varchar](50) NULL,
	[opyht44] [varchar](50) NULL,
	[opyht59] [varchar](50) NULL,
	[opyht74] [varchar](50) NULL,
	[opyht89] [varchar](50) NULL,
	[opyht104] [varchar](50) NULL,
	[opyht119] [varchar](50) NULL,
	[opyht120] [varchar](50) NULL,
	[op55] [varchar](50) NULL,
	[opes] [varchar](50) NULL,
	[opek] [varchar](50) NULL,
	[opker] [varchar](50) NULL,
	[koultyp] [varchar](50) NULL,
	[kkieli] [varchar](50) NULL,
	[lasnalk] [varchar](50) NULL,
	[poissalk] [varchar](50) NULL,
	[oplaaj] [varchar](50) NULL,
	[kirtu1v] [varchar](50) NULL,
	[kirtu1k] [varchar](50) NULL,
	[ensisop] [varchar](50) NULL,
	[tilmaa] [varchar](50) NULL,
	[kk] [varchar](50) NULL,
	[fuksi] [varchar](50) NULL,
	[opoikv] [varchar](50) NULL,
	[om] [varchar](50) NULL,
	[opkelp] [varchar](50) NULL,
	[avo] [varchar](50) NULL,
	[ltop] [varchar](50) NULL,
	[opmopa] [varchar](50) NULL,
	[luontipvm] [varchar](50) NULL
)

END
