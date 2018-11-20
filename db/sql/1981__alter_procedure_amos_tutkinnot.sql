USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot]    Script Date: 20.11.2018 11:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dw].[p_lataa_f_amos_tutkinnot] as


truncate table dw.f_amos_tutkinnot 

insert into dw.f_amos_tutkinnot

select
	 vuosi
	,aineisto as vaihe
	,coalesce(d1.id,-1)
	,tutkintopisteiden_osuus = painotettu_tutkintomaara / painotettu_tutkintomaara_summa
	,painotettu_tutkintomaara
	,painottamaton_tutkintomaara
from (
	select
		vuosi
		,aineisto
		,ytunnus
		,painotettu_tutkintomaara = sum(painotettu_tutkintomaara)
		,painotettu_tutkintomaara_summa = sum(painotettu_tutkintomaara_summa)
		,painottamaton_tutkintomaara = sum(painottamaton_tutkintomaara) 
									
	from (

		select
			 vuosi
			,aineisto
			,ytunnus
			,painotettu_tutkintomaara = sum(painotettu_tutkintomaara)
			,painotettu_tutkintomaara_summa = sum(painotettu_tutkintomaara) OVER (PARTITION BY vuosi,aineisto)
			,painottamaton_tutkintomaara = sum(painottamaton_tutkintojen_maara_ei_pohjakoulutusta) 
										 + sum(painottamaton_tutkintojen_maara_pohjakoulutus)
										  
		from (

			select
				 amos1.vuosi
				,amos1.aineisto
				,COALESCE(org.uusi_ytunnus,amos1.ytunnus) as ytunnus

				,painotettu_tutkintomaara = 
				--ei pohjakoulutusta
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Pohjakoulutus' and ryhma_koodi='ei_pohjakoul') *
					(
						--perustutkinnot
						(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (tutkinnot)' and ryhma_koodi='pt') *
							( 
								  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_pt_kr1 else amos2.ei_pohjakoul_pt_kr1 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_pt_kr2 else amos2.ei_pohjakoul_pt_kr2 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_pt_kr3 else amos2.ei_pohjakoul_pt_kr3 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_pt_kr4 else amos2.ei_pohjakoul_pt_kr4 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_pt_kr5 else amos2.ei_pohjakoul_pt_kr5 end)
							)
						--ammatti- ja erikoisammattitutkinnot
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (tutkinnot)' and ryhma_koodi='at_eat') *
							( 
								  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_at_eat_kr1 else amos2.ei_pohjakoul_at_eat_kr1 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_at_eat_kr2 else amos2.ei_pohjakoul_at_eat_kr2 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_at_eat_kr3 else amos2.ei_pohjakoul_at_eat_kr3 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_at_eat_kr4 else amos2.ei_pohjakoul_at_eat_kr4 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.ei_pohjakoul_at_eat_kr5 else amos2.ei_pohjakoul_at_eat_kr5 end)
							)
					) +
				--pohjakoulutus
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Pohjakoulutus' and ryhma_koodi='pohjakoul') *
					(
						--perustutkinnot
						(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (tutkinnot)' and ryhma_koodi='pt') *
							( 
								  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_pt_kr1 else amos2.pohjakoul_pt_kr1 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_pt_kr2 else amos2.pohjakoul_pt_kr2 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_pt_kr3 else amos2.pohjakoul_pt_kr3 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_pt_kr4 else amos2.pohjakoul_pt_kr4 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_pt_kr5 else amos2.pohjakoul_pt_kr5 end)
							)
						--ammatti- ja erikoisammattitutkinnot
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (tutkinnot)' and ryhma_koodi='at_eat') *
							( 
								  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_at_eat_kr1 else amos2.pohjakoul_at_eat_kr1 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_at_eat_kr2 else amos2.pohjakoul_at_eat_kr2 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_at_eat_kr3 else amos2.pohjakoul_at_eat_kr3 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_at_eat_kr4 else amos2.pohjakoul_at_eat_kr4 end)
								+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and amos1.vuosi between year(alkaen) and year(paattyen)) * (case when amos1.aineisto='L' then amos1.pohjakoul_at_eat_kr5 else amos2.pohjakoul_at_eat_kr5 end)
							)
					)

				,painottamaton_tutkintojen_maara_ei_pohjakoulutusta = 
					case
						when amos1.aineisto='L' then amos1.[ei_pohjakoul_pt_kr1]+amos1.[ei_pohjakoul_pt_kr2]+amos1.[ei_pohjakoul_pt_kr3]+amos1.[ei_pohjakoul_pt_kr4]+amos1.[ei_pohjakoul_pt_kr5]+amos1.[ei_pohjakoul_at_eat_kr1]+amos1.[ei_pohjakoul_at_eat_kr2]+amos1.[ei_pohjakoul_at_eat_kr3]+amos1.[ei_pohjakoul_at_eat_kr4]+amos1.[ei_pohjakoul_at_eat_kr5]
						else amos2.[ei_pohjakoul_pt_kr1]+amos2.[ei_pohjakoul_pt_kr2]+amos2.[ei_pohjakoul_pt_kr3]+amos2.[ei_pohjakoul_pt_kr4]+amos2.[ei_pohjakoul_pt_kr5]+amos2.[ei_pohjakoul_at_eat_kr1]+amos2.[ei_pohjakoul_at_eat_kr2]+amos2.[ei_pohjakoul_at_eat_kr3]+amos2.[ei_pohjakoul_at_eat_kr4]+amos2.[ei_pohjakoul_at_eat_kr5]
					end
				,painottamaton_tutkintojen_maara_pohjakoulutus = 
					case
						when amos1.aineisto='L' then amos1.[pohjakoul_pt_kr1]+amos1.[pohjakoul_pt_kr2]+amos1.[pohjakoul_pt_kr3]+amos1.[pohjakoul_pt_kr4]+amos1.[pohjakoul_pt_kr5]+amos1.[pohjakoul_at_eat_kr1]+amos1.[pohjakoul_at_eat_kr2]+amos1.[pohjakoul_at_eat_kr3]+amos1.[pohjakoul_at_eat_kr4]+amos1.[pohjakoul_at_eat_kr5]
						else amos2.[pohjakoul_pt_kr1]+amos2.[pohjakoul_pt_kr2]+amos2.[pohjakoul_pt_kr3]+amos2.[pohjakoul_pt_kr4]+amos2.[pohjakoul_pt_kr5]+amos2.[pohjakoul_at_eat_kr1]+amos2.[pohjakoul_at_eat_kr2]+amos2.[pohjakoul_at_eat_kr3]+amos2.[pohjakoul_at_eat_kr4]+amos2.[pohjakoul_at_eat_kr5]
					end

			from sa.sa_amos_tutkinnot amos1
			left join dw.v_amos_organisaatioliitokset org on org.poistuva_ytunnus=amos1.ytunnus
			--ennakkoaineistoa varten otetaan pohjakoulutusjakauma edellisen vuoden lopullisista tiedoista. Jos viime vuodelta ei ole tietoja, käytetään koko aineistosta laskettua jakaumaa.
			left join (
				select
					 vuosi
					,ytunnus
					,est_ei_pohjakoul_pt_kr1 * pt_kr1 as ei_pohjakoul_pt_kr1
					,(1-est_ei_pohjakoul_pt_kr1) * pt_kr1 as pohjakoul_pt_kr1
					,est_ei_pohjakoul_pt_kr2 * pt_kr2 as ei_pohjakoul_pt_kr2
					,(1-est_ei_pohjakoul_pt_kr2) * pt_kr2 as pohjakoul_pt_kr2
					,est_ei_pohjakoul_pt_kr3 * pt_kr3 as ei_pohjakoul_pt_kr3
					,(1-est_ei_pohjakoul_pt_kr3) * pt_kr3 as pohjakoul_pt_kr3
					,est_ei_pohjakoul_pt_kr4 * pt_kr4 as ei_pohjakoul_pt_kr4
					,(1-est_ei_pohjakoul_pt_kr4) * pt_kr4 as pohjakoul_pt_kr4
					,est_ei_pohjakoul_pt_kr5 * pt_kr5 as ei_pohjakoul_pt_kr5
					,(1-est_ei_pohjakoul_pt_kr5) * pt_kr5 as pohjakoul_pt_kr5
					,est_ei_pohjakoul_at_eat_kr1 * at_eat_kr1 as ei_pohjakoul_at_eat_kr1
					,(1-est_ei_pohjakoul_at_eat_kr1) * at_eat_kr1 as pohjakoul_at_eat_kr1
					,est_ei_pohjakoul_at_eat_kr2 * at_eat_kr2 as ei_pohjakoul_at_eat_kr2
					,(1-est_ei_pohjakoul_at_eat_kr2) * at_eat_kr2 as pohjakoul_at_eat_kr2
					,est_ei_pohjakoul_at_eat_kr3 * at_eat_kr3 as ei_pohjakoul_at_eat_kr3
					,(1-est_ei_pohjakoul_at_eat_kr3) * at_eat_kr3 as pohjakoul_at_eat_kr3
					,est_ei_pohjakoul_at_eat_kr4 * at_eat_kr4 as ei_pohjakoul_at_eat_kr4
					,(1-est_ei_pohjakoul_at_eat_kr4) * at_eat_kr4 as pohjakoul_at_eat_kr4
					,est_ei_pohjakoul_at_eat_kr5 * at_eat_kr5 as ei_pohjakoul_at_eat_kr5
					,(1-est_ei_pohjakoul_at_eat_kr5) * at_eat_kr5 as pohjakoul_at_eat_kr5
				from (

					select distinct
						 sa1.vuosi 
						,sa1.ytunnus as ytunnus
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_pt_kr1) + sum(sa2.pohjakoul_pt_kr1)),0)=0 then cast(sum(sa3.ei_pohjakoul_pt_kr1) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_pt_kr1 + sa3.pohjakoul_pt_kr1) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_pt_kr1) as decimal) / (sum(sa2.ei_pohjakoul_pt_kr1) + sum(sa2.pohjakoul_pt_kr1)) 
						 end as est_ei_pohjakoul_pt_kr1
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_pt_kr2) + sum(sa2.pohjakoul_pt_kr2)),0)=0 then cast(sum(sa3.ei_pohjakoul_pt_kr2) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_pt_kr2 + sa3.pohjakoul_pt_kr2) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_pt_kr2) as decimal) / (sum(sa2.ei_pohjakoul_pt_kr2) + sum(sa2.pohjakoul_pt_kr2)) 
						 end as est_ei_pohjakoul_pt_kr2
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_pt_kr3) + sum(sa2.pohjakoul_pt_kr3)),0)=0 then cast(sum(sa3.ei_pohjakoul_pt_kr3) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_pt_kr3 + sa3.pohjakoul_pt_kr3) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_pt_kr3) as decimal) / (sum(sa2.ei_pohjakoul_pt_kr3) + sum(sa2.pohjakoul_pt_kr3)) 
						 end as est_ei_pohjakoul_pt_kr3
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_pt_kr4) + sum(sa2.pohjakoul_pt_kr4)),0)=0 then cast(sum(sa3.ei_pohjakoul_pt_kr4) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_pt_kr4 + sa3.pohjakoul_pt_kr4) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_pt_kr4) as decimal) / (sum(sa2.ei_pohjakoul_pt_kr4) + sum(sa2.pohjakoul_pt_kr4)) 
						 end as est_ei_pohjakoul_pt_kr4
						 ,case 
							when coalesce((sum(sa2.ei_pohjakoul_pt_kr5) + sum(sa2.pohjakoul_pt_kr5)),0)=0 then cast(sum(sa3.ei_pohjakoul_pt_kr5) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_pt_kr5 + sa3.pohjakoul_pt_kr5) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_pt_kr5) as decimal) / (sum(sa2.ei_pohjakoul_pt_kr5) + sum(sa2.pohjakoul_pt_kr5)) 
						 end as est_ei_pohjakoul_pt_kr5
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_at_eat_kr1) + sum(sa2.pohjakoul_at_eat_kr1)),0)=0 then cast(sum(sa3.ei_pohjakoul_at_eat_kr1) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_at_eat_kr1 + sa3.pohjakoul_at_eat_kr1) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_at_eat_kr1) as decimal) / (sum(sa2.ei_pohjakoul_at_eat_kr1) + sum(sa2.pohjakoul_at_eat_kr1)) 
						 end as est_ei_pohjakoul_at_eat_kr1
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_at_eat_kr2) + sum(sa2.pohjakoul_at_eat_kr2)),0)=0 then cast(sum(sa3.ei_pohjakoul_at_eat_kr2) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_at_eat_kr2 + sa3.pohjakoul_at_eat_kr2) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_at_eat_kr2) as decimal) / (sum(sa2.ei_pohjakoul_at_eat_kr2) + sum(sa2.pohjakoul_at_eat_kr2)) 
						 end as est_ei_pohjakoul_at_eat_kr2
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_at_eat_kr3) + sum(sa2.pohjakoul_at_eat_kr3)),0)=0 then cast(sum(sa3.ei_pohjakoul_at_eat_kr3) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_at_eat_kr3 + sa3.pohjakoul_at_eat_kr3) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_at_eat_kr3) as decimal) / (sum(sa2.ei_pohjakoul_at_eat_kr3) + sum(sa2.pohjakoul_at_eat_kr3)) 
						 end as est_ei_pohjakoul_at_eat_kr3
						,case 
							when coalesce((sum(sa2.ei_pohjakoul_at_eat_kr4) + sum(sa2.pohjakoul_at_eat_kr4)),0)=0 then cast(sum(sa3.ei_pohjakoul_at_eat_kr4) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / sum(sa3.ei_pohjakoul_at_eat_kr4 + sa3.pohjakoul_at_eat_kr4) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) 
							else cast(sum(sa2.ei_pohjakoul_at_eat_kr4) as decimal) / (sum(sa2.ei_pohjakoul_at_eat_kr4) + sum(sa2.pohjakoul_at_eat_kr4)) 
						 end as est_ei_pohjakoul_at_eat_kr4
						 ,case 
							when coalesce((sum(sa2.ei_pohjakoul_at_eat_kr5) + sum(sa2.pohjakoul_at_eat_kr5)),0)=0 then cast(sum(sa3.ei_pohjakoul_at_eat_kr5) OVER (PARTITION BY sa3.vuosi,sa3.aineisto) as decimal) / COALESCE(NULLIF(sum(sa3.ei_pohjakoul_at_eat_kr5 + sa3.pohjakoul_at_eat_kr5) OVER (PARTITION BY sa3.vuosi,sa3.aineisto),0),1)
							else cast(sum(sa2.ei_pohjakoul_at_eat_kr5) as decimal) / (sum(sa2.ei_pohjakoul_at_eat_kr5) + sum(sa2.pohjakoul_at_eat_kr5)) 
						 end as est_ei_pohjakoul_at_eat_kr5
						,sa1.pt_kr1
						,sa1.pt_kr2
						,sa1.pt_kr3
						,sa1.pt_kr4
						,sa1.pt_kr5
						,sa1.at_eat_kr1
						,sa1.at_eat_kr2
						,sa1.at_eat_kr3
						,sa1.at_eat_kr4
						,sa1.at_eat_kr5
	
					from [sa].[sa_amos_tutkinnot] sa1
					left join ANTERO.sa.sa_amos_tutkinnot sa2 on sa1.ytunnus=sa2.ytunnus and sa2.vuosi=sa1.vuosi-1 and sa2.aineisto='L'
					left join ANTERO.sa.sa_amos_tutkinnot sa3 on sa3.vuosi=sa1.vuosi-1 and sa3.aineisto='L'
					where sa1.aineisto='E'
					group by sa1.vuosi,sa1.ytunnus,sa2.vuosi,sa2.aineisto
					,sa2.ei_pohjakoul_pt_kr1,sa2.pohjakoul_pt_kr1
					,sa2.ei_pohjakoul_pt_kr2,sa2.pohjakoul_pt_kr2
					,sa2.ei_pohjakoul_pt_kr3,sa2.pohjakoul_pt_kr3
					,sa2.ei_pohjakoul_pt_kr4,sa2.pohjakoul_pt_kr4
					,sa2.ei_pohjakoul_pt_kr5,sa2.pohjakoul_pt_kr5
					,sa2.ei_pohjakoul_at_eat_kr1,sa2.pohjakoul_at_eat_kr1
					,sa2.ei_pohjakoul_at_eat_kr2,sa2.pohjakoul_at_eat_kr2
					,sa2.ei_pohjakoul_at_eat_kr3,sa2.pohjakoul_at_eat_kr3
					,sa2.ei_pohjakoul_at_eat_kr4,sa2.pohjakoul_at_eat_kr4
					,sa2.ei_pohjakoul_at_eat_kr5,sa2.pohjakoul_at_eat_kr5
					,sa1.pt_kr1
					,sa1.pt_kr2
					,sa1.pt_kr3
					,sa1.pt_kr4
					,sa1.pt_kr5
					,sa1.at_eat_kr1
					,sa1.at_eat_kr2
					,sa1.at_eat_kr3
					,sa1.at_eat_kr4
					,sa1.at_eat_kr5
					,sa3.vuosi
					,sa3.aineisto
					,sa3.ei_pohjakoul_pt_kr1
					,sa3.pohjakoul_pt_kr1
					,sa3.ei_pohjakoul_pt_kr2
					,sa3.pohjakoul_pt_kr2
					,sa3.ei_pohjakoul_pt_kr3
					,sa3.pohjakoul_pt_kr3
					,sa3.ei_pohjakoul_pt_kr4
					,sa3.pohjakoul_pt_kr4
					,sa3.ei_pohjakoul_pt_kr5
					,sa3.pohjakoul_pt_kr5
					,sa3.ei_pohjakoul_at_eat_kr1
					,sa3.pohjakoul_at_eat_kr1
					,sa3.ei_pohjakoul_at_eat_kr2
					,sa3.pohjakoul_at_eat_kr2
					,sa3.ei_pohjakoul_at_eat_kr3
					,sa3.pohjakoul_at_eat_kr3
					,sa3.ei_pohjakoul_at_eat_kr4
					,sa3.pohjakoul_at_eat_kr4
					,sa3.ei_pohjakoul_at_eat_kr5
					,sa3.pohjakoul_at_eat_kr5

			) q1) amos2 on amos2.ytunnus=amos1.ytunnus and amos2.vuosi=amos1.vuosi	

		) q2 group by vuosi,aineisto,ytunnus,painotettu_tutkintomaara

	) q3 group by vuosi,aineisto,ytunnus

) q4 left join dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=q4.ytunnus


