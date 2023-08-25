use VipunenTK_lisatiedot
go


if not exists (select * from [dbo].[opiskelu_toiminta] where [opiskelu_toiminta_koodi] = 'ASEMA98')
begin
   INSERT [dbo].[opiskelu_toiminta] (
   [id],
   [luotu],
   [opiskelu_toiminta_koodi],
   [opiskelu_toiminta],
   [opiskelu_toiminta_SV],
   [opiskelu_toiminta_EN],
   [jarjestys_opiskelu_toiminta],
   [virhetilanne],
   [poistettu],
   [tietolahde],
   [kommentti])
   VALUES (
   9,
   CAST(N'2023-08-22' AS Date),
   N'ASEMA98',
   N'Valmentava/valmistava koulutus',
   N'Förberedande utbildning',
   N'Preparatory education',
   N'198',
   N'E         ',
   N'0',
   N'Tilastokeskus',
   N'CSC Mika')

end
;

if not exists (select * from [dbo].[rahoituslahde_amm] where [rahoituslahde_amm_koodi] = '14')
begin
   INSERT [dbo].[rahoituslahde_amm] (
   [id],
   [luotu],
   [alkaa],
   [paattyy],
   [rahoituslahde_amm_koodi],
   [rahoituslahde_amm],
   [rahoituslahde_amm_SV],
   [rahoituslahde_amm_EN],
   [jarjestys],
   [virhetilanne],
   [poistettu],
   [tietolahde],
   [kommentti])
   VALUES (
   14,
   CAST(N'2023-08-21' AS Date),
   CAST(N'1900-01-01' AS Date),
   CAST(N'9999-01-01' AS Date),
   N'14',
   N'Jatkuvan oppimisen ja työllisuuden palvelukeskuksen rahoitus',
   N'Finansiering av Servicecentret för kontinuerligt lärande och sysselsättning',
   N'Funded by The Service Centre for Continuous Learning and Employment',
   N'1140',
   N'E',
   N' ',
   N'Manuaalinen',
   N'CSC Mika')

end
;

if not exists (select * from [dbo].[rahoituslahde_amm] where [rahoituslahde_amm_koodi] = '15')
begin
   INSERT [dbo].[rahoituslahde_amm] (
   [id],
   [luotu],
   [alkaa],
   [paattyy],
   [rahoituslahde_amm_koodi],
   [rahoituslahde_amm],
   [rahoituslahde_amm_SV],
   [rahoituslahde_amm_EN],
   [jarjestys],
   [virhetilanne],
   [poistettu],
   [tietolahde],
   [kommentti]) 
   VALUES (
   15,
   CAST(N'2023-08-21' AS Date),
   CAST(N'1900-01-01' AS Date),
   CAST(N'9999-01-01' AS Date),
   N'15',
   N'Jatkuvan oppimisen ja työllisuuden palvelukeskuksen rahoitus (RRF)',
   N'Finansiering av Servicecentret för kontinuerligt lärande och sysselsättning (RRF)',
   N'Funded by The Service Centre for Continuous Learning and Employment (RRF)',
   N'1150',
   N'E',
   N' ',
   N'Manuaalinen',
   N'CSC Mika')

end
;

if not exists (select * from [perusopetuksen_yleisopetuksen_osuus] where [perusopetuksen_yleisopetuksen_osuus_koodi] = 'int_tuntem')
begin
   INSERT [dbo].[perusopetuksen_yleisopetuksen_osuus] (
   [id],
   [luotu],
   [perusopetuksen_yleisopetuksen_osuus_koodi],
   [perusopetuksen_yleisopetuksen_osuus],
   [perusopetuksen_yleisopetuksen_osuus_SV],
   [perusopetuksen_yleisopetuksen_osuus_EN],
   [jarjestys],
   [virhetilanne],
   [poistettu],
   [tietolahde],
   [kommentti])
   VALUES (
   11,
   CAST(N'2023-08-23' AS Date),
   N'int_tuntem',
   N'Tuntematon',
   N'Information saknas',
   N'Missing data',
   N'1045',
   N'E',
   N' ',
   N'Manuaalinen',
   N'CSC Mika')
   
end
;