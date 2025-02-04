use Arvo_SA
go

alter table [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot]
alter column [tyopaikkajakson_alkupvm] date

alter table [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot]
alter column [tyopaikkajakson_loppupvm] date

alter table [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot]
alter column [tiedonkeruu_alkupvm] date

alter table [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot]
alter column [tiedonkeruu_loppupvm] date

go
