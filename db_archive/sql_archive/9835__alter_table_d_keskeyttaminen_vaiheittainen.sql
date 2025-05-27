use [ANTERO]
go 

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [keskeyttaminen_vaiheittainen_koodi] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_tutkinto_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_koulutusala_taso3_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_koulutusala_taso2_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_koulutusala_taso1_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_koulutusmuoto_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_amm_yleissiv_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_toinen_aste_boo] int

alter table [dw].[d_keskeyttaminen_vaiheittainen]
alter column [jatkaa_koulutusjarjestelma_boo] int

go
