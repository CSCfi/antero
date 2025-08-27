USE [ANTERO]
GO

/****** Object:  View [dw].[v_lapsen_tuki_varhaiskasvatuksessa_2_22e]    Script Date: 5.9.2024 16:15:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE OR ALTER       VIEW [dw].[v_lapsen_tuki_varhaiskasvatuksessa_2_22e] AS

SELECT 

-- Taustamuuttujat
	 [Tilastovuosi]									= v.tilv
    ,[Koulutuksen järjestäjän järjestäjätunnus]		= v.[vjarj]
    ,[Koulutuksen järjestäjän nimi]					= v.[vjarjnim]
    ,case when v.yllapKieli = 0 then 'suomi'
	 when v.yllapKieli = 1 then 'ruotsi'
	 end as [Oikeudellisen yksikön kieli]					
	,[Opetuksen järjestäjän sijaintikuntakoodi]		= d2.kunta_koodi
    ,[Opetuksen järjestäjän sijaintikunnan nimi]	= d2.kunta_fi
    ,[Opetuksen järjestäjän sijaintikunnan maakunta]= d1.[maakunta_fi]

--Laskentamuuttujat

    ,[Kunnassa hallintopäätös vakassa annettavasta tuesta 2023] = v.vpaaton
    
--Yleinen tuki
	,[Kunnassa hallintopäätös yleisen tuen tukipalveluista 2023] = v.vpatyon
    ,[Päätösten määrää ei ole mahdollista jakaa sukupuolen mukaan, yleinen tuki] = v.[vpatysuku]
    ,[Hallintopäätösten määrä yleisen tuki, Alle 3-vuotiaat tytöt] = v.[vpatya3n]
    ,[Hallintopäätösten määrä yleisen tuki, 3-4-vuotiaat tytöt] = v.[vpaty34n]
    ,[Hallintopäätösten määrä yleisen tuki, 5-vuotiaat tytöt] = v.[vpaty5n]
    ,[Hallintopäätösten määrä yleisen tuki, 6-vuotiaat tytöt] = v.[vpaty6n]
    ,[Hallintopäätösten määrä yleisen tuki, Alle 3-vuotiaat pojat] = v.[vpatya3m]
    ,[Hallintopäätösten määrä yleisen tuki, 3-4-vuotiaat pojat] = v.[vpaty34m]
    ,[Hallintopäätösten määrä yleisen tuki, 5-vuotiaat pojat] = v.[vpaty5m]
    ,[Hallintopäätösten määrä yleisen tuki, 6-vuotiaat pojat] = v.[vpaty6m]
    ,[Hallintopäätösten määrä yleisen tuki, Alle 3-vuotiaat yhteensä] = v.[vpatya3y]
    ,[Hallintopäätösten määrä yleisen tuki, 3-4-vuotiaat yhteensä] = v.[vpaty34y]
    ,[Hallintopäätösten määrä yleisen tuki, 5-vuotiaat yhteensä] = v.[vpaty5y]
    ,[Hallintopäätösten määrä yleisen tuki, 6-vuotiaat yhteensä] = v.[vpaty6y]
    
--Tehostettu tuki	
	,[Kunnassa hallintopäätös vakassa annettavasta tehostetusta tuesta 2023] = v.[vpatton]
    ,[Päätösten määrää ei ole mahdollista jakaa sukupuolen mukaan, tehostettu tuki] = v.[vpattsuku]
    ,[Hallintopäätösten määrä tehostettu tuki, Alle 3-vuotiaat tytöt] = v.[vpatta3n]
    ,[Hallintopäätösten määrä tehostettu tuki, 3-4-vuotiaat tytöt] = v.[vpatt34n]
    ,[Hallintopäätösten määrä tehostettu tuki, 5-vuotiaat tytöt] = v.[vpatt5n]
    ,[Hallintopäätösten määrä tehostettu tuki, 6-vuotiaat tytöt] = v.[vpatt6n]
    ,[Hallintopäätösten määrä tehostettu tuki, Alle 3-vuotiaat pojat] = v.[vpatta3m]
    ,[Hallintopäätösten määrä tehostettu tuki, 3-4-vuotiaat pojat] = v.[vpatt34m]
    ,[Hallintopäätösten määrä tehostettu tuki, 5-vuotiaat pojat] = v.[vpatt5m]
    ,[Hallintopäätösten määrä tehostettu tuki, 6-vuotiaat pojat] = v.[vpatt6m]
    ,[Hallintopäätösten määrä tehostettu tuki, Alle 3-vuotiaat yhteensä] = v.[vpatta3y]
    ,[Hallintopäätösten määrä tehostettu tuki, 3-4-vuotiaat yhteensä] = v.[vpatt34y]
    ,[Hallintopäätösten määrä tehostettu tuki, 5-vuotiaat yhteensä] = v.[vpatt5y]
    ,[Hallintopäätösten määrä tehostettu tuki, 6-vuotiaat yhteensä] = v.[vpatt6y]
    
--Erityinen tuki	
	,[Kunnassa hallintopäätös vakassa annettavasta erityisestä tuesta 2023] = v.[vpateon]
    ,[Päätösten määrää ei ole mahdollista jakaa sukupuolen mukaan, erityinen tuki] = v.[vpatesuku]
    ,[Hallintopäätösten määrä erityinen tuki, Alle 3-vuotiaat tytöt] = v.[vpatea3n]
    ,[Hallintopäätösten määrä erityinen tuki, 3-4-vuotiaat tytöt] = v.[vpate34n]
    ,[Hallintopäätösten määrä erityinen tuki, 5-vuotiaat tytöt] = v.[vpate5n]
    ,[Hallintopäätösten määrä erityinen tuki, 6-vuotiaat tytöt] = v.[vpate6n]
    ,[Hallintopäätösten määrä erityinen tuki, Alle 3-vuotiaat pojat] = v.[vpatea3m]
    ,[Hallintopäätösten määrä erityinen tuki, 3-4-vuotiaat pojat] = v.[vpate34m]
    ,[Hallintopäätösten määrä erityinen tuki, 5-vuotiaat pojat] = v.[vpate5m]
    ,[Hallintopäätösten määrä erityinen tuki, 6-vuotiaat pojat] = v.[vpate6m]
    ,[Hallintopäätösten määrä erityinen tuki, Alle 3-vuotiaat yhteensä] = v.[vpatea3y]
    ,[Hallintopäätösten määrä erityinen tuki, 3-4-vuotiaat yhteensä] = v.[vpate34y]
    ,[Hallintopäätösten määrä erityinen tuki, 5-vuotiaat yhteensä] = v.[vpate5y]
    ,[Hallintopäätösten määrä erityinen tuki, 6-vuotiaat yhteensä] = v.[vpate6y]
    
--Lapselle hallintopäätöksen perusteella myönnetyt tukitoimet
	
	,[Erittely kunnallisten ja yksityisten varhaiskasvatustoimijoiden välillä ei ole mahdollista] = v.[vttjako]
	
	--kunnallinen
	,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmän lapsimäärää on vähennetty, Kunnallinen varhaiskasvatus] = v.[vttvahk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään lisätty henkilöstöä, Kunnallinen varhaiskasvatus] = v.[vttlisk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään lisätty erityisopettaja, Kunnallinen varhaiskasvatus] = v.[vtterik]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty avustaja, Kunnallinen varhaiskasvatus] = v.[vttavuk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Erityisopettajan tukea osa-aikaisesti, Kunnallinen varhaiskasvatus] = v.[vttosak]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi on sijoitettu erityisryhmään, Kunnallinen varhaiskasvatus] = v.[vtteryk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi sijoitettu integroituun ryhmään, Kunnallinen varhaiskasvatus] = v.[vttiryk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on henkilökohtainen avustaja, Kunnallinen varhaiskasvatus] = v.[vtthavk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi saa tulkitsemispalveluita, Kunnallinen varhaiskasvatus] = v.[vtttlkk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä apuvälineitä, Kunnallinen varhaiskasvatus] = v.[vttvalk]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä kuljetuspalvelu, Kunnallinen varhaiskasvatus] = v.[vttkulk]
    --yksityinen
	,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmän lapsimäärää on vähennetty, Yksityinen varhaiskasvatus] = v.[vttvahy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään lisätty henkilöstöä, Yksityinen varhaiskasvatus] = v.[vttlisy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty erityisopettaja, Yksityinen varhaiskasvatus] = v.[vtteriy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty avustaja, Yksityinen varhaiskasvatus] = v.[vttavuy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Erityisopettajan tukea osa-aikaisesti, Yksityinen varhaiskasvatus] = v.[vttosay]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi on sijoitettu erityisryhmään, Yksityinen varhaiskasvatus] = v.[vtteryy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi sijoitettu integroituun ryhmään, Yksityinen varhaiskasvatus] = v.[vttiryy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on henkilökohtainen avustaja, Yksityinen varhaiskasvatus] = v.[vtthavy]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi saa tulkitsemispalveluita, Yksityinen varhaiskasvatus] = v.[vtttlky]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä apuvälineitä, Yksityinen varhaiskasvatus] = v.[vttvaly]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä kuljetuspalvelu, Yksityinen varhaiskasvatus] = v.[vttkuly]
    --yhteensä
	,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmän lapsimäärää on vähennetty, Yhteensä] = v.[vttvahyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty kasvatus- ja opetushenkilöstöä, Yhteensä] = v.[vttlisyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty erityisopettaja, Yhteensä] = v.[vtteriyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsiryhmään on lisätty avustaja, Yhteensä] = v.[vttavuyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi saa erityisopettajan tukea osa-aikaisesti, Yhteensä] = v.[vttosayh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi on sijoitettu erityisryhmään, Yhteensä] = v.[vtteryyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi on sijoitettu integroituun ryhmään, Yhteensä] = v.[vttiryyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on henkilökohtainen avustaja, Yhteensä] = v.[vtthavyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsi saa tulkitsemispalveluita, Yhteensä] = v.[vtttlkyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä apuvälineitä, Yhteensä] = v.[vttvalyh]
    ,[Hallintopäätöksellä myönnetty tukitoimia, Lapsella on käytössä kuljetuspalvelu, Yhteensä] = v.[vttkulyh]
    
	,[Kunta ilmoittanut, ettei järjestä varhaiskasvatusta yksityisen kautta] = d3.kytkin_fi



-- Järjestysmuuttujat

		
							

FROM [VipunenTK_SA].[dbo].[v_sa_2_22e_lapsen_tuki_vakassa_2023] v
	OUTER APPLY (select top 1 * from dw.d_alueluokitus d1 where d1.maakunta_koodi = v.vonuts3) d1
	LEFT JOIN [ANTERO].dw.d_alueluokitus d2
	ON d2.kunta_koodi = v.vokun
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d3
	ON d3.id = v.eiyksityista
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d4
	ON d4.id = v.vpaaton
	LEFT JOIN [ANTERO].[dw].[d_kytkin] d5
	ON d5.id = v.vpatyon




GO


