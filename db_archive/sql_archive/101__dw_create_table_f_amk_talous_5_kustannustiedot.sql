IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous_5_kustannustiedot') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous_5_kustannustiedot(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  tilikausi int NOT NULL,
  vtkusty bigint NULL,
  koulutus bigint NULL,
  tutkoul bigint NULL,
  ptutosat bigint NULL,
  ammopkoul bigint NULL,
  muukoul bigint NULL,
  tutkimus bigint NULL,
  ylamkkoul bigint NULL,
  tktoim bigint NULL,
  muuyhtei bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__3D2915A8') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_5_kustannustiedot ADD  CONSTRAINT DF__f_amk_tal__loadt__3D2915A8  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__3E1D39E1') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_5_kustannustiedot ADD  CONSTRAINT DF__f_amk_tal__usern__3E1D39E1  DEFAULT (suser_sname()) FOR username
END