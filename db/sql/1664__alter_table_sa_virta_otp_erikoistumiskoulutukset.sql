USE ANTERO

GO

ALTER TABLE sa.sa_virta_otp_erikoistumiskoulutukset ADD  CONSTRAINT DF__sa_virta_otp_erikoistumiskoulutukset__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_erikoistumiskoulutukset ADD  CONSTRAINT DF__sa_virta_otp_erikoistumiskoulutukset__username  DEFAULT (suser_name()) FOR username
;
