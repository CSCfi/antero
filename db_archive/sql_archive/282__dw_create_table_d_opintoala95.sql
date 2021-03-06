IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.d_opintoala95') AND type in (N'U'))
BEGIN
CREATE TABLE dw.d_opintoala95(
	id int IDENTITY(-1,1) NOT NULL,
	opintoala95_koodi varchar(3) NOT NULL,
	opintoala95_nimi_fi varchar(100) NOT NULL,
	opintoala95_nimi_sv varchar(100) NOT NULL,
	opintoala95_nimi_en varchar(100) NOT NULL,
	loadtime datetime NOT NULL,
	source varchar(100) NOT NULL,
	username varchar(30) NOT NULL,
 CONSTRAINT PK_D_OPINTOALA95 PRIMARY KEY CLUSTERED 
(
	id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_opintoa__loadt__4C8B54C9') AND type = 'D')
BEGIN
ALTER TABLE dw.d_opintoala95 ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_opintoa__usern__4D7F7902') AND type = 'D')
BEGIN
ALTER TABLE dw.d_opintoala95 ADD  DEFAULT (suser_sname()) FOR username
END