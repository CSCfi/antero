use antero 
go

if not exists (
	SELECT * 
	FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026]') 
	AND name = 'tiedostonimi'
)
alter table [sa].sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026
add tiedostonimi varchar(255) null
go

if not exists (
	SELECT * 
	FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026]') 
	AND name = 'lastmodified'
)
alter table [sa].sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026
add lastmodified datetime2(7) null
go

if not exists (
	SELECT * 
	FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026]') 
	AND name = 'imp_date'
)
alter table [sa].sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026
add imp_date datetime2(7) null
go
