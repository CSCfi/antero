USE ANTERO

GO


ALTER TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet ADD  CONSTRAINT DF__sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet ADD  CONSTRAINT DF__sa_virta_otp_korkeakouluhaut_hakijat_opiskeluoikeudet__username  DEFAULT (suser_name()) FOR username
;

ALTER TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot ADD  CONSTRAINT DF__sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot ADD  CONSTRAINT DF__sa_virta_otp_korkeakouluhaut_hakijat_tutkinnot__username  DEFAULT (suser_name()) FOR username
;

