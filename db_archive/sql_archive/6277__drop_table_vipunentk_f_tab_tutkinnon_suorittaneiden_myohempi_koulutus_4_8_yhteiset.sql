use [VipunenTK_DW]
go

--testissä ajoja käynnissä, huom. lopussa vastaava off-asetus
IF(@@SERVERNAME != 'DWIPVIPUSQL16')
BEGIN
    SET NOEXEC ON; 
END
--

Drop table if exists VipunenTK.dbo.f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset
go

--testissä ajoja käynnissä, huom. alussa vastaava on-asetus
SET NOEXEC OFF; 
--