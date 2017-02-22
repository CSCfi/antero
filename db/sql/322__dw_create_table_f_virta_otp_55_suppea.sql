IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_55_suppea') BEGIN

CREATE TABLE dw.f_virta_otp_55_suppea(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,
  
  d_organisaatio_id int NOT NULL,
  d_koulutusluokitus_id int NOT NULL,

  vuosi int NOT NULL,
  
  suorittanut55 int NOT NULL,
  
  CONSTRAINT PK__f_virta_otp_55_suppea PRIMARY KEY CLUSTERED (id)
)

ALTER TABLE dw.f_virta_otp_55_suppea ADD  CONSTRAINT DF__f_virta_otp_55_suppea__loadtime  DEFAULT (getdate()) FOR loadtime

ALTER TABLE dw.f_virta_otp_55_suppea ADD  CONSTRAINT DF__f_virta_otp_55_suppea__username  DEFAULT (suser_sname()) FOR username

END
