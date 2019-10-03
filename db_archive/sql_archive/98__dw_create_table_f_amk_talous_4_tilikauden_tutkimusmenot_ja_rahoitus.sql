IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  tilikausi int NOT NULL,
  tutmenot bigint NULL,
  perusr bigint NULL,
  ulkoptr bigint NULL,
  akatemia bigint NULL,
  muuokm bigint NULL,
  tekes bigint NULL,
  muutem bigint NULL,
  ulkomin bigint NULL,
  oikmin bigint NULL,
  sisämin bigint NULL,
  puolmin bigint NULL,
  valtvmin bigint NULL,
  mmm bigint NULL,
  lvm bigint NULL,
  stm bigint NULL,
  ympmin bigint NULL,
  kunnat bigint NULL,
  muujulkr bigint NULL,
  kotiraha bigint NULL,
  kotiyrit bigint NULL,
  ulkoyrit bigint NULL,
  eupuiter bigint NULL,
  eakr bigint NULL,
  esr bigint NULL,
  muueur bigint NULL,
  ulkoraha bigint NULL,
  kvjarj bigint NULL,
  ulkomuur bigint NULL,
  amkomarah bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__2EDAF651') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__2FCF1A8A') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus ADD  DEFAULT (suser_sname()) FOR username
END