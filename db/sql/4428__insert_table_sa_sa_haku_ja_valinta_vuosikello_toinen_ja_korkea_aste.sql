/****** Script for SelectTopNRows command from SSMS  ******/
use antero
go

--toinen aste
if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] d
	where haku = 'Yhteishaku ammatilliseen ja lukioon, kevät 2021'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]
  (haku,haku_oid,koulutuksen_alkamiskausi,hakuvuosi,aloituspaikat,hakijat,valitut,vastaanottaneet,aloittaneet,pisterajat,extra) 
  values 
  ('Yhteishaku ammatilliseen ja lukioon, kevät 2021',null,null,'2021','2021-03-29','2021-03-29','2021-06-18','2021-08-21','2021-08-21','2021-06-18',null)
end;

if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] d
	where haku = 'Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2021 haku'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]
  (haku,haku_oid,koulutuksen_alkamiskausi,hakuvuosi,aloituspaikat,hakijat,valitut,vastaanottaneet,aloittaneet,pisterajat,extra) 
  values 
  ('Perusopetuksen jälkeisen valmistavan koulutuksen kevään 2021 haku',null,null,'2021','2021-03-29','2021-03-29','2021-06-18','2021-08-21','2021-08-21',null,null)
end;

if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste] d
	where haku = 'Haku vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen, kevät 2021'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_toinen_aste]
  (haku,haku_oid,koulutuksen_alkamiskausi,hakuvuosi,aloituspaikat,hakijat,valitut,vastaanottaneet,aloittaneet,pisterajat,extra) 
  values 
  ('Haku vaativana erityisenä tukena järjestettävään ammatilliseen koulutukseen, kevät 2021',null,null,'2021','2021-03-29','2021-03-29','2021-06-18','2021-08-21','2021-08-21',null,null)
end;

--kk varsinaiset
if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] d
	where haku = 'Korkeakoulujen kevään 2021 ensimmäinen yhteishaku'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	([haku]
    ,[haku_oid]
    ,[koulutuksen_alkamiskausi]
    ,[aloituspaikat]
    ,[hakijat]
    ,[valitut]
    ,[vastaanottaneet]
    ,[aloittaneet]) 
  values ('Korkeakoulujen kevään 2021 ensimmäinen yhteishaku',null,null,'2021-02-18','2021-02-18','2021-08-03','2021-08-10','2021-09-27')
end;

if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] d
	where haku = 'Korkeakoulujen kevään 2021 toinen yhteishaku'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	([haku]
    ,[haku_oid]
    ,[koulutuksen_alkamiskausi]
    ,[aloituspaikat]
    ,[hakijat]
    ,[valitut]
    ,[vastaanottaneet]
    ,[aloittaneet]) 
  values ('Korkeakoulujen kevään 2021 toinen yhteishaku',null,null,'2022-01-24','2022-01-24','2021-08-03','2021-08-10','2021-09-27')
end;

if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] d
	where haku = 'Korkeakoulujen yhteishaku syksy 2021'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	([haku]
    ,[haku_oid]
    ,[koulutuksen_alkamiskausi]
    ,[aloituspaikat]
    ,[hakijat]
    ,[valitut]
    ,[vastaanottaneet]
    ,[aloittaneet]) 
  values ('Korkeakoulujen yhteishaku syksy 2021',null,null,'2021-09-27','2021-09-27','2021-11-29','2021-12-22','2022-01-24')
end;

--kk erillishaut
if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] d
	where haku = 'Erillishaku' and koulutuksen_alkamiskausi = '20212'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	([haku]
    ,[haku_oid]
    ,[koulutuksen_alkamiskausi]
    ,[aloituspaikat]
    ,[hakijat]
    ,[valitut]
    ,[vastaanottaneet]
    ,[aloittaneet]) 
  values ('Erillishaku',null,'20212','2021-09-27','2021-09-27','2021-09-27','2021-09-27','2021-09-27')
end;

if not exists 
(
	select * from [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste] d
	where haku = 'Erillishaku' and koulutuksen_alkamiskausi = '20221'
)
begin
  insert into [ANTERO].[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	([haku]
    ,[haku_oid]
    ,[koulutuksen_alkamiskausi]
    ,[aloituspaikat]
    ,[hakijat]
    ,[valitut]
    ,[vastaanottaneet]
    ,[aloittaneet]) 
  values ('Erillishaku',null,'20221','2022-01-24','2022-01-24','2022-01-24','2022-01-24','2022-01-24')
end;

