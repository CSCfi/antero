USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_kalenteri]    Script Date: 1.5.2019 17:22:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_kalenteri] AS
declare @date date = '2000-01-01' --default
-- last inserted, if exists
if exists (select * from d_kalenteri) select @date=MAX(paivays) from d_kalenteri;
declare @dateend date;
-- end of next year
select @dateend = CAST(YEAR(CURRENT_TIMESTAMP)+1 as varchar)+'-12-31'
while @date<=@dateend begin
  print @date
  insert into dw.d_kalenteri
  (
    kalenteri_avain,paivays,
    vuosi,kuukausi,paiva,
    viikko,viikonpaiva,
    kuukausi_fi,kuukausi_sv,kuukausi_en,
    viikonpaiva_fi,viikonpaiva_sv,viikonpaiva_en,
	rahoituskausi_amm,
    source
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
	when DATEPART(month,@date) <7 then concat('1.7.', DATEPART(year,@date)-1,' - ','30.6.', DATEPART(year,@date)) 
	else concat('1.7.', DATEPART(year,@date),' - ','30.6.', DATEPART(year,@date)+1) 
  end as rahoituskausi_amm
  , 'ETL: p_lataa_d_kalenteri' AS source
  where @date not in (
    select paivays from dw.d_kalenteri
  )
  ;

  select @date=DATEADD(day,1,@date);
end
