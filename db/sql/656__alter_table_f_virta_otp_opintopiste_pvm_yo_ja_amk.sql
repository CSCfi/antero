ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD PRIMARY KEY (id)

ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_yo ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_yo__username  DEFAULT (suser_sname()) FOR username


ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD PRIMARY KEY (id)

ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__loadtime__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.f_virta_otp_opintopiste_pvm_amk ADD  CONSTRAINT DF__f_virta_otp_opintopiste_pvm_amk__username  DEFAULT (suser_sname()) FOR username