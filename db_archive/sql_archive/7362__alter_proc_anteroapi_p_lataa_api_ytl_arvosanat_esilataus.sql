USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_ytl_arvosanat_esilataus]    Script Date: 14.2.2023 12:15:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_ytl_arvosanat_esilataus] AS

TRUNCATE TABLE [dw].[api_ytl_arvosanat];

INSERT INTO [dw].[api_ytl_arvosanat]

SELECT  
	 ROW_NUMBER() OVER(ORDER BY id) as defaultorder
	,id AS 'Opiskelija Koodi'
	,tutkintokerta AS 'Tutkintokerta Koodi'
	,case 
		when RIGHT(tutkintokerta,1) = 'S' then CONCAT('Syksy ', LEFT(tutkintokerta,4))
		when RIGHT(tutkintokerta,1) = 'K' then CONCAT('Kevät ', LEFT(tutkintokerta,4))
	end as 'Tutkintokerta'
	,koulun_nro AS 'Lukio Koodi'
	,koulun_nimi AS 'Lukio'
	,tyyppi AS 'Oppilaitostyyppi Koodi'
	,case tyyppi
		when '1' then 'Lukio'
		when '2' then 'Aikuislukio'
		when '4' then 'Kansanopisto' 
	end AS 'Oppilaitostyyppi'
	,opetuskieli AS 'Opetuskieli Koodi'
	,case opetuskieli 
		when 'FI' then 'suomi' 
		when 'SV' then 'ruotsi' 
	end AS 'Opetuskieli'
	,sukup AS 'Sukupuoli Koodi'
	,case sukup 
		when 1 then 'Mies' 
		when 2 then 'Nainen' 
	end AS 'Sukupuoli'
	,koe AS 'Koe Koodi'
	,case koe
		when 'A' then 'Äidinkieli, suomi'
		when 'A5' then 'Suomi toisena kielenä'
		when 'BA' then 'Ruotsi, pitkä oppimäärä'
		when 'BB' then 'Ruotsi, keskipitkä oppimäärä'
		when 'BI' then 'Biologia'
		when 'CA' then 'Suomi, pitkä oppimäärä'
		when 'CB' then 'Suomi, keskipitkä oppimäärä'
		when 'DC' then 'Pohjoissaame, lyhyt oppimäärä'
		when 'EA' then 'Englanti, pitkä oppimäärä'
		when 'EC' then 'Englanti, lyhyt oppimäärä'
		when 'ET' then 'Elämänkatsomustieto'
		when 'FA' then 'Ranska, pitkä oppimäärä'
		when 'FC' then 'Ranska, lyhyt oppimäärä'
		when 'FF' then 'Filosofia'
		when 'FY' then 'Fysiikka'
		when 'GC' then 'Portugali, lyhyt oppimäärä'
		when 'GE' then 'Maantiede'
		when 'HI' then 'Historia'
		when 'I' then 'Äidinkieli, inarinsaame'
		when 'IC' then 'Inarinsaame, lyhyt oppimäärä'
		when 'KE' then 'Kemia'
		when 'L1' then 'Latina, lyhyt oppimäärä'
		when 'L7' then 'Latina, pidempi oppimäärä'
		when 'M' then 'Matematiikka, pitkä oppimäärä'
		when 'N' then 'Matematiikka, lyhyt oppimäärä'
		when 'O' then 'Äidinkieli, ruotsi'
		when 'O5' then 'Ruotsi toisena kielenä'
		when 'PA' then 'Espanja, pitkä oppimäärä'
		when 'PC' then 'Espanja, lyhyt oppimäärä'
		when 'PS' then 'Psykologia'
		when 'Q' then '- ei käytössä -'
		when 'QC' then 'Koltansaame, lyhyt oppimäärä'
		when 'SA' then 'Saksa, pitkä oppimäärä'
		when 'SC' then 'Saksa, lyhyt oppimäärä'
		when 'TC' then 'Italia, lyhyt oppimäärä'
		when 'TE' then 'Terveystieto'
		when 'UE' then 'Evankelis-luterilainen uskonto'
		when 'UO' then 'Ortodoksi uskonto'
		when 'VA' then 'Venäjä, pitkä oppimäärä'
		when 'VC' then 'Venäjä, lyhyt oppimäärä'
		when 'W' then 'Äidinkieli, koltansaame'
		when 'YH' then 'Yhteiskuntaoppi'
		when 'Z' then 'Äidinkieli, pohjoissaame' 
	end as 'Koe'
	,case arvosana
		when '0' then 'I'
		when '2' then 'A'
		when '3' then 'B'
		when '4' then 'C'
		when '5' then 'M'
		when '6' then 'E'
		when '7' then 'L' 
	end as 'Arvosana Koodi'
	,case arvosana
		when '0' then 'Improbatur'
		when '2' then 'Approbatur'
		when '3' then 'Lubenter approbatur'
		when '4' then 'Cum laude approbatur'
		when '5' then 'Magna cum laude approbatur'
		when '6' then 'Eximia cum laude approbatur'
		when '7' then 'Laudatur' 
	end AS 'Arvosana'
	,arvosana AS 'Arvosanapisteet'

FROM
	(SELECT id,tutkintokerta,koulun_nro,koulun_nimi,tyyppi,opetuskieli,sukup,YH,EA,BA,BB,FY,BI,FA,HI,FF,O5,QC,PC,PA,A5,TE,TC,A,VA,VC,PS,I,CB,CA,M,O,N,Q,SC,GE,GC,EC,W,L1,ET,IC,Z,KE,L7,DC,UO,FC,UE,SA
	  FROM ANTERO.sa.sa_ytl_FT4001) p
UNPIVOT
	(arvosana FOR koe IN (YH,EA,BA,BB,FY,BI,FA,HI,FF,O5,QC,PC,PA,A5,TE,TC,A,VA,VC,PS,I,CB,CA,M,O,N,Q,SC,GE,GC,EC,W,L1,ET,IC,Z,KE,L7,DC,UO,FC,UE,SA)) AS unpvt
WHERE arvosana <> ''

GO

USE [ANTERO]