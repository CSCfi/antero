USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot]    Script Date: 16.12.2020 19:14:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[v_f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot] as

-- CSC JN 9.5.2014

-- Palauta aineisto 2.11 hajotettuna riveille (unpivotoituna)
-- Rivillä on dimensioavainten lisäksi
--  mittari_nimi = aineiston 2.11 kentän nimi
--  mittari_arvo = aineiston 2.11 kentän arvo
-- Näkymä palauttaa vain arvoltaan tyhjästä ja nollasta eroavat rivit
-- Kenttien nimet ovat pitkässä muodossa.

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot
-- Select * into VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot from VipunenTK_DW.dbo.v_f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot
-- Insert into VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot Select * from VipunenTK_DW.dbo.v_f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot 

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot 


Select 
	 tilastointivuosi = tilv
	,tilv_date
	,oppilaitos = tunn
	,koulutuksen_jarjestaja = jarj
	,eikoul
		
	,[tietolahde]
    ,[rivinumero]
    
    ,mittari_nimi
    ,mittari_arvo = CAST(mittari_arvo as int)
from --p
(Select 
	   [tilv]
	  ,tilv_date
      ,[tunn]
      ,[jarj]
	  ,[eikoul]
      ,[osa1]
      ,[suo1]
      ,[osa2]
      ,[suo2]
      ,[osa3]
      ,[suo3]
      ,[kur4]
      ,[osa4]
      ,[nai4]
      ,[tun4]
      ,[kur5]
      ,[osa5]
      ,[nai5]
      ,[tun5]
      ,[kur6]
      ,[osa6]
      ,[nai6]
      ,[tun6]
      ,[kur7]
      ,[osa7]
      ,[nai7]
      ,[kur8]
      ,[osa8]
      ,[nai8]
      ,[kur9]
      ,[osa9]
      ,[nai9]
      ,[kur10]
      ,[osa10]
      ,[nai10]
      ,[kur11]
      ,[osa11]
      ,[nai11]
      ,[kur12]
      ,[osa12]
      ,[nai12]
      ,[kur13]
      ,[osa13]
      ,[nai13]
      ,[kur14]
      ,[osa14]
      ,[nai14]
      ,[kurd]
      ,[osad]
      ,[naid]
      ,[E11]
      ,[E12]
      ,[E13]
      ,[E14]
      ,[E15]
      ,[E16]
      ,[E17]
      ,[E18]
      ,[E19]
      ,[E21]
      ,[E22]
      ,[E23]
      ,[E24]
      ,[E25]
      ,[E26]
      ,[E27]
      ,[E28]
      ,[E29]
      ,[E31]
      ,[E32]
      ,[E33]
      ,[E34]
      ,[E35]
      ,[E36]
      ,[E37]
      ,[E38]
      ,[E39]
      ,[E41]
      ,[E42]
      ,[E43]
      ,[E44]
      ,[E45]
      ,[E46]
      ,[E47]
      ,[E48]
      ,[E49]
      ,[E51]
      ,[E52]
      ,[E53]
      ,[E54]
      ,[E55]
      ,[E56]
      ,[E57]
      ,[E58]
      ,[E59]
      ,[E61]
      ,[E62]
      ,[E63]
      ,[E64]
      ,[E65]
      ,[E66]
      ,[E67]
      ,[E68]
      ,[E69]
      ,[E71]
      ,[E72]
      ,[E73]
      ,[E74]
      ,[E75]
      ,[E76]
      ,[E77]
      ,[E78]
      ,[E79]
      ,[E81]
      ,[E82]
      ,[E83]
      ,[E84]
      ,[E85]
      ,[E86]
      ,[E87]
      ,[E88]
      ,[E89]
      ,[E91]
      ,[E92]
      ,[E93]
      ,[E94]
      ,[E95]
      ,[E96]
      ,[E97]
      ,[E98]
      ,[E99]
      ,[E101]
      ,[E102]
      ,[E103]
      ,[E104]
      ,[E105]
      ,[E106]
      ,[E107]
      ,[E108]
      ,[E109]
      ,[E111]
      ,[E112]
      ,[E113]
      ,[E114]
      ,[E115]
      ,[E116]
      ,[E117]
      ,[E118]
      ,[E119]
      ,[E121]
      ,[E122]
      ,[E123]
      ,[E124]
      ,[E125]
      ,[E126]
      ,[E127]
      ,[E128]
      ,[E129]
      ,[E131]
      ,[E132]
      ,[E133]
      ,[E134]
      ,[E135]
      ,[E136]
      ,[E137]
      ,[E138]
      ,[E139]
      ,[E141]
      ,[E142]
      ,[E143]
      ,[E144]
      ,[E145]
      ,[E146]
      ,[E147]
      ,[E148]
      ,[E149]
      ,[E151]
      ,[E152]
      ,[E153]
      ,[E154]
      ,[E155]
      ,[E156]
      ,[E157]
      ,[E158]
      ,[E159]
      ,[E161]
      ,[E162]
      ,[E163]
      ,[E164]
      ,[E165]
      ,[E166]
      ,[E167]
      ,[E168]
      ,[E169]
      ,[E171]
      ,[E172]
      ,[E173]
      ,[E174]
      ,[E175]
      ,[E176]
      ,[E177]
      ,[E178]
      ,[E179]
      ,[E181]
      ,[E182]
      ,[E183]
      ,[E184]
      ,[E185]
      ,[E186]
      ,[E187]
      ,[E188]
      ,[E189]
      ,[E191]
      ,[E192]
      ,[E193]
      ,[E194]
      ,[E195]
      ,[E196]
      ,[E197]
      ,[E198]
      ,[E199]
      ,[E201]
      ,[E202]
      ,[E203]
      ,[E204]
      ,[E205]
      ,[E206]
      ,[E207]
      ,[E208]
      ,[E209]
      ,[E211]
      ,[E212]
      ,[E213]
      ,[E214]
      ,[E215]
      ,[E216]
      ,[E217]
      ,[E218]
      ,[E219]
      ,[E221]
      ,[E222]
      ,[E223]
      ,[E224]
      ,[E225]
      ,[E226]
      ,[E227]
      ,[E228]
      ,[E229]
      ,[E231]
      ,[E232]
      ,[E233]
      ,[E234]
      ,[E235]
      ,[E236]
      ,[E237]
      ,[E238]
      ,[E239]
      ,[E241]
      ,[E242]
      ,[E243]
      ,[E244]
      ,[E245]
      ,[E246]
      ,[E247]
      ,[E248]
      ,[E249]
      ,[E251]
      ,[E252]
      ,[E253]
      ,[E254]
      ,[E255]
      ,[E256]
      ,[E257]
      ,[E258]
      ,[E259]
      ,[E261]
      ,[E262]
      ,[E263]
      ,[E264]
      ,[E265]
      ,[E266]
      ,[E267]
      ,[E268]
      ,[E269]
      ,[E271]
      ,[E272]
      ,[E273]
      ,[E274]
      ,[E275]
      ,[E276]
      ,[E277]
      ,[E278]
      ,[E279]
      ,[E281]
      ,[E282]
      ,[E283]
      ,[E284]
      ,[E285]
      ,[E286]
      ,[E287]
      ,[E288]
      ,[E289]
      ,[E291]
      ,[E292]
      ,[E293]
      ,[E294]
      ,[E295]
      ,[E296]
      ,[E297]
      ,[E298]
      ,[E299]
      ,[E301]
      ,[E302]
      ,[E303]
      ,[E304]
      ,[E305]
      ,[E306]
      ,[E307]
      ,[E308]
      ,[E309]
      ,[E311]
      ,[E312]
      ,[E313]
      ,[E314]
      ,[E315]
      ,[E316]
      ,[E317]
      ,[E318]
      ,[E319]
      ,[E321]
      ,[E322]
      ,[E323]
      ,[E324]
      ,[E325]
      ,[E326]
      ,[E327]
      ,[E328]
      ,[E329]
      ,[E331]
      ,[E332]
      ,[E333]
      ,[E334]
      ,[E335]
      ,[E336]
      ,[E337]
      ,[E338]
      ,[E339]
      ,[E341]
      ,[E342]
      ,[E343]
      ,[E344]
      ,[E345]
      ,[E346]
      ,[E347]
      ,[E348]
      ,[E349]
      ,[E351]
      ,[E352]
      ,[E353]
      ,[E354]
      ,[E355]
      ,[E356]
      ,[E357]
      ,[E358]
      ,[E359]
      ,[E361]
      ,[E362]
      ,[E363]
      ,[E364]
      ,[E365]
      ,[E366]
      ,[E367]
      ,[E368]
      ,[E369]
      ,[E371]
      ,[E372]
      ,[E373]
      ,[E374]
      ,[E375]
      ,[E376]
      ,[E377]
      ,[E378]
      ,[E379]
      ,[E381]
      ,[E382]
      ,[E383]
      ,[E384]
      ,[E385]
      ,[E386]
      ,[E387]
      ,[E388]
      ,[E389]
      ,[E391]
      ,[E392]
      ,[E393]
      ,[E394]
      ,[E395]
      ,[E396]
      ,[E397]
      ,[E398]
      ,[E399]
      ,[E401]
      ,[E402]
      ,[E403]
      ,[E404]
      ,[E405]
      ,[E406]
      ,[E407]
      ,[E408]
      ,[E409]
      ,[E411]
      ,[E412]
      ,[E413]
      ,[E414]
      ,[E415]
      ,[E416]
      ,[E417]
      ,[E418]
      ,[E419]
      ,[E421]
      ,[E422]
      ,[E423]
      ,[E424]
      ,[E425]
      ,[E426]
      ,[E427]
      ,[E428]
      ,[E429]
      ,[E431]
      ,[E432]
      ,[E433]
      ,[E434]
      ,[E435]
      ,[E436]
      ,[E437]
      ,[E438]
      ,[E439]
      ,[E441]
      ,[E442]
      ,[E443]
      ,[E444]
      ,[E445]
      ,[E446]
      ,[E447]
      ,[E448]
      ,[E449]
      ,[E451]
      ,[E452]
      ,[E453]
      ,[E454]
      ,[E455]
      ,[E456]
      ,[E457]
      ,[E458]
      ,[E459]
      ,[E461]
      ,[E462]
      ,[E463]
      ,[E464]
      ,[E465]
      ,[E466]
      ,[E467]
      ,[E468]
      ,[E469]
      ,[E471]
      ,[E472]
      ,[E473]
      ,[E474]
      ,[E475]
      ,[E476]
      ,[E477]
      ,[E478]
      ,[E479]
      ,[E481]
      ,[E482]
      ,[E483]
      ,[E484]
      ,[E485]
      ,[E486]
      ,[E487]
      ,[E488]
      ,[E489]
      ,[E491]
      ,[E492]
      ,[E493]
      ,[E494]
      ,[E495]
      ,[E496]
      ,[E497]
      ,[E498]
      ,[E499]
      ,[E501]
      ,[E502]
      ,[E503]
      ,[E504]
      ,[E505]
      ,[E506]
      ,[E507]
      ,[E508]
      ,[E509]
      ,[E511]
      ,[E512]
      ,[E513]
      ,[E514]
      ,[E515]
      ,[E516]
      ,[E517]
      ,[E518]
      ,[E519]
      ,[E521]
      ,[E522]
      ,[E523]
      ,[E524]
      ,[E525]
      ,[E526]
      ,[E527]
      ,[E528]
      ,[E529]
      ,[E531]
      ,[E532]
      ,[E533]
      ,[E534]
      ,[E535]
      ,[E536]
      ,[E537]
      ,[E538]
      ,[E539]
      ,[E541]
      ,[E542]
      ,[E543]
      ,[E544]
      ,[E545]
      ,[E546]
      ,[E547]
      ,[E548]
      ,[E549]
      ,[E551]
      ,[E552]
      ,[E553]
      ,[E554]
      ,[E555]
      ,[E556]
      ,[E557]
      ,[E558]
      ,[E559]
      ,[E561]
      ,[E562]
      ,[E563]
      ,[E564]
      ,[E565]
      ,[E566]
      ,[E567]
      ,[E568]
      ,[E569]
      ,[E571]
      ,[E572]
      ,[E573]
      ,[E574]
      ,[E575]
      ,[E576]
      ,[E577]
      ,[E578]
      ,[E579]
      ,[E581]
      ,[E582]
      ,[E583]
      ,[E584]
      ,[E585]
      ,[E586]
      ,[E587]
      ,[E588]
      ,[E589]
      ,[E591]
      ,[E592]
      ,[E593]
      ,[E594]
      ,[E595]
      ,[E596]
      ,[E597]
      ,[E598]
      ,[E599]
      ,[E601]
      ,[E602]
      ,[E603]
      ,[E604]
      ,[E605]
      ,[E606]
      ,[E607]
      ,[E608]
      ,[E609]
      ,[E611]
      ,[E612]
      ,[E613]
      ,[E614]
      ,[E615]
      ,[E616]
      ,[E617]
      ,[E618]
      ,[E619]
      ,[E621]
      ,[E622]
      ,[E623]
      ,[E624]
      ,[E625]
      ,[E626]
      ,[E627]
      ,[E628]
      ,[E629]
      ,[E631]
      ,[E632]
      ,[E633]
      ,[E634]
      ,[E635]
      ,[E636]
      ,[E637]
      ,[E638]
      ,[E639]
      ,[E641]
      ,[E642]
      ,[E643]
      ,[E644]
      ,[E645]
      ,[E646]
      ,[E647]
      ,[E648]
      ,[E649]
      ,[E651]
      ,[E652]
      ,[E653]
      ,[E654]
      ,[E655]
      ,[E656]
      ,[E657]
      ,[E658]
      ,[E659]
      ,[E661]
      ,[E662]
      ,[E663]
      ,[E664]
      ,[E665]
      ,[E666]
      ,[E667]
      ,[E668]
      ,[E669]
      ,[E671]
      ,[E672]
      ,[E673]
      ,[E674]
      ,[E675]
      ,[E676]
      ,[E677]
      ,[E678]
      ,[E679]
      ,[E681]
      ,[E682]
      ,[E683]
      ,[E684]
      ,[E685]
      ,[E686]
      ,[E687]
      ,[E688]
      ,[E689]
      ,[E691]
      ,[E692]
      ,[E693]
      ,[E694]
      ,[E695]
      ,[E696]
      ,[E697]
      ,[E698]
      ,[E699]
      ,[E701]
      ,[E702]
      ,[E703]
      ,[E704]
      ,[E705]
      ,[E706]
      ,[E707]
      ,[E708]
      ,[E709]
      ,[E711]
      ,[E712]
      ,[E713]
      ,[E714]
      ,[E715]
      ,[E716]
      ,[E717]
      ,[E718]
      ,[E719]
      ,[E721]
      ,[E722]
      ,[E723]
      ,[E724]
      ,[E725]
      ,[E726]
      ,[E727]
      ,[E728]
      ,[E729]
      ,[E731]
      ,[E732]
      ,[E733]
      ,[E734]
      ,[E735]
      ,[E736]
      ,[E737]
      ,[E738]
      ,[E739]
      ,[E741]
      ,[E742]
      ,[E743]
      ,[E744]
      ,[E745]
      ,[E746]
      ,[E747]
      ,[E748]
      ,[E749]
      ,[E751]
      ,[E752]
      ,[E753]
      ,[E754]
      ,[E755]
      ,[E756]
      ,[E757]
      ,[E758]
      ,[E759]
      ,[E1]
      ,[E2]
      ,[E3]
      ,[E4]
      ,[E5]
      ,[E6]
      ,[E7]
      ,[E8]
      ,[E9]
      ,[osa15]
      ,[nai15]
      ,[osa16]
      ,[nai16]
      ,[osa17]
      ,[nai17]
      ,[tietolahde]
      ,[rivinumero]
from VipunenTK_SA.dbo.v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton
) p
unpivot (mittari_arvo for mittari_nimi in (
	   [osa1]
      ,[suo1]
      ,[osa2]
      ,[suo2]
      ,[osa3]
      ,[suo3]
      ,[kur4]
      ,[osa4]
      ,[nai4]
      ,[tun4]
      ,[kur5]
      ,[osa5]
      ,[nai5]
      ,[tun5]
      ,[kur6]
      ,[osa6]
      ,[nai6]
      ,[tun6]
      ,[kur7]
      ,[osa7]
      ,[nai7]
      ,[kur8]
      ,[osa8]
      ,[nai8]
      ,[kur9]
      ,[osa9]
      ,[nai9]
      ,[kur10]
      ,[osa10]
      ,[nai10]
      ,[kur11]
      ,[osa11]
      ,[nai11]
      ,[kur12]
      ,[osa12]
      ,[nai12]
      ,[kur13]
      ,[osa13]
      ,[nai13]
      ,[kur14]
      ,[osa14]
      ,[nai14]
      ,[kurd]
      ,[osad]
      ,[naid]
      ,[E11]
      ,[E12]
      ,[E13]
      ,[E14]
      ,[E15]
      ,[E16]
      ,[E17]
      ,[E18]
      ,[E19]
      ,[E21]
      ,[E22]
      ,[E23]
      ,[E24]
      ,[E25]
      ,[E26]
      ,[E27]
      ,[E28]
      ,[E29]
      ,[E31]
      ,[E32]
      ,[E33]
      ,[E34]
      ,[E35]
      ,[E36]
      ,[E37]
      ,[E38]
      ,[E39]
      ,[E41]
      ,[E42]
      ,[E43]
      ,[E44]
      ,[E45]
      ,[E46]
      ,[E47]
      ,[E48]
      ,[E49]
      ,[E51]
      ,[E52]
      ,[E53]
      ,[E54]
      ,[E55]
      ,[E56]
      ,[E57]
      ,[E58]
      ,[E59]
      ,[E61]
      ,[E62]
      ,[E63]
      ,[E64]
      ,[E65]
      ,[E66]
      ,[E67]
      ,[E68]
      ,[E69]
      ,[E71]
      ,[E72]
      ,[E73]
      ,[E74]
      ,[E75]
      ,[E76]
      ,[E77]
      ,[E78]
      ,[E79]
      ,[E81]
      ,[E82]
      ,[E83]
      ,[E84]
      ,[E85]
      ,[E86]
      ,[E87]
      ,[E88]
      ,[E89]
      ,[E91]
      ,[E92]
      ,[E93]
      ,[E94]
      ,[E95]
      ,[E96]
      ,[E97]
      ,[E98]
      ,[E99]
      ,[E101]
      ,[E102]
      ,[E103]
      ,[E104]
      ,[E105]
      ,[E106]
      ,[E107]
      ,[E108]
      ,[E109]
      ,[E111]
      ,[E112]
      ,[E113]
      ,[E114]
      ,[E115]
      ,[E116]
      ,[E117]
      ,[E118]
      ,[E119]
      ,[E121]
      ,[E122]
      ,[E123]
      ,[E124]
      ,[E125]
      ,[E126]
      ,[E127]
      ,[E128]
      ,[E129]
      ,[E131]
      ,[E132]
      ,[E133]
      ,[E134]
      ,[E135]
      ,[E136]
      ,[E137]
      ,[E138]
      ,[E139]
      ,[E141]
      ,[E142]
      ,[E143]
      ,[E144]
      ,[E145]
      ,[E146]
      ,[E147]
      ,[E148]
      ,[E149]
      ,[E151]
      ,[E152]
      ,[E153]
      ,[E154]
      ,[E155]
      ,[E156]
      ,[E157]
      ,[E158]
      ,[E159]
      ,[E161]
      ,[E162]
      ,[E163]
      ,[E164]
      ,[E165]
      ,[E166]
      ,[E167]
      ,[E168]
      ,[E169]
      ,[E171]
      ,[E172]
      ,[E173]
      ,[E174]
      ,[E175]
      ,[E176]
      ,[E177]
      ,[E178]
      ,[E179]
      ,[E181]
      ,[E182]
      ,[E183]
      ,[E184]
      ,[E185]
      ,[E186]
      ,[E187]
      ,[E188]
      ,[E189]
      ,[E191]
      ,[E192]
      ,[E193]
      ,[E194]
      ,[E195]
      ,[E196]
      ,[E197]
      ,[E198]
      ,[E199]
      ,[E201]
      ,[E202]
      ,[E203]
      ,[E204]
      ,[E205]
      ,[E206]
      ,[E207]
      ,[E208]
      ,[E209]
      ,[E211]
      ,[E212]
      ,[E213]
      ,[E214]
      ,[E215]
      ,[E216]
      ,[E217]
      ,[E218]
      ,[E219]
      ,[E221]
      ,[E222]
      ,[E223]
      ,[E224]
      ,[E225]
      ,[E226]
      ,[E227]
      ,[E228]
      ,[E229]
      ,[E231]
      ,[E232]
      ,[E233]
      ,[E234]
      ,[E235]
      ,[E236]
      ,[E237]
      ,[E238]
      ,[E239]
      ,[E241]
      ,[E242]
      ,[E243]
      ,[E244]
      ,[E245]
      ,[E246]
      ,[E247]
      ,[E248]
      ,[E249]
      ,[E251]
      ,[E252]
      ,[E253]
      ,[E254]
      ,[E255]
      ,[E256]
      ,[E257]
      ,[E258]
      ,[E259]
      ,[E261]
      ,[E262]
      ,[E263]
      ,[E264]
      ,[E265]
      ,[E266]
      ,[E267]
      ,[E268]
      ,[E269]
      ,[E271]
      ,[E272]
      ,[E273]
      ,[E274]
      ,[E275]
      ,[E276]
      ,[E277]
      ,[E278]
      ,[E279]
      ,[E281]
      ,[E282]
      ,[E283]
      ,[E284]
      ,[E285]
      ,[E286]
      ,[E287]
      ,[E288]
      ,[E289]
      ,[E291]
      ,[E292]
      ,[E293]
      ,[E294]
      ,[E295]
      ,[E296]
      ,[E297]
      ,[E298]
      ,[E299]
      ,[E301]
      ,[E302]
      ,[E303]
      ,[E304]
      ,[E305]
      ,[E306]
      ,[E307]
      ,[E308]
      ,[E309]
      ,[E311]
      ,[E312]
      ,[E313]
      ,[E314]
      ,[E315]
      ,[E316]
      ,[E317]
      ,[E318]
      ,[E319]
      ,[E321]
      ,[E322]
      ,[E323]
      ,[E324]
      ,[E325]
      ,[E326]
      ,[E327]
      ,[E328]
      ,[E329]
      ,[E331]
      ,[E332]
      ,[E333]
      ,[E334]
      ,[E335]
      ,[E336]
      ,[E337]
      ,[E338]
      ,[E339]
      ,[E341]
      ,[E342]
      ,[E343]
      ,[E344]
      ,[E345]
      ,[E346]
      ,[E347]
      ,[E348]
      ,[E349]
      ,[E351]
      ,[E352]
      ,[E353]
      ,[E354]
      ,[E355]
      ,[E356]
      ,[E357]
      ,[E358]
      ,[E359]
      ,[E361]
      ,[E362]
      ,[E363]
      ,[E364]
      ,[E365]
      ,[E366]
      ,[E367]
      ,[E368]
      ,[E369]
      ,[E371]
      ,[E372]
      ,[E373]
      ,[E374]
      ,[E375]
      ,[E376]
      ,[E377]
      ,[E378]
      ,[E379]
      ,[E381]
      ,[E382]
      ,[E383]
      ,[E384]
      ,[E385]
      ,[E386]
      ,[E387]
      ,[E388]
      ,[E389]
      ,[E391]
      ,[E392]
      ,[E393]
      ,[E394]
      ,[E395]
      ,[E396]
      ,[E397]
      ,[E398]
      ,[E399]
      ,[E401]
      ,[E402]
      ,[E403]
      ,[E404]
      ,[E405]
      ,[E406]
      ,[E407]
      ,[E408]
      ,[E409]
      ,[E411]
      ,[E412]
      ,[E413]
      ,[E414]
      ,[E415]
      ,[E416]
      ,[E417]
      ,[E418]
      ,[E419]
      ,[E421]
      ,[E422]
      ,[E423]
      ,[E424]
      ,[E425]
      ,[E426]
      ,[E427]
      ,[E428]
      ,[E429]
      ,[E431]
      ,[E432]
      ,[E433]
      ,[E434]
      ,[E435]
      ,[E436]
      ,[E437]
      ,[E438]
      ,[E439]
      ,[E441]
      ,[E442]
      ,[E443]
      ,[E444]
      ,[E445]
      ,[E446]
      ,[E447]
      ,[E448]
      ,[E449]
      ,[E451]
      ,[E452]
      ,[E453]
      ,[E454]
      ,[E455]
      ,[E456]
      ,[E457]
      ,[E458]
      ,[E459]
      ,[E461]
      ,[E462]
      ,[E463]
      ,[E464]
      ,[E465]
      ,[E466]
      ,[E467]
      ,[E468]
      ,[E469]
      ,[E471]
      ,[E472]
      ,[E473]
      ,[E474]
      ,[E475]
      ,[E476]
      ,[E477]
      ,[E478]
      ,[E479]
      ,[E481]
      ,[E482]
      ,[E483]
      ,[E484]
      ,[E485]
      ,[E486]
      ,[E487]
      ,[E488]
      ,[E489]
      ,[E491]
      ,[E492]
      ,[E493]
      ,[E494]
      ,[E495]
      ,[E496]
      ,[E497]
      ,[E498]
      ,[E499]
      ,[E501]
      ,[E502]
      ,[E503]
      ,[E504]
      ,[E505]
      ,[E506]
      ,[E507]
      ,[E508]
      ,[E509]
      ,[E511]
      ,[E512]
      ,[E513]
      ,[E514]
      ,[E515]
      ,[E516]
      ,[E517]
      ,[E518]
      ,[E519]
      ,[E521]
      ,[E522]
      ,[E523]
      ,[E524]
      ,[E525]
      ,[E526]
      ,[E527]
      ,[E528]
      ,[E529]
      ,[E531]
      ,[E532]
      ,[E533]
      ,[E534]
      ,[E535]
      ,[E536]
      ,[E537]
      ,[E538]
      ,[E539]
      ,[E541]
      ,[E542]
      ,[E543]
      ,[E544]
      ,[E545]
      ,[E546]
      ,[E547]
      ,[E548]
      ,[E549]
      ,[E551]
      ,[E552]
      ,[E553]
      ,[E554]
      ,[E555]
      ,[E556]
      ,[E557]
      ,[E558]
      ,[E559]
      ,[E561]
      ,[E562]
      ,[E563]
      ,[E564]
      ,[E565]
      ,[E566]
      ,[E567]
      ,[E568]
      ,[E569]
      ,[E571]
      ,[E572]
      ,[E573]
      ,[E574]
      ,[E575]
      ,[E576]
      ,[E577]
      ,[E578]
      ,[E579]
      ,[E581]
      ,[E582]
      ,[E583]
      ,[E584]
      ,[E585]
      ,[E586]
      ,[E587]
      ,[E588]
      ,[E589]
      ,[E591]
      ,[E592]
      ,[E593]
      ,[E594]
      ,[E595]
      ,[E596]
      ,[E597]
      ,[E598]
      ,[E599]
      ,[E601]
      ,[E602]
      ,[E603]
      ,[E604]
      ,[E605]
      ,[E606]
      ,[E607]
      ,[E608]
      ,[E609]
      ,[E611]
      ,[E612]
      ,[E613]
      ,[E614]
      ,[E615]
      ,[E616]
      ,[E617]
      ,[E618]
      ,[E619]
      ,[E621]
      ,[E622]
      ,[E623]
      ,[E624]
      ,[E625]
      ,[E626]
      ,[E627]
      ,[E628]
      ,[E629]
      ,[E631]
      ,[E632]
      ,[E633]
      ,[E634]
      ,[E635]
      ,[E636]
      ,[E637]
      ,[E638]
      ,[E639]
      ,[E641]
      ,[E642]
      ,[E643]
      ,[E644]
      ,[E645]
      ,[E646]
      ,[E647]
      ,[E648]
      ,[E649]
      ,[E651]
      ,[E652]
      ,[E653]
      ,[E654]
      ,[E655]
      ,[E656]
      ,[E657]
      ,[E658]
      ,[E659]
      ,[E661]
      ,[E662]
      ,[E663]
      ,[E664]
      ,[E665]
      ,[E666]
      ,[E667]
      ,[E668]
      ,[E669]
      ,[E671]
      ,[E672]
      ,[E673]
      ,[E674]
      ,[E675]
      ,[E676]
      ,[E677]
      ,[E678]
      ,[E679]
      ,[E681]
      ,[E682]
      ,[E683]
      ,[E684]
      ,[E685]
      ,[E686]
      ,[E687]
      ,[E688]
      ,[E689]
      ,[E691]
      ,[E692]
      ,[E693]
      ,[E694]
      ,[E695]
      ,[E696]
      ,[E697]
      ,[E698]
      ,[E699]
      ,[E701]
      ,[E702]
      ,[E703]
      ,[E704]
      ,[E705]
      ,[E706]
      ,[E707]
      ,[E708]
      ,[E709]
      ,[E711]
      ,[E712]
      ,[E713]
      ,[E714]
      ,[E715]
      ,[E716]
      ,[E717]
      ,[E718]
      ,[E719]
      ,[E721]
      ,[E722]
      ,[E723]
      ,[E724]
      ,[E725]
      ,[E726]
      ,[E727]
      ,[E728]
      ,[E729]
      ,[E731]
      ,[E732]
      ,[E733]
      ,[E734]
      ,[E735]
      ,[E736]
      ,[E737]
      ,[E738]
      ,[E739]
      ,[E741]
      ,[E742]
      ,[E743]
      ,[E744]
      ,[E745]
      ,[E746]
      ,[E747]
      ,[E748]
      ,[E749]
      ,[E751]
      ,[E752]
      ,[E753]
      ,[E754]
      ,[E755]
      ,[E756]
      ,[E757]
      ,[E758]
      ,[E759]
      ,[E1]
      ,[E2]
      ,[E3]
      ,[E4]
      ,[E5]
      ,[E6]
      ,[E7]
      ,[E8]
      ,[E9]
      ,[osa15]
      ,[nai15]
      ,[osa16]
      ,[nai16]
      ,[osa17]
      ,[nai17]
) ) unpvt
where mittari_arvo <> '' and cast(mittari_arvo as int) <> 0


GO


USE [ANTERO]