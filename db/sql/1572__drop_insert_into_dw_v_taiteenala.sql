USE [ANTERO]
GO


TRUNCATE TABLE [dw].[d_taiteenala]
GO

INSERT INTO [dw].[d_taiteenala]
           ([taiteenala_koodi]
           ,[taiteenala_nimi_fi]
           ,[taiteenala_nimi_sv]
           ,[taiteenala_nimi_en])
     VALUES
           (-1,	'Tieto puuttuu','Information saknas','Missing data'),
(1,	'Arkkitehtuuri','Arkitektur','Architecture'),
(2, 'Elokuva','Film','Movie'),
(3,	'Esittävä taide','Scenkonst','Performing arts'),
(4,	'Kirjallisuus','Litteratur','Literature'),
(5,	'Muotoilu','Utformning','Design'),
(6,	'Musiikki','Musik','Music'),
(7,	'Nykytaide','Modern konst','Modern art')
GO
