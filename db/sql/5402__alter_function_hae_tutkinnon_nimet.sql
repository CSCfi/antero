USE [ANTERO]
GO
/****** Object:  UserDefinedFunction [dbo].[hae_tutkinnon_nimet]    Script Date: 7.1.2022 14:07:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[hae_tutkinnon_nimet] 
(
	@alku date
	,@loppu date
	,@tutk char(6)
)

RETURNS TABLE AS

RETURN
(
	with ep as (
		select 
			tutkintokoodi
			,nimi_fi
			,siirtymapaattyy =  max(case when voimassaololoppuu = ca.max_loppu then siirtymapaattyy end)
			,rivi_nro = dense_rank() over (partition by tutkintokoodi order by nimi_fi)
		from [Koski_SA].[sa].[sa_eperusteet] ep1
		cross apply (select max_loppu=max(coalesce(voimassaololoppuu,'9999-12-31')) from [Koski_SA].[sa].[sa_eperusteet] ep2 where ep2.tutkintokoodi=@tutk) ca
		where 1=1 
		and nimi_fi not like '%kokeilu'
		and (voimassaoloalkaa < @loppu and coalesce(siirtymapaattyy,voimassaololoppuu,'9999-12-31') > @alku)
		and tutkintokoodi = @tutk
		group by tutkintokoodi,nimi_fi
	)

	select distinct
		ep1.tutkintokoodi
		,ep1.nimi_fi as nimi1
		,ep2.nimi_fi as nimi2
		,ep3.nimi_fi as nimi3
		,ep4.nimi_fi as nimi4
		,ep4.nimi_fi as nimi5
		,ep1.siirtymapaattyy
	from ep ep1
	left join ep as ep2 on ep2.tutkintokoodi=ep1.tutkintokoodi and ep2.rivi_nro=2
	left join ep as ep3 on ep3.tutkintokoodi=ep1.tutkintokoodi and ep3.rivi_nro=3
	left join ep as ep4 on ep4.tutkintokoodi=ep1.tutkintokoodi and ep4.rivi_nro=4
	left join ep as ep5 on ep5.tutkintokoodi=ep1.tutkintokoodi and ep5.rivi_nro=5
	where ep1.rivi_nro=1
)

