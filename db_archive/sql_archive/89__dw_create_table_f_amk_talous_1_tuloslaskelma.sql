IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous_1_tuloslaskelma') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous_1_tuloslaskelma(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  tilikausi int NOT NULL,
  aineistotyyppi varchar(20) NULL,
  liikevaihto bigint NULL,
  kvarastojenl bigint NULL,
  omkaytt bigint NULL,
  muuttuot bigint NULL,
  matyht bigint NULL,
  aitata bigint NULL,
  ostotilaik bigint NULL,
  varastlis bigint NULL,
  ulkpal bigint NULL,
  hkulutyht bigint NULL,
  palkat bigint NULL,
  hsivukulut bigint NULL,
  elakekulut bigint NULL,
  msivukulut bigint NULL,
  poiarvoyht bigint NULL,
  poistot bigint NULL,
  aalennukset bigint NULL,
  vvpaalennukset bigint NULL,
  muutkulut bigint NULL,
  lvoitto bigint NULL,
  konstuot bigint NULL,
  tuotosuu bigint NULL,
  tuotsamakons bigint NULL,
  tuototmuilt bigint NULL,
  muutkorksamkons bigint NULL,
  muutkorkmuilt bigint NULL,
  arvovastaasijo bigint NULL,
  arvovaihtvastrah bigint NULL,
  korkrahkulukons bigint NULL,
  korkrahkulumuut bigint NULL,
  voitto bigint NULL,
  satyht bigint NULL,
  sattuot bigint NULL,
  satkulut bigint NULL,
  voitenveroja bigint NULL,
  poistoero bigint NULL,
  vapehtvara bigint NULL,
  rahasiirt bigint NULL,
  tulovero bigint NULL,
  muutverot bigint NULL,
  tilvoitto bigint NULL,
  okmperus bigint NULL,
  akatemia bigint NULL,
  tekes bigint NULL,
  muuokm bigint NULL,
  sosturvarah bigint NULL,
  muuvaltio bigint NULL,
  kunnat bigint NULL,
  vottavoittelematon bigint NULL,
  kotiyritys bigint NULL,
  kotirah bigint NULL,
  kotitalous bigint NULL,
  eurah bigint NULL,
  eurahyrit bigint NULL,
  eurahmuu bigint NULL,
  muuulkyritys bigint NULL,
  muuulkmuurah bigint NULL,
  maksuasetus bigint NULL,
  muuliikevaihto bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__236943A5') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_1_tuloslaskelma ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__245D67DE') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous_1_tuloslaskelma ADD  DEFAULT (suser_sname()) FOR username
END