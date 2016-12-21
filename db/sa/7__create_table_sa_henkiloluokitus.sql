IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_henkiloluokitus') BEGIN

CREATE TABLE dbo.sa_henkiloluokitus(
	id bigint IDENTITY(1,1) NOT NULL,
	sukupuoli_koodi nvarchar(2) NOT NULL,
	sukupuoli nvarchar(10) NULL,
	sukupuoli_sv nvarchar(10) NULL,
	sukupuoli_en nvarchar(10) NULL,
	ika nvarchar(4) NULL,
	ikaryhma10_koodi nvarchar(3) NULL,
	ikaryhma10 nvarchar(20) NULL,
	ikaryhma10_sv nvarchar(20) NULL,
	ikaryhma10_en nvarchar(20) NULL,
	loadtime datetime2(4) NOT NULL,
	source nvarchar(255) NULL,
	username nvarchar(128) NOT NULL,
 CONSTRAINT PK__sa_henkiloluokitus PRIMARY KEY CLUSTERED 
(
	id ASC
)
)
;

ALTER TABLE dbo.sa_henkiloluokitus ADD  CONSTRAINT DF__sa_henkiloluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_henkiloluokitus ADD  CONSTRAINT DF__sa_henkiloluokitus__username  DEFAULT (suser_name()) FOR username
;

END
