IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.d_tili') AND type in (N'U'))
BEGIN
CREATE TABLE dw.d_tili(
  id int IDENTITY(-1,1) NOT NULL,
  tili_koodi varchar(50) NOT NULL,
  tili_taso0_fi varchar(100) NOT NULL,
  tili_taso1_fi varchar(100) NOT NULL,
  tili_taso2_fi varchar(100) NOT NULL,
  tili_taso3_fi varchar(100) NOT NULL,
  tili_taso4_fi varchar(100) NOT NULL,
  tili_taso0_sv varchar(100) NOT NULL,
  tili_taso1_sv varchar(100) NOT NULL,
  tili_taso2_sv varchar(100) NOT NULL,
  tili_taso3_sv varchar(100) NOT NULL,
  tili_taso4_sv varchar(100) NOT NULL,
  tili_taso0_en varchar(100) NOT NULL,
  tili_taso1_en varchar(100) NOT NULL,
  tili_taso2_en varchar(100) NOT NULL,
  tili_taso3_en varchar(100) NOT NULL,
  tili_taso4_en varchar(100) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NULL,
  username varchar(30) NOT NULL,
 CONSTRAINT PK_d_tili PRIMARY KEY CLUSTERED 
(
  id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

INSERT dw.d_tili (tili_koodi, tili_taso0_fi, tili_taso1_fi, tili_taso2_fi, tili_taso3_fi, tili_taso4_fi, tili_taso0_sv, tili_taso1_sv, tili_taso2_sv, tili_taso3_sv, tili_taso4_sv, tili_taso0_en, tili_taso1_en, tili_taso2_en, tili_taso3_en, tili_taso4_en, loadtime, source, username) VALUES (N'-1', N'Tuntematon', N'Tuntematon', N'Tuntematon', N'Tuntematon', N'Tuntematon', N'Okänd', N'Okänd', N'Okänd', N'Okänd', N'Okänd', N'Unknown', N'Unknown', N'Unknown', N'Unknown', N'Unknown', CAST(N'2016-11-22T00:00:00.000' AS DateTime), N'manual', N'dwi\jrouhiai')
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_tili__loadtime__4D2A7347') AND type = 'D')
BEGIN
ALTER TABLE dw.d_tili ADD  CONSTRAINT DF__d_tili__loadtime__4D2A7347  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_tili__username__4E1E9780') AND type = 'D')
BEGIN
ALTER TABLE dw.d_tili ADD  CONSTRAINT DF__d_tili__username__4E1E9780  DEFAULT (suser_sname()) FOR username
END