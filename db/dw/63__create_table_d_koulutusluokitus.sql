IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_koulutusluokitus') BEGIN

CREATE TABLE dbo.d_koulutusluokitus(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  koulutusluokitus_avain varchar(50) NOT NULL,
  koulutusluokitus_koodi varchar(6) NOT NULL,
  koulutusluokitus_fi nvarchar(200) NOT NULL,
  koulutusluokitus_sv nvarchar(200) NOT NULL,
  koulutusluokitus_en nvarchar(200) NOT NULL,

  koulutusastetaso1_koodi varchar(2) NULL,
  koulutusastetaso1_fi nvarchar(200) NULL,
  koulutusastetaso1_sv nvarchar(200) NULL,
  koulutusastetaso1_en nvarchar(200) NULL,
  koulutusastetaso2_koodi varchar(2) NULL,
  koulutusastetaso2_fi nvarchar(200) NULL,
  koulutusastetaso2_sv nvarchar(200) NULL,
  koulutusastetaso2_en nvarchar(200) NULL,
  koulutusalataso1_koodi varchar(2) NULL,
  koulutusalataso1_fi nvarchar(200) NULL,
  koulutusalataso1_sv nvarchar(200) NULL,
  koulutusalataso1_en nvarchar(200) NULL,
  koulutusalataso2_koodi varchar(3) NULL,
  koulutusalataso2_fi nvarchar(200) NULL,
  koulutusalataso2_sv nvarchar(200) NULL,
  koulutusalataso2_en nvarchar(200) NULL,
  koulutusalataso3_koodi varchar(4) NULL,
  koulutusalataso3_fi nvarchar(200) NULL,
  koulutusalataso3_sv nvarchar(200) NULL,
  koulutusalataso3_en nvarchar(200) NULL,
  okmohjauksenala_koodi varchar(2) NULL,
  okmohjauksenala_fi nvarchar(200) NULL,
  okmohjauksenala_sv nvarchar(200) NULL,
  okmohjauksenala_en nvarchar(200) NULL,
)
;
ALTER TABLE dbo.d_koulutusluokitus ADD  CONSTRAINT PK__d_koulutusluokitus PRIMARY KEY CLUSTERED (id ASC)

ALTER TABLE dbo.d_koulutusluokitus ADD  CONSTRAINT DF__d_koulutusluokitus__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_koulutusluokitus ADD  CONSTRAINT DF__d_koulutusluokitus__username  DEFAULT (suser_sname()) FOR username
;

END
