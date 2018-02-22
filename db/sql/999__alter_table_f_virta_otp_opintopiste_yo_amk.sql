ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo DROP CONSTRAINT PK__f_virta___3213E83F5DE67105;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo DROP  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__loadtime;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo DROP  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__username;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo
ALTER COLUMN loadtime datetime2(7) NOT NULL;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD PRIMARY KEY (id);
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__loadtime  DEFAULT (getdate()) FOR loadtime;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__username  DEFAULT (suser_sname()) FOR username;

ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk DROP CONSTRAINT PK__f_virta___3213E83FF2696D7D
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk DROP  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__loadtime__loadtime;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk DROP  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__username;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk
ALTER COLUMN loadtime datetime2(7) NOT NULL;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD PRIMARY KEY (id);
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__loadtime__loadtime  DEFAULT (getdate()) FOR loadtime;
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__username  DEFAULT (suser_sname()) FOR username;