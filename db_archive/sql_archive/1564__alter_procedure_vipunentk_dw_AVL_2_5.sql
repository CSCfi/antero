USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat]    Script Date: 24.4.2018 13:59:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat] AS

/* Lauseet siirtoon VipunenTK-kantaan nopeaa testiä varten

EXECUTE [VipunenTK_DW].dbo.p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat


Välitaulun luonti
Drop table VipunenTK_DW.dbo.f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat
Select * into VipunenTK_DW.dbo.f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat from VipunenTK_DW.dbo.v_f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat
*/
-- Täytetään ensin välitaulu unpivot-muodossa

Truncate table VipunenTK_DW.dbo.f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat
Insert into VipunenTK_DW.dbo.f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat
Select * from VipunenTK_DW.dbo.v_f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat

-- INSERT1
-- Tyhjennetään ja täytetään VipunenTK.dbo.f_AVL_ainevalinnat
DELETE FROM VipunenTK.dbo.f_AVL_ainevalinnat

INSERT INTO VipunenTK.dbo.f_AVL_ainevalinnat
SELECT tilastovuosi=tilastointivuosi
      ,tilastovuosi_date=[tilv_date]
      
      ,[aine_avain]=f.ainevalinnatlukiossa_aine_koodi
      ,[laajuus_avain]=f.ainevalinnatlukiossa_laajuus_koodi
      ,[ainevalinta_id]=ISNULL(d1.id,-2)
      
      --,[kieltenmäärä_avain]=f.kieltenmäärä_avain
      --,[kieltenmaara_id]=ISNULL(d2.id,-2)
      
      ,[sukupuoli_avain]=f.sukupuoli_koodi
      ,[sukupuoli_id]=ISNULL(d3.id,-2)
      
      ,[oppilaitos_avain]=f.oppilaitos_avain
      ,[oppilaitos_id]=ISNULL(d4.id,-2)
      
      ,[oppilaitoksensijaintikunta_avain]=d4.sijaintikuntakoodi
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id,-2)
      
      ,ainevalintojen_lkm
      --,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      
      ,[aineisto]
      ,[laatu_id]=0 --voidaan laskea myöhemmin todelliseksi

-- INTO VipunenTK.dbo.f_ainevalinnat_lukiossa
FROM

( --f

SELECT 
      tilastointivuosi
      ,tilv_date
      ,ainevalinnatlukiossa_aine_koodi = aine
      ,ainevalinnatlukiossa_laajuus_koodi = laajuus 
      ,sukupuoli_koodi = Case sukupuoli when 'mies' then '1' when 'nainen' then '2' when 'yht' then '-1' else '-2' end
      --,kieltenmäärä_avain = Case when kielten_maara='' then '-1' else kielten_maara end
      ,oppilaitos_avain = oppilaitos
      ,ainevalintojen_lkm
      --,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      ,aineisto = CAST('2.5' as nvarchar(8))
FROM ( --olapdata

SELECT 
    tilastointivuosi
  , tilv_date
  , oppilaitos
  , aine= Cast('' as nvarchar(50))
  , laajuus= Cast('' as nvarchar(50))
  , sukupuoli= Cast('' as nvarchar(10))
  --, kielten_maara=Cast('' as nvarchar(10))
  , ainevalintojen_lkm= lkm_arvo --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  --, opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  --, aineiden_opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  , kommentti= Cast('' as nvarchar(100)) 
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='<lkm_id>' 


--Suorat ainevalintojen lukumäärät
--SQL1
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kats_evlut', 'ei', 'yht', lkm_arvo, 'muuttuja ev, rivi 86' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ev' --86
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kats_ortod', 'ei', 'yht', lkm_arvo, 'muuttuja ort, rivi 87' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ort' --87
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kats_elama', 'ei', 'yht', lkm_arvo, 'muuttuja et, rivi 88' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='et' --88
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kats_muut', 'ei', 'yht', lkm_arvo, 'muuttuja mu, rivi 89' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mu' --89
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kats_ei', 'ei', 'yht', lkm_arvo, 'muuttuja eos, rivi 90' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='eos' --90

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi2', 'ei', 'nainen', lkm_arvo, 'muuttuja svnn, rivi 104' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='svnn' --104
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi2', 'ei', 'nainen', lkm_arvo, 'muuttuja rvnn, rivi 105' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='rvnn' --105

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yaenm, rivi 108' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaenm' --108
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yyenm, rivi 109' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyenm' --109
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yen6m, rivi 110' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yen6m' --110
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja len6m, rivi 111' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='len6m' --111
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alen6m, rivi 112' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alen6m' --112

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yaenn, rivi 114' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaenn' --114
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yyenn, rivi 115' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyenn' --115
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yen6n, rivi 116' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yen6n' --116
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja len6n, rivi 117' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='len6n' --117
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'englanti', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alen6n, rivi 118' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alen6n' --118

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yarum, rivi 120' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yarum' --120
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yyrum, rivi 121' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyrum' --121
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yru6m, rivi 122' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yru6m' --122
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lru6m, rivi 123' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lru6m' --123
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alru6m, rivi 124' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alru6m' --124

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yarun, rivi 126' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yarun' --126
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yyrun, rivi 127' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyrun' --127
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yru6n, rivi 128' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yru6n' --128
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lru6n, rivi 129' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lru6n' --129
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alru6n, rivi 130' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alru6n' --130

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yasum, rivi 132' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasum' --132
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yysum, rivi 133' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yysum' --133
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja ysu6m, rivi 134' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysu6m' --134
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lsu6m, rivi 135' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsu6m' --135
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alsu6m, rivi 136' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsu6m' --136

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yasun, rivi 138' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasun' --138
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yysun, rivi 139' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yysun' --139
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja ysu6n, rivi 140' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysu6n' --140
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lsu6n, rivi 141' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsu6n' --141
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alsu6n, rivi 142' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsu6n' --142

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yaram, rivi 144' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaram' --144
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yyram, rivi 145' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyram' --145
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yra6m, rivi 146' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yra6m' --146
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lra6m, rivi 147' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lra6m' --147
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alra6m, rivi 148' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alra6m' --148

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yaran, rivi 150' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaran' --150
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yyran, rivi 151' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyran' --151
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yra6n, rivi 152' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yra6n' --152
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lra6n, rivi 153' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lra6n' --153
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ranska', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alra6n, rivi 154' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alra6n' --154

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yasam, rivi 156' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasam' --156
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yysam, rivi 157' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yysam' --157
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja ysa6m, rivi 158' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysa6m' --158
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lsa6m, rivi 159' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsa6m' --159
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alsa6m, rivi 160' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsa6m' --160

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yasan, rivi 162' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasan' --162
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yysan, rivi 163' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yysan' --163
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja ysa6n, rivi 164' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysa6n' --164
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lsa6n, rivi 165' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsa6n' --165
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saksa', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alsa6n, rivi 166' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsa6n' --166

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yavem, rivi 168' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yavem' --168
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yyvem, rivi 169' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyvem' --169
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yve6m, rivi 170' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yve6m' --170
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lve6m, rivi 171' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lve6m' --171
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alve6m, rivi 172' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alve6m' --172

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yaven, rivi 174' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaven' --174
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yyven, rivi 175' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyven' --175
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yve6n, rivi 176' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yve6n' --176
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lve6n, rivi 177' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lve6n' --177
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'venaja', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alve6n, rivi 178' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alve6n' --178

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yasaam, rivi 180' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasaam' --180
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja ysaa6m, rivi 181' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysaa6m' --181
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lsaa6m, rivi 182' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsaa6m' --182
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alsaa6m, rivi 183' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsaa6m' --183

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yasaan, rivi 185' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yasaan' --185
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja ysaa6n, rivi 186' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ysaa6n' --186
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lsaa6n, rivi 187' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lsaa6n' --187
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'saame', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alsaa6n, rivi 188' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alsaa6n' --188

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yalatm, rivi 190' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yalatm' --190
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja ylat6m, rivi 191' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ylat6m' --191
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lla6m, rivi 192' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lla6m' --192
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alla6m, rivi 193' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alla6m' --193

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yalan, rivi 195' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yalan' --195
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja ylat6n, rivi 196' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ylat6n' --196
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lla6n, rivi 197' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lla6n' --197
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'latina', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alla6n, rivi 198' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alla6n' --198

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yaesm, rivi 200' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaesm' --200
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yes6m, rivi 201' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yes6m' --201
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja les6m, rivi 202' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='les6m' --202
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja ales6m, rivi 203' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ales6m' --203

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yaesn, rivi 205' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaesn' --205
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yes6n, rivi 206' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yes6n' --206
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja les6n, rivi 207' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='les6n' --207
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'espanja', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja ales6n, rivi 208' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ales6n' --208

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yaitm, rivi 210' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaitm' --210
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja yit6m, rivi 211' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yit6m' --211
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lit6m, rivi 212' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lit6m' --212
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja alit6m, rivi 213' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alit6m' --213

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yaitn, rivi 215' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yaitn' --215
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja yit6n, rivi 216' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yit6n' --216
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lit6n, rivi 217' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lit6n' --217
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'italia', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja alit6n, rivi 218' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='alit6n' --218

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_A', 'mies', lkm_arvo, 'muuttuja yamum, rivi 220' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yamum' --220
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B1', 'mies', lkm_arvo, 'muuttuja yymum, rivi 221' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yymum' --221
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B2', 'mies', lkm_arvo, 'muuttuja ymu6m, rivi 222' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ymu6m' --222
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B3', 'mies', lkm_arvo, 'muuttuja lmu6m, rivi 223' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lmu6m' --223
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_alleB', 'mies', lkm_arvo, 'muuttuja almu6m, rivi 224' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='almu6m' --224

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_A', 'nainen', lkm_arvo, 'muuttuja yamun, rivi 226' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yamun' --226
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B1', 'nainen', lkm_arvo, 'muuttuja yymun, rivi 227' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yymun' --227
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B2', 'nainen', lkm_arvo, 'muuttuja ymu6n, rivi 228' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ymu6n' --228
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_B3', 'nainen', lkm_arvo, 'muuttuja lmu6n, rivi 229' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lmu6n' --229
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'muu_kieli', 'kieli_alleB', 'nainen', lkm_arvo, 'muuttuja almu6n, rivi 230' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='almu6n' --230

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kieli_vapautettu2', 'ei', 'mies', lkm_arvo, 'muuttuja yyvam, rivi 232' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyvam' --232

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kieli_vapautettu2', 'ei', 'nainen', lkm_arvo, 'muuttuja yyvan, rivi 234' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='yyvan' --234


UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'matematiikka_pitka', 'mies', lkm_arvo, 'muuttuja pmatm, rivi 237' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pmatm' --237
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'matematiikka_pitka', 'nainen', lkm_arvo, 'muuttuja pmatn, rivi 238' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pmatn' --238

UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'matematiikka_lyhyt', 'mies', lkm_arvo, 'muuttuja lmatm, rivi 240' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lmatm' --240
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'matematiikka_lyhyt', 'nainen', lkm_arvo, 'muuttuja lmatn, rivi 241' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lmatn' --241





UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja pma1m, rivi 247' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma1m' --247
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja pma1n, rivi 248' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma1n' --248
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_2', 'mies', lkm_arvo, 'muuttuja pma2m, rivi 249' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma2m' --249
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_2', 'nainen', lkm_arvo, 'muuttuja pma2n, rivi 250' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma2n' --250
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_3', 'mies', lkm_arvo, 'muuttuja pma3m, rivi 251' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma3m' --251
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_3', 'nainen', lkm_arvo, 'muuttuja pma3n, rivi 252' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma3n' --252
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja pma45m, rivi 253' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma45m' --253
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja pma45n, rivi 254' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma45n' --254
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_6', 'mies', lkm_arvo, 'muuttuja pma6m, rivi 255' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma6m' --255
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_6', 'nainen', lkm_arvo, 'muuttuja pma6n, rivi 256' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma6n' --256
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja pma7m, rivi 257' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma7m' --257
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_pitka', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja pma7n, rivi 258' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='pma7n' --258
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja lma1m, rivi 259' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma1m' --259
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja lma1n, rivi 260' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma1n' --260
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_2', 'mies', lkm_arvo, 'muuttuja lma2m, rivi 261' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma2m' --261
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_2', 'nainen', lkm_arvo, 'muuttuja lma2n, rivi 262' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma2n' --262
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_3', 'mies', lkm_arvo, 'muuttuja lma3m, rivi 263' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma3m' --263
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_3', 'nainen', lkm_arvo, 'muuttuja lma3n, rivi 264' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma3n' --264
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja lma45m, rivi 265' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma45m' --265
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja lma45n, rivi 266' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma45n' --266
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_6', 'mies', lkm_arvo, 'muuttuja lma6m, rivi 267' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma6m' --267
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_6', 'nainen', lkm_arvo, 'muuttuja lma6n, rivi 268' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma6n' --268
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja lma7m, rivi 269' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma7m' --269
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka_lyhyt', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja lma7n, rivi 270' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='lma7n' --270
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja fy1m, rivi 271' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy1m' --271
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja fy1n, rivi 272' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy1n' --272
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_2', 'mies', lkm_arvo, 'muuttuja fy2m, rivi 273' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy2m' --273
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_2', 'nainen', lkm_arvo, 'muuttuja fy2n, rivi 274' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy2n' --274
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_3', 'mies', lkm_arvo, 'muuttuja fy3m, rivi 275' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy3m' --275
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_3', 'nainen', lkm_arvo, 'muuttuja fy3n, rivi 276' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy3n' --276
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja fy45m, rivi 277' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy45m' --277
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja fy45n, rivi 278' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy45n' --278
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_6', 'mies', lkm_arvo, 'muuttuja fy6m, rivi 279' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy6m' --279
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_6', 'nainen', lkm_arvo, 'muuttuja fy6n, rivi 280' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy6n' --280
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja fy7m, rivi 281' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy7m' --281
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja fy7n, rivi 282' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='fy7n' --282
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja ke1m, rivi 283' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke1m' --283
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja ke1n, rivi 284' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke1n' --284
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_2', 'mies', lkm_arvo, 'muuttuja ke2m, rivi 285' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke2m' --285
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_2', 'nainen', lkm_arvo, 'muuttuja ke2n, rivi 286' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke2n' --286
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_3', 'mies', lkm_arvo, 'muuttuja ke3m, rivi 287' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke3m' --287
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_3', 'nainen', lkm_arvo, 'muuttuja ke3n, rivi 288' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke3n' --288
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja ke45m, rivi 289' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke45m' --289
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja ke45n, rivi 290' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke45n' --290
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_6', 'mies', lkm_arvo, 'muuttuja ke6m, rivi 291' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke6m' --291
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_6', 'nainen', lkm_arvo, 'muuttuja ke6n, rivi 292' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke6n' --292
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja ke7m, rivi 293' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke7m' --293
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja ke7n, rivi 294' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='ke7n' --294
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja bi1m, rivi 295' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi1m' --295
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja bi1n, rivi 296' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi1n' --296
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_2', 'mies', lkm_arvo, 'muuttuja bi2m, rivi 297' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi2m' --297
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_2', 'nainen', lkm_arvo, 'muuttuja bi2n, rivi 298' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi2n' --298
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_3', 'mies', lkm_arvo, 'muuttuja bi3m, rivi 299' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi3m' --299
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_3', 'nainen', lkm_arvo, 'muuttuja bi3n, rivi 300' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi3n' --300
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja bi45m, rivi 301' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi45m' --301
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja bi45n, rivi 302' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi45n' --302
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_6', 'mies', lkm_arvo, 'muuttuja bi6m, rivi 303' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi6m' --303
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_6', 'nainen', lkm_arvo, 'muuttuja bi6n, rivi 304' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi6n' --304
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja bi7m, rivi 305' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi7m' --305
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja bi7n, rivi 306' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='bi7n' --306
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_0_1', 'mies', lkm_arvo, 'muuttuja mt1m, rivi 307' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt1m' --307
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_0_1', 'nainen', lkm_arvo, 'muuttuja mt1n, rivi 308' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt1n' --308
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_2', 'mies', lkm_arvo, 'muuttuja mt2m, rivi 309' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt2m' --309
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_2', 'nainen', lkm_arvo, 'muuttuja mt2n, rivi 310' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt2n' --310
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_3', 'mies', lkm_arvo, 'muuttuja mt3m, rivi 311' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt3m' --311
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_3', 'nainen', lkm_arvo, 'muuttuja mt3n, rivi 312' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt3n' --312
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_4_5', 'mies', lkm_arvo, 'muuttuja mt45m, rivi 313' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt45m' --313
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_4_5', 'nainen', lkm_arvo, 'muuttuja mt45n, rivi 314' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt45n' --314
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_6', 'mies', lkm_arvo, 'muuttuja mt6m, rivi 315' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt6m' --315
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_6', 'nainen', lkm_arvo, 'muuttuja mt6n, rivi 316' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt6n' --316
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_7_99', 'mies', lkm_arvo, 'muuttuja mt7m, rivi 317' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt7m' --317
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'syv_7_99', 'nainen', lkm_arvo, 'muuttuja mt7n, rivi 318' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='mt7n' --318
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'sov_025_2', 'mies', lkm_arvo, 'muuttuja soma2m, rivi 319' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soma2m' --319
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'sov_025_2', 'nainen', lkm_arvo, 'muuttuja soma2n, rivi 320' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soma2n' --320
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'sov_3_99', 'mies', lkm_arvo, 'muuttuja soma3m, rivi 321' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soma3m' --321
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'matematiikka', 'sov_3_99', 'nainen', lkm_arvo, 'muuttuja soma3n, rivi 322' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soma3n' --322
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'sov_025_2', 'mies', lkm_arvo, 'muuttuja sofy2m, rivi 323' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sofy2m' --323
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'sov_025_2', 'nainen', lkm_arvo, 'muuttuja sofy2n, rivi 324' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sofy2n' --324
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'sov_3_99', 'mies', lkm_arvo, 'muuttuja sofy3m, rivi 325' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sofy3m' --325
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'fysiikka', 'sov_3_99', 'nainen', lkm_arvo, 'muuttuja sofy3n, rivi 326' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sofy3n' --326
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'sov_025_2', 'mies', lkm_arvo, 'muuttuja soke2m, rivi 327' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soke2m' --327
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'sov_025_2', 'nainen', lkm_arvo, 'muuttuja soke2n, rivi 328' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soke2n' --328
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'sov_3_99', 'mies', lkm_arvo, 'muuttuja soke3m, rivi 329' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soke3m' --329
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'kemia', 'sov_3_99', 'nainen', lkm_arvo, 'muuttuja soke3n, rivi 330' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='soke3n' --330
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'sov_025_2', 'mies', lkm_arvo, 'muuttuja sobi2m, rivi 331' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sobi2m' --331
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'sov_025_2', 'nainen', lkm_arvo, 'muuttuja sobi2n, rivi 332' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sobi2n' --332
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'sov_3_99', 'mies', lkm_arvo, 'muuttuja sobi3m, rivi 333' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sobi3m' --333
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'biologia', 'sov_3_99', 'nainen', lkm_arvo, 'muuttuja sobi3n, rivi 334' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sobi3n' --334
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'sov_025_2', 'mies', lkm_arvo, 'muuttuja somt2m, rivi 335' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='somt2m' --335
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'sov_025_2', 'nainen', lkm_arvo, 'muuttuja somt2n, rivi 336' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='somt2n' --336
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'sov_3_99', 'mies', lkm_arvo, 'muuttuja somt3m, rivi 337' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='somt3m' --337
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'maantiede', 'sov_3_99', 'nainen', lkm_arvo, 'muuttuja somt3n, rivi 338' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='somt3n' --338
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'tietotekniikka', 'muu_025_2', 'mies', lkm_arvo, 'muuttuja sotek2m, rivi 339' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sotek2m' --339
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'tietotekniikka', 'muu_025_2', 'nainen', lkm_arvo, 'muuttuja sotek2n, rivi 340' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sotek2n' --340
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'tietotekniikka', 'muu_3_99', 'mies', lkm_arvo, 'muuttuja sotek3m, rivi 341' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sotek3m' --341
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'tietotekniikka', 'muu_3_99', 'nainen', lkm_arvo, 'muuttuja sotek3n, rivi 342' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='sotek3n' --342

--Lasketut miesten ainevalintojen lukumäärät
--SQL2
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'suomi2', 'ei', 'mies', lkm_arvo-ISNULL((SELECT lkm_arvo FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] f2 WHERE lkm_id='svnn'AND f2.rivinumero=f1.rivinumero and f2.tilastointivuosi=f1.tilastointivuosi),0) , 'muuttuja sv, rivi 101' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] f1 WHERE lkm_id='sv' --101
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'ruotsi2', 'ei', 'mies', lkm_arvo-ISNULL((SELECT lkm_arvo FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] f2 WHERE lkm_id='rvnn'AND f2.rivinumero=f1.rivinumero and f2.tilastointivuosi=f1.tilastointivuosi),0) , 'muuttuja rv, rivi 102' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] f1 WHERE lkm_id='rv' --102






) olapdata


) f

  LEFT JOIN VipunenTK..d_lukion_ainevalinnat d1
	on  d1.avain_aine    = f.ainevalinnatlukiossa_aine_koodi
	and d1.avain_laajuus = f.ainevalinnatlukiossa_laajuus_koodi

 -- LEFT JOIN VipunenTK..d_lukion_kieltenmaara d2
	--on d2.kieltenmaara_koodi=f.kieltenmäärä_avain

  LEFT JOIN VipunenTK..d_sukupuoli d3
	on d3.sukupuoli_koodi=f.sukupuoli_koodi

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_avain
--	ei historiadimensiota mukaan kuutioon

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi
--	ei historiadimensiota mukaan kuutioon

-- INSERT2
-- Tyhjennetään ja täytetään VipunenTK.dbo.f_ainevalinnat_perusopetuksessa
DELETE FROM VipunenTK.dbo.f_AVL_kieltenmaarat

INSERT INTO VipunenTK.dbo.f_AVL_kieltenmaarat
SELECT tilastovuosi=tilastointivuosi
      ,tilastovuosi_date=[tilv_date]
      
      --,[aine_avain]=f.ainevalinnatlukiossa_aine_koodi
      --,[laajuus_avain]=f.ainevalinnatlukiossa_laajuus_koodi
      --,[ainevalinta_id]=ISNULL(d1.id,-2)
      
      ,[kieltenmäärä_avain]=f.kieltenmäärä_avain
      ,[kieltenmaara_id]=ISNULL(d2.id,-2)
      
      ,[sukupuoli_avain]=f.sukupuoli_koodi
      ,[sukupuoli_id]=ISNULL(d3.id,-2)
      
      ,[oppilaitos_avain]=f.oppilaitos_avain
      ,[oppilaitos_id]=ISNULL(d4.id,-2)
      
      ,[oppilaitoksensijaintikunta_avain]=d4.sijaintikuntakoodi
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id,-2)
      
      --,ainevalintojen_lkm
      ,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      
      ,[aineisto]
      ,[laatu_id]=0 --voidaan laskea myöhemmin todelliseksi

-- INTO VipunenTK.dbo.f_ainevalinnat_lukiossa
FROM

( --f

SELECT 
      tilastointivuosi
      ,tilv_date
      --,ainevalinnatlukiossa_aine_koodi = aine
      --,ainevalinnatlukiossa_laajuus_koodi = laajuus 
      ,sukupuoli_koodi = Case sukupuoli when 'mies' then '1' when 'nainen' then '2' when 'yht' then '-1' else '-2' end
      ,kieltenmäärä_avain = Case when kielten_maara='' then '-1' else kielten_maara end
      ,oppilaitos_avain = oppilaitos
      --,ainevalintojen_lkm
      ,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      ,aineisto = CAST('2.5' as nvarchar(8))
FROM ( --olapdata

SELECT 
    tilastointivuosi
  , tilv_date
  , oppilaitos
  --, aine= Cast('' as nvarchar(50))
  --, laajuus= Cast('' as nvarchar(50))
  , sukupuoli= Cast('' as nvarchar(10))
  , kielten_maara=Cast('' as nvarchar(10))
  --, ainevalintojen_lkm= lkm_arvo --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  , opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  --, aineiden_opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  , kommentti= Cast('' as nvarchar(100)) 
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='<lkm_id>' 


--Aineiden opiskelijoiden lukumäärät
--SQL4
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '1', lkm_arvo , 'muuttuja kieli1, rivi 93' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli1' --93
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '2', lkm_arvo , 'muuttuja kieli2, rivi 94' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli2' --94
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '3', lkm_arvo , 'muuttuja kieli3, rivi 95' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli3' --95
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '4', lkm_arvo , 'muuttuja kieli4, rivi 96' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli4' --96
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '5', lkm_arvo , 'muuttuja kieli5, rivi 97' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli5' --97
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'yht', '6', lkm_arvo , 'muuttuja kieli6, rivi 98' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='kieli6' --98






) olapdata


) f

 -- LEFT JOIN VipunenTK..d_lukion_ainevalinnat d1
	--on  d1.avain_aine    = f.ainevalinnatlukiossa_aine_koodi
	--and d1.avain_laajuus = f.ainevalinnatlukiossa_laajuus_koodi

  LEFT JOIN VipunenTK..d_lukion_kieltenmaara d2
	on d2.kieltenmaara_koodi=f.kieltenmäärä_avain

  LEFT JOIN VipunenTK..d_sukupuoli d3
	on d3.sukupuoli_koodi=f.sukupuoli_koodi

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_avain
--	ei historiadimensiota mukaan kuutioon

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi
--	ei historiadimensiota mukaan kuutioon




--oppimäärän suorittaneet
DELETE FROM VipunenTK.dbo.f_AVL_oppimaaran_suorittaneet

INSERT INTO VipunenTK.dbo.f_AVL_oppimaaran_suorittaneet
SELECT tilastovuosi=tilastointivuosi
      ,tilastovuosi_date=[tilv_date]
      
      --,[aine_avain]=f.ainevalinnatlukiossa_aine_koodi
      --,[laajuus_avain]=f.ainevalinnatlukiossa_laajuus_koodi
      --,[ainevalinta_id]=ISNULL(d1.id,-2)
      
      ,[sukupuoli_avain]=f.sukupuoli_koodi
      ,[sukupuoli_id]=ISNULL(d3.id,-2)
      
      ,[oppilaitos_avain]=f.oppilaitos_avain
      ,[oppilaitos_id]=ISNULL(d4.id,-2)
      
      ,[oppilaitoksensijaintikunta_avain]=d4.sijaintikuntakoodi
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id,-2)
      
      --,ainevalintojen_lkm
      ,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      
      ,[aineisto]
      ,[laatu_id]=0 --voidaan laskea myöhemmin todelliseksi

-- INTO VipunenTK.dbo.f_ainevalinnat_lukiossa
FROM

( --f

SELECT 
      tilastointivuosi
      ,tilv_date
      --,ainevalinnatlukiossa_aine_koodi = aine
      --,ainevalinnatlukiossa_laajuus_koodi = laajuus 
      ,sukupuoli_koodi = Case sukupuoli when 'mies' then '1' when 'nainen' then '2' when 'yht' then '-1' else '-2' end
      ,oppilaitos_avain = oppilaitos
      --,ainevalintojen_lkm
      ,opiskelijoiden_lkm
      --,aineiden_opiskelijoiden_lkm
      ,aineisto = CAST('2.5' as nvarchar(8))
FROM ( --olapdata

SELECT 
    tilastointivuosi
  , tilv_date
  , oppilaitos
  --, aine= Cast('' as nvarchar(50))
  --, laajuus= Cast('' as nvarchar(50))
  , sukupuoli= Cast('' as nvarchar(10))
  --, ainevalintojen_lkm= lkm_arvo --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  , opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  --, aineiden_opiskelijoiden_lkm= lkm_arvo  --vain yhteen mittariin voi tulla arvo, muut ovat nulleja
  , kommentti= Cast('' as nvarchar(100)) 
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='<lkm_id>' 


--Aineiden opiskelijoiden lukumäärät
--SQL4
UNION ALL SELECT tilastointivuosi, tilv_date, oppilaitos, 'nainen',  lkm_arvo , 'muuttuja oppimaara' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='varn'

UNION ALL (SELECT distinct tilastointivuosi,tilv_date,oppilaitos,sp,sum(lkm_arvo)-sum(lkm_arvo2) as lkm_arvo,kommentti FROM (

				SELECT tilastointivuosi, tilv_date, oppilaitos, 'mies' as sp, lkm_arvo , NULL AS lkm_arvo2, 'muuttuja oppimaara' as kommentti FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='var' 
				UNION ALL
				SELECT tilastointivuosi, tilv_date, oppilaitos, 'mies' as sp, NULL , lkm_arvo as lkm_arvo2, 'muuttuja oppimaara' as kommentti FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat] WHERE lkm_id='varn' 
		) P group by tilastointivuosi,tilv_date,oppilaitos,sp,kommentti)


) olapdata


) f

 -- LEFT JOIN VipunenTK..d_lukion_ainevalinnat d1
	--on  d1.avain_aine    = f.ainevalinnatlukiossa_aine_koodi
	--and d1.avain_laajuus = f.ainevalinnatlukiossa_laajuus_koodi

  LEFT JOIN VipunenTK..d_sukupuoli d3
	on d3.sukupuoli_koodi=f.sukupuoli_koodi

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_avain
--	ei historiadimensiota mukaan kuutioon

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi
--	ei historiadimensiota mukaan kuutioon


GO
USE [ANTERO]