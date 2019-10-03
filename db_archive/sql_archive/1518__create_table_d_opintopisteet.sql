USE [ANTERO]
GO

-- Opintopisteryhmittely 1-14 op, 15-29 op jne. suorittaneet

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_opintopisteet')
BEGIN

CREATE TABLE dw.d_opintopisteet (
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[op_avain] [varchar](6) NULL,
	[op_fi] [nvarchar](100) NULL,
	[op_sv] [nvarchar](100) NULL,
	[op_en] [nvarchar](100) NULL,
	[opryhma1_fi] [nvarchar](100) NULL,
	[opryhma1_sv] [nvarchar](100) NULL,
	[opryhma1_en] [nvarchar](100) NULL, 
	[jarjestys_op] [nvarchar](100) NULL,
	[jarjestys_opryhma1] [nvarchar](100) NULL, 
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_opintopisteet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;


ALTER TABLE dw.d_opintopisteet ADD  CONSTRAINT [DF__d_opintopisteet__loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE dw.d_opintopisteet ADD  CONSTRAINT [DF__d_opintopisteet__username]  DEFAULT (suser_sname()) FOR [username]
;

END


GO



