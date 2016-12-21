IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.d_amk') AND type in (N'U'))
BEGIN
CREATE TABLE dbo.d_amk(
	id bigint IDENTITY(0,1) NOT NULL,
	amk_tunnus varchar(5) NOT NULL,
	amk_nimi_fi varchar(100) NOT NULL,
	amk_nimi_sv varchar(100) NOT NULL,
	amk_nimi_en varchar(100) NOT NULL,
	loadtime datetime NOT NULL,
	source varchar(100) NOT NULL,
	username varchar(30) NOT NULL,
 CONSTRAINT PK_d_amk PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF__d_amk__loadtime__5224328E') AND type = 'D')
BEGIN
ALTER TABLE dbo.d_amk ADD  CONSTRAINT DF__d_amk__loadtime__5224328E  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.DF__d_amk__username__531856C7') AND type = 'D')
BEGIN
ALTER TABLE dbo.d_amk ADD  CONSTRAINT DF__d_amk__username__531856C7  DEFAULT (suser_sname()) FOR username
END