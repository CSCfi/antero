USE ANTERO

GO

SELECT 
	s.eu_koodi,
	s.isoCode as iso_koodi,
	s.name as Maa 
	INTO
	ANTERO.dw.d_horizon_maakoodit
	FROM
sa.sa_horizon_maakoodit s

