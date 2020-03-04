USE ANTERO
GO
IF EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_valmentavaan_koulutukseen_osallistuneet'
) BEGIN
	DROP TABLE dw.f_virta_otp_valmentavaan_koulutukseen_osallistuneet
END

GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.TABLES
  WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_virta_otp_valmentavaan_koulutukseen_osallistuneet'
) 
BEGIN


CREATE TABLE [dw].[f_virta_otp_valmentavaan_koulutukseen_osallistuneet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[henkilo_tunniste] [int] NOT NULL,
	[d_ika] [int] NULL,
	[d_sukupuoli] [int] NULL,
	[d_koulutusluokitus] [int] NULL,
	[d_organisaatioluokitus_tutkintooppilaitos] [int] NULL,
	[tutkinto_oikeus_aloitusvuosi] [int] NULL,
	[valmentava_oikeus_aloitusvuosi] [int] NULL,
	[valmentava_oikeus_paattymisvuosi] [int] NULL,
	[valmentava_oikeus_tyyppi] [int] NULL,
	[d_organisaatioluokitus_valmentavaoppilaitos] [int] NULL,
	[tutkinnon_suoritus_vuosi] [int] NULL,
	[tilastovuosi] [int] NULL,
	[d_kytkin_aiempi_tutkinto_id] [int] NULL,
	[d_kytkin_myohempi_tutkinto_id] [int] NULL,
	[d_kalenteri_muu_tutkinto_id] [int] NULL,
	
	
	[loadtime] [datetime] NOT NULL, 
	[username] [varchar](30) NOT NULL, 
	[source] [varchar](100) NOT NULL,
 
 
 CONSTRAINT [PK__f_virta_otp_valmentavaan_koulutukseen_osallistuneet] PRIMARY KEY CLUSTERED (id ASC)
 
 )
 
 END
 
 GO

  ALTER TABLE dw.f_virta_otp_valmentavaan_koulutukseen_osallistuneet ADD  CONSTRAINT DF__f_virta_otp_valmentavaan_koulutukseen_osallistuneet__loadtime  DEFAULT (getdate()) FOR loadtime
  GO

  ALTER TABLE dw.f_virta_otp_valmentavaan_koulutukseen_osallistuneet ADD  CONSTRAINT DF__f_virta_otp_valmentavaan_koulutukseen_osallistuneet__username  DEFAULT (suser_name()) FOR username
  GO
 
 
















