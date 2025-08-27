USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_move_pisterajat]    Script Date: 21.10.2024 15:00:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER PROCEDURE  [dw].[p_lataa_d_move_pisterajat] AS

TRUNCATE TABLE dw.d_move_pisterajat

INSERT dw.d_move_pisterajat (mittari, sukupuoli, luokka, ylaraja1, alaraja2, ylaraja2, alaraja3 ,source)
VALUES 
('etunojapunnerrus','Poika','5. luokka','10','11','21','22', 'manuaalinen'),
('etunojapunnerrus','Poika','8. luokka','15','16','28','29', 'manuaalinen'),
('etunojapunnerrus','Tyttö','5. luokka','20','21','30','31', 'manuaalinen'),
('etunojapunnerrus','Tyttö','8. luokka','21','22','32','33', 'manuaalinen'),
('heitto-kiinniotto','Poika','5. luokka','9','10','15','16', 'manuaalinen'),
('heitto-kiinniotto','Poika','8. luokka','12','13','16','17', 'manuaalinen'),
('heitto-kiinniotto','Tyttö','5. luokka','8','9','13','14', 'manuaalinen'),
('heitto-kiinniotto','Tyttö','8. luokka','12','13','16','17', 'manuaalinen'),
('vauhditon 5-loikka','Poika','5. luokka','7.3','7.4','8.1','8.2', 'manuaalinen'),
('vauhditon 5-loikka','Poika','8. luokka','9','9.1','10','10.1', 'manuaalinen'),
('vauhditon 5-loikka','Tyttö','5. luokka','7.3','7.4','8.1','8.2', 'manuaalinen'),
('vauhditon 5-loikka','Tyttö','8. luokka','8.2','8.3','9.1','9.2', 'manuaalinen'),
('viivajuoksu','Poika','5. luokka','24','25','43','44', 'manuaalinen'),
('viivajuoksu','Poika','8. luokka','36','37','60','61', 'manuaalinen'),
('viivajuoksu','Tyttö','5. luokka','21','22','35','36', 'manuaalinen'),
('viivajuoksu','Tyttö','8. luokka','27','28','43','44', 'manuaalinen'),
('ylävartalon kohotus','Poika','5. luokka','21','22','40','41', 'manuaalinen'),
('ylävartalon kohotus','Poika','8. luokka','32','33','57','58', 'manuaalinen'),
('ylävartalon kohotus','Tyttö','5. luokka','22','23','40','41', 'manuaalinen'),
('ylävartalon kohotus','Tyttö','8. luokka','27','28','43','44', 'manuaalinen')
GO

USE [ANTERO]
