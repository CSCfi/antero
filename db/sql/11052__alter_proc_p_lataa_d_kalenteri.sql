USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_kalenteri] AS

if not exists (select * from dw.d_kalenteri where id=-1) 
begin

	set identity_insert dw.d_kalenteri on;

	insert into dw.d_kalenteri (
		 id
		,kalenteri_avain
		,paivays
		,vuosi
		,kuukausi
		,paiva
		,viikko
		,viikonpaiva
		,kuukausi_fi,kuukausi_sv,kuukausi_en
		,viikonpaiva_fi,viikonpaiva_sv,viikonpaiva_en
		,rahoituskausi_amm
		,lukukausi_fi,lukukausi_sv,lukukausi_en
		,lukuvuosi
		,jarjestys_lukukausi_reverse
		,rahoituskausi_amm_1
		,rahoituskausi_amm_2
		,source
	)
	select
		'-1'
		,'9999-12-31'
		,'9999-12-31'
		,koodi
		,99
		,koodi
		,koodi
		,koodi
		,nimi,nimi_sv,nimi_en
		,nimi,nimi_sv,nimi_en
		,koodi
		,nimi,nimi_sv,nimi_en
		,koodi
		,9
		,koodi
		,koodi
		,'ETL: p_lataa_d_kalenteri'
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_kalenteri off;
end 

else 

begin
	update d
	set 
		 kalenteri_avain = '9999-12-31'
		,paivays = '9999-12-31'
		,vuosi = koodi
		,kuukausi = 99
		,paiva = koodi
		,viikko = koodi
		,viikonpaiva = koodi
		,kuukausi_fi = nimi
		,kuukausi_sv = nimi_sv
		,kuukausi_en = nimi_en
		,viikonpaiva_fi = nimi
		,viikonpaiva_sv = nimi_sv
		,viikonpaiva_en = nimi_en
		,rahoituskausi_amm = koodi
		,lukukausi_fi = nimi
		,lukukausi_sv = nimi_sv
		,lukukausi_en = nimi_en
		,lukuvuosi = koodi
		,jarjestys_lukukausi_reverse = 9
		,rahoituskausi_amm_1 = koodi
		,rahoituskausi_amm_2 = koodi
		,source='ETL: p_lataa_d_kalenteri'
	from dw.d_kalenteri d
	join sa.sa_koodistot s on s.koodi=d.id
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
end


declare @date date = '1939-01-01' --default
-- last inserted, if exists
--if exists (select * from dw.d_kalenteri where id <> -1) select @date = MAX(paivays) from dw.d_kalenteri where id <> -1;

declare @dateend date;
-- end of next year
select @dateend = CAST(YEAR(CURRENT_TIMESTAMP)+1 as varchar)+'-12-31'

while @date <= @dateend 
begin

	insert into dw.d_kalenteri (
		kalenteri_avain,paivays,
		vuosi,kuukausi,paiva,
		viikko,viikonpaiva,
		kuukausi_fi,kuukausi_sv,kuukausi_en,
		viikonpaiva_fi,viikonpaiva_sv,viikonpaiva_en,
		rahoituskausi_amm
		,lukukausi_fi,lukukausi_sv,lukukausi_en
		,lukuvuosi
		,jarjestys_lukukausi_reverse
		,rahoituskausi_amm_1
		,rahoituskausi_amm_2
		,source
	)
    select
		cast(@date AS varchar) AS kalenteri_avain
		, @date as paivays
		, DATEPART(year,@date) vuosi
		, DATEPART(month,@date) kuukausi
		, DATEPART(day,@date) paiva
		, DATEPART(ISO_WEEK,@date) viikko
		, DATEPART(weekday,@date) viikonpaiva
		, case DATEPART(month,@date)
		when 1 then 'tammikuu'    when 2 then 'helmikuu'   when 3 then 'maaliskuu'
		when 4 then 'huhtikuu'    when 5 then 'toukokuu'   when 6 then 'kesäkuu'
		when 7 then 'heinäkuu'    when 8 then 'elokuu'     when 9 then 'syyskuu'
		when 10 then 'lokakuu'    when 11 then 'marraskuu' when 12 then 'joulukuu'
		end as kuukausi_fi
		, case DATEPART(month,@date)
		when 1 then 'januari'     when 2 then 'februari'   when 3 then 'mars'
		when 4 then 'april'       when 5 then 'maj'        when 6 then 'juni'
		when 7 then 'juli'        when 8 then 'augusti'    when 9 then 'september'
		when 10 then 'oktober'    when 11 then 'november'  when 12 then 'december'
		end as kuukausi_sv
		, case DATEPART(month,@date)
		when 1 then 'January'     when 2 then 'February'   when 3 then 'March'
		when 4 then 'April'       when 5 then 'May'        when 6 then 'June'
		when 7 then 'July'        when 8 then 'August'     when 9 then 'September'
		when 10 then 'October'    when 11 then 'November'  when 12 then 'December'
		end as kuukausi_en
		, case DATEPART(weekday,@date)
		when 1 then 'sunnuntai'   when 2 then 'maanantai'  when 3 then 'tiistai'
		when 4 then 'keskiviikko' when 5 then 'torstai'    when 6 then 'perjantai'
		when 7 then 'lauantai'
		end as viikonpaiva_fi
		, case DATEPART(weekday,@date)
		when 1 then 'söndag'      when 2 then 'måndag'     when 3 then 'tisdag'
		when 4 then 'onsdag'      when 5 then 'torsdag'    when 6 then 'fredag'
		when 7 then 'lördag'
		end as viikonpaiva_sv
		, case DATEPART(weekday,@date)
		when 1 then 'Sunday'      when 2 then 'Monday'     when 3 then 'Tuesday'
		when 4 then 'Wednesday'   when 5 then 'Thursday'   when 6 then 'Friday'
		when 7 then 'Saturday'
		end as viikonpaiva_en
		, case 
		when DATEPART(month,@date) <7 then concat('01.07.', DATEPART(year,@date)-1,' - ','30.06.', DATEPART(year,@date)) 
		else concat('01.07.', DATEPART(year,@date),' - ','30.06.', DATEPART(year,@date)+1) 
		end as rahoituskausi_amm
		, case 
		when DATEPART(month,@date) between 1 and 7 then 'Kevät'
		when DATEPART(month,@date) between 8 and 12 then 'Syksy'
		end as lukukausi_fi
		, case 
		when DATEPART(month,@date) between 1 and 7 then 'Vår'
		when DATEPART(month,@date) between 8 and 12 then 'Höst'
		end as lukukausi_sv
		, case 
		when DATEPART(month,@date) between 1 and 7 then 'Spring'
		when DATEPART(month,@date) between 8 and 12 then 'Autumn'
		end as lukukausi_en
		, case 
		when DATEPART(month,@date) between 1 and 7 then cast(DATEPART(year,@date)-1 as varchar) + '/' + cast(DATEPART(year,@date) as varchar)
		when DATEPART(month,@date) between 8 and 12 then cast(DATEPART(year,@date) as varchar) + '/' + cast(DATEPART(year,@date)+1 as varchar)
		end as lukuvuosi
		, case 
		when DATEPART(month,@date) between 1 and 7 then 2
		when DATEPART(month,@date) between 8 and 12 then 1
		end as jarjestys_lukukausi_reverse
		, case 
		when DATEPART(month,@date) <7 then concat('01.07.', DATEPART(year,@date)-2,' - ','30.06.', DATEPART(year,@date)) 
		else concat('01.07.', DATEPART(year,@date)-1,' - ','30.06.', DATEPART(year,@date)+1) 
		end as rahoituskausi_amm_1
		, case 
		when DATEPART(month,@date) <7 then concat('01.07.', DATEPART(year,@date)-1,' - ','30.06.', DATEPART(year,@date)+1) 
		else concat('01.07.', DATEPART(year,@date),' - ','30.06.', DATEPART(year,@date)+2) 
		end as rahoituskausi_amm_2
		, 'ETL: p_lataa_d_kalenteri' AS source
  where @date not in (
    select paivays from dw.d_kalenteri
  );

  select @date = DATEADD(day,1,@date);

end

GO
