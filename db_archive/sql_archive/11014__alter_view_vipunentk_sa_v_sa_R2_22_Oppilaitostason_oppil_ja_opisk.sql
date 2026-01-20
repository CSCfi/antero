USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 11.8.2025 14.38.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_sa_R2_22_Oppilaitostason_oppil_ja_opisk] AS

/*
- sopv21 alkaen lähdeaineistona 2.22b
- varhaiskasvatuksen yhteydessä annettavan esiopetuksen raportointi samasta aineistosta 2.18-ketjussa
- aikuisten alkuvaihetta ei eroteltuna, joten ei voida tiedonkeruun tapaan sijoittaa opiskelijoita 6./9. lk (ei poimita suorittaneitakaan; huom. raporteilla oltyp-oletussuodatus)
- sopv21 aineistossa n. 500 suorittaneelta puuttuu tunn -> putoavat raportoinnista maakuntarajauksessa
- lisäopetuksen suorittaneet mukana sopv21, muttei sopv22 (joka tapauksessa poistuva tieto)
- sopv23 mukana perusopetukseen valmistava, ei raportoitu
*/

/*
Drop table VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk

truncate table VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk
insert into VipunenTK_DW.[dbo].f_R2_22_Oppilaitostason_oppil_ja_opisk select * from v_sa_R2_22_Oppilaitostason_oppil_ja_opisk
*/

SELECT [tilv] = CAST(tilv as nvarchar(4))
	  ,[tilv_date] = Cast(tilv+'0101' as date)
      ,[jarj] = CAST(jarj as nvarchar(10))
      ,[tiedtype] = CAST(tiedtype as nchar(1))
      ,[tunn] = CAST(tunn as nvarchar(5))
      ,[edesi] = CAST([edesi] as nchar(1))
      ,[edala] = CAST([edala] as nchar(1))
      ,[edyla] = CAST([edyla] as nchar(1))
      ,[edlisa] = CAST([edlisa] as nchar(1))
      ,[edainep] = CAST([edainep] as nchar(1))
      ,[syesi] = CAST([syesi] as nchar(1))
      ,[syala] = CAST([syala] as nchar(1))
      ,[syyla] = CAST([syyla] as nchar(1))
      ,[sylisa] = CAST([sylisa] as nchar(1))
      ,[symamu] = CAST([symamu] as nchar(1))
      ,[sylukio] = CAST([sylukio] as nchar(1))
      ,[syamm] = CAST([syamm] as nchar(1))
      ,[symuu] = CAST([symuu] as nchar(1))

      ,[keven]=  Cast([keven] as int)
      ,[kev1]=  Cast([kev1] as int)
      ,[kev1n]=  Cast([kev1n] as int)
      ,[kev2]=  Cast([kev2] as int)
      ,[kev2n]=  Cast([kev2n] as int)
      ,[kev3]=  Cast([kev3] as int)
      ,[kev3n]=  Cast([kev3n] as int)
      ,[kev4]=  Cast([kev4] as int)
      ,[kev4n]=  Cast([kev4n] as int)
      ,[kev5]=  Cast([kev5] as int)
      ,[kev5n]=  Cast([kev5n] as int)
      ,[kev6]=  Cast([kev6] as int)
      ,[kev6n]=  Cast([kev6n] as int)
      ,[kev7]=  Cast([kev7] as int)
      ,[kev7n]=  Cast([kev7n] as int)
      ,[kev8]=  Cast([kev8] as int)
      ,[kev8n]=  Cast([kev8n] as int)
      ,[kev9]=  Cast([kev9] as int)
      ,[kev9n]=  Cast([kev9n] as int)
      ,[kev10]=  Cast([kev10] as int)
      ,[kev10n]=  Cast([kev10n] as int)
      ,[kev]=  Cast([kev] as int)
      ,[kevn]=  Cast([kevn] as int)
      ,[luok1]=  Cast([luok1] as int)
      ,[luok1n]=  Cast([luok1n] as int)
      ,[luok2]=  Cast([luok2] as int)
      ,[luok2n]=  Cast([luok2n] as int)
      ,[luok3]=  Cast([luok3] as int)
      ,[luok3n]=  Cast([luok3n] as int)
      ,[luok4]=  Cast([luok4] as int)
      ,[luok4n]=  Cast([luok4n] as int)
      ,[luok5]=  Cast([luok5] as int)
      ,[luok5n]=  Cast([luok5n] as int)
      ,[luok6]=  Cast([luok6] as int)
      ,[luok6n]=  Cast([luok6n] as int)
      ,[luok7]=  Cast([luok7] as int)
      ,[luok7n]=  Cast([luok7n] as int)
      ,[luok8]=  Cast([luok8] as int)
      ,[luok8n]=  Cast([luok8n] as int)
      ,[luok9]=  Cast([luok9] as int)
      ,[luok9n]=  Cast([luok9n] as int)
      ,[luok]=  Cast([luok] as int)
      ,[luokn]=  Cast([luokn] as int)
      ,[kelaim]=  Cast([kelaim] as int)
      ,[kelaimn]=  Cast([kelaimn] as int)
      ,[tod]=  Cast([tod] as int)
      ,[todn]=  Cast([todn] as int)
      ,[tutkt]=  Cast([tutkt] as int)
      ,[tutktn]=  Cast([tutktn] as int)
      ,[suor10]=  Cast([suor10] as int)
      ,[suor10n]=  Cast([suor10n] as int)
      ,[oeriy]=  Cast([oeriy] as int)
      ,[oeriyn]=  Cast([oeriyn] as int)
      ,[ilmtod]=  Cast([ilmtod] as int)
      ,[ilmtodn]=  Cast([ilmtodn] as int)

      ,[aku] = CAST(aku as nchar(1))

      ,[mamukurs]=  Cast([mamukurs] as int)
      ,[oppkurs]=  Cast([oppkurs] as int)
      ,[muukurs]=  Cast([muukurs] as int)
      ,[akukurs]=  Cast([akukurs] as int)
      ,[kmamu]=  Cast([kmamu] as int)
      ,[kmamun]=  Cast([kmamun] as int)
      ,[syulkom]=  Cast([syulkom] as int)
      ,[syulkomn]=  Cast([syulkomn] as int)
      ,[sykoti]=  Cast([sykoti] as int)
      ,[sykotin]=  Cast([sykotin] as int)
      ,[ika4e]=  Cast([ika4e] as int)
      ,[ika4en]=  Cast([ika4en] as int)
      ,[ika5e]=  Cast([ika5e] as int)
      ,[ika5en]=  Cast([ika5en] as int)
      ,[pid5v]=  Cast([pid5v] as int)
      ,[ika6e]=  Cast([ika6e] as int)
      ,[ika6en]=  Cast([ika6en] as int)
      ,[ika7e]=  Cast([ika7e] as int)
      ,[ika7en]=  Cast([ika7en] as int)
      ,[ikae]=  Cast([ikae] as int)
      ,[ikaen]=  Cast([ikaen] as int)
      ,[ove]=  Cast([ove] as int)
      ,[ov1]=  Cast([ov1] as int)
      ,[ov2]=  Cast([ov2] as int)
      ,[ov3]=  Cast([ov3] as int)
      ,[ov4]=  Cast([ov4] as int)
      ,[ov5]=  Cast([ov5] as int)
      ,[ov6]=  Cast([ov6] as int)
      ,[ov7]=  Cast([ov7] as int)
      ,[ov8]=  Cast([ov8] as int)
      ,[ov9]=  Cast([ov9] as int)
      ,[ov10]=  Cast([ov10] as int)
      ,[ovy]=  Cast([ovy] as int)
      ,[tehoe]=  Cast([tehoe] as int)
      ,[teho1]=  Cast([teho1] as int)
      ,[teho2]=  Cast([teho2] as int)
      ,[teho3]=  Cast([teho3] as int)
      ,[teho4]=  Cast([teho4] as int)
      ,[teho5]=  Cast([teho5] as int)
      ,[teho6]=  Cast([teho6] as int)
      ,[teho7]=  Cast([teho7] as int)
      ,[teho8]=  Cast([teho8] as int)
      ,[teho9]=  Cast([teho9] as int)
      ,[teho10]=  Cast([teho10] as int)
      ,[tehoy]=  Cast([tehoy] as int)
      ,[eipide]=  Cast([eipide] as int)
      ,[eipid1]=  Cast([eipid1] as int)
      ,[eipid2]=  Cast([eipid2] as int)
      ,[eipid3]=  Cast([eipid3] as int)
      ,[eipid4]=  Cast([eipid4] as int)
      ,[eipid5]=  Cast([eipid5] as int)
      ,[eipid6]=  Cast([eipid6] as int)
      ,[eipid7]=  Cast([eipid7] as int)
      ,[eipid8]=  Cast([eipid8] as int)
      ,[eipid9]=  Cast([eipid9] as int)
      ,[eipid10]=  Cast([eipid10] as int)
      ,[eipidy]=  Cast([eipidy] as int)
      ,[ertuve]=  Cast([ertuve] as int)
      ,[ertuv1]=  Cast([ertuv1] as int)
      ,[ertuv2]=  Cast([ertuv2] as int)
      ,[ertuv3]=  Cast([ertuv3] as int)
      ,[ertuv4]=  Cast([ertuv4] as int)
      ,[ertuv5]=  Cast([ertuv5] as int)
      ,[ertuv6]=  Cast([ertuv6] as int)
      ,[ertuv7]=  Cast([ertuv7] as int)
      ,[ertuv8]=  Cast([ertuv8] as int)
      ,[ertuv9]=  Cast([ertuv9] as int)
      ,[ertuv10]=  Cast([ertuv10] as int)
      ,[ertuvy]=  Cast([ertuvy] as int)
      ,[ertume]=  Cast([ertume] as int)
      ,[ertum1]=  Cast([ertum1] as int)
      ,[ertum2]=  Cast([ertum2] as int)
      ,[ertum3]=  Cast([ertum3] as int)
      ,[ertum4]=  Cast([ertum4] as int)
      ,[ertum5]=  Cast([ertum5] as int)
      ,[ertum6]=  Cast([ertum6] as int)
      ,[ertum7]=  Cast([ertum7] as int)
      ,[ertum8]=  Cast([ertum8] as int)
      ,[ertum9]=  Cast([ertum9] as int)
      ,[ertum10]=  Cast([ertum10] as int)
      ,[ertumy]=  Cast([ertumy] as int)
      ,[tavove]=  Cast([tavove] as int)
      ,[tavov1]=  Cast([tavov1] as int)
      ,[tavov2]=  Cast([tavov2] as int)
      ,[tavov3]=  Cast([tavov3] as int)
      ,[tavov4]=  Cast([tavov4] as int)
      ,[tavov5]=  Cast([tavov5] as int)
      ,[tavov6]=  Cast([tavov6] as int)
      ,[tavov7]=  Cast([tavov7] as int)
      ,[tavov8]=  Cast([tavov8] as int)
      ,[tavov9]=  Cast([tavov9] as int)
      ,[tavov10]=  Cast([tavov10] as int)
      ,[tavovy]=  Cast([tavovy] as int)
      ,[oven]=  Cast([oven] as int)
      ,[ov1n]=  Cast([ov1n] as int)
      ,[ov2n]=  Cast([ov2n] as int)
      ,[ov3n]=  Cast([ov3n] as int)
      ,[ov4n]=  Cast([ov4n] as int)
      ,[ov5n]=  Cast([ov5n] as int)
      ,[ov6n]=  Cast([ov6n] as int)
      ,[ov7n]=  Cast([ov7n] as int)
      ,[ov8n]=  Cast([ov8n] as int)
      ,[ov9n]=  Cast([ov9n] as int)
      ,[ov10n]=  Cast([ov10n] as int)
      ,[ovyn]=  Cast([ovyn] as int)
      ,[tehoen]=  Cast([tehoen] as int)
      ,[teho1n]=  Cast([teho1n] as int)
      ,[teho2n]=  Cast([teho2n] as int)
      ,[teho3n]=  Cast([teho3n] as int)
      ,[teho4n]=  Cast([teho4n] as int)
      ,[teho5n]=  Cast([teho5n] as int)
      ,[teho6n]=  Cast([teho6n] as int)
      ,[teho7n]=  Cast([teho7n] as int)
      ,[teho8n]=  Cast([teho8n] as int)
      ,[teho9n]=  Cast([teho9n] as int)
      ,[teho10n]=  Cast([teho10n] as int)
      ,[tehoyn]=  Cast([tehoyn] as int)
      ,[eipiden]=  Cast([eipiden] as int)
      ,[eipid1n]=  Cast([eipid1n] as int)
      ,[eipid2n]=  Cast([eipid2n] as int)
      ,[eipid3n]=  Cast([eipid3n] as int)
      ,[eipid4n]=  Cast([eipid4n] as int)
      ,[eipid5n]=  Cast([eipid5n] as int)
      ,[eipid6n]=  Cast([eipid6n] as int)
      ,[eipid7n]=  Cast([eipid7n] as int)
      ,[eipid8n]=  Cast([eipid8n] as int)
      ,[eipid9n]=  Cast([eipid9n] as int)
      ,[eipid10n]=  Cast([eipid10n] as int)
      ,[eipidyn]=  Cast([eipidyn] as int)
      ,[ertuven]=  Cast([ertuven] as int)
      ,[ertuv1n]=  Cast([ertuv1n] as int)
      ,[ertuv2n]=  Cast([ertuv2n] as int)
      ,[ertuv3n]=  Cast([ertuv3n] as int)
      ,[ertuv4n]=  Cast([ertuv4n] as int)
      ,[ertuv5n]=  Cast([ertuv5n] as int)
      ,[ertuv6n]=  Cast([ertuv6n] as int)
      ,[ertuv7n]=  Cast([ertuv7n] as int)
      ,[ertuv8n]=  Cast([ertuv8n] as int)
      ,[ertuv9n]=  Cast([ertuv9n] as int)
      ,[ertuv10n]=  Cast([ertuv10n] as int)
      ,[ertuvyn]=  Cast([ertuvyn] as int)
      ,[ertumen]=  Cast([ertumen] as int)
      ,[ertum1n]=  Cast([ertum1n] as int)
      ,[ertum2n]=  Cast([ertum2n] as int)
      ,[ertum3n]=  Cast([ertum3n] as int)
      ,[ertum4n]=  Cast([ertum4n] as int)
      ,[ertum5n]=  Cast([ertum5n] as int)
      ,[ertum6n]=  Cast([ertum6n] as int)
      ,[ertum7n]=  Cast([ertum7n] as int)
      ,[ertum8n]=  Cast([ertum8n] as int)
      ,[ertum9n]=  Cast([ertum9n] as int)
      ,[ertum10n]=  Cast([ertum10n] as int)
      ,[ertumyn]=  Cast([ertumyn] as int)
      ,[tavoven]=  Cast([tavoven] as int)
      ,[tavov1n]=  Cast([tavov1n] as int)
      ,[tavov2n]=  Cast([tavov2n] as int)
      ,[tavov3n]=  Cast([tavov3n] as int)
      ,[tavov4n]=  Cast([tavov4n] as int)
      ,[tavov5n]=  Cast([tavov5n] as int)
      ,[tavov6n]=  Cast([tavov6n] as int)
      ,[tavov7n]=  Cast([tavov7n] as int)
      ,[tavov8n]=  Cast([tavov8n] as int)
      ,[tavov9n]=  Cast([tavov9n] as int)
      ,[tavov10n]=  Cast([tavov10n] as int)
      ,[tavovyn]=  Cast([tavovyn] as int)
      ,[eipidec]=  Cast([eipidec] as int)
      ,[eipidpc]=  Cast([eipidpc] as int)
      ,[eipidlc]=  Cast([eipidlc] as int)
      ,[eipidyc]=  Cast([eipidyc] as int)
      ,[ertuvec]=  Cast([ertuvec] as int)
      ,[ertuvpc]=  Cast([ertuvpc] as int)
      ,[ertuvlc]=  Cast([ertuvlc] as int)
      ,[ertuvyc]=  Cast([ertuvyc] as int)
      ,[ertumec]=  Cast([ertumec] as int)
      ,[ertumpc]=  Cast([ertumpc] as int)
      ,[ertumlc]=  Cast([ertumlc] as int)
      ,[ertumyc]=  Cast([ertumyc] as int)
      ,[muuec]=  Cast([muuec] as int)
      ,[muupc]=  Cast([muupc] as int)
      ,[muulc]=  Cast([muulc] as int)
      ,[muuyc]=  Cast([muuyc] as int)
      ,[ovec]=  Cast([ovec] as int)
      ,[ovpc]=  Cast([ovpc] as int)
      ,[ovlc]=  Cast([ovlc] as int)
      ,[ovyc]=  Cast([ovyc] as int)
      ,[sisae]=  Cast([sisae] as int)
      ,[sisap]=  Cast([sisap] as int)
      ,[sisal]=  Cast([sisal] as int)
      ,[sisam]=  Cast([sisam] as int)
      ,[sisay]=  Cast([sisay] as int)
      ,[maeipide]=  Cast([maeipide] as int)
      ,[maeipidp]=  Cast([maeipidp] as int)
      ,[maeipidl]=  Cast([maeipidl] as int)
      ,[maeipidy]=  Cast([maeipidy] as int)
      ,[maertuve]=  Cast([maertuve] as int)
      ,[maertuvp]=  Cast([maertuvp] as int)
      ,[maertuvl]=  Cast([maertuvl] as int)
      ,[maertuvy]=  Cast([maertuvy] as int)
      ,[maertume]=  Cast([maertume] as int)
      ,[maertump]=  Cast([maertump] as int)
      ,[maertuml]=  Cast([maertuml] as int)
      ,[maertumy]=  Cast([maertumy] as int)
      ,[mamuue]=  Cast([mamuue] as int)
      ,[mamuup]=  Cast([mamuup] as int)
      ,[mamuul]=  Cast([mamuul] as int)
      ,[mamuuy]=  Cast([mamuuy] as int)
      ,[maove]=  Cast([maove] as int)
      ,[maovp]=  Cast([maovp] as int)
      ,[maovl]=  Cast([maovl] as int)
      ,[maovy]=  Cast([maovy] as int)
      ,[kueipide]=  Cast([kueipide] as int)
      ,[kueipidp]=  Cast([kueipidp] as int)
      ,[kueipidl]=  Cast([kueipidl] as int)
      ,[kueipidy]=  Cast([kueipidy] as int)
      ,[kuertuve]=  Cast([kuertuve] as int)
      ,[kuertuvp]=  Cast([kuertuvp] as int)
      ,[kuertuvl]=  Cast([kuertuvl] as int)
      ,[kuertuvy]=  Cast([kuertuvy] as int)
      ,[kuertume]=  Cast([kuertume] as int)
      ,[kuertump]=  Cast([kuertump] as int)
      ,[kuertuml]=  Cast([kuertuml] as int)
      ,[kuertumy]=  Cast([kuertumy] as int)
      ,[kumuue]=  Cast([kumuue] as int)
      ,[kumuup]=  Cast([kumuup] as int)
      ,[kumuul]=  Cast([kumuul] as int)
      ,[kumuuy]=  Cast([kumuuy] as int)
      ,[kuove]=  Cast([kuove] as int)
      ,[kuovp]=  Cast([kuovp] as int)
      ,[kuovl]=  Cast([kuovl] as int)
      ,[kuovy]=  Cast([kuovy] as int)
      ,[vieipide]=  Cast([vieipide] as int)
      ,[vieipidp]=  Cast([vieipidp] as int)
      ,[vieipidl]=  Cast([vieipidl] as int)
      ,[vieipidy]=  Cast([vieipidy] as int)
      ,[viertuve]=  Cast([viertuve] as int)
      ,[viertuvp]=  Cast([viertuvp] as int)
      ,[viertuvl]=  Cast([viertuvl] as int)
      ,[viertuvy]=  Cast([viertuvy] as int)
      ,[viertume]=  Cast([viertume] as int)
      ,[viertump]=  Cast([viertump] as int)
      ,[viertuml]=  Cast([viertuml] as int)
      ,[viertumy]=  Cast([viertumy] as int)
      ,[vimuue]=  Cast([vimuue] as int)
      ,[vimuup]=  Cast([vimuup] as int)
      ,[vimuul]=  Cast([vimuul] as int)
      ,[vimuuy]=  Cast([vimuuy] as int)
      ,[viove]=  Cast([viove] as int)
      ,[viovp]=  Cast([viovp] as int)
      ,[viovl]=  Cast([viovl] as int)
      ,[viovy]=  Cast([viovy] as int)
      ,[ika61]=  Cast([ika61] as int)
      ,[ika61n]=  Cast([ika61n] as int)
      ,[ika71]=  Cast([ika71] as int)
      ,[ika71n]=  Cast([ika71n] as int)
      ,[ika81]=  Cast([ika81] as int)
      ,[ika81n]=  Cast([ika81n] as int)
      ,[ika91]=  Cast([ika91] as int)
      ,[ika91n]=  Cast([ika91n] as int)
      ,[ika1]=  Cast([ika1] as int)
      ,[ika1n]=  Cast([ika1n] as int)
      ,[lykk]=  Cast([lykk] as int)
      ,[lykkn]=  Cast([lykkn] as int)
      ,[jopo]=  Cast([jopo] as int)
      ,[jopon]=  Cast([jopon] as int)
      ,[kan17v]=  Cast([kan17v] as int)
      ,[muu17v]=  Cast([muu17v] as int)
      ,[op17v]=  Cast([op17v] as int)
      ,[lukoko]=  Cast([lukoko] as int)
      ,[lukokon]=  Cast([lukokon] as int)
      ,[luib]=  Cast([luib] as int)
      ,[luibn]=  Cast([luibn] as int)
      ,[reife]=  Cast([reife] as int)
      ,[reifen]=  Cast([reifen] as int)
      ,[gymn]=  Cast([gymn] as int)
      ,[gymnn]=  Cast([gymnn] as int)
      ,[lueb]=  Cast([lueb] as int)
      ,[luebn]=  Cast([luebn] as int)
      ,[lukio]=  Cast([lukio] as int)
      ,[lukion]=  Cast([lukion] as int)
      ,[opsamm]=  Cast([opsamm] as int)
      ,[opsammn]=  Cast([opsammn] as int)
      ,[muuamm]=  Cast([muuamm] as int)
      ,[muuammn]=  Cast([muuammn] as int)
      ,[amm]=  Cast([amm] as int)
      ,[ammn]=  Cast([ammn] as int)
      ,[peain]=  Cast([peain] as int)
      ,[peainn]=  Cast([peainn] as int)
      ,[luain]=  Cast([luain] as int)
      ,[luainn]=  Cast([luainn] as int)
      ,[vapsiv]=  Cast([vapsiv] as int)
      ,[vapsivn]=  Cast([vapsivn] as int)
      ,[taiop]=  Cast([taiop] as int)
      ,[taiopn]=  Cast([taiopn] as int)
      ,[muukoul]=  Cast([muukoul] as int)
      ,[muukouln]=  Cast([muukouln] as int)
      ,[muuop]=  Cast([muuop] as int)
      ,[muuopn]=  Cast([muuopn] as int)
      ,[tehoec]=  Cast([tehoec] as int)
      ,[teho16c]=  Cast([teho16c] as int)
      ,[teho79c]=  Cast([teho79c] as int)
      ,[teholc]=  Cast([teholc] as int)
      ,[tehoyc]=  Cast([tehoyc] as int)
      ,[ertuec]=  Cast([ertuec] as int)
      ,[ertu16c]=  Cast([ertu16c] as int)
      ,[ertu79c]=  Cast([ertu79c] as int)
      ,[ertulc]=  Cast([ertulc] as int)
      ,[ertuyc]=  Cast([ertuyc] as int)
      ,[eritec]=  Cast([eritec] as int)
      ,[erit16c]=  Cast([erit16c] as int)
      ,[erit79c]=  Cast([erit79c] as int)
      ,[eritlc]=  Cast([eritlc] as int)
      ,[erityc]=  Cast([erityc] as int)
      ,[inte4]=  Cast([inte4] as int)
      ,[int164]=  Cast([int164] as int)
      ,[int794]=  Cast([int794] as int)
      ,[intl4]=  Cast([intl4] as int)
      ,[inty4]=  Cast([inty4] as int)
      ,[inte3]=  Cast([inte3] as int)
      ,[int163]=  Cast([int163] as int)
      ,[int793]=  Cast([int793] as int)
      ,[intl3]=  Cast([intl3] as int)
      ,[inty3]=  Cast([inty3] as int)
      ,[inte2]=  Cast([inte2] as int)
      ,[int162]=  Cast([int162] as int)
      ,[int792]=  Cast([int792] as int)
      ,[intl2]=  Cast([intl2] as int)
      ,[inty2]=  Cast([inty2] as int)
      ,[inte1]=  Cast([inte1] as int)
      ,[int161]=  Cast([int161] as int)
      ,[int791]=  Cast([int791] as int)
      ,[intl1]=  Cast([intl1] as int)
      ,[inty1]=  Cast([inty1] as int)
      ,[inte0]=  Cast([inte0] as int)
      ,[int160]=  Cast([int160] as int)
      ,[int790]=  Cast([int790] as int)
      ,[intl0]=  Cast([intl0] as int)
      ,[inty0]=  Cast([inty0] as int)
      ,[intey]=  Cast([intey] as int)
      ,[int16y]=  Cast([int16y] as int)
      ,[int79y]=  Cast([int79y] as int)
      ,[intly]=  Cast([intly] as int)
      ,[intyy]=  Cast([intyy] as int)
      ,[yks160]=  Cast([yks160] as int)
      ,[yks790]=  Cast([yks790] as int)
      ,[yksl0]=  Cast([yksl0] as int)
      ,[yksy0]=  Cast([yksy0] as int)
      ,[yks161]=  Cast([yks161] as int)
      ,[yks791]=  Cast([yks791] as int)
      ,[yksl1]=  Cast([yksl1] as int)
      ,[yksy1]=  Cast([yksy1] as int)
      ,[yks162]=  Cast([yks162] as int)
      ,[yks792]=  Cast([yks792] as int)
      ,[yksl2]=  Cast([yksl2] as int)
      ,[yksy2]=  Cast([yksy2] as int)
      ,[yks164]=  Cast([yks164] as int)
      ,[yks794]=  Cast([yks794] as int)
      ,[yksl4]=  Cast([yksl4] as int)
      ,[yksy4]=  Cast([yksy4] as int)
      ,[yks16t]=  Cast([yks16t] as int)
      ,[yks79t]=  Cast([yks79t] as int)
      ,[ykslt]=  Cast([ykslt] as int)
      ,[yksyt]=  Cast([yksyt] as int)
      ,[yks16y]=  Cast([yks16y] as int)
      ,[yks79y]=  Cast([yks79y] as int)
      ,[yksly]=  Cast([yksly] as int)
      ,[yksyy]=  Cast([yksyy] as int)
      ,[tehoosa]=  Cast([tehoosa] as int)
      ,[ertuosa]=  Cast([ertuosa] as int)
      ,[eritosa]=  Cast([eritosa] as int)
      ,[tehotuki]=  Cast([tehotuki] as int)
      ,[ertutuki]=  Cast([ertutuki] as int)
      ,[erittuki]=  Cast([erittuki] as int)
      ,[tehoavu]=  Cast([tehoavu] as int)
      ,[ertuavu]=  Cast([ertuavu] as int)
      ,[eritavu]=  Cast([eritavu] as int)
      ,[tehomuu]=  Cast([tehomuu] as int)
      ,[ertumuu]=  Cast([ertumuu] as int)
      ,[eritmuu]=  Cast([eritmuu] as int)
      ,[alc]=  Cast([alc] as int)
      ,[ylc]=  Cast([ylc] as int)
      ,[luc]=  Cast([luc] as int)
      ,[amc]=  Cast([amc] as int)
      ,[alkieli0]=  Cast([alkieli0] as int)
      ,[alkieli1]=  Cast([alkieli1] as int)
      ,[alkieli2]=  Cast([alkieli2] as int)
      ,[alkieli3]=  Cast([alkieli3] as int)
      ,[alkieli4]=  Cast([alkieli4] as int)
      ,[alkieliy]=  Cast([alkieliy] as int)
      ,[ylkieli0]=  Cast([ylkieli0] as int)
      ,[ylkieli1]=  Cast([ylkieli1] as int)
      ,[ylkieli2]=  Cast([ylkieli2] as int)
      ,[ylkieli3]=  Cast([ylkieli3] as int)
      ,[ylkieli4]=  Cast([ylkieli4] as int)
      ,[ylkieli5]=  Cast([ylkieli5] as int)
      ,[ylkieliy]=  Cast([ylkieliy] as int)
      ,[lukieli0]=  Cast([lukieli0] as int)
      ,[lukieli1]=  Cast([lukieli1] as int)
      ,[lukieli2]=  Cast([lukieli2] as int)
      ,[lukieli3]=  Cast([lukieli3] as int)
      ,[lukieli4]=  Cast([lukieli4] as int)
      ,[lukieli5]=  Cast([lukieli5] as int)
      ,[lukieli6]=  Cast([lukieli6] as int)
      ,[lukieliy]=  Cast([lukieliy] as int)
      ,[amkieli0]=  Cast([amkieli0] as int)
      ,[amkieli1]=  Cast([amkieli1] as int)
      ,[amkieli2]=  Cast([amkieli2] as int)
      ,[amkieli3]=  Cast([amkieli3] as int)
      ,[amkieli4]=  Cast([amkieli4] as int)
      ,[amkieli5]=  Cast([amkieli5] as int)
      ,[amkieli6]=  Cast([amkieli6] as int)
      ,[amkieliy]=  Cast([amkieliy] as int)
      ,[aleny]=  Cast([aleny] as int)
      ,[alruy]=  Cast([alruy] as int)
      ,[alsuy]=  Cast([alsuy] as int)
      ,[alray]=  Cast([alray] as int)
      ,[alsay]=  Cast([alsay] as int)
      ,[alvey]=  Cast([alvey] as int)
      ,[alesy]=  Cast([alesy] as int)
      ,[ality]=  Cast([ality] as int)
      ,[alsaay]=  Cast([alsaay] as int)
      ,[almuy]=  Cast([almuy] as int)
      ,[yleny]=  Cast([yleny] as int)
      ,[ylruy]=  Cast([ylruy] as int)
      ,[ylsuy]=  Cast([ylsuy] as int)
      ,[ylray]=  Cast([ylray] as int)
      ,[ylsay]=  Cast([ylsay] as int)
      ,[ylvey]=  Cast([ylvey] as int)
      ,[ylesy]=  Cast([ylesy] as int)
      ,[ylity]=  Cast([ylity] as int)
      ,[ylsaay]=  Cast([ylsaay] as int)
      ,[yllaty]=  Cast([yllaty] as int)
      ,[ylmuy]=  Cast([ylmuy] as int)
      ,[lueny]=  Cast([lueny] as int)
      ,[luruy]=  Cast([luruy] as int)
      ,[lusuy]=  Cast([lusuy] as int)
      ,[luray]=  Cast([luray] as int)
      ,[lusay]=  Cast([lusay] as int)
      ,[luvey]=  Cast([luvey] as int)
      ,[luesy]=  Cast([luesy] as int)
      ,[luity]=  Cast([luity] as int)
      ,[lusaay]=  Cast([lusaay] as int)
      ,[lulaty]=  Cast([lulaty] as int)
      ,[lumuy]=  Cast([lumuy] as int)
      ,[ameny]=  Cast([ameny] as int)
      ,[amruy]=  Cast([amruy] as int)
      ,[amsuy]=  Cast([amsuy] as int)
      ,[amray]=  Cast([amray] as int)
      ,[amsay]=  Cast([amsay] as int)
      ,[amvey]=  Cast([amvey] as int)
      ,[amesy]=  Cast([amesy] as int)
      ,[amity]=  Cast([amity] as int)
      ,[amsaay]=  Cast([amsaay] as int)
      ,[amlaty]=  Cast([amlaty] as int)
      ,[ammuy]=  Cast([ammuy] as int)
      ,[ov1c]=  Cast([ov1c] as int)
      ,[ov2c]=  Cast([ov2c] as int)
      ,[ov3c]=  Cast([ov3c] as int)
      ,[ov4c]=  Cast([ov4c] as int)
      ,[ov5c]=  Cast([ov5c] as int)
      ,[ov6c]=  Cast([ov6c] as int)
      ,[ov16yc]=  Cast([ov16yc] as int)
      ,[ov16nc]=  Cast([ov16nc] as int)
      ,[eng1]=  Cast([eng1] as int)
      ,[ru1]=  Cast([ru1] as int)
      ,[su1]=  Cast([su1] as int)
      ,[ra1]=  Cast([ra1] as int)
      ,[sa1]=  Cast([sa1] as int)
      ,[ve1]=  Cast([ve1] as int)
      ,[es1]=  Cast([es1] as int)
      ,[it1]=  Cast([it1] as int)
      ,[saa1]=  Cast([saa1] as int)
      ,[mu1]=  Cast([mu1] as int)
      ,[eopis1]=  Cast([eopis1] as int)
      ,[eng2]=  Cast([eng2] as int)
      ,[ru2]=  Cast([ru2] as int)
      ,[su2]=  Cast([su2] as int)
      ,[ra2]=  Cast([ra2] as int)
      ,[sa2]=  Cast([sa2] as int)
      ,[ve2]=  Cast([ve2] as int)
      ,[es2]=  Cast([es2] as int)
      ,[it2]=  Cast([it2] as int)
      ,[saa2]=  Cast([saa2] as int)
      ,[mu2]=  Cast([mu2] as int)
      ,[eopis2]=  Cast([eopis2] as int)
      ,[eng3]=  Cast([eng3] as int)
      ,[ru3]=  Cast([ru3] as int)
      ,[su3]=  Cast([su3] as int)
      ,[ra3]=  Cast([ra3] as int)
      ,[sa3]=  Cast([sa3] as int)
      ,[ve3]=  Cast([ve3] as int)
      ,[es3]=  Cast([es3] as int)
      ,[it3]=  Cast([it3] as int)
      ,[saa3]=  Cast([saa3] as int)
      ,[mu3]=  Cast([mu3] as int)
      ,[eopis3]=  Cast([eopis3] as int)
      ,[eng4]=  Cast([eng4] as int)
      ,[ru4]=  Cast([ru4] as int)
      ,[su4]=  Cast([su4] as int)
      ,[ra4]=  Cast([ra4] as int)
      ,[sa4]=  Cast([sa4] as int)
      ,[ve4]=  Cast([ve4] as int)
      ,[es4]=  Cast([es4] as int)
      ,[it4]=  Cast([it4] as int)
      ,[saa4]=  Cast([saa4] as int)
      ,[mu4]=  Cast([mu4] as int)
      ,[eopis4]=  Cast([eopis4] as int)
      ,[eng5]=  Cast([eng5] as int)
      ,[ru5]=  Cast([ru5] as int)
      ,[su5]=  Cast([su5] as int)
      ,[ra5]=  Cast([ra5] as int)
      ,[sa5]=  Cast([sa5] as int)
      ,[ve5]=  Cast([ve5] as int)
      ,[es5]=  Cast([es5] as int)
      ,[it5]=  Cast([it5] as int)
      ,[saa5]=  Cast([saa5] as int)
      ,[mu5]=  Cast([mu5] as int)
      ,[eopis5]=  Cast([eopis5] as int)
      ,[eng6]=  Cast([eng6] as int)
      ,[ru6]=  Cast([ru6] as int)
      ,[su6]=  Cast([su6] as int)
      ,[ra6]=  Cast([ra6] as int)
      ,[sa6]=  Cast([sa6] as int)
      ,[ve6]=  Cast([ve6] as int)
      ,[es6]=  Cast([es6] as int)
      ,[it6]=  Cast([it6] as int)
      ,[saa6]=  Cast([saa6] as int)
      ,[mu6]=  Cast([mu6] as int)
      ,[eopis6]=  Cast([eopis6] as int)
      ,[eny]=  Cast([eny] as int)
      ,[ruy]=  Cast([ruy] as int)
      ,[suy]=  Cast([suy] as int)
      ,[ray]=  Cast([ray] as int)
      ,[say]=  Cast([say] as int)
      ,[vey]=  Cast([vey] as int)
      ,[esy]=  Cast([esy] as int)
      ,[ity]=  Cast([ity] as int)
      ,[saay]=  Cast([saay] as int)
      ,[muy]=  Cast([muy] as int)
      ,[eopisy]=  Cast([eopisy] as int)
      ,[enn]=  Cast([enn] as int)
      ,[run]=  Cast([run] as int)
      ,[sun]=  Cast([sun] as int)
      ,[ran]=  Cast([ran] as int)
      ,[san]=  Cast([san] as int)
      ,[ven]=  Cast([ven] as int)
      ,[esn]=  Cast([esn] as int)
      ,[itn]=  Cast([itn] as int)
      ,[saan]=  Cast([saan] as int)
      ,[mun]=  Cast([mun] as int)
      ,[eopisn]=  Cast([eopisn] as int)
      ,[ven1]=  Cast([ven1] as int)
      ,[vru1]=  Cast([vru1] as int)
      ,[vsu1]=  Cast([vsu1] as int)
      ,[vra1]=  Cast([vra1] as int)
      ,[vsa1]=  Cast([vsa1] as int)
      ,[vve1]=  Cast([vve1] as int)
      ,[ves1]=  Cast([ves1] as int)
      ,[vit1]=  Cast([vit1] as int)
      ,[vsaa1]=  Cast([vsaa1] as int)
      ,[vmu1]=  Cast([vmu1] as int)
      ,[vyht1]=  Cast([vyht1] as int)
      ,[ven2]=  Cast([ven2] as int)
      ,[vru2]=  Cast([vru2] as int)
      ,[vsu2]=  Cast([vsu2] as int)
      ,[vra2]=  Cast([vra2] as int)
      ,[vsa2]=  Cast([vsa2] as int)
      ,[vve2]=  Cast([vve2] as int)
      ,[ves2]=  Cast([ves2] as int)
      ,[vit2]=  Cast([vit2] as int)
      ,[vsaa2]=  Cast([vsaa2] as int)
      ,[vmu2]=  Cast([vmu2] as int)
      ,[vyht2]=  Cast([vyht2] as int)
      ,[ven3]=  Cast([ven3] as int)
      ,[vru3]=  Cast([vru3] as int)
      ,[vsu3]=  Cast([vsu3] as int)
      ,[vra3]=  Cast([vra3] as int)
      ,[vsa3]=  Cast([vsa3] as int)
      ,[vve3]=  Cast([vve3] as int)
      ,[ves3]=  Cast([ves3] as int)
      ,[vit3]=  Cast([vit3] as int)
      ,[vsaa3]=  Cast([vsaa3] as int)
      ,[vmu3]=  Cast([vmu3] as int)
      ,[vyht3]=  Cast([vyht3] as int)
      ,[ven4]=  Cast([ven4] as int)
      ,[vru4]=  Cast([vru4] as int)
      ,[vsu4]=  Cast([vsu4] as int)
      ,[vra4]=  Cast([vra4] as int)
      ,[vsa4]=  Cast([vsa4] as int)
      ,[vve4]=  Cast([vve4] as int)
      ,[ves4]=  Cast([ves4] as int)
      ,[vit4]=  Cast([vit4] as int)
      ,[vsaa4]=  Cast([vsaa4] as int)
      ,[vmu4]=  Cast([vmu4] as int)
      ,[vyht4]=  Cast([vyht4] as int)
      ,[ven5]=  Cast([ven5] as int)
      ,[vru5]=  Cast([vru5] as int)
      ,[vsu5]=  Cast([vsu5] as int)
      ,[vra5]=  Cast([vra5] as int)
      ,[vsa5]=  Cast([vsa5] as int)
      ,[vve5]=  Cast([vve5] as int)
      ,[ves5]=  Cast([ves5] as int)
      ,[vit5]=  Cast([vit5] as int)
      ,[vsaa5]=  Cast([vsaa5] as int)
      ,[vmu5]=  Cast([vmu5] as int)
      ,[vyht5]=  Cast([vyht5] as int)
      ,[ven6]=  Cast([ven6] as int)
      ,[vru6]=  Cast([vru6] as int)
      ,[vsu6]=  Cast([vsu6] as int)
      ,[vra6]=  Cast([vra6] as int)
      ,[vsa6]=  Cast([vsa6] as int)
      ,[vve6]=  Cast([vve6] as int)
      ,[ves6]=  Cast([ves6] as int)
      ,[vit6]=  Cast([vit6] as int)
      ,[vsaa6]=  Cast([vsaa6] as int)
      ,[vmu6]=  Cast([vmu6] as int)
      ,[vyht6]=  Cast([vyht6] as int)
      ,[veny]=  Cast([veny] as int)
      ,[vruy]=  Cast([vruy] as int)
      ,[vsuy]=  Cast([vsuy] as int)
      ,[vray]=  Cast([vray] as int)
      ,[vsay]=  Cast([vsay] as int)
      ,[vvey]=  Cast([vvey] as int)
      ,[vesy]=  Cast([vesy] as int)
      ,[vity]=  Cast([vity] as int)
      ,[vsaay]=  Cast([vsaay] as int)
      ,[vmuy]=  Cast([vmuy] as int)
      ,[vyht]=  Cast([vyht] as int)
      ,[venn]=  Cast([venn] as int)
      ,[vrun]=  Cast([vrun] as int)
      ,[vsun]=  Cast([vsun] as int)
      ,[vran]=  Cast([vran] as int)
      ,[vsan]=  Cast([vsan] as int)
      ,[vven]=  Cast([vven] as int)
      ,[vesn]=  Cast([vesn] as int)
      ,[vitn]=  Cast([vitn] as int)
      ,[vsaan]=  Cast([vsaan] as int)
      ,[vmun]=  Cast([vmun] as int)
      ,[vtyt]=  Cast([vtyt] as int)
      ,[ov79yc]=  Cast([ov79yc] as int)
      ,[ov79nc]=  Cast([ov79nc] as int)
      ,[yaen1]=  Cast([yaen1] as int)
      ,[yaru1]=  Cast([yaru1] as int)
      ,[yasu1]=  Cast([yasu1] as int)
      ,[yara1]=  Cast([yara1] as int)
      ,[yasa1]=  Cast([yasa1] as int)
      ,[yave1]=  Cast([yave1] as int)
      ,[yaes1]=  Cast([yaes1] as int)
      ,[yait1]=  Cast([yait1] as int)
      ,[yasaa1]=  Cast([yasaa1] as int)
      ,[yalat1]=  Cast([yalat1] as int)
      ,[yamuu1]=  Cast([yamuu1] as int)
      ,[yaen2]=  Cast([yaen2] as int)
      ,[yaru2]=  Cast([yaru2] as int)
      ,[yasu2]=  Cast([yasu2] as int)
      ,[yara2]=  Cast([yara2] as int)
      ,[yasa2]=  Cast([yasa2] as int)
      ,[yave2]=  Cast([yave2] as int)
      ,[yaes2]=  Cast([yaes2] as int)
      ,[yait2]=  Cast([yait2] as int)
      ,[yasaa2]=  Cast([yasaa2] as int)
      ,[yalat2]=  Cast([yalat2] as int)
      ,[yamuu2]=  Cast([yamuu2] as int)
      ,[yyen]=  Cast([yyen] as int)
      ,[yyru]=  Cast([yyru] as int)
      ,[yysu]=  Cast([yysu] as int)
      ,[yyra]=  Cast([yyra] as int)
      ,[yysa]=  Cast([yysa] as int)
      ,[yen]=  Cast([yen] as int)
      ,[yru]=  Cast([yru] as int)
      ,[ysu]=  Cast([ysu] as int)
      ,[yra]=  Cast([yra] as int)
      ,[ysa]=  Cast([ysa] as int)
      ,[yve]=  Cast([yve] as int)
      ,[yes]=  Cast([yes] as int)
      ,[yit]=  Cast([yit] as int)
      ,[ysaa]=  Cast([ysaa] as int)
      ,[ylat]=  Cast([ylat] as int)
      ,[ymuu]=  Cast([ymuu] as int)
      ,[enyy]=  Cast([enyy] as int)
      ,[ruyy]=  Cast([ruyy] as int)
      ,[suyy]=  Cast([suyy] as int)
      ,[rayy]=  Cast([rayy] as int)
      ,[sayy]=  Cast([sayy] as int)
      ,[veyy]=  Cast([veyy] as int)
      ,[esyy]=  Cast([esyy] as int)
      ,[ityy]=  Cast([ityy] as int)
      ,[saayy]=  Cast([saayy] as int)
      ,[layy]=  Cast([layy] as int)
      ,[muyy]=  Cast([muyy] as int)
      ,[yaen1n]=  Cast([yaen1n] as int)
      ,[yaru1n]=  Cast([yaru1n] as int)
      ,[yasu1n]=  Cast([yasu1n] as int)
      ,[yara1n]=  Cast([yara1n] as int)
      ,[yasa1n]=  Cast([yasa1n] as int)
      ,[yave1n]=  Cast([yave1n] as int)
      ,[yaes1n]=  Cast([yaes1n] as int)
      ,[yait1n]=  Cast([yait1n] as int)
      ,[yasaa1n]=  Cast([yasaa1n] as int)
      ,[yalat1n]=  Cast([yalat1n] as int)
      ,[yamuu1n]=  Cast([yamuu1n] as int)
      ,[yaen2n]=  Cast([yaen2n] as int)
      ,[yaru2n]=  Cast([yaru2n] as int)
      ,[yasu2n]=  Cast([yasu2n] as int)
      ,[yara2n]=  Cast([yara2n] as int)
      ,[yasa2n]=  Cast([yasa2n] as int)
      ,[yave2n]=  Cast([yave2n] as int)
      ,[yaes2n]=  Cast([yaes2n] as int)
      ,[yait2n]=  Cast([yait2n] as int)
      ,[yasaa2n]=  Cast([yasaa2n] as int)
      ,[yalat2n]=  Cast([yalat2n] as int)
      ,[yamuu2n]=  Cast([yamuu2n] as int)
      ,[yyenn]=  Cast([yyenn] as int)
      ,[yyrun]=  Cast([yyrun] as int)
      ,[yysun]=  Cast([yysun] as int)
      ,[yyran]=  Cast([yyran] as int)
      ,[yysan]=  Cast([yysan] as int)
      ,[yenn]=  Cast([yenn] as int)
      ,[yrun]=  Cast([yrun] as int)
      ,[ysun]=  Cast([ysun] as int)
      ,[yran]=  Cast([yran] as int)
      ,[ysan]=  Cast([ysan] as int)
      ,[yven]=  Cast([yven] as int)
      ,[yesn]=  Cast([yesn] as int)
      ,[yitn]=  Cast([yitn] as int)
      ,[ysaan]=  Cast([ysaan] as int)
      ,[ylatn]=  Cast([ylatn] as int)
      ,[ymuun]=  Cast([ymuun] as int)
      ,[ennn]=  Cast([ennn] as int)
      ,[runn]=  Cast([runn] as int)
      ,[sunn]=  Cast([sunn] as int)
      ,[rann]=  Cast([rann] as int)
      ,[sann]=  Cast([sann] as int)
      ,[vennn]=  Cast([vennn] as int)
      ,[esnn]=  Cast([esnn] as int)
      ,[itnn]=  Cast([itnn] as int)
      ,[saann]=  Cast([saann] as int)
      ,[lann]=  Cast([lann] as int)
      ,[munn]=  Cast([munn] as int)
      ,[asv]=  Cast([asv] as int)
      ,[arv]=  Cast([arv] as int)
      ,[asvrv]=  Cast([asvrv] as int)
      ,[ysv]=  Cast([ysv] as int)
      ,[yrv]=  Cast([yrv] as int)
      ,[ysvrv]=  Cast([ysvrv] as int)
      ,[sv]=  Cast([sv] as int)
      ,[rv]=  Cast([rv] as int)
      ,[svrv]=  Cast([svrv] as int)
      ,[aev]=  Cast([aev] as int)
      ,[aort]=  Cast([aort] as int)
      ,[aisl]=  Cast([aisl] as int)
      ,[amu]=  Cast([amu] as int)
      ,[aet]=  Cast([aet] as int)
      ,[aeos]=  Cast([aeos] as int)
      ,[akay]=  Cast([akay] as int)
      ,[yev]=  Cast([yev] as int)
      ,[yort]=  Cast([yort] as int)
      ,[yisl]=  Cast([yisl] as int)
      ,[ymu]=  Cast([ymu] as int)
      ,[yet]=  Cast([yet] as int)
      ,[yeos]=  Cast([yeos] as int)
      ,[ykay]=  Cast([ykay] as int)
      ,[ev]=  Cast([ev] as int)
      ,[ort]=  Cast([ort] as int)
      ,[isl]=  Cast([isl] as int)
      ,[mu]=  Cast([mu] as int)
      ,[et]=  Cast([et] as int)
      ,[eos]=  Cast([eos] as int)
      ,[kay]=  Cast([kay] as int)
      ,[ov89yc]=  Cast([ov89yc] as int)
      ,[ov89nc]=  Cast([ov89nc] as int)
      ,[ai]=  Cast([ai] as int)
      ,[rsb]=  Cast([rsb] as int)
      ,[ma]=  Cast([ma] as int)
      ,[yl]=  Cast([yl] as int)
      ,[bi]=  Cast([bi] as int)
      ,[ge]=  Cast([ge] as int)
      ,[fy]=  Cast([fy] as int)
      ,[ke]=  Cast([ke] as int)
      ,[ter]=  Cast([ter] as int)
      ,[ue]=  Cast([ue] as int)
      ,[eti]=  Cast([eti] as int)
      ,[hi]=  Cast([hi] as int)
      ,[yh]=  Cast([yh] as int)
      ,[mus]=  Cast([mus] as int)
      ,[ku]=  Cast([ku] as int)
      ,[tt]=  Cast([tt] as int)
      ,[ts]=  Cast([ts] as int)
	  ,[ks]=  Cast([ks] as int)
      ,[li]=  Cast([li] as int)
      ,[ko]=  Cast([ko] as int)
      ,[yhd]=  Cast([yhd] as int)
      ,[ain]=  Cast([ain] as int)
      ,[rsbn]=  Cast([rsbn] as int)
      ,[man]=  Cast([man] as int)
      ,[yln]=  Cast([yln] as int)
      ,[bin]=  Cast([bin] as int)
      ,[gen]=  Cast([gen] as int)
      ,[fyn]=  Cast([fyn] as int)
      ,[ken]=  Cast([ken] as int)
      ,[tern]=  Cast([tern] as int)
      ,[uen]=  Cast([uen] as int)
      ,[etin]=  Cast([etin] as int)
      ,[hin]=  Cast([hin] as int)
      ,[yhn]=  Cast([yhn] as int)
      ,[musn]=  Cast([musn] as int)
      ,[kun]=  Cast([kun] as int)
      ,[ttn]=  Cast([ttn] as int)
      ,[tsn]=  Cast([tsn] as int)
	  ,[ksn]=  Cast([ksn] as int)
      ,[lin]=  Cast([lin] as int)
      ,[kon]=  Cast([kon] as int)
      ,[yhdn]=  Cast([yhdn] as int)
      ,[tietop]=  Cast([tietop] as int)
      ,[tietok]=  Cast([tietok] as int)
      ,[tietoi]=  Cast([tietoi] as int)
      ,[verkko]=  Cast([verkko] as int)

      ,[kaytto] = CAST([kaytto] as nchar(1))
      ,[tietolahde]
      ,[rivinumero]
  FROM (
/*
  UNION ALL 
  --Aineisto 2.1
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype] =NULL
      ,[tunn]
      ,[edesi] =NULL
      ,[edala] =NULL
      ,[edyla] =NULL
      ,[edlisa] =NULL
      ,[edainep] =NULL
      ,[syesi] =NULL
      ,[syala] =NULL
      ,[syyla] =NULL
      ,[sylisa] =NULL
      ,[symamu] =NULL
      ,[sylukio] =NULL
      ,[syamm] =NULL
      ,[symuu] =NULL
      ,[keve] =NULL
      ,[keven] =NULL
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10] =NULL
      ,[kev10n] =NULL
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim] =NULL
      ,[kelaimn] =NULL
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn] =NULL
      ,[ilmtod] =NULL
      ,[ilmtodn] =NULL
      ,[aku] =NULL
      ,[mamukurs] =NULL
      ,[oppkurs] =NULL
      ,[muukurs] =NULL
      ,[akukurs] =NULL
      ,[kmamu] =NULL
      ,[kmamun] =NULL
      ,[syulkom] =NULL
      ,[syulkomn] =NULL
      ,[sykoti] =NULL
      ,[sykotin] =NULL
      ,[ika4e] =NULL
      ,[ika4en] =NULL
      ,[ika5e]
      ,[ika5en]
      ,[pid5v] =NULL
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe] =NULL
      ,[teho1] =NULL
      ,[teho2] =NULL
      ,[teho3] =NULL
      ,[teho4] =NULL
      ,[teho5] =NULL
      ,[teho6] =NULL
      ,[teho7] =NULL
      ,[teho8] =NULL
      ,[teho9] =NULL
      ,[teho10] =NULL
      ,[tehoy] =NULL
      ,[eipide] =NULL
      ,[eipid1] =NULL
      ,[eipid2] =NULL
      ,[eipid3] =NULL
      ,[eipid4] =NULL
      ,[eipid5] =NULL
      ,[eipid6] =NULL
      ,[eipid7] =NULL
      ,[eipid8] =NULL
      ,[eipid9] =NULL
      ,[eipid10] =NULL
      ,[eipidy] =NULL
      ,[ertuve] =NULL
      ,[ertuv1] =NULL
      ,[ertuv2] =NULL
      ,[ertuv3] =NULL
      ,[ertuv4] =NULL
      ,[ertuv5] =NULL
      ,[ertuv6] =NULL
      ,[ertuv7] =NULL
      ,[ertuv8] =NULL
      ,[ertuv9] =NULL
      ,[ertuv10] =NULL
      ,[ertuvy] =NULL
      ,[ertume] =NULL
      ,[ertum1] =NULL
      ,[ertum2] =NULL
      ,[ertum3] =NULL
      ,[ertum4] =NULL
      ,[ertum5] =NULL
      ,[ertum6] =NULL
      ,[ertum7] =NULL
      ,[ertum8] =NULL
      ,[ertum9] =NULL
      ,[ertum10] =NULL
      ,[ertumy] =NULL
      ,[tavove] =NULL
      ,[tavov1] =NULL
      ,[tavov2] =NULL
      ,[tavov3] =NULL
      ,[tavov4] =NULL
      ,[tavov5] =NULL
      ,[tavov6] =NULL
      ,[tavov7] =NULL
      ,[tavov8] =NULL
      ,[tavov9] =NULL
      ,[tavov10] =NULL
      ,[tavovy] =NULL
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen] =NULL
      ,[teho1n] =NULL
      ,[teho2n] =NULL
      ,[teho3n] =NULL
      ,[teho4n] =NULL
      ,[teho5n] =NULL
      ,[teho6n] =NULL
      ,[teho7n] =NULL
      ,[teho8n] =NULL
      ,[teho9n] =NULL
      ,[teho10n] =NULL
      ,[tehoyn] =NULL
      ,[eipiden] =NULL
      ,[eipid1n] =NULL
      ,[eipid2n] =NULL
      ,[eipid3n] =NULL
      ,[eipid4n] =NULL
      ,[eipid5n] =NULL
      ,[eipid6n] =NULL
      ,[eipid7n] =NULL
      ,[eipid8n] =NULL
      ,[eipid9n] =NULL
      ,[eipid10n] =NULL
      ,[eipidyn] =NULL
      ,[ertuven] =NULL
      ,[ertuv1n] =NULL
      ,[ertuv2n] =NULL
      ,[ertuv3n] =NULL
      ,[ertuv4n] =NULL
      ,[ertuv5n] =NULL
      ,[ertuv6n] =NULL
      ,[ertuv7n] =NULL
      ,[ertuv8n] =NULL
      ,[ertuv9n] =NULL
      ,[ertuv10n] =NULL
      ,[ertuvyn] =NULL
      ,[ertumen] =NULL
      ,[ertum1n] =NULL
      ,[ertum2n] =NULL
      ,[ertum3n] =NULL
      ,[ertum4n] =NULL
      ,[ertum5n] =NULL
      ,[ertum6n] =NULL
      ,[ertum7n] =NULL
      ,[ertum8n] =NULL
      ,[ertum9n] =NULL
      ,[ertum10n] =NULL
      ,[ertumyn] =NULL
      ,[tavoven] =NULL
      ,[tavov1n] =NULL
      ,[tavov2n] =NULL
      ,[tavov3n] =NULL
      ,[tavov4n] =NULL
      ,[tavov5n] =NULL
      ,[tavov6n] =NULL
      ,[tavov7n] =NULL
      ,[tavov8n] =NULL
      ,[tavov9n] =NULL
      ,[tavov10n] =NULL
      ,[tavovyn] =NULL
      ,[eipidec] =NULL
      ,[eipidpc] =NULL
      ,[eipidlc] =NULL
      ,[eipidyc] =NULL
      ,[ertuvec] =NULL
      ,[ertuvpc] =NULL
      ,[ertuvlc] =NULL
      ,[ertuvyc] =NULL
      ,[ertumec] =NULL
      ,[ertumpc] =NULL
      ,[ertumlc] =NULL
      ,[ertumyc] =NULL
      ,[muuec] =NULL
      ,[muupc] =NULL
      ,[muulc] =NULL
      ,[muuyc] =NULL
      ,[ovec] =NULL
      ,[ovpc] =NULL
      ,[ovlc] =NULL
      ,[ovyc] =NULL
      ,[sisae] =NULL
      ,[sisap] =NULL
      ,[sisal] =NULL
      ,[sisam] =NULL
      ,[sisay] =NULL
      ,[maeipide] =NULL
      ,[maeipidp] =NULL
      ,[maeipidl] =NULL
      ,[maeipidy] =NULL
      ,[maertuve] =NULL
      ,[maertuvp] =NULL
      ,[maertuvl] =NULL
      ,[maertuvy] =NULL
      ,[maertume] =NULL
      ,[maertump] =NULL
      ,[maertuml] =NULL
      ,[maertumy] =NULL
      ,[mamuue] =NULL
      ,[mamuup] =NULL
      ,[mamuul] =NULL
      ,[mamuuy] =NULL
      ,[maove] =NULL
      ,[maovp] =NULL
      ,[maovl] =NULL
      ,[maovy] =NULL
      ,[kueipide] =NULL
      ,[kueipidp] =NULL
      ,[kueipidl] =NULL
      ,[kueipidy] =NULL
      ,[kuertuve] =NULL
      ,[kuertuvp] =NULL
      ,[kuertuvl] =NULL
      ,[kuertuvy] =NULL
      ,[kuertume] =NULL
      ,[kuertump] =NULL
      ,[kuertuml] =NULL
      ,[kuertumy] =NULL
      ,[kumuue] =NULL
      ,[kumuup] =NULL
      ,[kumuul] =NULL
      ,[kumuuy] =NULL
      ,[kuove] =NULL
      ,[kuovp] =NULL
      ,[kuovl] =NULL
      ,[kuovy] =NULL
      ,[vieipide] =NULL
      ,[vieipidp] =NULL
      ,[vieipidl] =NULL
      ,[vieipidy] =NULL
      ,[viertuve] =NULL
      ,[viertuvp] =NULL
      ,[viertuvl] =NULL
      ,[viertuvy] =NULL
      ,[viertume] =NULL
      ,[viertump] =NULL
      ,[viertuml] =NULL
      ,[viertumy] =NULL
      ,[vimuue] =NULL
      ,[vimuup] =NULL
      ,[vimuul] =NULL
      ,[vimuuy] =NULL
      ,[viove] =NULL
      ,[viovp] =NULL
      ,[viovl] =NULL
      ,[viovy] =NULL
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo] =NULL
      ,[jopon] =NULL
      ,[kan17v] =NULL
      ,[muu17v] =NULL
      ,[op17v] =NULL
      ,[lukoko] =NULL
      ,[lukokon] =NULL
      ,[luib] =NULL
      ,[luibn] =NULL
      ,[reife] =NULL
      ,[reifen] =NULL
      ,[gymn] =NULL
      ,[gymnn] =NULL
      ,[lueb] =NULL
      ,[luebn] =NULL
      ,[lukio] =NULL
      ,[lukion] =NULL
      ,[opsamm] =NULL
      ,[opsammn] =NULL
      ,[muuamm] =NULL
      ,[muuammn] =NULL
      ,[amm] =NULL
      ,[ammn] =NULL
      ,[peain] =NULL
      ,[peainn] =NULL
      ,[luain] =NULL
      ,[luainn] =NULL
      ,[vapsiv] =NULL
      ,[vapsivn] =NULL
      ,[taiop] =NULL
      ,[taiopn] =NULL
      ,[muukoul] =NULL
      ,[muukouln] =NULL
      ,[muuop] =NULL
      ,[muuopn] =NULL
      ,[tehoec] =NULL
      ,[teho16c] =NULL
      ,[teho79c] =NULL
      ,[teholc] =NULL
      ,[tehoyc] =NULL
      ,[ertuec] =NULL
      ,[ertu16c] =NULL
      ,[ertu79c] =NULL
      ,[ertulc] =NULL
      ,[ertuyc] =NULL
      ,[eritec] =NULL
      ,[erit16c] =NULL
      ,[erit79c] =NULL
      ,[eritlc] =NULL
      ,[erityc] =NULL
      ,[inte4] =NULL
      ,[int164] =NULL
      ,[int794] =NULL
      ,[intl4] =NULL
      ,[inty4] =NULL
      ,[inte3] =NULL
      ,[int163] =NULL
      ,[int793] =NULL
      ,[intl3] =NULL
      ,[inty3] =NULL
      ,[inte2] =NULL
      ,[int162] =NULL
      ,[int792] =NULL
      ,[intl2] =NULL
      ,[inty2] =NULL
      ,[inte1] =NULL
      ,[int161] =NULL
      ,[int791] =NULL
      ,[intl1] =NULL
      ,[inty1] =NULL
      ,[inte0] =NULL
      ,[int160] =NULL
      ,[int790] =NULL
      ,[intl0] =NULL
      ,[inty0] =NULL
      ,[intey] =NULL
      ,[int16y] =NULL
      ,[int79y] =NULL
      ,[intly] =NULL
      ,[intyy] =NULL
      ,[yks160] =NULL
      ,[yks790] =NULL
      ,[yksl0] =NULL
      ,[yksy0] =NULL
      ,[yks161] =NULL
      ,[yks791] =NULL
      ,[yksl1] =NULL
      ,[yksy1] =NULL
      ,[yks162] =NULL
      ,[yks792] =NULL
      ,[yksl2] =NULL
      ,[yksy2] =NULL
      ,[yks164] =NULL
      ,[yks794] =NULL
      ,[yksl4] =NULL
      ,[yksy4] =NULL
      ,[yks16t] =NULL
      ,[yks79t] =NULL
      ,[ykslt] =NULL
      ,[yksyt] =NULL
      ,[yks16y] =NULL
      ,[yks79y] =NULL
      ,[yksly] =NULL
      ,[yksyy] =NULL
      ,[tehoosa] =NULL
      ,[ertuosa] =NULL
      ,[eritosa] =NULL
      ,[tehotuki] =NULL
      ,[ertutuki] =NULL
      ,[erittuki] =NULL
      ,[tehoavu] =NULL
      ,[ertuavu] =NULL
      ,[eritavu] =NULL
      ,[tehomuu] =NULL
      ,[ertumuu] =NULL
      ,[eritmuu] =NULL
      ,[alc] =NULL
      ,[ylc] =NULL
      ,[luc] =NULL
      ,[amc] =NULL
      ,[alkieli0] =NULL
      ,[alkieli1] =NULL
      ,[alkieli2] =NULL
      ,[alkieli3] =NULL
      ,[alkieli4] =NULL
      ,[alkieliy] =NULL
      ,[ylkieli0] =NULL
      ,[ylkieli1] =NULL
      ,[ylkieli2] =NULL
      ,[ylkieli3] =NULL
      ,[ylkieli4] =NULL
      ,[ylkieli5] =NULL
      ,[ylkieliy] =NULL
      ,[lukieli0] =NULL
      ,[lukieli1] =NULL
      ,[lukieli2] =NULL
      ,[lukieli3] =NULL
      ,[lukieli4] =NULL
      ,[lukieli5] =NULL
      ,[lukieli6] =NULL
      ,[lukieliy] =NULL
      ,[amkieli0] =NULL
      ,[amkieli1] =NULL
      ,[amkieli2] =NULL
      ,[amkieli3] =NULL
      ,[amkieli4] =NULL
      ,[amkieli5] =NULL
      ,[amkieli6] =NULL
      ,[amkieliy] =NULL
      ,[aleny] =NULL
      ,[alruy] =NULL
      ,[alsuy] =NULL
      ,[alray] =NULL
      ,[alsay] =NULL
      ,[alvey] =NULL
      ,[alesy] =NULL
      ,[ality] =NULL
      ,[alsaay] =NULL
      ,[almuy] =NULL
      ,[yleny] =NULL
      ,[ylruy] =NULL
      ,[ylsuy] =NULL
      ,[ylray] =NULL
      ,[ylsay] =NULL
      ,[ylvey] =NULL
      ,[ylesy] =NULL
      ,[ylity] =NULL
      ,[ylsaay] =NULL
      ,[yllaty] =NULL
      ,[ylmuy] =NULL
      ,[lueny] =NULL
      ,[luruy] =NULL
      ,[lusuy] =NULL
      ,[luray] =NULL
      ,[lusay] =NULL
      ,[luvey] =NULL
      ,[luesy] =NULL
      ,[luity] =NULL
      ,[lusaay] =NULL
      ,[lulaty] =NULL
      ,[lumuy] =NULL
      ,[ameny] =NULL
      ,[amruy] =NULL
      ,[amsuy] =NULL
      ,[amray] =NULL
      ,[amsay] =NULL
      ,[amvey] =NULL
      ,[amesy] =NULL
      ,[amity] =NULL
      ,[amsaay] =NULL
      ,[amlaty] =NULL
      ,[ammuy] =NULL
      ,[ov1c] =NULL
      ,[ov2c] =NULL
      ,[ov3c] =NULL
      ,[ov4c] =NULL
      ,[ov5c] =NULL
      ,[ov6c] =NULL
      ,[ov16yc] =NULL
      ,[ov16nc] =NULL
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1] =NULL
      ,[it1] =NULL
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2] =NULL
      ,[it2] =NULL
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3] =NULL
      ,[it3] =NULL
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4] =NULL
      ,[it4] =NULL
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5] =NULL
      ,[it5] =NULL
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6] =NULL
      ,[it6] =NULL
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy] =NULL
      ,[ity] =NULL
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn] =NULL
      ,[itn] =NULL
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1] =NULL
      ,[vit1] =NULL
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2] =NULL
      ,[vit2] =NULL
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3] =NULL
      ,[vit3] =NULL
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4] =NULL
      ,[vit4] =NULL
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5] =NULL
      ,[vit5] =NULL
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6] =NULL
      ,[vit6] =NULL
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy] =NULL
      ,[vity] =NULL
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn] =NULL
      ,[vitn] =NULL
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc] =NULL
      ,[ov79nc] =NULL
      ,[yaen1] =NULL
      ,[yaru1] =NULL
      ,[yasu1] =NULL
      ,[yara1] =NULL
      ,[yasa1] =NULL
      ,[yave1] =NULL
      ,[yaes1] =NULL
      ,[yait1] =NULL
      ,[yasaa1] =NULL
      ,[yalat1] =NULL
      ,[yamuu1] =NULL
      ,[yaen2] =NULL
      ,[yaru2] =NULL
      ,[yasu2] =NULL
      ,[yara2] =NULL
      ,[yasa2] =NULL
      ,[yave2] =NULL
      ,[yaes2] =NULL
      ,[yait2] =NULL
      ,[yasaa2] =NULL
      ,[yalat2] =NULL
      ,[yamuu2] =NULL
      ,[yyen] =NULL
      ,[yyru] =NULL
      ,[yysu] =NULL
      ,[yyra] =NULL
      ,[yysa] =NULL
      ,[yen] =NULL
      ,[yru] =NULL
      ,[ysu] =NULL
      ,[yra] =NULL
      ,[ysa] =NULL
      ,[yve] =NULL
      ,[yes] =NULL
      ,[yit] =NULL
      ,[ysaa] =NULL
      ,[ylat] =NULL
      ,[ymuu] =NULL
      ,[enyy] =NULL
      ,[ruyy] =NULL
      ,[suyy] =NULL
      ,[rayy] =NULL
      ,[sayy] =NULL
      ,[veyy] =NULL
      ,[esyy] =NULL
      ,[ityy] =NULL
      ,[saayy] =NULL
      ,[layy] =NULL
      ,[muyy] =NULL
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n] =NULL
      ,[yait1n] =NULL
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n] =NULL
      ,[yait2n] =NULL
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn] =NULL
      ,[yitn] =NULL
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn] =NULL
      ,[itnn] =NULL
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl] =NULL
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl] =NULL
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl] =NULL
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc] =NULL
      ,[ov89nc] =NULL
      ,[ai] =NULL
      ,[rsb] =NULL
      ,[ma] =NULL
      ,[yl] =NULL
      ,[bi] =NULL
      ,[ge] =NULL
      ,[fy] =NULL
      ,[ke] =NULL
      ,[ter] =NULL
      ,[ue] =NULL
      ,[eti] =NULL
      ,[hi] =NULL
      ,[yh] =NULL
      ,[mus] =NULL
      ,[ku] =NULL
      ,[tt] =NULL
      ,[ts] =NULL
      ,[li] =NULL
      ,[ko] =NULL
      ,[yhd] =NULL
      ,[ain] =NULL
      ,[rsbn] =NULL
      ,[man] =NULL
      ,[yln] =NULL
      ,[bin] =NULL
      ,[gen] =NULL
      ,[fyn] =NULL
      ,[ken] =NULL
      ,[tern] =NULL
      ,[uen] =NULL
      ,[etin] =NULL
      ,[hin] =NULL
      ,[yhn] =NULL
      ,[musn] =NULL
      ,[kun] =NULL
      ,[ttn] =NULL
      ,[tsn] =NULL
      ,[lin] =NULL
      ,[kon] =NULL
      ,[yhdn] =NULL
      ,[tietop] =NULL
      ,[tietok] =NULL
      ,[tietoi] =NULL
      ,[verkko] =NULL
      ,[kaytto] =NULL
      ,[tietolahde]
      ,[rivinumero]
  from dbo.sa_2_1_Peruskoulutiedosto_11
*/


--Historia-aineisto 8.3
--Historia-aineistossa 7-9 luokkien A1 ja A2 kielivalinnat on summattu, tässä näkymässä ne merkitään A1-kieliksi
    SELECT [tilv]
      ,[jarj] = null
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = null
      ,[edala] = null
      ,[edyla] = null
      ,[edlisa] = null
      ,[edainep] = null
      ,[syesi] = null
      ,[syala] = null
      ,[syyla] = null
      ,[sylisa] = null
      ,[symamu] = null
      ,[sylukio] = null
      ,[syamm] = null
      ,[symuu] = null
      ,[keve] = null
      ,[keven] = null
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10] = null
      ,[kev10n] = null
      ,[kev] = null
      ,[kevn] = null
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim] = null
      ,[kelaimn] = null
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy] = null
      ,[oeriyn] = null
      ,[ilmtod] = null --eitod?
      ,[ilmtodn] = null --eitodn?
      ,[aku] = null
      ,[mamukurs] = null
      ,[oppkurs] = null
      ,[muukurs] = null
      ,[akukurs] = null
      ,[kmamu] = null
      ,[kmamun] = null
      ,[syulkom] = null
      ,[syulkomn] = null
      ,[sykoti] = null
      ,[sykotin] = null
      ,[ika4e] = null
      ,[ika4en] = null
      ,[ika5e] = null
      ,[ika5en] = null
      ,[pid5v] = null
      ,[ika6e] = null
      ,[ika6en] = null
      ,[ika7e] = null
      ,[ika7en] = null
      ,[ikae] = null
      ,[ikaen] = null
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe] = null
      ,[teho1] = null
      ,[teho2] = null
      ,[teho3] = null
      ,[teho4] = null
      ,[teho5] = null
      ,[teho6] = null
      ,[teho7] = null
      ,[teho8] = null
      ,[teho9] = null
      ,[teho10] = null
      ,[tehoy] = null
      ,[eipide] = null
      ,[eipid1] = null
      ,[eipid2] = null
      ,[eipid3] = null
      ,[eipid4] = null
      ,[eipid5] = null
      ,[eipid6] = null
      ,[eipid7] = null
      ,[eipid8] = null
      ,[eipid9] = null
      ,[eipid10] = null
      ,[eipidy] = null
      ,[ertuve] = null
      ,[ertuv1] = null
      ,[ertuv2] = null
      ,[ertuv3] = null
      ,[ertuv4] = null
      ,[ertuv5] = null
      ,[ertuv6] = null
      ,[ertuv7] = null
      ,[ertuv8] = null
      ,[ertuv9] = null
      ,[ertuv10] = null
      ,[ertuvy] = null
      ,[ertume] = null
      ,[ertum1] = null
      ,[ertum2] = null
      ,[ertum3] = null
      ,[ertum4] = null
      ,[ertum5] = null
      ,[ertum6] = null
      ,[ertum7] = null
      ,[ertum8] = null
      ,[ertum9] = null
      ,[ertum10] = null
      ,[ertumy] = null 
      ,[tavove] = null
      ,[tavov1] = null
      ,[tavov2] = null
      ,[tavov3] = null
      ,[tavov4] = null
      ,[tavov5] = null
      ,[tavov6] = null
      ,[tavov7] = null
      ,[tavov8] = null
      ,[tavov9] = null
      ,[tavov10] = null
      ,[tavovy] = null
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen] = null
      ,[teho1n] = null
      ,[teho2n] = null
      ,[teho3n] = null
      ,[teho4n] = null
      ,[teho5n] = null
      ,[teho6n] = null
      ,[teho7n] = null
      ,[teho8n] = null
      ,[teho9n] = null
      ,[teho10n] = null
      ,[tehoyn] = null
      ,[eipiden] = null
      ,[eipid1n] = null
      ,[eipid2n] = null
      ,[eipid3n] = null
      ,[eipid4n] = null
      ,[eipid5n] = null
      ,[eipid6n] = null
      ,[eipid7n] = null
      ,[eipid8n] = null
      ,[eipid9n] = null
      ,[eipid10n] = null
      ,[eipidyn] = null
      ,[ertuven] = null
      ,[ertuv1n] = null
      ,[ertuv2n] = null
      ,[ertuv3n] = null
      ,[ertuv4n] = null
      ,[ertuv5n] = null
      ,[ertuv6n] = null
      ,[ertuv7n] = null
      ,[ertuv8n] = null
      ,[ertuv9n] = null
      ,[ertuv10n] = null
      ,[ertuvyn] = null
      ,[ertumen] = null
      ,[ertum1n] = null
      ,[ertum2n] = null
      ,[ertum3n] = null
      ,[ertum4n] = null
      ,[ertum5n] = null
      ,[ertum6n] = null
      ,[ertum7n] = null
      ,[ertum8n] = null
      ,[ertum9n] = null
      ,[ertum10n] = null
      ,[ertumyn] = null
      ,[tavoven] = null
      ,[tavov1n] = null
      ,[tavov2n] = null
      ,[tavov3n] = null
      ,[tavov4n] = null
      ,[tavov5n] = null
      ,[tavov6n] = null
      ,[tavov7n] = null
      ,[tavov8n] = null
      ,[tavov9n] = null
      ,[tavov10n] = null
      ,[tavovyn] = null
      ,[eipidec] = null
      ,[eipidpc] = null
      ,[eipidlc] = null
      ,[eipidyc] = null
      ,[ertuvec] = null
      ,[ertuvpc] = null
      ,[ertuvlc] = null
      ,[ertuvyc] = null
      ,[ertumec] = null
      ,[ertumpc] = null
      ,[ertumlc] = null
      ,[ertumyc] = null
      ,[muuec] = null
      ,[muupc] = null
      ,[muulc] = null
      ,[muuyc] = null
      ,[ovec] = null
      ,[ovpc] = null
      ,[ovlc] = null
      ,[ovyc] = null
      ,[sisae] = null
      ,[sisap] = null
      ,[sisal] = null
      ,[sisam] = null
      ,[sisay] = null
      ,[maeipide] = null
      ,[maeipidp] = null
      ,[maeipidl] = null
      ,[maeipidy] = null
      ,[maertuve] = null
      ,[maertuvp] = null
      ,[maertuvl] = null
      ,[maertuvy] = null
      ,[maertume] = null
      ,[maertump] = null
      ,[maertuml] = null
      ,[maertumy] = null
      ,[mamuue] = null
      ,[mamuup] = null
      ,[mamuul] = null
      ,[mamuuy] = null
      ,[maove] = null
      ,[maovp] = null
      ,[maovl] = null
      ,[maovy] = null
      ,[kueipide] = null
      ,[kueipidp] = null
      ,[kueipidl] = null
      ,[kueipidy] = null
      ,[kuertuve] = null
      ,[kuertuvp] = null
      ,[kuertuvl] = null
      ,[kuertuvy] = null
      ,[kuertume] = null
      ,[kuertump] = null
      ,[kuertuml] = null
      ,[kuertumy] = null
      ,[kumuue] = null
      ,[kumuup] = null
      ,[kumuul] = null
      ,[kumuuy] = null
      ,[kuove] = null
      ,[kuovp] = null
      ,[kuovl] = null
      ,[kuovy] = null
      ,[vieipide] = null
      ,[vieipidp] = null
      ,[vieipidl] = null
      ,[vieipidy] = null
      ,[viertuve] = null
      ,[viertuvp] = null
      ,[viertuvl] = null
      ,[viertuvy] = null
      ,[viertume] = null
      ,[viertump] = null
      ,[viertuml] = null
      ,[viertumy] = null
      ,[vimuue] = null
      ,[vimuup] = null
      ,[vimuul] = null
      ,[vimuuy] = null
      ,[viove] = null
      ,[viovp] = null
      ,[viovl] = null
      ,[viovy] = null
      ,[ika61] = null
      ,[ika61n] = null
      ,[ika71] = null
      ,[ika71n] = null
      ,[ika81] = null
      ,[ika81n] = null
      ,[ika91] = null
      ,[ika91n] = null
      ,[ika1] = null
      ,[ika1n] = null
      ,[lykk]
      ,[lykkn]
      ,[jopo] = null
      ,[jopon] = null
      ,[kan17v] = null
      ,[muu17v] = null
      ,[op17v] = null
      ,[lukoko] = null
      ,[lukokon] = null
      ,[luib] = null
      ,[luibn] = null
      ,[reife] = null
      ,[reifen] = null
      ,[gymn] = null
      ,[gymnn] = null
      ,[lueb] = null
      ,[luebn] = null
      ,[lukio] = null
      ,[lukion] = null
      ,[opsamm] = null
      ,[opsammn] = null
      ,[muuamm] = null
      ,[muuammn] = null
      ,[amm] = null
      ,[ammn] = null
      ,[peain] = null
      ,[peainn] = null
      ,[luain] = null
      ,[luainn] = null
      ,[vapsiv] = null
      ,[vapsivn] = null
      ,[taiop] = null
      ,[taiopn] = null
      ,[muukoul] = null
      ,[muukouln] = null
      ,[muuop] = null
      ,[muuopn] = null
      ,[tehoec] = null
      ,[teho16c] = null
      ,[teho79c] = null
      ,[teholc] = null
      ,[tehoyc] = null
      ,[ertuec] = null
      ,[ertu16c] = null
      ,[ertu79c] = null
      ,[ertulc] = null
      ,[ertuyc] = null
      ,[eritec] = null
      ,[erit16c] = null
      ,[erit79c] = null
      ,[eritlc] = null
      ,[erityc] = null
      ,[inte4] = null
      ,[int164] = null
      ,[int794] = null
      ,[intl4] = null
      ,[inty4] = null
      ,[inte3] = null
      ,[int163] = null
      ,[int793] = null
      ,[intl3] = null
      ,[inty3] = null
      ,[inte2] = null
      ,[int162] = null
      ,[int792] = null
      ,[intl2] = null
      ,[inty2] = null
      ,[inte1] = null
      ,[int161] = null
      ,[int791] = null
      ,[intl1] = null
      ,[inty1] = null
      ,[inte0] = null
      ,[int160] = null
      ,[int790] = null
      ,[intl0] = null
      ,[inty0] = null
      ,[intey] = null
      ,[int16y] = null
      ,[int79y] = null
      ,[intly] = null
      ,[intyy] = null
      ,[yks160] = null
      ,[yks790] = null
      ,[yksl0] = null
      ,[yksy0] = null
      ,[yks161] = null
      ,[yks791] = null
      ,[yksl1] = null
      ,[yksy1] = null
      ,[yks162] = null
      ,[yks792] = null
      ,[yksl2] = null
      ,[yksy2] = null
      ,[yks164] = null
      ,[yks794] = null
      ,[yksl4] = null
      ,[yksy4] = null
      ,[yks16t] = null
      ,[yks79t] = null
      ,[ykslt] = null
      ,[yksyt] = null
      ,[yks16y] = null
      ,[yks79y] = null
      ,[yksly] = null
      ,[yksyy] = null
      ,[tehoosa] = null
      ,[ertuosa] = null
      ,[eritosa] = null
      ,[tehotuki] = null
      ,[ertutuki] = null
      ,[erittuki] = null
      ,[tehoavu] = null
      ,[ertuavu] = null
      ,[eritavu] = null
      ,[tehomuu] = null
      ,[ertumuu] = null
      ,[eritmuu] = null
      ,[alc] = null
      ,[ylc] = null
      ,[luc] = null
      ,[amc] = null
      ,[alkieli0] = null
      ,[alkieli1] = null
      ,[alkieli2] = null
      ,[alkieli3] = null
      ,[alkieli4] = null
      ,[alkieliy] = null
      ,[ylkieli0] = null
      ,[ylkieli1] = null
      ,[ylkieli2] = null
      ,[ylkieli3] = null
      ,[ylkieli4] = null
      ,[ylkieli5] = null
      ,[ylkieliy] = null
      ,[lukieli0] = null
      ,[lukieli1] = null
      ,[lukieli2] = null
      ,[lukieli3] = null
      ,[lukieli4] = null
      ,[lukieli5] = null
      ,[lukieli6] = null
      ,[lukieliy] = null
      ,[amkieli0] = null
      ,[amkieli1] = null
      ,[amkieli2] = null
      ,[amkieli3] = null
      ,[amkieli4] = null
      ,[amkieli5] = null
      ,[amkieli6] = null
      ,[amkieliy] = null
      ,[aleny] = null
      ,[alruy] = null
      ,[alsuy] = null
      ,[alray] = null
      ,[alsay] = null
      ,[alvey] = null
      ,[alesy] = null
      ,[ality] = null
      ,[alsaay] = null
      ,[almuy] = null
      ,[yleny] = null
      ,[ylruy] = null
      ,[ylsuy] = null
      ,[ylray] = null
      ,[ylsay] = null
      ,[ylvey] = null
      ,[ylesy] = null
      ,[ylity] = null
      ,[ylsaay] = null
      ,[yllaty] = null
      ,[ylmuy] = null
      ,[lueny] = null
      ,[luruy] = null
      ,[lusuy] = null
      ,[luray] = null
      ,[lusay] = null
      ,[luvey] = null
      ,[luesy] = null
      ,[luity] = null
      ,[lusaay] = null
      ,[lulaty] = null
      ,[lumuy] = null
      ,[ameny] = null
      ,[amruy] = null
      ,[amsuy] = null
      ,[amray] = null
      ,[amsay] = null
      ,[amvey] = null
      ,[amesy] = null
      ,[amity] = null
      ,[amsaay] = null
      ,[amlaty] = null
      ,[ammuy] = null
      ,[ov1c] = null
      ,[ov2c] = null
      ,[ov3c] = null
      ,[ov4c] = null
      ,[ov5c] = null
      ,[ov6c] = null
      ,[ov16yc] = null
      ,[ov16nc] = null
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1] = null
      ,[it1] = null
      ,[saa1]
      ,[mu1]
      ,[eopis1] = null
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2] = null
      ,[it2] = null
      ,[saa2]
      ,[mu2]
      ,[eopis2] = null
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3] = null
      ,[it3] = null
      ,[saa3]
      ,[mu3]
      ,[eopis3] = null
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4] = null
      ,[it4] = null
      ,[saa4]
      ,[mu4]
      ,[eopis4] = null
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5] = null
      ,[it5] = null
      ,[saa5]
      ,[mu5]
      ,[eopis5] = null
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6] = null
      ,[it6] = null
      ,[saa6]
      ,[mu6]
      ,[eopis6] = null
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy] = null
      ,[ity] = null
      ,[saay]
      ,[muy]
      ,[eopisy] = null
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn] = null
      ,[itn] = null
      ,[saan]
      ,[mun]
      ,[eopisn] = null
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1] = null
      ,[vit1] = null
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2] = null
      ,[vit2] = null
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3] = null
      ,[vit3] = null
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4] = null
      ,[vit4] = null
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5] = null
      ,[vit5] = null
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6] = null
      ,[vit6] = null
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy] = null
      ,[vity] = null
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn] = null
      ,[vitn] = null
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc] = null
      ,[ov79nc] = null
      ,[yaen1] = yaen
      ,[yaru1] = yaru
      ,[yasu1] = yasu
      ,[yara1] = yara
      ,[yasa1] = yasa
      ,[yave1] = yave
      ,[yaes1] = null
      ,[yait1] = null
      ,[yasaa1] = yasaa
      ,[yalat1] = yalat
      ,[yamuu1] = yamu
      ,[yaen2] = null
      ,[yaru2] = null
      ,[yasu2] = null
      ,[yara2] = null
      ,[yasa2] = null
      ,[yave2] = null
      ,[yaes2] = null
      ,[yait2] = null
      ,[yasaa2] = null
      ,[yalat2] = null
      ,[yamuu2] = null
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes] = null
      ,[yit] = null
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy] = null
      ,[ityy] = null
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n] = yaenn
      ,[yaru1n] = yarun
      ,[yasu1n] = yasun
      ,[yara1n] = yaran
      ,[yasa1n] = yasan
      ,[yave1n] = yaven
      ,[yaes1n] = null
      ,[yait1n] = null
      ,[yasaa1n] = yasaan
      ,[yalat1n] = yalatn
      ,[yamuu1n] = yamun
      ,[yaen2n] = null
      ,[yaru2n] = null
      ,[yasu2n] = null
      ,[yara2n] = null
      ,[yasa2n] = null
      ,[yave2n] = null
      ,[yaes2n] = null
      ,[yait2n] = null
      ,[yasaa2n] = null
      ,[yalat2n] = null
      ,[yamuu2n] = null
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn] = null
      ,[yitn] = null
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn] = null
      ,[itnn] = null
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv] = null
      ,[arv] = null
      ,[asvrv] = null
      ,[ysv] = null
      ,[yrv] = null
      ,[ysvrv] = null
      ,[sv] = null
      ,[rv] = null
      ,[svrv] = null
      ,[aev] = null
      ,[aort] = null
      ,[aisl] = null
      ,[amu] = null
      ,[aet] = null
      ,[aeos] = null
      ,[akay] = null
      ,[yev] = null
      ,[yort] = null
      ,[yisl] = null
      ,[ymu] = null
      ,[yet] = null
      ,[yeos] = null
      ,[ykay] = null
      ,[ev] = null
      ,[ort] = null
      ,[isl] = null
      ,[mu] = null
      ,[et] = null
      ,[eos] = null
      ,[kay] = null
      ,[ov89yc] = null
      ,[ov89nc] = null
      ,[ai] = null
      ,[rsb] = null
      ,[ma] = null--ma14m+ma14n+ma12m+ma12n+ma1m+ma1n+ma2m+ma2n+ma3m+ma3n
      ,[yl] = null
      ,[bi] = null--bi14m+bi14n+bi12m+bi12n+bi1m+bi1n+bi2m+bi2n+bi3m+bi3n
      ,[ge] = null--mt14m+mt14n+mt12m+mt12n+mt1m+mt1n+mt2m+mt2n+mt3m+mt3n
      ,[fy] = null--fy14m+fy14n+fy12m+fy12n+fy1m+fy1n+fy2m+fy2n+fy3m+fy3n
      ,[ke] = null--ke14m+ke14n+ke12m+ke12n+ke1m+ke1n+ke2m+ke2n+ke3m+ke3n
      ,[ter] = null
      ,[ue] = null
      ,[eti] = null
      ,[hi] = null
      ,[yh] = null
      ,[mus] = null
      ,[ku] = null
      ,[tt] = null--tt14m+tt14n+tt12m+tt12n+tt1m+tt1n+tt2m+tt2n+tt3m+tt3n
      ,[ts] = null--ts14m+ts14n+ts12m+ts12n+ts1m+ts1n+ts2m+ts2n+ts3m+ts3n
	  ,[ks] = null
      ,[li] = null
      ,[ko] = null
      ,[yhd] = null
      ,[ain] = null
      ,[rsbn] = null
      ,[man] = null--ma14n+ma12n+ma1n+ma2n+ma3n
      ,[yln] = null
      ,[bin] = null--bi14n+bi12n+bi1n+bi2n+bi3n
      ,[gen] = null--mt14n+mt12n+mt1n+mt2n+mt3n
      ,[fyn] = null--fy14n+fy12n+fy1n+fy2n+fy3n
      ,[ken] = null--ke14n+ke12n+ke1n+ke2n+ke3n
      ,[tern] = null
      ,[uen] = null
      ,[etin] = null
      ,[hin] = null
      ,[yhn] = null
      ,[musn] = null
      ,[kun] = null
      ,[ttn] = null--tt14n+tt12n+tt1n+tt2n+tt3n
      ,[tsn] = null--ts14n+ts12n+ts1n+ts2n+ts3n
	  ,[ksn] = null
      ,[lin] = null
      ,[kon] = null
      ,[yhdn] = null
      ,[tietop] = null
      ,[tietok] = null
      ,[tietoi] = null
      ,[verkko] = null
      ,[kaytto] = null
      ,[tietolahde]='R2.22_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_8_3_sopv_16]


UNION ALL

  SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks] = null
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn] = null
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_12]
  UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks] = null
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn] = null
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_13]
  UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks] = null
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn] = null
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_14]
   UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks] = null
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn] = null
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_15]
     UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks] = null
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn] = null
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_16]
    UNION ALL
    SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_17]

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu]
      ,[kmamun]
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn]
      ,[gymnn]
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm]
      ,[opsammn]
      ,[muuamm]
      ,[muuammn]
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt]
      ,[ts]
	  ,[ks]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn]
      ,[tsn]
	  ,[ksn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R2_22_sopv_18]

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu] = NULL
      ,[kmamun] = NULL
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn] = NULL
      ,[gymnn] = NULL
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm] = NULL
      ,[opsammn] = NULL
      ,[muuamm] = NULL
      ,[muuammn] = NULL
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt] = NULL
      ,[ts] = NULL
	  ,[ks]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn] = NULL
      ,[tsn] = NULL
	  ,[ksn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop]
      ,[tietok]
      ,[tietoi]
      ,[verkko]
      ,[kaytto]
      ,[tietolahde]='R2.22_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22_sopv_19]

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype]
      ,[tunn]
      ,[edesi]
      ,[edala]
      ,[edyla]
      ,[edlisa]
      ,[edainep]
      ,[syesi]
      ,[syala]
      ,[syyla]
      ,[sylisa]
      ,[symamu]
      ,[sylukio]
      ,[syamm]
      ,[symuu]
      ,[keve]
      ,[keven]
      ,[kev1]
      ,[kev1n]
      ,[kev2]
      ,[kev2n]
      ,[kev3]
      ,[kev3n]
      ,[kev4]
      ,[kev4n]
      ,[kev5]
      ,[kev5n]
      ,[kev6]
      ,[kev6n]
      ,[kev7]
      ,[kev7n]
      ,[kev8]
      ,[kev8n]
      ,[kev9]
      ,[kev9n]
      ,[kev10]
      ,[kev10n]
      ,[kev]
      ,[kevn]
      ,[luok1]
      ,[luok1n]
      ,[luok2]
      ,[luok2n]
      ,[luok3]
      ,[luok3n]
      ,[luok4]
      ,[luok4n]
      ,[luok5]
      ,[luok5n]
      ,[luok6]
      ,[luok6n]
      ,[luok7]
      ,[luok7n]
      ,[luok8]
      ,[luok8n]
      ,[luok9]
      ,[luok9n]
      ,[luok]
      ,[luokn]
      ,[kelaim]
      ,[kelaimn]
      ,[tod]
      ,[todn]
      ,[tutkt]
      ,[tutktn]
      ,[suor10]
      ,[suor10n]
      ,[oeriy]
      ,[oeriyn]
      ,[ilmtod]
      ,[ilmtodn]
      ,[aku]
      ,[mamukurs]
      ,[oppkurs]
      ,[muukurs]
      ,[akukurs]
      ,[kmamu] = NULL
      ,[kmamun] = NULL
      ,[syulkom]
      ,[syulkomn]
      ,[sykoti]
      ,[sykotin]
      ,[ika4e]
      ,[ika4en]
      ,[ika5e]
      ,[ika5en]
      ,[pid5v]
      ,[ika6e]
      ,[ika6en]
      ,[ika7e]
      ,[ika7en]
      ,[ikae]
      ,[ikaen]
      ,[ove]
      ,[ov1]
      ,[ov2]
      ,[ov3]
      ,[ov4]
      ,[ov5]
      ,[ov6]
      ,[ov7]
      ,[ov8]
      ,[ov9]
      ,[ov10]
      ,[ovy]
      ,[tehoe]
      ,[teho1]
      ,[teho2]
      ,[teho3]
      ,[teho4]
      ,[teho5]
      ,[teho6]
      ,[teho7]
      ,[teho8]
      ,[teho9]
      ,[teho10]
      ,[tehoy]
      ,[eipide]
      ,[eipid1]
      ,[eipid2]
      ,[eipid3]
      ,[eipid4]
      ,[eipid5]
      ,[eipid6]
      ,[eipid7]
      ,[eipid8]
      ,[eipid9]
      ,[eipid10]
      ,[eipidy]
      ,[ertuve]
      ,[ertuv1]
      ,[ertuv2]
      ,[ertuv3]
      ,[ertuv4]
      ,[ertuv5]
      ,[ertuv6]
      ,[ertuv7]
      ,[ertuv8]
      ,[ertuv9]
      ,[ertuv10]
      ,[ertuvy]
      ,[ertume]
      ,[ertum1]
      ,[ertum2]
      ,[ertum3]
      ,[ertum4]
      ,[ertum5]
      ,[ertum6]
      ,[ertum7]
      ,[ertum8]
      ,[ertum9]
      ,[ertum10]
      ,[ertumy]
      ,[tavove]
      ,[tavov1]
      ,[tavov2]
      ,[tavov3]
      ,[tavov4]
      ,[tavov5]
      ,[tavov6]
      ,[tavov7]
      ,[tavov8]
      ,[tavov9]
      ,[tavov10]
      ,[tavovy]
      ,[oven]
      ,[ov1n]
      ,[ov2n]
      ,[ov3n]
      ,[ov4n]
      ,[ov5n]
      ,[ov6n]
      ,[ov7n]
      ,[ov8n]
      ,[ov9n]
      ,[ov10n]
      ,[ovyn]
      ,[tehoen]
      ,[teho1n]
      ,[teho2n]
      ,[teho3n]
      ,[teho4n]
      ,[teho5n]
      ,[teho6n]
      ,[teho7n]
      ,[teho8n]
      ,[teho9n]
      ,[teho10n]
      ,[tehoyn]
      ,[eipiden]
      ,[eipid1n]
      ,[eipid2n]
      ,[eipid3n]
      ,[eipid4n]
      ,[eipid5n]
      ,[eipid6n]
      ,[eipid7n]
      ,[eipid8n]
      ,[eipid9n]
      ,[eipid10n]
      ,[eipidyn]
      ,[ertuven]
      ,[ertuv1n]
      ,[ertuv2n]
      ,[ertuv3n]
      ,[ertuv4n]
      ,[ertuv5n]
      ,[ertuv6n]
      ,[ertuv7n]
      ,[ertuv8n]
      ,[ertuv9n]
      ,[ertuv10n]
      ,[ertuvyn]
      ,[ertumen]
      ,[ertum1n]
      ,[ertum2n]
      ,[ertum3n]
      ,[ertum4n]
      ,[ertum5n]
      ,[ertum6n]
      ,[ertum7n]
      ,[ertum8n]
      ,[ertum9n]
      ,[ertum10n]
      ,[ertumyn]
      ,[tavoven]
      ,[tavov1n]
      ,[tavov2n]
      ,[tavov3n]
      ,[tavov4n]
      ,[tavov5n]
      ,[tavov6n]
      ,[tavov7n]
      ,[tavov8n]
      ,[tavov9n]
      ,[tavov10n]
      ,[tavovyn]
      ,[eipidec]
      ,[eipidpc]
      ,[eipidlc]
      ,[eipidyc]
      ,[ertuvec]
      ,[ertuvpc]
      ,[ertuvlc]
      ,[ertuvyc]
      ,[ertumec]
      ,[ertumpc]
      ,[ertumlc]
      ,[ertumyc]
      ,[muuec]
      ,[muupc]
      ,[muulc]
      ,[muuyc]
      ,[ovec]
      ,[ovpc]
      ,[ovlc]
      ,[ovyc]
      ,[sisae]
      ,[sisap]
      ,[sisal]
      ,[sisam]
      ,[sisay]
      ,[maeipide]
      ,[maeipidp]
      ,[maeipidl]
      ,[maeipidy]
      ,[maertuve]
      ,[maertuvp]
      ,[maertuvl]
      ,[maertuvy]
      ,[maertume]
      ,[maertump]
      ,[maertuml]
      ,[maertumy]
      ,[mamuue]
      ,[mamuup]
      ,[mamuul]
      ,[mamuuy]
      ,[maove]
      ,[maovp]
      ,[maovl]
      ,[maovy]
      ,[kueipide]
      ,[kueipidp]
      ,[kueipidl]
      ,[kueipidy]
      ,[kuertuve]
      ,[kuertuvp]
      ,[kuertuvl]
      ,[kuertuvy]
      ,[kuertume]
      ,[kuertump]
      ,[kuertuml]
      ,[kuertumy]
      ,[kumuue]
      ,[kumuup]
      ,[kumuul]
      ,[kumuuy]
      ,[kuove]
      ,[kuovp]
      ,[kuovl]
      ,[kuovy]
      ,[vieipide]
      ,[vieipidp]
      ,[vieipidl]
      ,[vieipidy]
      ,[viertuve]
      ,[viertuvp]
      ,[viertuvl]
      ,[viertuvy]
      ,[viertume]
      ,[viertump]
      ,[viertuml]
      ,[viertumy]
      ,[vimuue]
      ,[vimuup]
      ,[vimuul]
      ,[vimuuy]
      ,[viove]
      ,[viovp]
      ,[viovl]
      ,[viovy]
      ,[ika61]
      ,[ika61n]
      ,[ika71]
      ,[ika71n]
      ,[ika81]
      ,[ika81n]
      ,[ika91]
      ,[ika91n]
      ,[ika1]
      ,[ika1n]
      ,[lykk]
      ,[lykkn]
      ,[jopo]
      ,[jopon]
      ,[kan17v]
      ,[muu17v]
      ,[op17v]
      ,[lukoko]
      ,[lukokon]
      ,[luib]
      ,[luibn]
      ,[reife]
      ,[reifen]
      ,[gymn] = NULL
      ,[gymnn] = NULL
      ,[lueb]
      ,[luebn]
      ,[lukio]
      ,[lukion]
      ,[opsamm] = NULL
      ,[opsammn] = NULL
      ,[muuamm] = NULL
      ,[muuammn] = NULL
      ,[amm]
      ,[ammn]
      ,[peain]
      ,[peainn]
      ,[luain]
      ,[luainn]
      ,[vapsiv]
      ,[vapsivn]
      ,[taiop]
      ,[taiopn]
      ,[muukoul]
      ,[muukouln]
      ,[muuop]
      ,[muuopn]
      ,[tehoec]
      ,[teho16c]
      ,[teho79c]
      ,[teholc]
      ,[tehoyc]
      ,[ertuec]
      ,[ertu16c]
      ,[ertu79c]
      ,[ertulc]
      ,[ertuyc]
      ,[eritec]
      ,[erit16c]
      ,[erit79c]
      ,[eritlc]
      ,[erityc]
      ,[inte4]
      ,[int164]
      ,[int794]
      ,[intl4]
      ,[inty4]
      ,[inte3]
      ,[int163]
      ,[int793]
      ,[intl3]
      ,[inty3]
      ,[inte2]
      ,[int162]
      ,[int792]
      ,[intl2]
      ,[inty2]
      ,[inte1]
      ,[int161]
      ,[int791]
      ,[intl1]
      ,[inty1]
      ,[inte0]
      ,[int160]
      ,[int790]
      ,[intl0]
      ,[inty0]
      ,[intey]
      ,[int16y]
      ,[int79y]
      ,[intly]
      ,[intyy]
      ,[yks160]
      ,[yks790]
      ,[yksl0]
      ,[yksy0]
      ,[yks161]
      ,[yks791]
      ,[yksl1]
      ,[yksy1]
      ,[yks162]
      ,[yks792]
      ,[yksl2]
      ,[yksy2]
      ,[yks164]
      ,[yks794]
      ,[yksl4]
      ,[yksy4]
      ,[yks16t]
      ,[yks79t]
      ,[ykslt]
      ,[yksyt]
      ,[yks16y]
      ,[yks79y]
      ,[yksly]
      ,[yksyy]
      ,[tehoosa]
      ,[ertuosa]
      ,[eritosa]
      ,[tehotuki]
      ,[ertutuki]
      ,[erittuki]
      ,[tehoavu]
      ,[ertuavu]
      ,[eritavu]
      ,[tehomuu]
      ,[ertumuu]
      ,[eritmuu]
      ,[alc]
      ,[ylc]
      ,[luc]
      ,[amc]
      ,[alkieli0]
      ,[alkieli1]
      ,[alkieli2]
      ,[alkieli3]
      ,[alkieli4]
      ,[alkieliy]
      ,[ylkieli0]
      ,[ylkieli1]
      ,[ylkieli2]
      ,[ylkieli3]
      ,[ylkieli4]
      ,[ylkieli5]
      ,[ylkieliy]
      ,[lukieli0]
      ,[lukieli1]
      ,[lukieli2]
      ,[lukieli3]
      ,[lukieli4]
      ,[lukieli5]
      ,[lukieli6]
      ,[lukieliy]
      ,[amkieli0]
      ,[amkieli1]
      ,[amkieli2]
      ,[amkieli3]
      ,[amkieli4]
      ,[amkieli5]
      ,[amkieli6]
      ,[amkieliy]
      ,[aleny]
      ,[alruy]
      ,[alsuy]
      ,[alray]
      ,[alsay]
      ,[alvey]
      ,[alesy]
      ,[ality]
      ,[alsaay]
      ,[almuy]
      ,[yleny]
      ,[ylruy]
      ,[ylsuy]
      ,[ylray]
      ,[ylsay]
      ,[ylvey]
      ,[ylesy]
      ,[ylity]
      ,[ylsaay]
      ,[yllaty]
      ,[ylmuy]
      ,[lueny]
      ,[luruy]
      ,[lusuy]
      ,[luray]
      ,[lusay]
      ,[luvey]
      ,[luesy]
      ,[luity]
      ,[lusaay]
      ,[lulaty]
      ,[lumuy]
      ,[ameny]
      ,[amruy]
      ,[amsuy]
      ,[amray]
      ,[amsay]
      ,[amvey]
      ,[amesy]
      ,[amity]
      ,[amsaay]
      ,[amlaty]
      ,[ammuy]
      ,[ov1c]
      ,[ov2c]
      ,[ov3c]
      ,[ov4c]
      ,[ov5c]
      ,[ov6c]
      ,[ov16yc]
      ,[ov16nc]
      ,[eng1]
      ,[ru1]
      ,[su1]
      ,[ra1]
      ,[sa1]
      ,[ve1]
      ,[es1]
      ,[it1]
      ,[saa1]
      ,[mu1]
      ,[eopis1]
      ,[eng2]
      ,[ru2]
      ,[su2]
      ,[ra2]
      ,[sa2]
      ,[ve2]
      ,[es2]
      ,[it2]
      ,[saa2]
      ,[mu2]
      ,[eopis2]
      ,[eng3]
      ,[ru3]
      ,[su3]
      ,[ra3]
      ,[sa3]
      ,[ve3]
      ,[es3]
      ,[it3]
      ,[saa3]
      ,[mu3]
      ,[eopis3]
      ,[eng4]
      ,[ru4]
      ,[su4]
      ,[ra4]
      ,[sa4]
      ,[ve4]
      ,[es4]
      ,[it4]
      ,[saa4]
      ,[mu4]
      ,[eopis4]
      ,[eng5]
      ,[ru5]
      ,[su5]
      ,[ra5]
      ,[sa5]
      ,[ve5]
      ,[es5]
      ,[it5]
      ,[saa5]
      ,[mu5]
      ,[eopis5]
      ,[eng6]
      ,[ru6]
      ,[su6]
      ,[ra6]
      ,[sa6]
      ,[ve6]
      ,[es6]
      ,[it6]
      ,[saa6]
      ,[mu6]
      ,[eopis6]
      ,[eny]
      ,[ruy]
      ,[suy]
      ,[ray]
      ,[say]
      ,[vey]
      ,[esy]
      ,[ity]
      ,[saay]
      ,[muy]
      ,[eopisy]
      ,[enn]
      ,[run]
      ,[sun]
      ,[ran]
      ,[san]
      ,[ven]
      ,[esn]
      ,[itn]
      ,[saan]
      ,[mun]
      ,[eopisn]
      ,[ven1]
      ,[vru1]
      ,[vsu1]
      ,[vra1]
      ,[vsa1]
      ,[vve1]
      ,[ves1]
      ,[vit1]
      ,[vsaa1]
      ,[vmu1]
      ,[vyht1]
      ,[ven2]
      ,[vru2]
      ,[vsu2]
      ,[vra2]
      ,[vsa2]
      ,[vve2]
      ,[ves2]
      ,[vit2]
      ,[vsaa2]
      ,[vmu2]
      ,[vyht2]
      ,[ven3]
      ,[vru3]
      ,[vsu3]
      ,[vra3]
      ,[vsa3]
      ,[vve3]
      ,[ves3]
      ,[vit3]
      ,[vsaa3]
      ,[vmu3]
      ,[vyht3]
      ,[ven4]
      ,[vru4]
      ,[vsu4]
      ,[vra4]
      ,[vsa4]
      ,[vve4]
      ,[ves4]
      ,[vit4]
      ,[vsaa4]
      ,[vmu4]
      ,[vyht4]
      ,[ven5]
      ,[vru5]
      ,[vsu5]
      ,[vra5]
      ,[vsa5]
      ,[vve5]
      ,[ves5]
      ,[vit5]
      ,[vsaa5]
      ,[vmu5]
      ,[vyht5]
      ,[ven6]
      ,[vru6]
      ,[vsu6]
      ,[vra6]
      ,[vsa6]
      ,[vve6]
      ,[ves6]
      ,[vit6]
      ,[vsaa6]
      ,[vmu6]
      ,[vyht6]
      ,[veny]
      ,[vruy]
      ,[vsuy]
      ,[vray]
      ,[vsay]
      ,[vvey]
      ,[vesy]
      ,[vity]
      ,[vsaay]
      ,[vmuy]
      ,[vyht]
      ,[venn]
      ,[vrun]
      ,[vsun]
      ,[vran]
      ,[vsan]
      ,[vven]
      ,[vesn]
      ,[vitn]
      ,[vsaan]
      ,[vmun]
      ,[vtyt]
      ,[ov79yc]
      ,[ov79nc]
      ,[yaen1]
      ,[yaru1]
      ,[yasu1]
      ,[yara1]
      ,[yasa1]
      ,[yave1]
      ,[yaes1]
      ,[yait1]
      ,[yasaa1]
      ,[yalat1]
      ,[yamuu1]
      ,[yaen2]
      ,[yaru2]
      ,[yasu2]
      ,[yara2]
      ,[yasa2]
      ,[yave2]
      ,[yaes2]
      ,[yait2]
      ,[yasaa2]
      ,[yalat2]
      ,[yamuu2]
      ,[yyen]
      ,[yyru]
      ,[yysu]
      ,[yyra]
      ,[yysa]
      ,[yen]
      ,[yru]
      ,[ysu]
      ,[yra]
      ,[ysa]
      ,[yve]
      ,[yes]
      ,[yit]
      ,[ysaa]
      ,[ylat]
      ,[ymuu]
      ,[enyy]
      ,[ruyy]
      ,[suyy]
      ,[rayy]
      ,[sayy]
      ,[veyy]
      ,[esyy]
      ,[ityy]
      ,[saayy]
      ,[layy]
      ,[muyy]
      ,[yaen1n]
      ,[yaru1n]
      ,[yasu1n]
      ,[yara1n]
      ,[yasa1n]
      ,[yave1n]
      ,[yaes1n]
      ,[yait1n]
      ,[yasaa1n]
      ,[yalat1n]
      ,[yamuu1n]
      ,[yaen2n]
      ,[yaru2n]
      ,[yasu2n]
      ,[yara2n]
      ,[yasa2n]
      ,[yave2n]
      ,[yaes2n]
      ,[yait2n]
      ,[yasaa2n]
      ,[yalat2n]
      ,[yamuu2n]
      ,[yyenn]
      ,[yyrun]
      ,[yysun]
      ,[yyran]
      ,[yysan]
      ,[yenn]
      ,[yrun]
      ,[ysun]
      ,[yran]
      ,[ysan]
      ,[yven]
      ,[yesn]
      ,[yitn]
      ,[ysaan]
      ,[ylatn]
      ,[ymuun]
      ,[ennn]
      ,[runn]
      ,[sunn]
      ,[rann]
      ,[sann]
      ,[vennn]
      ,[esnn]
      ,[itnn]
      ,[saann]
      ,[lann]
      ,[munn]
      ,[asv]
      ,[arv]
      ,[asvrv]
      ,[ysv]
      ,[yrv]
      ,[ysvrv]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[aev]
      ,[aort]
      ,[aisl]
      ,[amu]
      ,[aet]
      ,[aeos]
      ,[akay]
      ,[yev]
      ,[yort]
      ,[yisl]
      ,[ymu]
      ,[yet]
      ,[yeos]
      ,[ykay]
      ,[ev]
      ,[ort]
      ,[isl]
      ,[mu]
      ,[et]
      ,[eos]
      ,[kay]
      ,[ov89yc]
      ,[ov89nc]
      ,[ai]
      ,[rsb]
      ,[ma]
      ,[yl]
      ,[bi]
      ,[ge]
      ,[fy]
      ,[ke]
      ,[ter]
      ,[ue]
      ,[eti]
      ,[hi]
      ,[yh]
      ,[mus]
      ,[ku]
      ,[tt] = NULL
      ,[ts] = NULL
	  ,[ks]
      ,[li]
      ,[ko]
      ,[yhd]
      ,[ain]
      ,[rsbn]
      ,[man]
      ,[yln]
      ,[bin]
      ,[gen]
      ,[fyn]
      ,[ken]
      ,[tern]
      ,[uen]
      ,[etin]
      ,[hin]
      ,[yhn]
      ,[musn]
      ,[kun]
      ,[ttn] = NULL
      ,[tsn] = NULL
	  ,[ksn]
      ,[lin]
      ,[kon]
      ,[yhdn]
      ,[tietop] = NULL
      ,[tietok] = NULL
      ,[tietoi] = NULL
      ,[verkko] = NULL
      ,[kaytto] = NULL
      ,[tietolahde]='R2.22_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22_sopv_20]

UNION ALL

--2.22b
SELECT [tilv]
      ,[jarj]
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = NULL
      ,[edala] = NULL
      ,[edyla] = NULL
      ,[edlisa] = NULL
      ,[edainep] = NULL
      ,[syesi] = NULL
      ,[syala] = NULL
      ,[syyla] = NULL
      ,[sylisa] = NULL
      ,[symamu] = NULL
      ,[sylukio] = NULL
      ,[syamm] = NULL
      ,[symuu] = NULL
      ,[keve] = NULL--sum(case when oppilas = '2' and luokka = '00' then lkm else 0 end)
      ,[keven] = NULL--sum(case when oppilas = '2' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[kev1] = NULL--sum(case when oppilas = '2' and luokka = '01' then lkm else 0 end)
      ,[kev1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[kev2] = NULL--sum(case when oppilas = '2' and luokka = '02' then lkm else 0 end)
      ,[kev2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[kev3] = NULL--sum(case when oppilas = '2' and luokka = '03' then lkm else 0 end)
      ,[kev3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[kev4] = NULL--sum(case when oppilas = '2' and luokka = '04' then lkm else 0 end)
      ,[kev4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[kev5] = NULL--sum(case when oppilas = '2' and luokka = '05' then lkm else 0 end)
      ,[kev5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[kev6] = NULL--sum(case when oppilas = '2' and luokka = '06' then lkm else 0 end)
      ,[kev6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[kev7] = NULL--sum(case when oppilas = '2' and luokka = '07' then lkm else 0 end)
      ,[kev7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[kev8] = NULL--sum(case when oppilas = '2' and luokka = '08' then lkm else 0 end)
      ,[kev8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[kev9] = NULL--sum(case when oppilas = '2' and luokka = '09' then lkm else 0 end)
      ,[kev9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[kev10] = NULL--sum(case when oppilas = '2' and luokka = '10' then lkm else 0 end)
      ,[kev10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[kev] = NULL--sum(case when oppilas = '2' and jaaluok = '1' then lkm else 0 end)
      ,[kevn] = NULL--sum(case when oppilas = '2' and sp = '2' and jaaluok = '1' then lkm else 0 end)
      ,[luok1] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' then lkm else 0 end)
      ,[luok1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok2] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' then lkm else 0 end)
      ,[luok2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok3] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' then lkm else 0 end)
      ,[luok3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok4] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' then lkm else 0 end)
      ,[luok4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok5] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' then lkm else 0 end)
      ,[luok5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok6] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' then lkm else 0 end)
      ,[luok6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok7] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' then lkm else 0 end)
      ,[luok7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok8] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' then lkm else 0 end)
      ,[luok8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok9] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' then lkm else 0 end)
      ,[luok9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' then lkm else 0 end)
      ,[luokn] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[kelaim] = NULL
      ,[kelaimn] = NULL
      ,[tod] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[todn] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[tutkt] = NULL
      ,[tutktn] = NULL
      ,[suor10] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[suor10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[oeriy] = NULL
      ,[oeriyn] = NULL
      ,[ilmtod] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 then lkm else 0 end)
      ,[ilmtodn] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 and sp = '2' then lkm else 0 end)
      ,[aku] = NULL
      ,[mamukurs] = NULL
      ,[oppkurs] = NULL
      ,[muukurs] = NULL
      ,[akukurs] = NULL
      ,[kmamu]  = NULL
      ,[kmamun]  = NULL
      ,[syulkom] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[syulkomn] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[sykoti] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[sykotin] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[ika4e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 then lkm else 0 end)
      ,[ika4en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 and sp = '2' then lkm else 0 end)
      ,[ika5e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 then lkm else 0 end)
      ,[ika5en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 and sp = '2' then lkm else 0 end)
      ,[pid5v] = NULL
      ,[ika6e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 then lkm else 0 end)
      ,[ika6en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 and sp = '2' then lkm else 0 end)
      ,[ika7e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 then lkm else 0 end)
      ,[ika7en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 and sp = '2' then lkm else 0 end)
      ,[ikae] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 then lkm else 0 end)
      ,[ikaen] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 and sp = '2' then lkm else 0 end)
      ,[ove] = sum(case when oppilas = '1' and luokka = '00' then lkm else 0 end)
      ,[ov1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ov2] = sum(case when oppilas = '1' and luokka = '02' then lkm else 0 end)
      ,[ov3] = sum(case when oppilas = '1' and luokka = '03' then lkm else 0 end)
      ,[ov4] = sum(case when oppilas = '1' and luokka = '04' then lkm else 0 end)
      ,[ov5] = sum(case when oppilas = '1' and luokka = '05' then lkm else 0 end)
      ,[ov6] = sum(case when oppilas = '1' and luokka = '06' then lkm else 0 end)
      ,[ov7] = sum(case when oppilas = '1' and luokka = '07' then lkm else 0 end)
      ,[ov8] = sum(case when oppilas = '1' and luokka = '08' then lkm else 0 end)
      ,[ov9] = sum(case when oppilas = '1' and luokka = '09' then lkm else 0 end)
      ,[ov10] = sum(case when oppilas = '1' and luokka = '10' then lkm else 0 end)
      ,[ovy] = sum(case when oppilas = '1' then lkm else 0 end)
      --
	  ,[tehoe] = NULL, [teho1] = NULL, [teho2] = NULL, [teho3] = NULL, [teho4] = NULL, [teho5] = NULL, [teho6] = NULL, [teho7] = NULL, [teho8] = NULL, [teho9] = NULL, [teho10] = NULL, [tehoy] = NULL, [eipide] = NULL, [eipid1] = NULL, [eipid2] = NULL, [eipid3] = NULL, [eipid4] = NULL, [eipid5] = NULL, [eipid6] = NULL, [eipid7] = NULL, [eipid8] = NULL, [eipid9] = NULL, [eipid10] = NULL, [eipidy] = NULL, [ertuve] = NULL, [ertuv1] = NULL, [ertuv2] = NULL, [ertuv3] = NULL, [ertuv4] = NULL, [ertuv5] = NULL, [ertuv6] = NULL, [ertuv7] = NULL, [ertuv8] = NULL, [ertuv9] = NULL, [ertuv10] = NULL, [ertuvy] = NULL, [ertume] = NULL, [ertum1] = NULL, [ertum2] = NULL, [ertum3] = NULL, [ertum4] = NULL, [ertum5] = NULL, [ertum6] = NULL, [ertum7] = NULL, [ertum8] = NULL, [ertum9] = NULL, [ertum10] = NULL, [ertumy] = NULL, [tavove] = NULL, [tavov1] = NULL, [tavov2] = NULL, [tavov3] = NULL, [tavov4] = NULL, [tavov5] = NULL, [tavov6] = NULL, [tavov7] = NULL, [tavov8] = NULL, [tavov9] = NULL, [tavov10] = NULL, [tavovy] = NULL
      --
	  ,[oven] = sum(case when oppilas = '1' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[ov1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[ov2n] = sum(case when oppilas = '1' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[ov3n] = sum(case when oppilas = '1' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[ov4n] = sum(case when oppilas = '1' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[ov5n] = sum(case when oppilas = '1' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[ov6n] = sum(case when oppilas = '1' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[ov7n] = sum(case when oppilas = '1' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[ov8n] = sum(case when oppilas = '1' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[ov9n] = sum(case when oppilas = '1' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[ov10n] = sum(case when oppilas = '1' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[ovyn] = sum(case when oppilas = '1' and sp = '2' then lkm else 0 end)
	  --
      ,[tehoen] = NULL, [teho1n] = NULL, [teho2n] = NULL, [teho3n] = NULL, [teho4n] = NULL, [teho5n] = NULL, [teho6n] = NULL, [teho7n] = NULL, [teho8n] = NULL, [teho9n] = NULL, [teho10n] = NULL, [tehoyn] = NULL, [eipiden] = NULL, [eipid1n] = NULL, [eipid2n] = NULL, [eipid3n] = NULL, [eipid4n] = NULL, [eipid5n] = NULL, [eipid6n] = NULL, [eipid7n] = NULL, [eipid8n] = NULL, [eipid9n] = NULL, [eipid10n] = NULL, [eipidyn] = NULL, [ertuven] = NULL, [ertuv1n] = NULL, [ertuv2n] = NULL, [ertuv3n] = NULL, [ertuv4n] = NULL, [ertuv5n] = NULL, [ertuv6n] = NULL, [ertuv7n] = NULL, [ertuv8n] = NULL, [ertuv9n] = NULL, [ertuv10n] = NULL, [ertuvyn] = NULL, [ertumen] = NULL, [ertum1n] = NULL, [ertum2n] = NULL, [ertum3n] = NULL, [ertum4n] = NULL, [ertum5n] = NULL, [ertum6n] = NULL, [ertum7n] = NULL, [ertum8n] = NULL, [ertum9n] = NULL, [ertum10n] = NULL, [ertumyn] = NULL, [tavoven] = NULL, [tavov1n] = NULL, [tavov2n] = NULL, [tavov3n] = NULL, [tavov4n] = NULL, [tavov5n] = NULL, [tavov6n] = NULL, [tavov7n] = NULL, [tavov8n] = NULL, [tavov9n] = NULL, [tavov10n] = NULL, [tavovyn] = NULL, [eipidec] = NULL, [eipidpc] = NULL, [eipidlc] = NULL, [eipidyc] = NULL, [ertuvec] = NULL, [ertuvpc] = NULL, [ertuvlc] = NULL, [ertuvyc] = NULL, [ertumec] = NULL, [ertumpc] = NULL, [ertumlc] = NULL, [ertumyc] = NULL, [muuec] = NULL, [muupc] = NULL, [muulc] = NULL, [muuyc] = NULL, [ovec] = NULL, [ovpc] = NULL, [ovlc] = NULL, [ovyc] = NULL, [sisae] = NULL, [sisap] = NULL, [sisal] = NULL, [sisam] = NULL, [sisay] = NULL, [maeipide] = NULL, [maeipidp] = NULL, [maeipidl] = NULL, [maeipidy] = NULL, [maertuve] = NULL, [maertuvp] = NULL, [maertuvl] = NULL, [maertuvy] = NULL, [maertume] = NULL, [maertump] = NULL, [maertuml] = NULL, [maertumy] = NULL, [mamuue] = NULL, [mamuup] = NULL, [mamuul] = NULL, [mamuuy] = NULL, [maove] = NULL, [maovp] = NULL, [maovl] = NULL, [maovy] = NULL, [kueipide] = NULL, [kueipidp] = NULL, [kueipidl] = NULL, [kueipidy] = NULL, [kuertuve] = NULL, [kuertuvp] = NULL, [kuertuvl] = NULL, [kuertuvy] = NULL, [kuertume] = NULL, [kuertump] = NULL, [kuertuml] = NULL, [kuertumy] = NULL, [kumuue] = NULL, [kumuup] = NULL, [kumuul] = NULL, [kumuuy] = NULL, [kuove] = NULL, [kuovp] = NULL, [kuovl] = NULL, [kuovy] = NULL, [vieipide] = NULL, [vieipidp] = NULL, [vieipidl] = NULL, [vieipidy] = NULL, [viertuve] = NULL, [viertuvp] = NULL, [viertuvl] = NULL, [viertuvy] = NULL, [viertume] = NULL, [viertump] = NULL, [viertuml] = NULL, [viertumy] = NULL, [vimuue] = NULL, [vimuup] = NULL, [vimuul] = NULL, [vimuuy] = NULL
	  --
      ,[viove] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '00' then lkm else 0 end)
      ,[viovp] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and cast(luokka as int) between 1 and 9 then lkm else 0 end)
      ,[viovl] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '10' then lkm else 0 end)
      ,[viovy] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') then lkm else 0 end)
      ,[ika61] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 then lkm else 0 end)
      ,[ika61n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 and sp = '2' then lkm else 0 end)
      ,[ika71] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 then lkm else 0 end)
      ,[ika71n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 and sp = '2' then lkm else 0 end)
      ,[ika81] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 then lkm else 0 end)
      ,[ika81n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 and sp = '2' then lkm else 0 end)
      ,[ika91] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 then lkm else 0 end)
      ,[ika91n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 and sp = '2' then lkm else 0 end)
      ,[ika1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ika1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[lykk] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' then lkm else 0 end)
      ,[lykkn] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' and sp = '2' then lkm else 0 end)
      ,[jopo] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 then lkm else 0 end)
      ,[jopon] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 and sp = '2' then lkm else 0 end)
	  --
      ,[kan17v] = NULL, [muu17v] = NULL, [op17v] = NULL, [lukoko] = NULL, [lukokon] = NULL, [luib] = NULL, [luibn] = NULL, [reife] = NULL, [reifen] = NULL, [gymn]= NULL, [gymnn]= NULL, [lueb] = NULL, [luebn] = NULL, [lukio] = NULL, [lukion] = NULL, [opsamm]= NULL, [opsammn]= NULL, [muuamm]= NULL, [muuammn]= NULL, [amm] = NULL, [ammn] = NULL, [peain] = NULL, [peainn] = NULL, [luain] = NULL, [luainn] = NULL, [vapsiv] = NULL, [vapsivn] = NULL, [taiop] = NULL, [taiopn] = NULL, [muukoul] = NULL, [muukouln] = NULL, [muuop] = NULL, [muuopn] = NULL, [tehoec] = NULL, [teho16c] = NULL, [teho79c] = NULL, [teholc] = NULL, [tehoyc] = NULL, [ertuec] = NULL, [ertu16c] = NULL, [ertu79c] = NULL, [ertulc] = NULL, [ertuyc] = NULL, [eritec] = NULL, [erit16c] = NULL, [erit79c] = NULL, [eritlc] = NULL, [erityc] = NULL, [inte4] = NULL, [int164] = NULL, [int794] = NULL, [intl4] = NULL, [inty4] = NULL, [inte3] = NULL, [int163] = NULL, [int793] = NULL, [intl3] = NULL, [inty3] = NULL, [inte2] = NULL, [int162] = NULL, [int792] = NULL, [intl2] = NULL, [inty2] = NULL, [inte1] = NULL, [int161] = NULL, [int791] = NULL, [intl1] = NULL, [inty1] = NULL, [inte0] = NULL, [int160] = NULL, [int790] = NULL, [intl0] = NULL, [inty0] = NULL, [intey] = NULL, [int16y] = NULL, [int79y] = NULL, [intly] = NULL, [intyy] = NULL, [yks160] = NULL, [yks790] = NULL, [yksl0] = NULL, [yksy0] = NULL, [yks161] = NULL, [yks791] = NULL, [yksl1] = NULL, [yksy1] = NULL, [yks162] = NULL, [yks792] = NULL, [yksl2] = NULL, [yksy2] = NULL, [yks164] = NULL, [yks794] = NULL, [yksl4] = NULL, [yksy4] = NULL, [yks16t] = NULL, [yks79t] = NULL, [ykslt] = NULL, [yksyt] = NULL, [yks16y] = NULL, [yks79y] = NULL, [yksly] = NULL, [yksyy] = NULL, [tehoosa] = NULL, [ertuosa] = NULL, [eritosa] = NULL, [tehotuki] = NULL, [ertutuki] = NULL, [erittuki] = NULL, [tehoavu] = NULL, [ertuavu] = NULL, [eritavu] = NULL, [tehomuu] = NULL, [ertumuu] = NULL, [eritmuu] = NULL, [alc] = NULL, [ylc] = NULL, [luc] = NULL, [amc] = NULL, [alkieli0] = NULL, [alkieli1] = NULL, [alkieli2] = NULL, [alkieli3] = NULL, [alkieli4] = NULL, [alkieliy] = NULL, [ylkieli0] = NULL, [ylkieli1] = NULL, [ylkieli2] = NULL, [ylkieli3] = NULL, [ylkieli4] = NULL, [ylkieli5] = NULL, [ylkieliy] = NULL, [lukieli0] = NULL, [lukieli1] = NULL, [lukieli2] = NULL, [lukieli3] = NULL, [lukieli4] = NULL, [lukieli5] = NULL, [lukieli6] = NULL, [lukieliy] = NULL, [amkieli0] = NULL, [amkieli1] = NULL, [amkieli2] = NULL, [amkieli3] = NULL, [amkieli4] = NULL, [amkieli5] = NULL, [amkieli6] = NULL, [amkieliy] = NULL, [aleny] = NULL, [alruy] = NULL, [alsuy] = NULL, [alray] = NULL, [alsay] = NULL, [alvey] = NULL, [alesy] = NULL, [ality] = NULL, [alsaay] = NULL, [almuy] = NULL, [yleny] = NULL, [ylruy] = NULL, [ylsuy] = NULL, [ylray] = NULL, [ylsay] = NULL, [ylvey] = NULL, [ylesy] = NULL, [ylity] = NULL, [ylsaay] = NULL, [yllaty] = NULL, [ylmuy] = NULL, [lueny] = NULL, [luruy] = NULL, [lusuy] = NULL, [luray] = NULL, [lusay] = NULL, [luvey] = NULL, [luesy] = NULL, [luity] = NULL, [lusaay] = NULL, [lulaty] = NULL, [lumuy] = NULL, [ameny] = NULL, [amruy] = NULL, [amsuy] = NULL, [amray] = NULL, [amsay] = NULL, [amvey] = NULL, [amesy] = NULL, [amity] = NULL, [amsaay] = NULL, [amlaty] = NULL, [ammuy] = NULL, [ov1c] = NULL, [ov2c] = NULL, [ov3c] = NULL, [ov4c] = NULL, [ov5c] = NULL, [ov6c] = NULL, [ov16yc] = NULL, [ov16nc] = NULL, [eng1] = NULL, [ru1] = NULL, [su1] = NULL, [ra1] = NULL, [sa1] = NULL, [ve1] = NULL, [es1] = NULL, [it1] = NULL, [saa1] = NULL, [mu1] = NULL, [eopis1] = NULL, [eng2] = NULL, [ru2] = NULL, [su2] = NULL, [ra2] = NULL, [sa2] = NULL, [ve2] = NULL, [es2] = NULL, [it2] = NULL, [saa2] = NULL, [mu2] = NULL, [eopis2] = NULL, [eng3] = NULL, [ru3] = NULL, [su3] = NULL, [ra3] = NULL, [sa3] = NULL, [ve3] = NULL, [es3] = NULL, [it3] = NULL, [saa3] = NULL, [mu3] = NULL, [eopis3] = NULL, [eng4] = NULL, [ru4] = NULL, [su4] = NULL, [ra4] = NULL, [sa4] = NULL, [ve4] = NULL, [es4] = NULL, [it4] = NULL, [saa4] = NULL, [mu4] = NULL, [eopis4] = NULL, [eng5] = NULL, [ru5] = NULL, [su5] = NULL, [ra5] = NULL, [sa5] = NULL, [ve5] = NULL, [es5] = NULL, [it5] = NULL, [saa5] = NULL, [mu5] = NULL, [eopis5] = NULL, [eng6] = NULL, [ru6] = NULL, [su6] = NULL, [ra6] = NULL, [sa6] = NULL, [ve6] = NULL, [es6] = NULL, [it6] = NULL, [saa6] = NULL, [mu6] = NULL, [eopis6] = NULL, [eny] = NULL, [ruy] = NULL, [suy] = NULL, [ray] = NULL, [say] = NULL, [vey] = NULL, [esy] = NULL, [ity] = NULL, [saay] = NULL, [muy] = NULL, [eopisy] = NULL, [enn] = NULL, [run] = NULL, [sun] = NULL, [ran] = NULL, [san] = NULL, [ven] = NULL, [esn] = NULL, [itn] = NULL, [saan] = NULL, [mun] = NULL, [eopisn] = NULL, [ven1] = NULL, [vru1] = NULL, [vsu1] = NULL, [vra1] = NULL, [vsa1] = NULL, [vve1] = NULL, [ves1] = NULL, [vit1] = NULL, [vsaa1] = NULL, [vmu1] = NULL, [vyht1] = NULL, [ven2] = NULL, [vru2] = NULL, [vsu2] = NULL, [vra2] = NULL, [vsa2] = NULL, [vve2] = NULL, [ves2] = NULL, [vit2] = NULL, [vsaa2] = NULL, [vmu2] = NULL, [vyht2] = NULL, [ven3] = NULL, [vru3] = NULL, [vsu3] = NULL, [vra3] = NULL, [vsa3] = NULL, [vve3] = NULL, [ves3] = NULL, [vit3] = NULL, [vsaa3] = NULL, [vmu3] = NULL, [vyht3] = NULL, [ven4] = NULL, [vru4] = NULL, [vsu4] = NULL, [vra4] = NULL, [vsa4] = NULL, [vve4] = NULL, [ves4] = NULL, [vit4] = NULL, [vsaa4] = NULL, [vmu4] = NULL, [vyht4] = NULL, [ven5] = NULL, [vru5] = NULL, [vsu5] = NULL, [vra5] = NULL, [vsa5] = NULL, [vve5] = NULL, [ves5] = NULL, [vit5] = NULL, [vsaa5] = NULL, [vmu5] = NULL, [vyht5] = NULL, [ven6] = NULL, [vru6] = NULL, [vsu6] = NULL, [vra6] = NULL, [vsa6] = NULL, [vve6] = NULL, [ves6] = NULL, [vit6] = NULL, [vsaa6] = NULL, [vmu6] = NULL, [vyht6] = NULL, [veny] = NULL, [vruy] = NULL, [vsuy] = NULL, [vray] = NULL, [vsay] = NULL, [vvey] = NULL, [vesy] = NULL, [vity] = NULL, [vsaay] = NULL, [vmuy] = NULL, [vyht] = NULL, [venn] = NULL, [vrun] = NULL, [vsun] = NULL, [vran] = NULL, [vsan] = NULL, [vven] = NULL, [vesn] = NULL, [vitn] = NULL, [vsaan] = NULL, [vmun] = NULL, [vtyt] = NULL, [ov79yc] = NULL, [ov79nc] = NULL, [yaen1] = NULL, [yaru1] = NULL, [yasu1] = NULL, [yara1] = NULL, [yasa1] = NULL, [yave1] = NULL, [yaes1] = NULL, [yait1] = NULL, [yasaa1] = NULL, [yalat1] = NULL, [yamuu1] = NULL, [yaen2] = NULL, [yaru2] = NULL, [yasu2] = NULL, [yara2] = NULL, [yasa2] = NULL, [yave2] = NULL, [yaes2] = NULL, [yait2] = NULL, [yasaa2] = NULL, [yalat2] = NULL, [yamuu2] = NULL, [yyen] = NULL, [yyru] = NULL, [yysu] = NULL, [yyra] = NULL, [yysa] = NULL, [yen] = NULL, [yru] = NULL, [ysu] = NULL, [yra] = NULL, [ysa] = NULL, [yve] = NULL, [yes] = NULL, [yit] = NULL, [ysaa] = NULL, [ylat] = NULL, [ymuu] = NULL, [enyy] = NULL, [ruyy] = NULL, [suyy] = NULL, [rayy] = NULL, [sayy] = NULL, [veyy] = NULL, [esyy] = NULL, [ityy] = NULL, [saayy] = NULL, [layy] = NULL, [muyy] = NULL, [yaen1n] = NULL, [yaru1n] = NULL, [yasu1n] = NULL, [yara1n] = NULL, [yasa1n] = NULL, [yave1n] = NULL, [yaes1n] = NULL, [yait1n] = NULL, [yasaa1n] = NULL, [yalat1n] = NULL, [yamuu1n] = NULL, [yaen2n] = NULL, [yaru2n] = NULL, [yasu2n] = NULL, [yara2n] = NULL, [yasa2n] = NULL, [yave2n] = NULL, [yaes2n] = NULL, [yait2n] = NULL, [yasaa2n] = NULL, [yalat2n] = NULL, [yamuu2n] = NULL, [yyenn] = NULL, [yyrun] = NULL, [yysun] = NULL, [yyran] = NULL, [yysan] = NULL, [yenn] = NULL, [yrun] = NULL, [ysun] = NULL, [yran] = NULL, [ysan] = NULL, [yven] = NULL, [yesn] = NULL, [yitn] = NULL, [ysaan] = NULL, [ylatn] = NULL, [ymuun] = NULL, [ennn] = NULL, [runn] = NULL, [sunn] = NULL, [rann] = NULL, [sann] = NULL, [vennn] = NULL, [esnn] = NULL, [itnn] = NULL, [saann] = NULL, [lann] = NULL, [munn] = NULL, [asv] = NULL, [arv] = NULL, [asvrv] = NULL, [ysv] = NULL, [yrv] = NULL, [ysvrv] = NULL, [sv] = NULL, [rv] = NULL, [svrv] = NULL, [aev] = NULL, [aort] = NULL, [aisl] = NULL, [amu] = NULL, [aet] = NULL, [aeos] = NULL, [akay] = NULL, [yev] = NULL, [yort] = NULL, [yisl] = NULL, [ymu] = NULL, [yet] = NULL, [yeos] = NULL, [ykay] = NULL, [ev] = NULL, [ort] = NULL, [isl] = NULL, [mu] = NULL, [et] = NULL, [eos] = NULL, [kay] = NULL, [ov89yc] = NULL, [ov89nc] = NULL, [ai] = NULL, [rsb] = NULL, [ma] = NULL, [yl] = NULL, [bi] = NULL, [ge] = NULL, [fy] = NULL, [ke] = NULL, [ter] = NULL, [ue] = NULL, [eti] = NULL, [hi] = NULL, [yh] = NULL, [mus] = NULL, [ku] = NULL, [tt]= NULL, [ts]= NULL, [ks] = NULL, [li] = NULL, [ko] = NULL, [yhd] = NULL, [ain] = NULL, [rsbn] = NULL, [man] = NULL, [yln] = NULL, [bin] = NULL, [gen] = NULL, [fyn] = NULL, [ken] = NULL, [tern] = NULL, [uen] = NULL, [etin] = NULL, [hin] = NULL, [yhn] = NULL, [musn] = NULL, [kun] = NULL, [ttn]= NULL, [tsn]= NULL, [ksn] = NULL, [lin] = NULL, [kon] = NULL, [yhdn] = NULL, [tietop] = NULL, [tietok] = NULL, [tietoi] = NULL, [verkko] = NULL, [kaytto] = NULL
      --
	  ,[tietolahde]='K2.22b_sopv21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_21] f 
  WHERE (oppilas = '1' and (esi = '2' or luokka in ('01','02','03','04','05','06','07','08','09'))) 
    or (oppilas = '2' and aik = '2')
  GROUP BY tilv, jarj, tunn

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = NULL
      ,[edala] = NULL
      ,[edyla] = NULL
      ,[edlisa] = NULL
      ,[edainep] = NULL
      ,[syesi] = NULL
      ,[syala] = NULL
      ,[syyla] = NULL
      ,[sylisa] = NULL
      ,[symamu] = NULL
      ,[sylukio] = NULL
      ,[syamm] = NULL
      ,[symuu] = NULL
      ,[keve] = NULL--sum(case when oppilas = '2' and luokka = '00' then lkm else 0 end)
      ,[keven] = NULL--sum(case when oppilas = '2' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[kev1] = NULL--sum(case when oppilas = '2' and luokka = '01' then lkm else 0 end)
      ,[kev1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[kev2] = NULL--sum(case when oppilas = '2' and luokka = '02' then lkm else 0 end)
      ,[kev2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[kev3] = NULL--sum(case when oppilas = '2' and luokka = '03' then lkm else 0 end)
      ,[kev3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[kev4] = NULL--sum(case when oppilas = '2' and luokka = '04' then lkm else 0 end)
      ,[kev4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[kev5] = NULL--sum(case when oppilas = '2' and luokka = '05' then lkm else 0 end)
      ,[kev5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[kev6] = NULL--sum(case when oppilas = '2' and luokka = '06' then lkm else 0 end)
      ,[kev6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[kev7] = NULL--sum(case when oppilas = '2' and luokka = '07' then lkm else 0 end)
      ,[kev7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[kev8] = NULL--sum(case when oppilas = '2' and luokka = '08' then lkm else 0 end)
      ,[kev8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[kev9] = NULL--sum(case when oppilas = '2' and luokka = '09' then lkm else 0 end)
      ,[kev9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[kev10] = NULL--sum(case when oppilas = '2' and luokka = '10' then lkm else 0 end)
      ,[kev10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[kev] = NULL--sum(case when oppilas = '2' and jaaluok = '1' then lkm else 0 end)
      ,[kevn] = NULL--sum(case when oppilas = '2' and sp = '2' and jaaluok = '1' then lkm else 0 end)
      ,[luok1] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' then lkm else 0 end)
      ,[luok1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok2] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' then lkm else 0 end)
      ,[luok2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok3] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' then lkm else 0 end)
      ,[luok3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok4] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' then lkm else 0 end)
      ,[luok4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok5] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' then lkm else 0 end)
      ,[luok5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok6] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' then lkm else 0 end)
      ,[luok6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok7] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' then lkm else 0 end)
      ,[luok7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok8] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' then lkm else 0 end)
      ,[luok8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok9] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' then lkm else 0 end)
      ,[luok9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' then lkm else 0 end)
      ,[luokn] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[kelaim] = NULL
      ,[kelaimn] = NULL
      ,[tod] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[todn] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[tutkt] = NULL
      ,[tutktn] = NULL
      ,[suor10] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[suor10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[oeriy] = NULL
      ,[oeriyn] = NULL
      ,[ilmtod] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 then lkm else 0 end)
      ,[ilmtodn] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 and sp = '2' then lkm else 0 end)
      ,[aku] = NULL
      ,[mamukurs] = NULL
      ,[oppkurs] = NULL
      ,[muukurs] = NULL
      ,[akukurs] = NULL
      ,[kmamu]  = NULL
      ,[kmamun]  = NULL
      ,[syulkom] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[syulkomn] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[sykoti] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[sykotin] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[ika4e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 then lkm else 0 end)
      ,[ika4en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 and sp = '2' then lkm else 0 end)
      ,[ika5e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 then lkm else 0 end)
      ,[ika5en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 and sp = '2' then lkm else 0 end)
      ,[pid5v] = NULL
      ,[ika6e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 then lkm else 0 end)
      ,[ika6en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 and sp = '2' then lkm else 0 end)
      ,[ika7e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 then lkm else 0 end)
      ,[ika7en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 and sp = '2' then lkm else 0 end)
      ,[ikae] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 then lkm else 0 end)
      ,[ikaen] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 and sp = '2' then lkm else 0 end)
      ,[ove] = sum(case when oppilas = '1' and luokka = '00' then lkm else 0 end)
      ,[ov1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ov2] = sum(case when oppilas = '1' and luokka = '02' then lkm else 0 end)
      ,[ov3] = sum(case when oppilas = '1' and luokka = '03' then lkm else 0 end)
      ,[ov4] = sum(case when oppilas = '1' and luokka = '04' then lkm else 0 end)
      ,[ov5] = sum(case when oppilas = '1' and luokka = '05' then lkm else 0 end)
      ,[ov6] = sum(case when oppilas = '1' and luokka = '06' then lkm else 0 end)
      ,[ov7] = sum(case when oppilas = '1' and luokka = '07' then lkm else 0 end)
      ,[ov8] = sum(case when oppilas = '1' and luokka = '08' then lkm else 0 end)
      ,[ov9] = sum(case when oppilas = '1' and luokka = '09' then lkm else 0 end)
      ,[ov10] = sum(case when oppilas = '1' and luokka = '10' then lkm else 0 end)
      ,[ovy] = sum(case when oppilas = '1' then lkm else 0 end)
      --
	  ,[tehoe] = NULL, [teho1] = NULL, [teho2] = NULL, [teho3] = NULL, [teho4] = NULL, [teho5] = NULL, [teho6] = NULL, [teho7] = NULL, [teho8] = NULL, [teho9] = NULL, [teho10] = NULL, [tehoy] = NULL, [eipide] = NULL, [eipid1] = NULL, [eipid2] = NULL, [eipid3] = NULL, [eipid4] = NULL, [eipid5] = NULL, [eipid6] = NULL, [eipid7] = NULL, [eipid8] = NULL, [eipid9] = NULL, [eipid10] = NULL, [eipidy] = NULL, [ertuve] = NULL, [ertuv1] = NULL, [ertuv2] = NULL, [ertuv3] = NULL, [ertuv4] = NULL, [ertuv5] = NULL, [ertuv6] = NULL, [ertuv7] = NULL, [ertuv8] = NULL, [ertuv9] = NULL, [ertuv10] = NULL, [ertuvy] = NULL, [ertume] = NULL, [ertum1] = NULL, [ertum2] = NULL, [ertum3] = NULL, [ertum4] = NULL, [ertum5] = NULL, [ertum6] = NULL, [ertum7] = NULL, [ertum8] = NULL, [ertum9] = NULL, [ertum10] = NULL, [ertumy] = NULL, [tavove] = NULL, [tavov1] = NULL, [tavov2] = NULL, [tavov3] = NULL, [tavov4] = NULL, [tavov5] = NULL, [tavov6] = NULL, [tavov7] = NULL, [tavov8] = NULL, [tavov9] = NULL, [tavov10] = NULL, [tavovy] = NULL
      --
	  ,[oven] = sum(case when oppilas = '1' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[ov1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[ov2n] = sum(case when oppilas = '1' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[ov3n] = sum(case when oppilas = '1' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[ov4n] = sum(case when oppilas = '1' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[ov5n] = sum(case when oppilas = '1' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[ov6n] = sum(case when oppilas = '1' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[ov7n] = sum(case when oppilas = '1' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[ov8n] = sum(case when oppilas = '1' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[ov9n] = sum(case when oppilas = '1' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[ov10n] = sum(case when oppilas = '1' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[ovyn] = sum(case when oppilas = '1' and sp = '2' then lkm else 0 end)
	  --
      ,[tehoen] = NULL, [teho1n] = NULL, [teho2n] = NULL, [teho3n] = NULL, [teho4n] = NULL, [teho5n] = NULL, [teho6n] = NULL, [teho7n] = NULL, [teho8n] = NULL, [teho9n] = NULL, [teho10n] = NULL, [tehoyn] = NULL, [eipiden] = NULL, [eipid1n] = NULL, [eipid2n] = NULL, [eipid3n] = NULL, [eipid4n] = NULL, [eipid5n] = NULL, [eipid6n] = NULL, [eipid7n] = NULL, [eipid8n] = NULL, [eipid9n] = NULL, [eipid10n] = NULL, [eipidyn] = NULL, [ertuven] = NULL, [ertuv1n] = NULL, [ertuv2n] = NULL, [ertuv3n] = NULL, [ertuv4n] = NULL, [ertuv5n] = NULL, [ertuv6n] = NULL, [ertuv7n] = NULL, [ertuv8n] = NULL, [ertuv9n] = NULL, [ertuv10n] = NULL, [ertuvyn] = NULL, [ertumen] = NULL, [ertum1n] = NULL, [ertum2n] = NULL, [ertum3n] = NULL, [ertum4n] = NULL, [ertum5n] = NULL, [ertum6n] = NULL, [ertum7n] = NULL, [ertum8n] = NULL, [ertum9n] = NULL, [ertum10n] = NULL, [ertumyn] = NULL, [tavoven] = NULL, [tavov1n] = NULL, [tavov2n] = NULL, [tavov3n] = NULL, [tavov4n] = NULL, [tavov5n] = NULL, [tavov6n] = NULL, [tavov7n] = NULL, [tavov8n] = NULL, [tavov9n] = NULL, [tavov10n] = NULL, [tavovyn] = NULL, [eipidec] = NULL, [eipidpc] = NULL, [eipidlc] = NULL, [eipidyc] = NULL, [ertuvec] = NULL, [ertuvpc] = NULL, [ertuvlc] = NULL, [ertuvyc] = NULL, [ertumec] = NULL, [ertumpc] = NULL, [ertumlc] = NULL, [ertumyc] = NULL, [muuec] = NULL, [muupc] = NULL, [muulc] = NULL, [muuyc] = NULL, [ovec] = NULL, [ovpc] = NULL, [ovlc] = NULL, [ovyc] = NULL, [sisae] = NULL, [sisap] = NULL, [sisal] = NULL, [sisam] = NULL, [sisay] = NULL, [maeipide] = NULL, [maeipidp] = NULL, [maeipidl] = NULL, [maeipidy] = NULL, [maertuve] = NULL, [maertuvp] = NULL, [maertuvl] = NULL, [maertuvy] = NULL, [maertume] = NULL, [maertump] = NULL, [maertuml] = NULL, [maertumy] = NULL, [mamuue] = NULL, [mamuup] = NULL, [mamuul] = NULL, [mamuuy] = NULL, [maove] = NULL, [maovp] = NULL, [maovl] = NULL, [maovy] = NULL, [kueipide] = NULL, [kueipidp] = NULL, [kueipidl] = NULL, [kueipidy] = NULL, [kuertuve] = NULL, [kuertuvp] = NULL, [kuertuvl] = NULL, [kuertuvy] = NULL, [kuertume] = NULL, [kuertump] = NULL, [kuertuml] = NULL, [kuertumy] = NULL, [kumuue] = NULL, [kumuup] = NULL, [kumuul] = NULL, [kumuuy] = NULL, [kuove] = NULL, [kuovp] = NULL, [kuovl] = NULL, [kuovy] = NULL, [vieipide] = NULL, [vieipidp] = NULL, [vieipidl] = NULL, [vieipidy] = NULL, [viertuve] = NULL, [viertuvp] = NULL, [viertuvl] = NULL, [viertuvy] = NULL, [viertume] = NULL, [viertump] = NULL, [viertuml] = NULL, [viertumy] = NULL, [vimuue] = NULL, [vimuup] = NULL, [vimuul] = NULL, [vimuuy] = NULL
	  --
      ,[viove] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '00' then lkm else 0 end)
      ,[viovp] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and cast(luokka as int) between 1 and 9 then lkm else 0 end)
      ,[viovl] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '10' then lkm else 0 end)
      ,[viovy] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') then lkm else 0 end)
      ,[ika61] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 then lkm else 0 end)
      ,[ika61n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 and sp = '2' then lkm else 0 end)
      ,[ika71] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 then lkm else 0 end)
      ,[ika71n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 and sp = '2' then lkm else 0 end)
      ,[ika81] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 then lkm else 0 end)
      ,[ika81n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 and sp = '2' then lkm else 0 end)
      ,[ika91] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 then lkm else 0 end)
      ,[ika91n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 and sp = '2' then lkm else 0 end)
      ,[ika1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ika1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[lykk] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' then lkm else 0 end)
      ,[lykkn] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' and sp = '2' then lkm else 0 end)
      ,[jopo] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 then lkm else 0 end)
      ,[jopon] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 and sp = '2' then lkm else 0 end)
	  --
      ,[kan17v] = NULL, [muu17v] = NULL, [op17v] = NULL, [lukoko] = NULL, [lukokon] = NULL, [luib] = NULL, [luibn] = NULL, [reife] = NULL, [reifen] = NULL, [gymn]= NULL, [gymnn]= NULL, [lueb] = NULL, [luebn] = NULL, [lukio] = NULL, [lukion] = NULL, [opsamm]= NULL, [opsammn]= NULL, [muuamm]= NULL, [muuammn]= NULL, [amm] = NULL, [ammn] = NULL, [peain] = NULL, [peainn] = NULL, [luain] = NULL, [luainn] = NULL, [vapsiv] = NULL, [vapsivn] = NULL, [taiop] = NULL, [taiopn] = NULL, [muukoul] = NULL, [muukouln] = NULL, [muuop] = NULL, [muuopn] = NULL, [tehoec] = NULL, [teho16c] = NULL, [teho79c] = NULL, [teholc] = NULL, [tehoyc] = NULL, [ertuec] = NULL, [ertu16c] = NULL, [ertu79c] = NULL, [ertulc] = NULL, [ertuyc] = NULL, [eritec] = NULL, [erit16c] = NULL, [erit79c] = NULL, [eritlc] = NULL, [erityc] = NULL, [inte4] = NULL, [int164] = NULL, [int794] = NULL, [intl4] = NULL, [inty4] = NULL, [inte3] = NULL, [int163] = NULL, [int793] = NULL, [intl3] = NULL, [inty3] = NULL, [inte2] = NULL, [int162] = NULL, [int792] = NULL, [intl2] = NULL, [inty2] = NULL, [inte1] = NULL, [int161] = NULL, [int791] = NULL, [intl1] = NULL, [inty1] = NULL, [inte0] = NULL, [int160] = NULL, [int790] = NULL, [intl0] = NULL, [inty0] = NULL, [intey] = NULL, [int16y] = NULL, [int79y] = NULL, [intly] = NULL, [intyy] = NULL, [yks160] = NULL, [yks790] = NULL, [yksl0] = NULL, [yksy0] = NULL, [yks161] = NULL, [yks791] = NULL, [yksl1] = NULL, [yksy1] = NULL, [yks162] = NULL, [yks792] = NULL, [yksl2] = NULL, [yksy2] = NULL, [yks164] = NULL, [yks794] = NULL, [yksl4] = NULL, [yksy4] = NULL, [yks16t] = NULL, [yks79t] = NULL, [ykslt] = NULL, [yksyt] = NULL, [yks16y] = NULL, [yks79y] = NULL, [yksly] = NULL, [yksyy] = NULL, [tehoosa] = NULL, [ertuosa] = NULL, [eritosa] = NULL, [tehotuki] = NULL, [ertutuki] = NULL, [erittuki] = NULL, [tehoavu] = NULL, [ertuavu] = NULL, [eritavu] = NULL, [tehomuu] = NULL, [ertumuu] = NULL, [eritmuu] = NULL, [alc] = NULL, [ylc] = NULL, [luc] = NULL, [amc] = NULL, [alkieli0] = NULL, [alkieli1] = NULL, [alkieli2] = NULL, [alkieli3] = NULL, [alkieli4] = NULL, [alkieliy] = NULL, [ylkieli0] = NULL, [ylkieli1] = NULL, [ylkieli2] = NULL, [ylkieli3] = NULL, [ylkieli4] = NULL, [ylkieli5] = NULL, [ylkieliy] = NULL, [lukieli0] = NULL, [lukieli1] = NULL, [lukieli2] = NULL, [lukieli3] = NULL, [lukieli4] = NULL, [lukieli5] = NULL, [lukieli6] = NULL, [lukieliy] = NULL, [amkieli0] = NULL, [amkieli1] = NULL, [amkieli2] = NULL, [amkieli3] = NULL, [amkieli4] = NULL, [amkieli5] = NULL, [amkieli6] = NULL, [amkieliy] = NULL, [aleny] = NULL, [alruy] = NULL, [alsuy] = NULL, [alray] = NULL, [alsay] = NULL, [alvey] = NULL, [alesy] = NULL, [ality] = NULL, [alsaay] = NULL, [almuy] = NULL, [yleny] = NULL, [ylruy] = NULL, [ylsuy] = NULL, [ylray] = NULL, [ylsay] = NULL, [ylvey] = NULL, [ylesy] = NULL, [ylity] = NULL, [ylsaay] = NULL, [yllaty] = NULL, [ylmuy] = NULL, [lueny] = NULL, [luruy] = NULL, [lusuy] = NULL, [luray] = NULL, [lusay] = NULL, [luvey] = NULL, [luesy] = NULL, [luity] = NULL, [lusaay] = NULL, [lulaty] = NULL, [lumuy] = NULL, [ameny] = NULL, [amruy] = NULL, [amsuy] = NULL, [amray] = NULL, [amsay] = NULL, [amvey] = NULL, [amesy] = NULL, [amity] = NULL, [amsaay] = NULL, [amlaty] = NULL, [ammuy] = NULL, [ov1c] = NULL, [ov2c] = NULL, [ov3c] = NULL, [ov4c] = NULL, [ov5c] = NULL, [ov6c] = NULL, [ov16yc] = NULL, [ov16nc] = NULL, [eng1] = NULL, [ru1] = NULL, [su1] = NULL, [ra1] = NULL, [sa1] = NULL, [ve1] = NULL, [es1] = NULL, [it1] = NULL, [saa1] = NULL, [mu1] = NULL, [eopis1] = NULL, [eng2] = NULL, [ru2] = NULL, [su2] = NULL, [ra2] = NULL, [sa2] = NULL, [ve2] = NULL, [es2] = NULL, [it2] = NULL, [saa2] = NULL, [mu2] = NULL, [eopis2] = NULL, [eng3] = NULL, [ru3] = NULL, [su3] = NULL, [ra3] = NULL, [sa3] = NULL, [ve3] = NULL, [es3] = NULL, [it3] = NULL, [saa3] = NULL, [mu3] = NULL, [eopis3] = NULL, [eng4] = NULL, [ru4] = NULL, [su4] = NULL, [ra4] = NULL, [sa4] = NULL, [ve4] = NULL, [es4] = NULL, [it4] = NULL, [saa4] = NULL, [mu4] = NULL, [eopis4] = NULL, [eng5] = NULL, [ru5] = NULL, [su5] = NULL, [ra5] = NULL, [sa5] = NULL, [ve5] = NULL, [es5] = NULL, [it5] = NULL, [saa5] = NULL, [mu5] = NULL, [eopis5] = NULL, [eng6] = NULL, [ru6] = NULL, [su6] = NULL, [ra6] = NULL, [sa6] = NULL, [ve6] = NULL, [es6] = NULL, [it6] = NULL, [saa6] = NULL, [mu6] = NULL, [eopis6] = NULL, [eny] = NULL, [ruy] = NULL, [suy] = NULL, [ray] = NULL, [say] = NULL, [vey] = NULL, [esy] = NULL, [ity] = NULL, [saay] = NULL, [muy] = NULL, [eopisy] = NULL, [enn] = NULL, [run] = NULL, [sun] = NULL, [ran] = NULL, [san] = NULL, [ven] = NULL, [esn] = NULL, [itn] = NULL, [saan] = NULL, [mun] = NULL, [eopisn] = NULL, [ven1] = NULL, [vru1] = NULL, [vsu1] = NULL, [vra1] = NULL, [vsa1] = NULL, [vve1] = NULL, [ves1] = NULL, [vit1] = NULL, [vsaa1] = NULL, [vmu1] = NULL, [vyht1] = NULL, [ven2] = NULL, [vru2] = NULL, [vsu2] = NULL, [vra2] = NULL, [vsa2] = NULL, [vve2] = NULL, [ves2] = NULL, [vit2] = NULL, [vsaa2] = NULL, [vmu2] = NULL, [vyht2] = NULL, [ven3] = NULL, [vru3] = NULL, [vsu3] = NULL, [vra3] = NULL, [vsa3] = NULL, [vve3] = NULL, [ves3] = NULL, [vit3] = NULL, [vsaa3] = NULL, [vmu3] = NULL, [vyht3] = NULL, [ven4] = NULL, [vru4] = NULL, [vsu4] = NULL, [vra4] = NULL, [vsa4] = NULL, [vve4] = NULL, [ves4] = NULL, [vit4] = NULL, [vsaa4] = NULL, [vmu4] = NULL, [vyht4] = NULL, [ven5] = NULL, [vru5] = NULL, [vsu5] = NULL, [vra5] = NULL, [vsa5] = NULL, [vve5] = NULL, [ves5] = NULL, [vit5] = NULL, [vsaa5] = NULL, [vmu5] = NULL, [vyht5] = NULL, [ven6] = NULL, [vru6] = NULL, [vsu6] = NULL, [vra6] = NULL, [vsa6] = NULL, [vve6] = NULL, [ves6] = NULL, [vit6] = NULL, [vsaa6] = NULL, [vmu6] = NULL, [vyht6] = NULL, [veny] = NULL, [vruy] = NULL, [vsuy] = NULL, [vray] = NULL, [vsay] = NULL, [vvey] = NULL, [vesy] = NULL, [vity] = NULL, [vsaay] = NULL, [vmuy] = NULL, [vyht] = NULL, [venn] = NULL, [vrun] = NULL, [vsun] = NULL, [vran] = NULL, [vsan] = NULL, [vven] = NULL, [vesn] = NULL, [vitn] = NULL, [vsaan] = NULL, [vmun] = NULL, [vtyt] = NULL, [ov79yc] = NULL, [ov79nc] = NULL, [yaen1] = NULL, [yaru1] = NULL, [yasu1] = NULL, [yara1] = NULL, [yasa1] = NULL, [yave1] = NULL, [yaes1] = NULL, [yait1] = NULL, [yasaa1] = NULL, [yalat1] = NULL, [yamuu1] = NULL, [yaen2] = NULL, [yaru2] = NULL, [yasu2] = NULL, [yara2] = NULL, [yasa2] = NULL, [yave2] = NULL, [yaes2] = NULL, [yait2] = NULL, [yasaa2] = NULL, [yalat2] = NULL, [yamuu2] = NULL, [yyen] = NULL, [yyru] = NULL, [yysu] = NULL, [yyra] = NULL, [yysa] = NULL, [yen] = NULL, [yru] = NULL, [ysu] = NULL, [yra] = NULL, [ysa] = NULL, [yve] = NULL, [yes] = NULL, [yit] = NULL, [ysaa] = NULL, [ylat] = NULL, [ymuu] = NULL, [enyy] = NULL, [ruyy] = NULL, [suyy] = NULL, [rayy] = NULL, [sayy] = NULL, [veyy] = NULL, [esyy] = NULL, [ityy] = NULL, [saayy] = NULL, [layy] = NULL, [muyy] = NULL, [yaen1n] = NULL, [yaru1n] = NULL, [yasu1n] = NULL, [yara1n] = NULL, [yasa1n] = NULL, [yave1n] = NULL, [yaes1n] = NULL, [yait1n] = NULL, [yasaa1n] = NULL, [yalat1n] = NULL, [yamuu1n] = NULL, [yaen2n] = NULL, [yaru2n] = NULL, [yasu2n] = NULL, [yara2n] = NULL, [yasa2n] = NULL, [yave2n] = NULL, [yaes2n] = NULL, [yait2n] = NULL, [yasaa2n] = NULL, [yalat2n] = NULL, [yamuu2n] = NULL, [yyenn] = NULL, [yyrun] = NULL, [yysun] = NULL, [yyran] = NULL, [yysan] = NULL, [yenn] = NULL, [yrun] = NULL, [ysun] = NULL, [yran] = NULL, [ysan] = NULL, [yven] = NULL, [yesn] = NULL, [yitn] = NULL, [ysaan] = NULL, [ylatn] = NULL, [ymuun] = NULL, [ennn] = NULL, [runn] = NULL, [sunn] = NULL, [rann] = NULL, [sann] = NULL, [vennn] = NULL, [esnn] = NULL, [itnn] = NULL, [saann] = NULL, [lann] = NULL, [munn] = NULL, [asv] = NULL, [arv] = NULL, [asvrv] = NULL, [ysv] = NULL, [yrv] = NULL, [ysvrv] = NULL, [sv] = NULL, [rv] = NULL, [svrv] = NULL, [aev] = NULL, [aort] = NULL, [aisl] = NULL, [amu] = NULL, [aet] = NULL, [aeos] = NULL, [akay] = NULL, [yev] = NULL, [yort] = NULL, [yisl] = NULL, [ymu] = NULL, [yet] = NULL, [yeos] = NULL, [ykay] = NULL, [ev] = NULL, [ort] = NULL, [isl] = NULL, [mu] = NULL, [et] = NULL, [eos] = NULL, [kay] = NULL, [ov89yc] = NULL, [ov89nc] = NULL, [ai] = NULL, [rsb] = NULL, [ma] = NULL, [yl] = NULL, [bi] = NULL, [ge] = NULL, [fy] = NULL, [ke] = NULL, [ter] = NULL, [ue] = NULL, [eti] = NULL, [hi] = NULL, [yh] = NULL, [mus] = NULL, [ku] = NULL, [tt]= NULL, [ts]= NULL, [ks] = NULL, [li] = NULL, [ko] = NULL, [yhd] = NULL, [ain] = NULL, [rsbn] = NULL, [man] = NULL, [yln] = NULL, [bin] = NULL, [gen] = NULL, [fyn] = NULL, [ken] = NULL, [tern] = NULL, [uen] = NULL, [etin] = NULL, [hin] = NULL, [yhn] = NULL, [musn] = NULL, [kun] = NULL, [ttn]= NULL, [tsn]= NULL, [ksn] = NULL, [lin] = NULL, [kon] = NULL, [yhdn] = NULL, [tietop] = NULL, [tietok] = NULL, [tietoi] = NULL, [verkko] = NULL, [kaytto] = NULL
      --
	  ,[tietolahde]='K2.22b_sopv22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_22] f 
  WHERE (oppilas = '1' and (esi = '2' or luokka in ('01','02','03','04','05','06','07','08','09'))) 
    or (oppilas = '2' and aik = '2')
  GROUP BY tilv, jarj, tunn

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = NULL
      ,[edala] = NULL
      ,[edyla] = NULL
      ,[edlisa] = NULL
      ,[edainep] = NULL
      ,[syesi] = NULL
      ,[syala] = NULL
      ,[syyla] = NULL
      ,[sylisa] = NULL
      ,[symamu] = NULL
      ,[sylukio] = NULL
      ,[syamm] = NULL
      ,[symuu] = NULL
      ,[keve] = NULL--sum(case when oppilas = '2' and luokka = '00' then lkm else 0 end)
      ,[keven] = NULL--sum(case when oppilas = '2' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[kev1] = NULL--sum(case when oppilas = '2' and luokka = '01' then lkm else 0 end)
      ,[kev1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[kev2] = NULL--sum(case when oppilas = '2' and luokka = '02' then lkm else 0 end)
      ,[kev2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[kev3] = NULL--sum(case when oppilas = '2' and luokka = '03' then lkm else 0 end)
      ,[kev3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[kev4] = NULL--sum(case when oppilas = '2' and luokka = '04' then lkm else 0 end)
      ,[kev4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[kev5] = NULL--sum(case when oppilas = '2' and luokka = '05' then lkm else 0 end)
      ,[kev5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[kev6] = NULL--sum(case when oppilas = '2' and luokka = '06' then lkm else 0 end)
      ,[kev6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[kev7] = NULL--sum(case when oppilas = '2' and luokka = '07' then lkm else 0 end)
      ,[kev7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[kev8] = NULL--sum(case when oppilas = '2' and luokka = '08' then lkm else 0 end)
      ,[kev8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[kev9] = NULL--sum(case when oppilas = '2' and luokka = '09' then lkm else 0 end)
      ,[kev9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[kev10] = NULL--sum(case when oppilas = '2' and luokka = '10' then lkm else 0 end)
      ,[kev10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[kev] = NULL--sum(case when oppilas = '2' and jaaluok = '1' then lkm else 0 end)
      ,[kevn] = NULL--sum(case when oppilas = '2' and sp = '2' and jaaluok = '1' then lkm else 0 end)
      ,[luok1] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' then lkm else 0 end)
      ,[luok1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok2] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' then lkm else 0 end)
      ,[luok2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok3] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' then lkm else 0 end)
      ,[luok3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok4] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' then lkm else 0 end)
      ,[luok4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok5] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' then lkm else 0 end)
      ,[luok5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok6] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' then lkm else 0 end)
      ,[luok6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok7] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' then lkm else 0 end)
      ,[luok7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok8] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' then lkm else 0 end)
      ,[luok8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok9] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' then lkm else 0 end)
      ,[luok9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' then lkm else 0 end)
      ,[luokn] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[kelaim] = NULL
      ,[kelaimn] = NULL
      ,[tod] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[todn] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[tutkt] = NULL
      ,[tutktn] = NULL
      ,[suor10] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[suor10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[oeriy] = NULL
      ,[oeriyn] = NULL
      ,[ilmtod] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 then lkm else 0 end)
      ,[ilmtodn] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 and sp = '2' then lkm else 0 end)
      ,[aku] = NULL
      ,[mamukurs] = NULL
      ,[oppkurs] = NULL
      ,[muukurs] = NULL
      ,[akukurs] = NULL
      ,[kmamu]  = NULL
      ,[kmamun]  = NULL
      ,[syulkom] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[syulkomn] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[sykoti] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[sykotin] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[ika4e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 then lkm else 0 end)
      ,[ika4en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 and sp = '2' then lkm else 0 end)
      ,[ika5e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 then lkm else 0 end)
      ,[ika5en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 and sp = '2' then lkm else 0 end)
      ,[pid5v] = NULL
      ,[ika6e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 then lkm else 0 end)
      ,[ika6en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 and sp = '2' then lkm else 0 end)
      ,[ika7e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 then lkm else 0 end)
      ,[ika7en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 and sp = '2' then lkm else 0 end)
      ,[ikae] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 then lkm else 0 end)
      ,[ikaen] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 and sp = '2' then lkm else 0 end)
      ,[ove] = sum(case when oppilas = '1' and luokka = '00' then lkm else 0 end)
      ,[ov1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ov2] = sum(case when oppilas = '1' and luokka = '02' then lkm else 0 end)
      ,[ov3] = sum(case when oppilas = '1' and luokka = '03' then lkm else 0 end)
      ,[ov4] = sum(case when oppilas = '1' and luokka = '04' then lkm else 0 end)
      ,[ov5] = sum(case when oppilas = '1' and luokka = '05' then lkm else 0 end)
      ,[ov6] = sum(case when oppilas = '1' and luokka = '06' then lkm else 0 end)
      ,[ov7] = sum(case when oppilas = '1' and luokka = '07' then lkm else 0 end)
      ,[ov8] = sum(case when oppilas = '1' and luokka = '08' then lkm else 0 end)
      ,[ov9] = sum(case when oppilas = '1' and luokka = '09' then lkm else 0 end)
      ,[ov10] = sum(case when oppilas = '1' and luokka = '10' then lkm else 0 end)
      ,[ovy] = sum(case when oppilas = '1' then lkm else 0 end)
      --
	  ,[tehoe] = NULL, [teho1] = NULL, [teho2] = NULL, [teho3] = NULL, [teho4] = NULL, [teho5] = NULL, [teho6] = NULL, [teho7] = NULL, [teho8] = NULL, [teho9] = NULL, [teho10] = NULL, [tehoy] = NULL, [eipide] = NULL, [eipid1] = NULL, [eipid2] = NULL, [eipid3] = NULL, [eipid4] = NULL, [eipid5] = NULL, [eipid6] = NULL, [eipid7] = NULL, [eipid8] = NULL, [eipid9] = NULL, [eipid10] = NULL, [eipidy] = NULL, [ertuve] = NULL, [ertuv1] = NULL, [ertuv2] = NULL, [ertuv3] = NULL, [ertuv4] = NULL, [ertuv5] = NULL, [ertuv6] = NULL, [ertuv7] = NULL, [ertuv8] = NULL, [ertuv9] = NULL, [ertuv10] = NULL, [ertuvy] = NULL, [ertume] = NULL, [ertum1] = NULL, [ertum2] = NULL, [ertum3] = NULL, [ertum4] = NULL, [ertum5] = NULL, [ertum6] = NULL, [ertum7] = NULL, [ertum8] = NULL, [ertum9] = NULL, [ertum10] = NULL, [ertumy] = NULL, [tavove] = NULL, [tavov1] = NULL, [tavov2] = NULL, [tavov3] = NULL, [tavov4] = NULL, [tavov5] = NULL, [tavov6] = NULL, [tavov7] = NULL, [tavov8] = NULL, [tavov9] = NULL, [tavov10] = NULL, [tavovy] = NULL
      --
	  ,[oven] = sum(case when oppilas = '1' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[ov1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[ov2n] = sum(case when oppilas = '1' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[ov3n] = sum(case when oppilas = '1' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[ov4n] = sum(case when oppilas = '1' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[ov5n] = sum(case when oppilas = '1' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[ov6n] = sum(case when oppilas = '1' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[ov7n] = sum(case when oppilas = '1' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[ov8n] = sum(case when oppilas = '1' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[ov9n] = sum(case when oppilas = '1' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[ov10n] = sum(case when oppilas = '1' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[ovyn] = sum(case when oppilas = '1' and sp = '2' then lkm else 0 end)
	  --
      ,[tehoen] = NULL, [teho1n] = NULL, [teho2n] = NULL, [teho3n] = NULL, [teho4n] = NULL, [teho5n] = NULL, [teho6n] = NULL, [teho7n] = NULL, [teho8n] = NULL, [teho9n] = NULL, [teho10n] = NULL, [tehoyn] = NULL, [eipiden] = NULL, [eipid1n] = NULL, [eipid2n] = NULL, [eipid3n] = NULL, [eipid4n] = NULL, [eipid5n] = NULL, [eipid6n] = NULL, [eipid7n] = NULL, [eipid8n] = NULL, [eipid9n] = NULL, [eipid10n] = NULL, [eipidyn] = NULL, [ertuven] = NULL, [ertuv1n] = NULL, [ertuv2n] = NULL, [ertuv3n] = NULL, [ertuv4n] = NULL, [ertuv5n] = NULL, [ertuv6n] = NULL, [ertuv7n] = NULL, [ertuv8n] = NULL, [ertuv9n] = NULL, [ertuv10n] = NULL, [ertuvyn] = NULL, [ertumen] = NULL, [ertum1n] = NULL, [ertum2n] = NULL, [ertum3n] = NULL, [ertum4n] = NULL, [ertum5n] = NULL, [ertum6n] = NULL, [ertum7n] = NULL, [ertum8n] = NULL, [ertum9n] = NULL, [ertum10n] = NULL, [ertumyn] = NULL, [tavoven] = NULL, [tavov1n] = NULL, [tavov2n] = NULL, [tavov3n] = NULL, [tavov4n] = NULL, [tavov5n] = NULL, [tavov6n] = NULL, [tavov7n] = NULL, [tavov8n] = NULL, [tavov9n] = NULL, [tavov10n] = NULL, [tavovyn] = NULL, [eipidec] = NULL, [eipidpc] = NULL, [eipidlc] = NULL, [eipidyc] = NULL, [ertuvec] = NULL, [ertuvpc] = NULL, [ertuvlc] = NULL, [ertuvyc] = NULL, [ertumec] = NULL, [ertumpc] = NULL, [ertumlc] = NULL, [ertumyc] = NULL, [muuec] = NULL, [muupc] = NULL, [muulc] = NULL, [muuyc] = NULL, [ovec] = NULL, [ovpc] = NULL, [ovlc] = NULL, [ovyc] = NULL, [sisae] = NULL, [sisap] = NULL, [sisal] = NULL, [sisam] = NULL, [sisay] = NULL, [maeipide] = NULL, [maeipidp] = NULL, [maeipidl] = NULL, [maeipidy] = NULL, [maertuve] = NULL, [maertuvp] = NULL, [maertuvl] = NULL, [maertuvy] = NULL, [maertume] = NULL, [maertump] = NULL, [maertuml] = NULL, [maertumy] = NULL, [mamuue] = NULL, [mamuup] = NULL, [mamuul] = NULL, [mamuuy] = NULL, [maove] = NULL, [maovp] = NULL, [maovl] = NULL, [maovy] = NULL, [kueipide] = NULL, [kueipidp] = NULL, [kueipidl] = NULL, [kueipidy] = NULL, [kuertuve] = NULL, [kuertuvp] = NULL, [kuertuvl] = NULL, [kuertuvy] = NULL, [kuertume] = NULL, [kuertump] = NULL, [kuertuml] = NULL, [kuertumy] = NULL, [kumuue] = NULL, [kumuup] = NULL, [kumuul] = NULL, [kumuuy] = NULL, [kuove] = NULL, [kuovp] = NULL, [kuovl] = NULL, [kuovy] = NULL, [vieipide] = NULL, [vieipidp] = NULL, [vieipidl] = NULL, [vieipidy] = NULL, [viertuve] = NULL, [viertuvp] = NULL, [viertuvl] = NULL, [viertuvy] = NULL, [viertume] = NULL, [viertump] = NULL, [viertuml] = NULL, [viertumy] = NULL, [vimuue] = NULL, [vimuup] = NULL, [vimuul] = NULL, [vimuuy] = NULL
	  --
      ,[viove] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '00' then lkm else 0 end)
      ,[viovp] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and cast(luokka as int) between 1 and 9 then lkm else 0 end)
      ,[viovl] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '10' then lkm else 0 end)
      ,[viovy] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') then lkm else 0 end)
      ,[ika61] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 then lkm else 0 end)
      ,[ika61n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 and sp = '2' then lkm else 0 end)
      ,[ika71] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 then lkm else 0 end)
      ,[ika71n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 and sp = '2' then lkm else 0 end)
      ,[ika81] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 then lkm else 0 end)
      ,[ika81n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 and sp = '2' then lkm else 0 end)
      ,[ika91] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 then lkm else 0 end)
      ,[ika91n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 and sp = '2' then lkm else 0 end)
      ,[ika1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ika1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[lykk] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' then lkm else 0 end)
      ,[lykkn] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' and sp = '2' then lkm else 0 end)
      ,[jopo] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 then lkm else 0 end)
      ,[jopon] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 and sp = '2' then lkm else 0 end)
	  --
      ,[kan17v] = NULL, [muu17v] = NULL, [op17v] = NULL, [lukoko] = NULL, [lukokon] = NULL, [luib] = NULL, [luibn] = NULL, [reife] = NULL, [reifen] = NULL, [gymn]= NULL, [gymnn]= NULL, [lueb] = NULL, [luebn] = NULL, [lukio] = NULL, [lukion] = NULL, [opsamm]= NULL, [opsammn]= NULL, [muuamm]= NULL, [muuammn]= NULL, [amm] = NULL, [ammn] = NULL, [peain] = NULL, [peainn] = NULL, [luain] = NULL, [luainn] = NULL, [vapsiv] = NULL, [vapsivn] = NULL, [taiop] = NULL, [taiopn] = NULL, [muukoul] = NULL, [muukouln] = NULL, [muuop] = NULL, [muuopn] = NULL, [tehoec] = NULL, [teho16c] = NULL, [teho79c] = NULL, [teholc] = NULL, [tehoyc] = NULL, [ertuec] = NULL, [ertu16c] = NULL, [ertu79c] = NULL, [ertulc] = NULL, [ertuyc] = NULL, [eritec] = NULL, [erit16c] = NULL, [erit79c] = NULL, [eritlc] = NULL, [erityc] = NULL, [inte4] = NULL, [int164] = NULL, [int794] = NULL, [intl4] = NULL, [inty4] = NULL, [inte3] = NULL, [int163] = NULL, [int793] = NULL, [intl3] = NULL, [inty3] = NULL, [inte2] = NULL, [int162] = NULL, [int792] = NULL, [intl2] = NULL, [inty2] = NULL, [inte1] = NULL, [int161] = NULL, [int791] = NULL, [intl1] = NULL, [inty1] = NULL, [inte0] = NULL, [int160] = NULL, [int790] = NULL, [intl0] = NULL, [inty0] = NULL, [intey] = NULL, [int16y] = NULL, [int79y] = NULL, [intly] = NULL, [intyy] = NULL, [yks160] = NULL, [yks790] = NULL, [yksl0] = NULL, [yksy0] = NULL, [yks161] = NULL, [yks791] = NULL, [yksl1] = NULL, [yksy1] = NULL, [yks162] = NULL, [yks792] = NULL, [yksl2] = NULL, [yksy2] = NULL, [yks164] = NULL, [yks794] = NULL, [yksl4] = NULL, [yksy4] = NULL, [yks16t] = NULL, [yks79t] = NULL, [ykslt] = NULL, [yksyt] = NULL, [yks16y] = NULL, [yks79y] = NULL, [yksly] = NULL, [yksyy] = NULL, [tehoosa] = NULL, [ertuosa] = NULL, [eritosa] = NULL, [tehotuki] = NULL, [ertutuki] = NULL, [erittuki] = NULL, [tehoavu] = NULL, [ertuavu] = NULL, [eritavu] = NULL, [tehomuu] = NULL, [ertumuu] = NULL, [eritmuu] = NULL, [alc] = NULL, [ylc] = NULL, [luc] = NULL, [amc] = NULL, [alkieli0] = NULL, [alkieli1] = NULL, [alkieli2] = NULL, [alkieli3] = NULL, [alkieli4] = NULL, [alkieliy] = NULL, [ylkieli0] = NULL, [ylkieli1] = NULL, [ylkieli2] = NULL, [ylkieli3] = NULL, [ylkieli4] = NULL, [ylkieli5] = NULL, [ylkieliy] = NULL, [lukieli0] = NULL, [lukieli1] = NULL, [lukieli2] = NULL, [lukieli3] = NULL, [lukieli4] = NULL, [lukieli5] = NULL, [lukieli6] = NULL, [lukieliy] = NULL, [amkieli0] = NULL, [amkieli1] = NULL, [amkieli2] = NULL, [amkieli3] = NULL, [amkieli4] = NULL, [amkieli5] = NULL, [amkieli6] = NULL, [amkieliy] = NULL, [aleny] = NULL, [alruy] = NULL, [alsuy] = NULL, [alray] = NULL, [alsay] = NULL, [alvey] = NULL, [alesy] = NULL, [ality] = NULL, [alsaay] = NULL, [almuy] = NULL, [yleny] = NULL, [ylruy] = NULL, [ylsuy] = NULL, [ylray] = NULL, [ylsay] = NULL, [ylvey] = NULL, [ylesy] = NULL, [ylity] = NULL, [ylsaay] = NULL, [yllaty] = NULL, [ylmuy] = NULL, [lueny] = NULL, [luruy] = NULL, [lusuy] = NULL, [luray] = NULL, [lusay] = NULL, [luvey] = NULL, [luesy] = NULL, [luity] = NULL, [lusaay] = NULL, [lulaty] = NULL, [lumuy] = NULL, [ameny] = NULL, [amruy] = NULL, [amsuy] = NULL, [amray] = NULL, [amsay] = NULL, [amvey] = NULL, [amesy] = NULL, [amity] = NULL, [amsaay] = NULL, [amlaty] = NULL, [ammuy] = NULL, [ov1c] = NULL, [ov2c] = NULL, [ov3c] = NULL, [ov4c] = NULL, [ov5c] = NULL, [ov6c] = NULL, [ov16yc] = NULL, [ov16nc] = NULL, [eng1] = NULL, [ru1] = NULL, [su1] = NULL, [ra1] = NULL, [sa1] = NULL, [ve1] = NULL, [es1] = NULL, [it1] = NULL, [saa1] = NULL, [mu1] = NULL, [eopis1] = NULL, [eng2] = NULL, [ru2] = NULL, [su2] = NULL, [ra2] = NULL, [sa2] = NULL, [ve2] = NULL, [es2] = NULL, [it2] = NULL, [saa2] = NULL, [mu2] = NULL, [eopis2] = NULL, [eng3] = NULL, [ru3] = NULL, [su3] = NULL, [ra3] = NULL, [sa3] = NULL, [ve3] = NULL, [es3] = NULL, [it3] = NULL, [saa3] = NULL, [mu3] = NULL, [eopis3] = NULL, [eng4] = NULL, [ru4] = NULL, [su4] = NULL, [ra4] = NULL, [sa4] = NULL, [ve4] = NULL, [es4] = NULL, [it4] = NULL, [saa4] = NULL, [mu4] = NULL, [eopis4] = NULL, [eng5] = NULL, [ru5] = NULL, [su5] = NULL, [ra5] = NULL, [sa5] = NULL, [ve5] = NULL, [es5] = NULL, [it5] = NULL, [saa5] = NULL, [mu5] = NULL, [eopis5] = NULL, [eng6] = NULL, [ru6] = NULL, [su6] = NULL, [ra6] = NULL, [sa6] = NULL, [ve6] = NULL, [es6] = NULL, [it6] = NULL, [saa6] = NULL, [mu6] = NULL, [eopis6] = NULL, [eny] = NULL, [ruy] = NULL, [suy] = NULL, [ray] = NULL, [say] = NULL, [vey] = NULL, [esy] = NULL, [ity] = NULL, [saay] = NULL, [muy] = NULL, [eopisy] = NULL, [enn] = NULL, [run] = NULL, [sun] = NULL, [ran] = NULL, [san] = NULL, [ven] = NULL, [esn] = NULL, [itn] = NULL, [saan] = NULL, [mun] = NULL, [eopisn] = NULL, [ven1] = NULL, [vru1] = NULL, [vsu1] = NULL, [vra1] = NULL, [vsa1] = NULL, [vve1] = NULL, [ves1] = NULL, [vit1] = NULL, [vsaa1] = NULL, [vmu1] = NULL, [vyht1] = NULL, [ven2] = NULL, [vru2] = NULL, [vsu2] = NULL, [vra2] = NULL, [vsa2] = NULL, [vve2] = NULL, [ves2] = NULL, [vit2] = NULL, [vsaa2] = NULL, [vmu2] = NULL, [vyht2] = NULL, [ven3] = NULL, [vru3] = NULL, [vsu3] = NULL, [vra3] = NULL, [vsa3] = NULL, [vve3] = NULL, [ves3] = NULL, [vit3] = NULL, [vsaa3] = NULL, [vmu3] = NULL, [vyht3] = NULL, [ven4] = NULL, [vru4] = NULL, [vsu4] = NULL, [vra4] = NULL, [vsa4] = NULL, [vve4] = NULL, [ves4] = NULL, [vit4] = NULL, [vsaa4] = NULL, [vmu4] = NULL, [vyht4] = NULL, [ven5] = NULL, [vru5] = NULL, [vsu5] = NULL, [vra5] = NULL, [vsa5] = NULL, [vve5] = NULL, [ves5] = NULL, [vit5] = NULL, [vsaa5] = NULL, [vmu5] = NULL, [vyht5] = NULL, [ven6] = NULL, [vru6] = NULL, [vsu6] = NULL, [vra6] = NULL, [vsa6] = NULL, [vve6] = NULL, [ves6] = NULL, [vit6] = NULL, [vsaa6] = NULL, [vmu6] = NULL, [vyht6] = NULL, [veny] = NULL, [vruy] = NULL, [vsuy] = NULL, [vray] = NULL, [vsay] = NULL, [vvey] = NULL, [vesy] = NULL, [vity] = NULL, [vsaay] = NULL, [vmuy] = NULL, [vyht] = NULL, [venn] = NULL, [vrun] = NULL, [vsun] = NULL, [vran] = NULL, [vsan] = NULL, [vven] = NULL, [vesn] = NULL, [vitn] = NULL, [vsaan] = NULL, [vmun] = NULL, [vtyt] = NULL, [ov79yc] = NULL, [ov79nc] = NULL, [yaen1] = NULL, [yaru1] = NULL, [yasu1] = NULL, [yara1] = NULL, [yasa1] = NULL, [yave1] = NULL, [yaes1] = NULL, [yait1] = NULL, [yasaa1] = NULL, [yalat1] = NULL, [yamuu1] = NULL, [yaen2] = NULL, [yaru2] = NULL, [yasu2] = NULL, [yara2] = NULL, [yasa2] = NULL, [yave2] = NULL, [yaes2] = NULL, [yait2] = NULL, [yasaa2] = NULL, [yalat2] = NULL, [yamuu2] = NULL, [yyen] = NULL, [yyru] = NULL, [yysu] = NULL, [yyra] = NULL, [yysa] = NULL, [yen] = NULL, [yru] = NULL, [ysu] = NULL, [yra] = NULL, [ysa] = NULL, [yve] = NULL, [yes] = NULL, [yit] = NULL, [ysaa] = NULL, [ylat] = NULL, [ymuu] = NULL, [enyy] = NULL, [ruyy] = NULL, [suyy] = NULL, [rayy] = NULL, [sayy] = NULL, [veyy] = NULL, [esyy] = NULL, [ityy] = NULL, [saayy] = NULL, [layy] = NULL, [muyy] = NULL, [yaen1n] = NULL, [yaru1n] = NULL, [yasu1n] = NULL, [yara1n] = NULL, [yasa1n] = NULL, [yave1n] = NULL, [yaes1n] = NULL, [yait1n] = NULL, [yasaa1n] = NULL, [yalat1n] = NULL, [yamuu1n] = NULL, [yaen2n] = NULL, [yaru2n] = NULL, [yasu2n] = NULL, [yara2n] = NULL, [yasa2n] = NULL, [yave2n] = NULL, [yaes2n] = NULL, [yait2n] = NULL, [yasaa2n] = NULL, [yalat2n] = NULL, [yamuu2n] = NULL, [yyenn] = NULL, [yyrun] = NULL, [yysun] = NULL, [yyran] = NULL, [yysan] = NULL, [yenn] = NULL, [yrun] = NULL, [ysun] = NULL, [yran] = NULL, [ysan] = NULL, [yven] = NULL, [yesn] = NULL, [yitn] = NULL, [ysaan] = NULL, [ylatn] = NULL, [ymuun] = NULL, [ennn] = NULL, [runn] = NULL, [sunn] = NULL, [rann] = NULL, [sann] = NULL, [vennn] = NULL, [esnn] = NULL, [itnn] = NULL, [saann] = NULL, [lann] = NULL, [munn] = NULL, [asv] = NULL, [arv] = NULL, [asvrv] = NULL, [ysv] = NULL, [yrv] = NULL, [ysvrv] = NULL, [sv] = NULL, [rv] = NULL, [svrv] = NULL, [aev] = NULL, [aort] = NULL, [aisl] = NULL, [amu] = NULL, [aet] = NULL, [aeos] = NULL, [akay] = NULL, [yev] = NULL, [yort] = NULL, [yisl] = NULL, [ymu] = NULL, [yet] = NULL, [yeos] = NULL, [ykay] = NULL, [ev] = NULL, [ort] = NULL, [isl] = NULL, [mu] = NULL, [et] = NULL, [eos] = NULL, [kay] = NULL, [ov89yc] = NULL, [ov89nc] = NULL, [ai] = NULL, [rsb] = NULL, [ma] = NULL, [yl] = NULL, [bi] = NULL, [ge] = NULL, [fy] = NULL, [ke] = NULL, [ter] = NULL, [ue] = NULL, [eti] = NULL, [hi] = NULL, [yh] = NULL, [mus] = NULL, [ku] = NULL, [tt]= NULL, [ts]= NULL, [ks] = NULL, [li] = NULL, [ko] = NULL, [yhd] = NULL, [ain] = NULL, [rsbn] = NULL, [man] = NULL, [yln] = NULL, [bin] = NULL, [gen] = NULL, [fyn] = NULL, [ken] = NULL, [tern] = NULL, [uen] = NULL, [etin] = NULL, [hin] = NULL, [yhn] = NULL, [musn] = NULL, [kun] = NULL, [ttn]= NULL, [tsn]= NULL, [ksn] = NULL, [lin] = NULL, [kon] = NULL, [yhdn] = NULL, [tietop] = NULL, [tietok] = NULL, [tietoi] = NULL, [verkko] = NULL, [kaytto] = NULL
      --
	  ,[tietolahde]='K2.22b_sopv23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_23] f 
  WHERE (oppilas = '1' and (esi = '2' or luokka in ('01','02','03','04','05','06','07','08','09'))) 
    or (oppilas = '2' and aik = '2')
  GROUP BY tilv, jarj, tunn

UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = NULL
      ,[edala] = NULL
      ,[edyla] = NULL
      ,[edlisa] = NULL
      ,[edainep] = NULL
      ,[syesi] = NULL
      ,[syala] = NULL
      ,[syyla] = NULL
      ,[sylisa] = NULL
      ,[symamu] = NULL
      ,[sylukio] = NULL
      ,[syamm] = NULL
      ,[symuu] = NULL
      ,[keve] = NULL--sum(case when oppilas = '2' and luokka = '00' then lkm else 0 end)
      ,[keven] = NULL--sum(case when oppilas = '2' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[kev1] = NULL--sum(case when oppilas = '2' and luokka = '01' then lkm else 0 end)
      ,[kev1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[kev2] = NULL--sum(case when oppilas = '2' and luokka = '02' then lkm else 0 end)
      ,[kev2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[kev3] = NULL--sum(case when oppilas = '2' and luokka = '03' then lkm else 0 end)
      ,[kev3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[kev4] = NULL--sum(case when oppilas = '2' and luokka = '04' then lkm else 0 end)
      ,[kev4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[kev5] = NULL--sum(case when oppilas = '2' and luokka = '05' then lkm else 0 end)
      ,[kev5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[kev6] = NULL--sum(case when oppilas = '2' and luokka = '06' then lkm else 0 end)
      ,[kev6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[kev7] = NULL--sum(case when oppilas = '2' and luokka = '07' then lkm else 0 end)
      ,[kev7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[kev8] = NULL--sum(case when oppilas = '2' and luokka = '08' then lkm else 0 end)
      ,[kev8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[kev9] = NULL--sum(case when oppilas = '2' and luokka = '09' then lkm else 0 end)
      ,[kev9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[kev10] = NULL--sum(case when oppilas = '2' and luokka = '10' then lkm else 0 end)
      ,[kev10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[kev] = NULL--sum(case when oppilas = '2' and jaaluok = '1' then lkm else 0 end)
      ,[kevn] = NULL--sum(case when oppilas = '2' and sp = '2' and jaaluok = '1' then lkm else 0 end)
      ,[luok1] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' then lkm else 0 end)
      ,[luok1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok2] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' then lkm else 0 end)
      ,[luok2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok3] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' then lkm else 0 end)
      ,[luok3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok4] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' then lkm else 0 end)
      ,[luok4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok5] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' then lkm else 0 end)
      ,[luok5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok6] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' then lkm else 0 end)
      ,[luok6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok7] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' then lkm else 0 end)
      ,[luok7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok8] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' then lkm else 0 end)
      ,[luok8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok9] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' then lkm else 0 end)
      ,[luok9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' then lkm else 0 end)
      ,[luokn] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[kelaim] = NULL
      ,[kelaimn] = NULL
      ,[tod] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[todn] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[tutkt] = NULL
      ,[tutktn] = NULL
      ,[suor10] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[suor10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[oeriy] = NULL
      ,[oeriyn] = NULL
      ,[ilmtod] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 then lkm else 0 end)
      ,[ilmtodn] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 and sp = '2' then lkm else 0 end)
      ,[aku] = NULL
      ,[mamukurs] = NULL
      ,[oppkurs] = NULL
      ,[muukurs] = NULL
      ,[akukurs] = NULL
      ,[kmamu]  = NULL
      ,[kmamun]  = NULL
      ,[syulkom] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[syulkomn] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[sykoti] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[sykotin] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[ika4e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 then lkm else 0 end)
      ,[ika4en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 and sp = '2' then lkm else 0 end)
      ,[ika5e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 then lkm else 0 end)
      ,[ika5en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 and sp = '2' then lkm else 0 end)
      ,[pid5v] = NULL
      ,[ika6e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 then lkm else 0 end)
      ,[ika6en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 and sp = '2' then lkm else 0 end)
      ,[ika7e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 then lkm else 0 end)
      ,[ika7en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 and sp = '2' then lkm else 0 end)
      ,[ikae] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 then lkm else 0 end)
      ,[ikaen] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 and sp = '2' then lkm else 0 end)
      ,[ove] = sum(case when oppilas = '1' and luokka = '00' then lkm else 0 end)
      ,[ov1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ov2] = sum(case when oppilas = '1' and luokka = '02' then lkm else 0 end)
      ,[ov3] = sum(case when oppilas = '1' and luokka = '03' then lkm else 0 end)
      ,[ov4] = sum(case when oppilas = '1' and luokka = '04' then lkm else 0 end)
      ,[ov5] = sum(case when oppilas = '1' and luokka = '05' then lkm else 0 end)
      ,[ov6] = sum(case when oppilas = '1' and luokka = '06' then lkm else 0 end)
      ,[ov7] = sum(case when oppilas = '1' and luokka = '07' then lkm else 0 end)
      ,[ov8] = sum(case when oppilas = '1' and luokka = '08' then lkm else 0 end)
      ,[ov9] = sum(case when oppilas = '1' and luokka = '09' then lkm else 0 end)
      ,[ov10] = sum(case when oppilas = '1' and luokka = '10' then lkm else 0 end)
      ,[ovy] = sum(case when oppilas = '1' then lkm else 0 end)
      --
	  ,[tehoe] = NULL, [teho1] = NULL, [teho2] = NULL, [teho3] = NULL, [teho4] = NULL, [teho5] = NULL, [teho6] = NULL, [teho7] = NULL, [teho8] = NULL, [teho9] = NULL, [teho10] = NULL, [tehoy] = NULL, [eipide] = NULL, [eipid1] = NULL, [eipid2] = NULL, [eipid3] = NULL, [eipid4] = NULL, [eipid5] = NULL, [eipid6] = NULL, [eipid7] = NULL, [eipid8] = NULL, [eipid9] = NULL, [eipid10] = NULL, [eipidy] = NULL, [ertuve] = NULL, [ertuv1] = NULL, [ertuv2] = NULL, [ertuv3] = NULL, [ertuv4] = NULL, [ertuv5] = NULL, [ertuv6] = NULL, [ertuv7] = NULL, [ertuv8] = NULL, [ertuv9] = NULL, [ertuv10] = NULL, [ertuvy] = NULL, [ertume] = NULL, [ertum1] = NULL, [ertum2] = NULL, [ertum3] = NULL, [ertum4] = NULL, [ertum5] = NULL, [ertum6] = NULL, [ertum7] = NULL, [ertum8] = NULL, [ertum9] = NULL, [ertum10] = NULL, [ertumy] = NULL, [tavove] = NULL, [tavov1] = NULL, [tavov2] = NULL, [tavov3] = NULL, [tavov4] = NULL, [tavov5] = NULL, [tavov6] = NULL, [tavov7] = NULL, [tavov8] = NULL, [tavov9] = NULL, [tavov10] = NULL, [tavovy] = NULL
      --
	  ,[oven] = sum(case when oppilas = '1' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[ov1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[ov2n] = sum(case when oppilas = '1' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[ov3n] = sum(case when oppilas = '1' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[ov4n] = sum(case when oppilas = '1' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[ov5n] = sum(case when oppilas = '1' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[ov6n] = sum(case when oppilas = '1' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[ov7n] = sum(case when oppilas = '1' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[ov8n] = sum(case when oppilas = '1' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[ov9n] = sum(case when oppilas = '1' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[ov10n] = sum(case when oppilas = '1' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[ovyn] = sum(case when oppilas = '1' and sp = '2' then lkm else 0 end)
	  --
      ,[tehoen] = NULL, [teho1n] = NULL, [teho2n] = NULL, [teho3n] = NULL, [teho4n] = NULL, [teho5n] = NULL, [teho6n] = NULL, [teho7n] = NULL, [teho8n] = NULL, [teho9n] = NULL, [teho10n] = NULL, [tehoyn] = NULL, [eipiden] = NULL, [eipid1n] = NULL, [eipid2n] = NULL, [eipid3n] = NULL, [eipid4n] = NULL, [eipid5n] = NULL, [eipid6n] = NULL, [eipid7n] = NULL, [eipid8n] = NULL, [eipid9n] = NULL, [eipid10n] = NULL, [eipidyn] = NULL, [ertuven] = NULL, [ertuv1n] = NULL, [ertuv2n] = NULL, [ertuv3n] = NULL, [ertuv4n] = NULL, [ertuv5n] = NULL, [ertuv6n] = NULL, [ertuv7n] = NULL, [ertuv8n] = NULL, [ertuv9n] = NULL, [ertuv10n] = NULL, [ertuvyn] = NULL, [ertumen] = NULL, [ertum1n] = NULL, [ertum2n] = NULL, [ertum3n] = NULL, [ertum4n] = NULL, [ertum5n] = NULL, [ertum6n] = NULL, [ertum7n] = NULL, [ertum8n] = NULL, [ertum9n] = NULL, [ertum10n] = NULL, [ertumyn] = NULL, [tavoven] = NULL, [tavov1n] = NULL, [tavov2n] = NULL, [tavov3n] = NULL, [tavov4n] = NULL, [tavov5n] = NULL, [tavov6n] = NULL, [tavov7n] = NULL, [tavov8n] = NULL, [tavov9n] = NULL, [tavov10n] = NULL, [tavovyn] = NULL, [eipidec] = NULL, [eipidpc] = NULL, [eipidlc] = NULL, [eipidyc] = NULL, [ertuvec] = NULL, [ertuvpc] = NULL, [ertuvlc] = NULL, [ertuvyc] = NULL, [ertumec] = NULL, [ertumpc] = NULL, [ertumlc] = NULL, [ertumyc] = NULL, [muuec] = NULL, [muupc] = NULL, [muulc] = NULL, [muuyc] = NULL, [ovec] = NULL, [ovpc] = NULL, [ovlc] = NULL, [ovyc] = NULL, [sisae] = NULL, [sisap] = NULL, [sisal] = NULL, [sisam] = NULL, [sisay] = NULL, [maeipide] = NULL, [maeipidp] = NULL, [maeipidl] = NULL, [maeipidy] = NULL, [maertuve] = NULL, [maertuvp] = NULL, [maertuvl] = NULL, [maertuvy] = NULL, [maertume] = NULL, [maertump] = NULL, [maertuml] = NULL, [maertumy] = NULL, [mamuue] = NULL, [mamuup] = NULL, [mamuul] = NULL, [mamuuy] = NULL, [maove] = NULL, [maovp] = NULL, [maovl] = NULL, [maovy] = NULL, [kueipide] = NULL, [kueipidp] = NULL, [kueipidl] = NULL, [kueipidy] = NULL, [kuertuve] = NULL, [kuertuvp] = NULL, [kuertuvl] = NULL, [kuertuvy] = NULL, [kuertume] = NULL, [kuertump] = NULL, [kuertuml] = NULL, [kuertumy] = NULL, [kumuue] = NULL, [kumuup] = NULL, [kumuul] = NULL, [kumuuy] = NULL, [kuove] = NULL, [kuovp] = NULL, [kuovl] = NULL, [kuovy] = NULL, [vieipide] = NULL, [vieipidp] = NULL, [vieipidl] = NULL, [vieipidy] = NULL, [viertuve] = NULL, [viertuvp] = NULL, [viertuvl] = NULL, [viertuvy] = NULL, [viertume] = NULL, [viertump] = NULL, [viertuml] = NULL, [viertumy] = NULL, [vimuue] = NULL, [vimuup] = NULL, [vimuul] = NULL, [vimuuy] = NULL
	  --
      ,[viove] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '00' then lkm else 0 end)
      ,[viovp] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and cast(luokka as int) between 1 and 9 then lkm else 0 end)
      ,[viovl] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '10' then lkm else 0 end)
      ,[viovy] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') then lkm else 0 end)
      ,[ika61] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 then lkm else 0 end)
      ,[ika61n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 and sp = '2' then lkm else 0 end)
      ,[ika71] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 then lkm else 0 end)
      ,[ika71n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 and sp = '2' then lkm else 0 end)
      ,[ika81] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 then lkm else 0 end)
      ,[ika81n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 and sp = '2' then lkm else 0 end)
      ,[ika91] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 then lkm else 0 end)
      ,[ika91n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 and sp = '2' then lkm else 0 end)
      ,[ika1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ika1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[lykk] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' then lkm else 0 end)
      ,[lykkn] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' and sp = '2' then lkm else 0 end)
      ,[jopo] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 then lkm else 0 end)
      ,[jopon] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 and sp = '2' then lkm else 0 end)
	  --
      ,[kan17v] = NULL, [muu17v] = NULL, [op17v] = NULL, [lukoko] = NULL, [lukokon] = NULL, [luib] = NULL, [luibn] = NULL, [reife] = NULL, [reifen] = NULL, [gymn]= NULL, [gymnn]= NULL, [lueb] = NULL, [luebn] = NULL, [lukio] = NULL, [lukion] = NULL, [opsamm]= NULL, [opsammn]= NULL, [muuamm]= NULL, [muuammn]= NULL, [amm] = NULL, [ammn] = NULL, [peain] = NULL, [peainn] = NULL, [luain] = NULL, [luainn] = NULL, [vapsiv] = NULL, [vapsivn] = NULL, [taiop] = NULL, [taiopn] = NULL, [muukoul] = NULL, [muukouln] = NULL, [muuop] = NULL, [muuopn] = NULL, [tehoec] = NULL, [teho16c] = NULL, [teho79c] = NULL, [teholc] = NULL, [tehoyc] = NULL, [ertuec] = NULL, [ertu16c] = NULL, [ertu79c] = NULL, [ertulc] = NULL, [ertuyc] = NULL, [eritec] = NULL, [erit16c] = NULL, [erit79c] = NULL, [eritlc] = NULL, [erityc] = NULL, [inte4] = NULL, [int164] = NULL, [int794] = NULL, [intl4] = NULL, [inty4] = NULL, [inte3] = NULL, [int163] = NULL, [int793] = NULL, [intl3] = NULL, [inty3] = NULL, [inte2] = NULL, [int162] = NULL, [int792] = NULL, [intl2] = NULL, [inty2] = NULL, [inte1] = NULL, [int161] = NULL, [int791] = NULL, [intl1] = NULL, [inty1] = NULL, [inte0] = NULL, [int160] = NULL, [int790] = NULL, [intl0] = NULL, [inty0] = NULL, [intey] = NULL, [int16y] = NULL, [int79y] = NULL, [intly] = NULL, [intyy] = NULL, [yks160] = NULL, [yks790] = NULL, [yksl0] = NULL, [yksy0] = NULL, [yks161] = NULL, [yks791] = NULL, [yksl1] = NULL, [yksy1] = NULL, [yks162] = NULL, [yks792] = NULL, [yksl2] = NULL, [yksy2] = NULL, [yks164] = NULL, [yks794] = NULL, [yksl4] = NULL, [yksy4] = NULL, [yks16t] = NULL, [yks79t] = NULL, [ykslt] = NULL, [yksyt] = NULL, [yks16y] = NULL, [yks79y] = NULL, [yksly] = NULL, [yksyy] = NULL, [tehoosa] = NULL, [ertuosa] = NULL, [eritosa] = NULL, [tehotuki] = NULL, [ertutuki] = NULL, [erittuki] = NULL, [tehoavu] = NULL, [ertuavu] = NULL, [eritavu] = NULL, [tehomuu] = NULL, [ertumuu] = NULL, [eritmuu] = NULL, [alc] = NULL, [ylc] = NULL, [luc] = NULL, [amc] = NULL, [alkieli0] = NULL, [alkieli1] = NULL, [alkieli2] = NULL, [alkieli3] = NULL, [alkieli4] = NULL, [alkieliy] = NULL, [ylkieli0] = NULL, [ylkieli1] = NULL, [ylkieli2] = NULL, [ylkieli3] = NULL, [ylkieli4] = NULL, [ylkieli5] = NULL, [ylkieliy] = NULL, [lukieli0] = NULL, [lukieli1] = NULL, [lukieli2] = NULL, [lukieli3] = NULL, [lukieli4] = NULL, [lukieli5] = NULL, [lukieli6] = NULL, [lukieliy] = NULL, [amkieli0] = NULL, [amkieli1] = NULL, [amkieli2] = NULL, [amkieli3] = NULL, [amkieli4] = NULL, [amkieli5] = NULL, [amkieli6] = NULL, [amkieliy] = NULL, [aleny] = NULL, [alruy] = NULL, [alsuy] = NULL, [alray] = NULL, [alsay] = NULL, [alvey] = NULL, [alesy] = NULL, [ality] = NULL, [alsaay] = NULL, [almuy] = NULL, [yleny] = NULL, [ylruy] = NULL, [ylsuy] = NULL, [ylray] = NULL, [ylsay] = NULL, [ylvey] = NULL, [ylesy] = NULL, [ylity] = NULL, [ylsaay] = NULL, [yllaty] = NULL, [ylmuy] = NULL, [lueny] = NULL, [luruy] = NULL, [lusuy] = NULL, [luray] = NULL, [lusay] = NULL, [luvey] = NULL, [luesy] = NULL, [luity] = NULL, [lusaay] = NULL, [lulaty] = NULL, [lumuy] = NULL, [ameny] = NULL, [amruy] = NULL, [amsuy] = NULL, [amray] = NULL, [amsay] = NULL, [amvey] = NULL, [amesy] = NULL, [amity] = NULL, [amsaay] = NULL, [amlaty] = NULL, [ammuy] = NULL, [ov1c] = NULL, [ov2c] = NULL, [ov3c] = NULL, [ov4c] = NULL, [ov5c] = NULL, [ov6c] = NULL, [ov16yc] = NULL, [ov16nc] = NULL, [eng1] = NULL, [ru1] = NULL, [su1] = NULL, [ra1] = NULL, [sa1] = NULL, [ve1] = NULL, [es1] = NULL, [it1] = NULL, [saa1] = NULL, [mu1] = NULL, [eopis1] = NULL, [eng2] = NULL, [ru2] = NULL, [su2] = NULL, [ra2] = NULL, [sa2] = NULL, [ve2] = NULL, [es2] = NULL, [it2] = NULL, [saa2] = NULL, [mu2] = NULL, [eopis2] = NULL, [eng3] = NULL, [ru3] = NULL, [su3] = NULL, [ra3] = NULL, [sa3] = NULL, [ve3] = NULL, [es3] = NULL, [it3] = NULL, [saa3] = NULL, [mu3] = NULL, [eopis3] = NULL, [eng4] = NULL, [ru4] = NULL, [su4] = NULL, [ra4] = NULL, [sa4] = NULL, [ve4] = NULL, [es4] = NULL, [it4] = NULL, [saa4] = NULL, [mu4] = NULL, [eopis4] = NULL, [eng5] = NULL, [ru5] = NULL, [su5] = NULL, [ra5] = NULL, [sa5] = NULL, [ve5] = NULL, [es5] = NULL, [it5] = NULL, [saa5] = NULL, [mu5] = NULL, [eopis5] = NULL, [eng6] = NULL, [ru6] = NULL, [su6] = NULL, [ra6] = NULL, [sa6] = NULL, [ve6] = NULL, [es6] = NULL, [it6] = NULL, [saa6] = NULL, [mu6] = NULL, [eopis6] = NULL, [eny] = NULL, [ruy] = NULL, [suy] = NULL, [ray] = NULL, [say] = NULL, [vey] = NULL, [esy] = NULL, [ity] = NULL, [saay] = NULL, [muy] = NULL, [eopisy] = NULL, [enn] = NULL, [run] = NULL, [sun] = NULL, [ran] = NULL, [san] = NULL, [ven] = NULL, [esn] = NULL, [itn] = NULL, [saan] = NULL, [mun] = NULL, [eopisn] = NULL, [ven1] = NULL, [vru1] = NULL, [vsu1] = NULL, [vra1] = NULL, [vsa1] = NULL, [vve1] = NULL, [ves1] = NULL, [vit1] = NULL, [vsaa1] = NULL, [vmu1] = NULL, [vyht1] = NULL, [ven2] = NULL, [vru2] = NULL, [vsu2] = NULL, [vra2] = NULL, [vsa2] = NULL, [vve2] = NULL, [ves2] = NULL, [vit2] = NULL, [vsaa2] = NULL, [vmu2] = NULL, [vyht2] = NULL, [ven3] = NULL, [vru3] = NULL, [vsu3] = NULL, [vra3] = NULL, [vsa3] = NULL, [vve3] = NULL, [ves3] = NULL, [vit3] = NULL, [vsaa3] = NULL, [vmu3] = NULL, [vyht3] = NULL, [ven4] = NULL, [vru4] = NULL, [vsu4] = NULL, [vra4] = NULL, [vsa4] = NULL, [vve4] = NULL, [ves4] = NULL, [vit4] = NULL, [vsaa4] = NULL, [vmu4] = NULL, [vyht4] = NULL, [ven5] = NULL, [vru5] = NULL, [vsu5] = NULL, [vra5] = NULL, [vsa5] = NULL, [vve5] = NULL, [ves5] = NULL, [vit5] = NULL, [vsaa5] = NULL, [vmu5] = NULL, [vyht5] = NULL, [ven6] = NULL, [vru6] = NULL, [vsu6] = NULL, [vra6] = NULL, [vsa6] = NULL, [vve6] = NULL, [ves6] = NULL, [vit6] = NULL, [vsaa6] = NULL, [vmu6] = NULL, [vyht6] = NULL, [veny] = NULL, [vruy] = NULL, [vsuy] = NULL, [vray] = NULL, [vsay] = NULL, [vvey] = NULL, [vesy] = NULL, [vity] = NULL, [vsaay] = NULL, [vmuy] = NULL, [vyht] = NULL, [venn] = NULL, [vrun] = NULL, [vsun] = NULL, [vran] = NULL, [vsan] = NULL, [vven] = NULL, [vesn] = NULL, [vitn] = NULL, [vsaan] = NULL, [vmun] = NULL, [vtyt] = NULL, [ov79yc] = NULL, [ov79nc] = NULL, [yaen1] = NULL, [yaru1] = NULL, [yasu1] = NULL, [yara1] = NULL, [yasa1] = NULL, [yave1] = NULL, [yaes1] = NULL, [yait1] = NULL, [yasaa1] = NULL, [yalat1] = NULL, [yamuu1] = NULL, [yaen2] = NULL, [yaru2] = NULL, [yasu2] = NULL, [yara2] = NULL, [yasa2] = NULL, [yave2] = NULL, [yaes2] = NULL, [yait2] = NULL, [yasaa2] = NULL, [yalat2] = NULL, [yamuu2] = NULL, [yyen] = NULL, [yyru] = NULL, [yysu] = NULL, [yyra] = NULL, [yysa] = NULL, [yen] = NULL, [yru] = NULL, [ysu] = NULL, [yra] = NULL, [ysa] = NULL, [yve] = NULL, [yes] = NULL, [yit] = NULL, [ysaa] = NULL, [ylat] = NULL, [ymuu] = NULL, [enyy] = NULL, [ruyy] = NULL, [suyy] = NULL, [rayy] = NULL, [sayy] = NULL, [veyy] = NULL, [esyy] = NULL, [ityy] = NULL, [saayy] = NULL, [layy] = NULL, [muyy] = NULL, [yaen1n] = NULL, [yaru1n] = NULL, [yasu1n] = NULL, [yara1n] = NULL, [yasa1n] = NULL, [yave1n] = NULL, [yaes1n] = NULL, [yait1n] = NULL, [yasaa1n] = NULL, [yalat1n] = NULL, [yamuu1n] = NULL, [yaen2n] = NULL, [yaru2n] = NULL, [yasu2n] = NULL, [yara2n] = NULL, [yasa2n] = NULL, [yave2n] = NULL, [yaes2n] = NULL, [yait2n] = NULL, [yasaa2n] = NULL, [yalat2n] = NULL, [yamuu2n] = NULL, [yyenn] = NULL, [yyrun] = NULL, [yysun] = NULL, [yyran] = NULL, [yysan] = NULL, [yenn] = NULL, [yrun] = NULL, [ysun] = NULL, [yran] = NULL, [ysan] = NULL, [yven] = NULL, [yesn] = NULL, [yitn] = NULL, [ysaan] = NULL, [ylatn] = NULL, [ymuun] = NULL, [ennn] = NULL, [runn] = NULL, [sunn] = NULL, [rann] = NULL, [sann] = NULL, [vennn] = NULL, [esnn] = NULL, [itnn] = NULL, [saann] = NULL, [lann] = NULL, [munn] = NULL, [asv] = NULL, [arv] = NULL, [asvrv] = NULL, [ysv] = NULL, [yrv] = NULL, [ysvrv] = NULL, [sv] = NULL, [rv] = NULL, [svrv] = NULL, [aev] = NULL, [aort] = NULL, [aisl] = NULL, [amu] = NULL, [aet] = NULL, [aeos] = NULL, [akay] = NULL, [yev] = NULL, [yort] = NULL, [yisl] = NULL, [ymu] = NULL, [yet] = NULL, [yeos] = NULL, [ykay] = NULL, [ev] = NULL, [ort] = NULL, [isl] = NULL, [mu] = NULL, [et] = NULL, [eos] = NULL, [kay] = NULL, [ov89yc] = NULL, [ov89nc] = NULL, [ai] = NULL, [rsb] = NULL, [ma] = NULL, [yl] = NULL, [bi] = NULL, [ge] = NULL, [fy] = NULL, [ke] = NULL, [ter] = NULL, [ue] = NULL, [eti] = NULL, [hi] = NULL, [yh] = NULL, [mus] = NULL, [ku] = NULL, [tt]= NULL, [ts]= NULL, [ks] = NULL, [li] = NULL, [ko] = NULL, [yhd] = NULL, [ain] = NULL, [rsbn] = NULL, [man] = NULL, [yln] = NULL, [bin] = NULL, [gen] = NULL, [fyn] = NULL, [ken] = NULL, [tern] = NULL, [uen] = NULL, [etin] = NULL, [hin] = NULL, [yhn] = NULL, [musn] = NULL, [kun] = NULL, [ttn]= NULL, [tsn]= NULL, [ksn] = NULL, [lin] = NULL, [kon] = NULL, [yhdn] = NULL, [tietop] = NULL, [tietok] = NULL, [tietoi] = NULL, [verkko] = NULL, [kaytto] = NULL
      --
	  ,[tietolahde]='K2.22b_sopv24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_24] f 
  WHERE (oppilas = '1' and (esi = '2' or luokka in ('01','02','03','04','05','06','07','08','09'))) 
    or (oppilas = '2' and aik = '2')
  GROUP BY tilv, jarj, tunn

  UNION ALL

SELECT [tilv]
      ,[jarj]
      ,[tiedtype] = null
      ,[tunn]
      ,[edesi] = NULL
      ,[edala] = NULL
      ,[edyla] = NULL
      ,[edlisa] = NULL
      ,[edainep] = NULL
      ,[syesi] = NULL
      ,[syala] = NULL
      ,[syyla] = NULL
      ,[sylisa] = NULL
      ,[symamu] = NULL
      ,[sylukio] = NULL
      ,[syamm] = NULL
      ,[symuu] = NULL
      ,[keve] = NULL--sum(case when oppilas = '2' and luokka = '00' then lkm else 0 end)
      ,[keven] = NULL--sum(case when oppilas = '2' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[kev1] = NULL--sum(case when oppilas = '2' and luokka = '01' then lkm else 0 end)
      ,[kev1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[kev2] = NULL--sum(case when oppilas = '2' and luokka = '02' then lkm else 0 end)
      ,[kev2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[kev3] = NULL--sum(case when oppilas = '2' and luokka = '03' then lkm else 0 end)
      ,[kev3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[kev4] = NULL--sum(case when oppilas = '2' and luokka = '04' then lkm else 0 end)
      ,[kev4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[kev5] = NULL--sum(case when oppilas = '2' and luokka = '05' then lkm else 0 end)
      ,[kev5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[kev6] = NULL--sum(case when oppilas = '2' and luokka = '06' then lkm else 0 end)
      ,[kev6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[kev7] = NULL--sum(case when oppilas = '2' and luokka = '07' then lkm else 0 end)
      ,[kev7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[kev8] = NULL--sum(case when oppilas = '2' and luokka = '08' then lkm else 0 end)
      ,[kev8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[kev9] = NULL--sum(case when oppilas = '2' and luokka = '09' then lkm else 0 end)
      ,[kev9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[kev10] = NULL--sum(case when oppilas = '2' and luokka = '10' then lkm else 0 end)
      ,[kev10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[kev] = NULL--sum(case when oppilas = '2' and jaaluok = '1' then lkm else 0 end)
      ,[kevn] = NULL--sum(case when oppilas = '2' and sp = '2' and jaaluok = '1' then lkm else 0 end)
      ,[luok1] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' then lkm else 0 end)
      ,[luok1n] = NULL--sum(case when oppilas = '2' and luokka = '01' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok2] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' then lkm else 0 end)
      ,[luok2n] = NULL--sum(case when oppilas = '2' and luokka = '02' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok3] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' then lkm else 0 end)
      ,[luok3n] = NULL--sum(case when oppilas = '2' and luokka = '03' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok4] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' then lkm else 0 end)
      ,[luok4n] = NULL--sum(case when oppilas = '2' and luokka = '04' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok5] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' then lkm else 0 end)
      ,[luok5n] = NULL--sum(case when oppilas = '2' and luokka = '05' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok6] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' then lkm else 0 end)
      ,[luok6n] = NULL--sum(case when oppilas = '2' and luokka = '06' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok7] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' then lkm else 0 end)
      ,[luok7n] = NULL--sum(case when oppilas = '2' and luokka = '07' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok8] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' then lkm else 0 end)
      ,[luok8n] = NULL--sum(case when oppilas = '2' and luokka = '08' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok9] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' then lkm else 0 end)
      ,[luok9n] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[luok] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' then lkm else 0 end)
      ,[luokn] = NULL--sum(case when oppilas = '2' and luokka not in ('00','10') and jaaluok = '1' and sp = '2' then lkm else 0 end)
      ,[kelaim] = NULL
      ,[kelaimn] = NULL
      ,[tod] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[todn] = sum(case when oppilas = '2' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[tutkt] = NULL
      ,[tutktn] = NULL
      ,[suor10] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' then lkm else 0 end)
      ,[suor10n] = NULL--sum(case when oppilas = '2' and luokka = '10' and suorv = tilv and suorlk = '1' and sp = '2' then lkm else 0 end)
      ,[oeriy] = NULL
      ,[oeriyn] = NULL
      ,[ilmtod] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 then lkm else 0 end)
      ,[ilmtodn] = NULL--sum(case when oppilas = '2' and luokka = '09' and jaaluok = '1' and nullif(isnumeric(ika),0) > 16 and sp = '2' then lkm else 0 end)
      ,[aku] = NULL
      ,[mamukurs] = NULL
      ,[oppkurs] = NULL
      ,[muukurs] = NULL
      ,[akukurs] = NULL
      ,[kmamu]  = NULL
      ,[kmamun]  = NULL
      ,[syulkom] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[syulkomn] = sum(case when oppilas = '1' and ulkom = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[sykoti] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 then lkm else 0 end)
      ,[sykotin] = sum(case when oppilas = '1' and koti = '1' and tilv - nullif(isnumeric(syntv),0) between 7 and 16 and sp = '2' then lkm else 0 end)
      ,[ika4e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 then lkm else 0 end)
      ,[ika4en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 4 and sp = '2' then lkm else 0 end)
      ,[ika5e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 then lkm else 0 end)
      ,[ika5en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 5 and sp = '2' then lkm else 0 end)
      ,[pid5v] = NULL
      ,[ika6e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 then lkm else 0 end)
      ,[ika6en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) = 6 and sp = '2' then lkm else 0 end)
      ,[ika7e] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 then lkm else 0 end)
      ,[ika7en] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) > 6 and sp = '2' then lkm else 0 end)
      ,[ikae] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 then lkm else 0 end)
      ,[ikaen] = sum(case when oppilas = '1' and luokka = '00' and tilv - nullif(isnumeric(syntv),0) between 5 and 7 and sp = '2' then lkm else 0 end)
      ,[ove] = sum(case when oppilas = '1' and luokka = '00' then lkm else 0 end)
      ,[ov1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ov2] = sum(case when oppilas = '1' and luokka = '02' then lkm else 0 end)
      ,[ov3] = sum(case when oppilas = '1' and luokka = '03' then lkm else 0 end)
      ,[ov4] = sum(case when oppilas = '1' and luokka = '04' then lkm else 0 end)
      ,[ov5] = sum(case when oppilas = '1' and luokka = '05' then lkm else 0 end)
      ,[ov6] = sum(case when oppilas = '1' and luokka = '06' then lkm else 0 end)
      ,[ov7] = sum(case when oppilas = '1' and luokka = '07' then lkm else 0 end)
      ,[ov8] = sum(case when oppilas = '1' and luokka = '08' then lkm else 0 end)
      ,[ov9] = sum(case when oppilas = '1' and luokka = '09' then lkm else 0 end)
      ,[ov10] = sum(case when oppilas = '1' and luokka = '10' then lkm else 0 end)
      ,[ovy] = sum(case when oppilas = '1' then lkm else 0 end)
      --
	  ,[tehoe] = NULL, [teho1] = NULL, [teho2] = NULL, [teho3] = NULL, [teho4] = NULL, [teho5] = NULL, [teho6] = NULL, [teho7] = NULL, [teho8] = NULL, [teho9] = NULL, [teho10] = NULL, [tehoy] = NULL, [eipide] = NULL, [eipid1] = NULL, [eipid2] = NULL, [eipid3] = NULL, [eipid4] = NULL, [eipid5] = NULL, [eipid6] = NULL, [eipid7] = NULL, [eipid8] = NULL, [eipid9] = NULL, [eipid10] = NULL, [eipidy] = NULL, [ertuve] = NULL, [ertuv1] = NULL, [ertuv2] = NULL, [ertuv3] = NULL, [ertuv4] = NULL, [ertuv5] = NULL, [ertuv6] = NULL, [ertuv7] = NULL, [ertuv8] = NULL, [ertuv9] = NULL, [ertuv10] = NULL, [ertuvy] = NULL, [ertume] = NULL, [ertum1] = NULL, [ertum2] = NULL, [ertum3] = NULL, [ertum4] = NULL, [ertum5] = NULL, [ertum6] = NULL, [ertum7] = NULL, [ertum8] = NULL, [ertum9] = NULL, [ertum10] = NULL, [ertumy] = NULL, [tavove] = NULL, [tavov1] = NULL, [tavov2] = NULL, [tavov3] = NULL, [tavov4] = NULL, [tavov5] = NULL, [tavov6] = NULL, [tavov7] = NULL, [tavov8] = NULL, [tavov9] = NULL, [tavov10] = NULL, [tavovy] = NULL
      --
	  ,[oven] = sum(case when oppilas = '1' and luokka = '00' and sp = '2' then lkm else 0 end)
      ,[ov1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[ov2n] = sum(case when oppilas = '1' and luokka = '02' and sp = '2' then lkm else 0 end)
      ,[ov3n] = sum(case when oppilas = '1' and luokka = '03' and sp = '2' then lkm else 0 end)
      ,[ov4n] = sum(case when oppilas = '1' and luokka = '04' and sp = '2' then lkm else 0 end)
      ,[ov5n] = sum(case when oppilas = '1' and luokka = '05' and sp = '2' then lkm else 0 end)
      ,[ov6n] = sum(case when oppilas = '1' and luokka = '06' and sp = '2' then lkm else 0 end)
      ,[ov7n] = sum(case when oppilas = '1' and luokka = '07' and sp = '2' then lkm else 0 end)
      ,[ov8n] = sum(case when oppilas = '1' and luokka = '08' and sp = '2' then lkm else 0 end)
      ,[ov9n] = sum(case when oppilas = '1' and luokka = '09' and sp = '2' then lkm else 0 end)
      ,[ov10n] = sum(case when oppilas = '1' and luokka = '10' and sp = '2' then lkm else 0 end)
      ,[ovyn] = sum(case when oppilas = '1' and sp = '2' then lkm else 0 end)
	  --
      ,[tehoen] = NULL, [teho1n] = NULL, [teho2n] = NULL, [teho3n] = NULL, [teho4n] = NULL, [teho5n] = NULL, [teho6n] = NULL, [teho7n] = NULL, [teho8n] = NULL, [teho9n] = NULL, [teho10n] = NULL, [tehoyn] = NULL, [eipiden] = NULL, [eipid1n] = NULL, [eipid2n] = NULL, [eipid3n] = NULL, [eipid4n] = NULL, [eipid5n] = NULL, [eipid6n] = NULL, [eipid7n] = NULL, [eipid8n] = NULL, [eipid9n] = NULL, [eipid10n] = NULL, [eipidyn] = NULL, [ertuven] = NULL, [ertuv1n] = NULL, [ertuv2n] = NULL, [ertuv3n] = NULL, [ertuv4n] = NULL, [ertuv5n] = NULL, [ertuv6n] = NULL, [ertuv7n] = NULL, [ertuv8n] = NULL, [ertuv9n] = NULL, [ertuv10n] = NULL, [ertuvyn] = NULL, [ertumen] = NULL, [ertum1n] = NULL, [ertum2n] = NULL, [ertum3n] = NULL, [ertum4n] = NULL, [ertum5n] = NULL, [ertum6n] = NULL, [ertum7n] = NULL, [ertum8n] = NULL, [ertum9n] = NULL, [ertum10n] = NULL, [ertumyn] = NULL, [tavoven] = NULL, [tavov1n] = NULL, [tavov2n] = NULL, [tavov3n] = NULL, [tavov4n] = NULL, [tavov5n] = NULL, [tavov6n] = NULL, [tavov7n] = NULL, [tavov8n] = NULL, [tavov9n] = NULL, [tavov10n] = NULL, [tavovyn] = NULL, [eipidec] = NULL, [eipidpc] = NULL, [eipidlc] = NULL, [eipidyc] = NULL, [ertuvec] = NULL, [ertuvpc] = NULL, [ertuvlc] = NULL, [ertuvyc] = NULL, [ertumec] = NULL, [ertumpc] = NULL, [ertumlc] = NULL, [ertumyc] = NULL, [muuec] = NULL, [muupc] = NULL, [muulc] = NULL, [muuyc] = NULL, [ovec] = NULL, [ovpc] = NULL, [ovlc] = NULL, [ovyc] = NULL, [sisae] = NULL, [sisap] = NULL, [sisal] = NULL, [sisam] = NULL, [sisay] = NULL, [maeipide] = NULL, [maeipidp] = NULL, [maeipidl] = NULL, [maeipidy] = NULL, [maertuve] = NULL, [maertuvp] = NULL, [maertuvl] = NULL, [maertuvy] = NULL, [maertume] = NULL, [maertump] = NULL, [maertuml] = NULL, [maertumy] = NULL, [mamuue] = NULL, [mamuup] = NULL, [mamuul] = NULL, [mamuuy] = NULL, [maove] = NULL, [maovp] = NULL, [maovl] = NULL, [maovy] = NULL, [kueipide] = NULL, [kueipidp] = NULL, [kueipidl] = NULL, [kueipidy] = NULL, [kuertuve] = NULL, [kuertuvp] = NULL, [kuertuvl] = NULL, [kuertuvy] = NULL, [kuertume] = NULL, [kuertump] = NULL, [kuertuml] = NULL, [kuertumy] = NULL, [kumuue] = NULL, [kumuup] = NULL, [kumuul] = NULL, [kumuuy] = NULL, [kuove] = NULL, [kuovp] = NULL, [kuovl] = NULL, [kuovy] = NULL, [vieipide] = NULL, [vieipidp] = NULL, [vieipidl] = NULL, [vieipidy] = NULL, [viertuve] = NULL, [viertuvp] = NULL, [viertuvl] = NULL, [viertuvy] = NULL, [viertume] = NULL, [viertump] = NULL, [viertuml] = NULL, [viertumy] = NULL, [vimuue] = NULL, [vimuup] = NULL, [vimuul] = NULL, [vimuuy] = NULL
	  --
      ,[viove] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '00' then lkm else 0 end)
      ,[viovp] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and cast(luokka as int) between 1 and 9 then lkm else 0 end)
      ,[viovl] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') and luokka = '10' then lkm else 0 end)
      ,[viovy] = sum(case when oppilas = '1' and f.aikielir1 not in ('fs','sv') then lkm else 0 end)
      ,[ika61] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 then lkm else 0 end)
      ,[ika61n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) < 7 and sp = '2' then lkm else 0 end)
      ,[ika71] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 then lkm else 0 end)
      ,[ika71n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 7 and sp = '2' then lkm else 0 end)
      ,[ika81] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 then lkm else 0 end)
      ,[ika81n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) = 8 and sp = '2' then lkm else 0 end)
      ,[ika91] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 then lkm else 0 end)
      ,[ika91n] = sum(case when oppilas = '1' and luokka = '01' and tilv - nullif(isnumeric(syntv),0) > 8 and sp = '2' then lkm else 0 end)
      ,[ika1] = sum(case when oppilas = '1' and luokka = '01' then lkm else 0 end)
      ,[ika1n] = sum(case when oppilas = '1' and luokka = '01' and sp = '2' then lkm else 0 end)
      ,[lykk] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' then lkm else 0 end)
      ,[lykkn] = NULL --sum(case when oppilas = '1' and luokka = '01' and lykk = '1' and sp = '2' then lkm else 0 end)
      ,[jopo] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 then lkm else 0 end)
      ,[jopon] = sum(case when oppilas = '1' and jopo = '1' and cast(luokka as int) between 7 and 9 and sp = '2' then lkm else 0 end)
	  --
      ,[kan17v] = NULL, [muu17v] = NULL, [op17v] = NULL, [lukoko] = NULL, [lukokon] = NULL, [luib] = NULL, [luibn] = NULL, [reife] = NULL, [reifen] = NULL, [gymn]= NULL, [gymnn]= NULL, [lueb] = NULL, [luebn] = NULL, [lukio] = NULL, [lukion] = NULL, [opsamm]= NULL, [opsammn]= NULL, [muuamm]= NULL, [muuammn]= NULL, [amm] = NULL, [ammn] = NULL, [peain] = NULL, [peainn] = NULL, [luain] = NULL, [luainn] = NULL, [vapsiv] = NULL, [vapsivn] = NULL, [taiop] = NULL, [taiopn] = NULL, [muukoul] = NULL, [muukouln] = NULL, [muuop] = NULL, [muuopn] = NULL, [tehoec] = NULL, [teho16c] = NULL, [teho79c] = NULL, [teholc] = NULL, [tehoyc] = NULL, [ertuec] = NULL, [ertu16c] = NULL, [ertu79c] = NULL, [ertulc] = NULL, [ertuyc] = NULL, [eritec] = NULL, [erit16c] = NULL, [erit79c] = NULL, [eritlc] = NULL, [erityc] = NULL, [inte4] = NULL, [int164] = NULL, [int794] = NULL, [intl4] = NULL, [inty4] = NULL, [inte3] = NULL, [int163] = NULL, [int793] = NULL, [intl3] = NULL, [inty3] = NULL, [inte2] = NULL, [int162] = NULL, [int792] = NULL, [intl2] = NULL, [inty2] = NULL, [inte1] = NULL, [int161] = NULL, [int791] = NULL, [intl1] = NULL, [inty1] = NULL, [inte0] = NULL, [int160] = NULL, [int790] = NULL, [intl0] = NULL, [inty0] = NULL, [intey] = NULL, [int16y] = NULL, [int79y] = NULL, [intly] = NULL, [intyy] = NULL, [yks160] = NULL, [yks790] = NULL, [yksl0] = NULL, [yksy0] = NULL, [yks161] = NULL, [yks791] = NULL, [yksl1] = NULL, [yksy1] = NULL, [yks162] = NULL, [yks792] = NULL, [yksl2] = NULL, [yksy2] = NULL, [yks164] = NULL, [yks794] = NULL, [yksl4] = NULL, [yksy4] = NULL, [yks16t] = NULL, [yks79t] = NULL, [ykslt] = NULL, [yksyt] = NULL, [yks16y] = NULL, [yks79y] = NULL, [yksly] = NULL, [yksyy] = NULL, [tehoosa] = NULL, [ertuosa] = NULL, [eritosa] = NULL, [tehotuki] = NULL, [ertutuki] = NULL, [erittuki] = NULL, [tehoavu] = NULL, [ertuavu] = NULL, [eritavu] = NULL, [tehomuu] = NULL, [ertumuu] = NULL, [eritmuu] = NULL, [alc] = NULL, [ylc] = NULL, [luc] = NULL, [amc] = NULL, [alkieli0] = NULL, [alkieli1] = NULL, [alkieli2] = NULL, [alkieli3] = NULL, [alkieli4] = NULL, [alkieliy] = NULL, [ylkieli0] = NULL, [ylkieli1] = NULL, [ylkieli2] = NULL, [ylkieli3] = NULL, [ylkieli4] = NULL, [ylkieli5] = NULL, [ylkieliy] = NULL, [lukieli0] = NULL, [lukieli1] = NULL, [lukieli2] = NULL, [lukieli3] = NULL, [lukieli4] = NULL, [lukieli5] = NULL, [lukieli6] = NULL, [lukieliy] = NULL, [amkieli0] = NULL, [amkieli1] = NULL, [amkieli2] = NULL, [amkieli3] = NULL, [amkieli4] = NULL, [amkieli5] = NULL, [amkieli6] = NULL, [amkieliy] = NULL, [aleny] = NULL, [alruy] = NULL, [alsuy] = NULL, [alray] = NULL, [alsay] = NULL, [alvey] = NULL, [alesy] = NULL, [ality] = NULL, [alsaay] = NULL, [almuy] = NULL, [yleny] = NULL, [ylruy] = NULL, [ylsuy] = NULL, [ylray] = NULL, [ylsay] = NULL, [ylvey] = NULL, [ylesy] = NULL, [ylity] = NULL, [ylsaay] = NULL, [yllaty] = NULL, [ylmuy] = NULL, [lueny] = NULL, [luruy] = NULL, [lusuy] = NULL, [luray] = NULL, [lusay] = NULL, [luvey] = NULL, [luesy] = NULL, [luity] = NULL, [lusaay] = NULL, [lulaty] = NULL, [lumuy] = NULL, [ameny] = NULL, [amruy] = NULL, [amsuy] = NULL, [amray] = NULL, [amsay] = NULL, [amvey] = NULL, [amesy] = NULL, [amity] = NULL, [amsaay] = NULL, [amlaty] = NULL, [ammuy] = NULL, [ov1c] = NULL, [ov2c] = NULL, [ov3c] = NULL, [ov4c] = NULL, [ov5c] = NULL, [ov6c] = NULL, [ov16yc] = NULL, [ov16nc] = NULL, [eng1] = NULL, [ru1] = NULL, [su1] = NULL, [ra1] = NULL, [sa1] = NULL, [ve1] = NULL, [es1] = NULL, [it1] = NULL, [saa1] = NULL, [mu1] = NULL, [eopis1] = NULL, [eng2] = NULL, [ru2] = NULL, [su2] = NULL, [ra2] = NULL, [sa2] = NULL, [ve2] = NULL, [es2] = NULL, [it2] = NULL, [saa2] = NULL, [mu2] = NULL, [eopis2] = NULL, [eng3] = NULL, [ru3] = NULL, [su3] = NULL, [ra3] = NULL, [sa3] = NULL, [ve3] = NULL, [es3] = NULL, [it3] = NULL, [saa3] = NULL, [mu3] = NULL, [eopis3] = NULL, [eng4] = NULL, [ru4] = NULL, [su4] = NULL, [ra4] = NULL, [sa4] = NULL, [ve4] = NULL, [es4] = NULL, [it4] = NULL, [saa4] = NULL, [mu4] = NULL, [eopis4] = NULL, [eng5] = NULL, [ru5] = NULL, [su5] = NULL, [ra5] = NULL, [sa5] = NULL, [ve5] = NULL, [es5] = NULL, [it5] = NULL, [saa5] = NULL, [mu5] = NULL, [eopis5] = NULL, [eng6] = NULL, [ru6] = NULL, [su6] = NULL, [ra6] = NULL, [sa6] = NULL, [ve6] = NULL, [es6] = NULL, [it6] = NULL, [saa6] = NULL, [mu6] = NULL, [eopis6] = NULL, [eny] = NULL, [ruy] = NULL, [suy] = NULL, [ray] = NULL, [say] = NULL, [vey] = NULL, [esy] = NULL, [ity] = NULL, [saay] = NULL, [muy] = NULL, [eopisy] = NULL, [enn] = NULL, [run] = NULL, [sun] = NULL, [ran] = NULL, [san] = NULL, [ven] = NULL, [esn] = NULL, [itn] = NULL, [saan] = NULL, [mun] = NULL, [eopisn] = NULL, [ven1] = NULL, [vru1] = NULL, [vsu1] = NULL, [vra1] = NULL, [vsa1] = NULL, [vve1] = NULL, [ves1] = NULL, [vit1] = NULL, [vsaa1] = NULL, [vmu1] = NULL, [vyht1] = NULL, [ven2] = NULL, [vru2] = NULL, [vsu2] = NULL, [vra2] = NULL, [vsa2] = NULL, [vve2] = NULL, [ves2] = NULL, [vit2] = NULL, [vsaa2] = NULL, [vmu2] = NULL, [vyht2] = NULL, [ven3] = NULL, [vru3] = NULL, [vsu3] = NULL, [vra3] = NULL, [vsa3] = NULL, [vve3] = NULL, [ves3] = NULL, [vit3] = NULL, [vsaa3] = NULL, [vmu3] = NULL, [vyht3] = NULL, [ven4] = NULL, [vru4] = NULL, [vsu4] = NULL, [vra4] = NULL, [vsa4] = NULL, [vve4] = NULL, [ves4] = NULL, [vit4] = NULL, [vsaa4] = NULL, [vmu4] = NULL, [vyht4] = NULL, [ven5] = NULL, [vru5] = NULL, [vsu5] = NULL, [vra5] = NULL, [vsa5] = NULL, [vve5] = NULL, [ves5] = NULL, [vit5] = NULL, [vsaa5] = NULL, [vmu5] = NULL, [vyht5] = NULL, [ven6] = NULL, [vru6] = NULL, [vsu6] = NULL, [vra6] = NULL, [vsa6] = NULL, [vve6] = NULL, [ves6] = NULL, [vit6] = NULL, [vsaa6] = NULL, [vmu6] = NULL, [vyht6] = NULL, [veny] = NULL, [vruy] = NULL, [vsuy] = NULL, [vray] = NULL, [vsay] = NULL, [vvey] = NULL, [vesy] = NULL, [vity] = NULL, [vsaay] = NULL, [vmuy] = NULL, [vyht] = NULL, [venn] = NULL, [vrun] = NULL, [vsun] = NULL, [vran] = NULL, [vsan] = NULL, [vven] = NULL, [vesn] = NULL, [vitn] = NULL, [vsaan] = NULL, [vmun] = NULL, [vtyt] = NULL, [ov79yc] = NULL, [ov79nc] = NULL, [yaen1] = NULL, [yaru1] = NULL, [yasu1] = NULL, [yara1] = NULL, [yasa1] = NULL, [yave1] = NULL, [yaes1] = NULL, [yait1] = NULL, [yasaa1] = NULL, [yalat1] = NULL, [yamuu1] = NULL, [yaen2] = NULL, [yaru2] = NULL, [yasu2] = NULL, [yara2] = NULL, [yasa2] = NULL, [yave2] = NULL, [yaes2] = NULL, [yait2] = NULL, [yasaa2] = NULL, [yalat2] = NULL, [yamuu2] = NULL, [yyen] = NULL, [yyru] = NULL, [yysu] = NULL, [yyra] = NULL, [yysa] = NULL, [yen] = NULL, [yru] = NULL, [ysu] = NULL, [yra] = NULL, [ysa] = NULL, [yve] = NULL, [yes] = NULL, [yit] = NULL, [ysaa] = NULL, [ylat] = NULL, [ymuu] = NULL, [enyy] = NULL, [ruyy] = NULL, [suyy] = NULL, [rayy] = NULL, [sayy] = NULL, [veyy] = NULL, [esyy] = NULL, [ityy] = NULL, [saayy] = NULL, [layy] = NULL, [muyy] = NULL, [yaen1n] = NULL, [yaru1n] = NULL, [yasu1n] = NULL, [yara1n] = NULL, [yasa1n] = NULL, [yave1n] = NULL, [yaes1n] = NULL, [yait1n] = NULL, [yasaa1n] = NULL, [yalat1n] = NULL, [yamuu1n] = NULL, [yaen2n] = NULL, [yaru2n] = NULL, [yasu2n] = NULL, [yara2n] = NULL, [yasa2n] = NULL, [yave2n] = NULL, [yaes2n] = NULL, [yait2n] = NULL, [yasaa2n] = NULL, [yalat2n] = NULL, [yamuu2n] = NULL, [yyenn] = NULL, [yyrun] = NULL, [yysun] = NULL, [yyran] = NULL, [yysan] = NULL, [yenn] = NULL, [yrun] = NULL, [ysun] = NULL, [yran] = NULL, [ysan] = NULL, [yven] = NULL, [yesn] = NULL, [yitn] = NULL, [ysaan] = NULL, [ylatn] = NULL, [ymuun] = NULL, [ennn] = NULL, [runn] = NULL, [sunn] = NULL, [rann] = NULL, [sann] = NULL, [vennn] = NULL, [esnn] = NULL, [itnn] = NULL, [saann] = NULL, [lann] = NULL, [munn] = NULL, [asv] = NULL, [arv] = NULL, [asvrv] = NULL, [ysv] = NULL, [yrv] = NULL, [ysvrv] = NULL, [sv] = NULL, [rv] = NULL, [svrv] = NULL, [aev] = NULL, [aort] = NULL, [aisl] = NULL, [amu] = NULL, [aet] = NULL, [aeos] = NULL, [akay] = NULL, [yev] = NULL, [yort] = NULL, [yisl] = NULL, [ymu] = NULL, [yet] = NULL, [yeos] = NULL, [ykay] = NULL, [ev] = NULL, [ort] = NULL, [isl] = NULL, [mu] = NULL, [et] = NULL, [eos] = NULL, [kay] = NULL, [ov89yc] = NULL, [ov89nc] = NULL, [ai] = NULL, [rsb] = NULL, [ma] = NULL, [yl] = NULL, [bi] = NULL, [ge] = NULL, [fy] = NULL, [ke] = NULL, [ter] = NULL, [ue] = NULL, [eti] = NULL, [hi] = NULL, [yh] = NULL, [mus] = NULL, [ku] = NULL, [tt]= NULL, [ts]= NULL, [ks] = NULL, [li] = NULL, [ko] = NULL, [yhd] = NULL, [ain] = NULL, [rsbn] = NULL, [man] = NULL, [yln] = NULL, [bin] = NULL, [gen] = NULL, [fyn] = NULL, [ken] = NULL, [tern] = NULL, [uen] = NULL, [etin] = NULL, [hin] = NULL, [yhn] = NULL, [musn] = NULL, [kun] = NULL, [ttn]= NULL, [tsn]= NULL, [ksn] = NULL, [lin] = NULL, [kon] = NULL, [yhdn] = NULL, [tietop] = NULL, [tietok] = NULL, [tietoi] = NULL, [verkko] = NULL, [kaytto] = NULL
      --
	  ,[tietolahde]='K2.22b_sopv25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_22b_sopv_25] f 
  WHERE (oppilas = '1' and (esi = '2' or luokka in ('01','02','03','04','05','06','07','08','09'))) 
    or (oppilas = '2' and aik = '2')
  GROUP BY tilv, jarj, tunn

) Aineistot

GO


