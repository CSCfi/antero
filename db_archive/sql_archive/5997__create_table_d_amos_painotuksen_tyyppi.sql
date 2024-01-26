USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_painotuksen_tyyppi]    Script Date: 6.3.2022 18:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_painotuksen_tyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_painotuksen_tyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_painotuksen_tyyppi__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_painotuksen_tyyppi_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_painotuksen_tyyppi] ADD  CONSTRAINT [DF_d_amos_painotuksen_tyyppi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_painotuksen_tyyppi_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_painotuksen_tyyppi] ADD  CONSTRAINT [DF_d_amos_painotuksen_tyyppi_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_painotuksen_tyyppi]    Script Date: 6.3.2022 18:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_painotuksen_tyyppi]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_painotuksen_tyyppi] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_d_amos_painotuksen_tyyppi] AS

TRUNCATE TABLE dw.d_amos_painotuksen_tyyppi

IF NOT EXISTS (select * from dw.d_amos_painotuksen_tyyppi where id=-1) 
begin
	set identity_insert dw.d_amos_painotuksen_tyyppi on;
	insert into dw.d_amos_painotuksen_tyyppi (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
end

else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 99,
		d.source=s.source
	from dw.d_amos_painotuksen_tyyppi d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_amos_painotuksen_tyyppi off;

declare @source varchar(50) = 'p_lataa_d_amos_painotuksen_tyyppi'

INSERT dw.d_amos_painotuksen_tyyppi (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
--opiskelijavuodet
('opiskelijavuodet_painottamaton', 'Painottamattomat opiskelijavuodet', 'SV*', 'EN*', 1, @source),
('opiskelijavuodet_hylatty_painottamaton', 'Painottamattomat opiskelijavuodet', 'SV*', 'EN*', 1, @source),
('opiskelijavuodet_painotettu_pt', 'Kustannusryhmän mukaan painotetut perustutkinnon opiskelijavuodet', 'SV*', 'EN*', 2, @source),
('opiskelijavuodet_painotettu_at_eat', 'Kustannusryhmän mukaan painotetut at- ja eat-tutkinnon opiskelijavuodet', 'SV*', 'EN*', 3, @source),
('opiskelijavuodet_painotettu_valma_telma', 'Kustannusryhmän mukaan painotetut VALMA&TELMA opiskelijavuodet', 'SV*', 'EN*', 4, @source),
('opiskelijavuodet_painotettu_opisk_valm_tukevat', 'Kustannusryhmän mukaan painotetut opiskelijavalmiuksia tukevat opiskelijavuodet', 'SV*', 'EN*', 5, @source),
('opiskelijavuodet_painotettu_muu', 'Kustannusryhmän mukaan painotetut muun koulutuksen opiskelijavuodet', 'SV*', 'EN*', 6, @source),
('opiskelijavuodet_painotettu_erityistuki_hyv', 'Erityistuen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 7, @source),
('opiskelijavuodet_hylatty_painotettu_erityistuki', 'Erityistuen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 8, @source),
('opiskelijavuodet_painotettu_majoitus_hyv', 'Majoituksen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 9, @source),
('opiskelijavuodet_hylatty_painotettu_majoitus', 'Majoituksen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 10, @source),
('opiskelijavuodet_painotettu_henkilostokoulutus', 'Henkilöstökoulutuksen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 11, @source),
('opiskelijavuodet_painotettu_tyovoimakoulutus', 'Työvoimakoulutuksen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 12, @source),
('opiskelijavuodet_painotettu_vankilaopetus', 'Vankilakoulutuksen mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 13, @source),
('opiskelijavuodet_painotettu_oppivelvollisuus', 'Oppivelvollisuuden mukaan painotetut opiskelijavuodet', 'SV*', 'EN*', 14, @source),
--tutkinnot
('painottamaton_tutkinnot_pt', 'Perustutkintojen määrä', 'SV*', 'EN*', 21, @source),
('painottamaton_tutkinnot_at_eat', 'Ammatti- ja erikoisammattitutkintojen määrä', 'SV*', 'EN*', 22, @source),
('painottamaton_osatutkinnot_pt', 'Perustutkintojen tutkinnon osien määrä', 'SV*', 'EN*', 23, @source),
('painottamaton_osatutkinnot_at_eat', 'Ammatti- ja erikoisammattitutkintojen tutkinnon osien määrä', 'SV*', 'EN*', 24, @source),
('painottamaton_osaamispisteet_hyvaksytty_pt', 'Perustutkintojen tutkinnon osien osaamispisteet', 'SV*', 'EN*', 25, @source),
('painottamaton_osaamispisteet_hyvaksytty_at_eat', 'Ammatti- ja erikoisammattitutkintojen tutkinnon osien osaamispisteet', 'SV*', 'EN*', 26, @source),
('painottamaton_osaamispisteet_hylatty_pt', 'Perustutkintojen tutkinnon osien osaamispisteet', 'SV*', 'EN*', 27, @source),
('painottamaton_osaamispisteet_hylatty_at_eat', 'Ammatti- ja erikoisammattitutkintojen tutkinnon osien osaamispisteet', 'SV*', 'EN*',28, @source),
('painotettu_tutkinnot_pt_kr_pk', 'Perustutkintojen kustannusryhmän ja pohjakoulutuksen mukaan painotetut pisteet', 'SV*', 'EN*', 29, @source),
('painotettu_tutkinnot_at_eat_kr_pk', 'Ammatti- ja erikoisammattitutkintojen kustannusryhmän ja pohjakoulutuksen mukaan painotetut pisteet', 'SV*', 'EN*', 30, @source),
('painotettu_tutkinnot_erityistuki', 'Erityisen tuen mukaan painotetut tutkintojen pisteet', 'SV*', 'EN*', 31, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr', 'Perustutkintojen osien kustannusryhmän mukaan painotetut osaamispisteet', 'SV*', 'EN*', 32, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr', 'Ammatti- ja erikoisammattitutkintojen osien kustannusryhmän mukaan painotetut osaamispisteet', 'SV*', 'EN*', 33, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki', 'Erityisen tuen mukaan painotetut tutkinnon osien osaamispisteet', 'SV*', 'EN*', 34, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr', 'Perustutkintojen osien kustannusryhmän mukaan painotetut osaamispisteet', 'SV*', 'EN*', 35, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr', 'Ammatti- ja erikoisammattitutkintojen osien kustannusryhmän mukaan painotetut osaamispisteet', 'SV*', 'EN*', 36, @source),
('painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki', 'Erityisen tuen mukaan painotetut tutkinnon osien osaamispisteet', 'SV*', 'EN*', 37, @source)

