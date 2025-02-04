
--create temporary table including just DUI citations and grouping citations by the street locations they take place at
  select 
	 [Street]
	,count([Charge Description]) as _Count_
  into #DUI_Percent
  from [dbo].[spd_PDCitations$]
  where [Charge Description] like '%DUI%'
  group by [Street]

  select * from #DUI_Percent


  --use temp table to find percent of DUIs at specific streets and intersections across Scottsdale
    select 
	 A.[Street]
	 ,A._Count_
	 ,convert(varchar,
			round(
				 convert(float, A._Count_)/convert(float, B._Total_)*100
				 ,2
			 )
	 ) + '%'as _Percent_
  from #DUI_Percent as A
  cross join (select sum(_Count_) as _Total_
			 from #DUI_Percent
			 ) as B
  group by A.[Street], A._Count_, (convert(float, A._Count_)/convert(float, B._Total_)*100)
  order by _Percent_ desc


  --performs the same as the above, but instead embed the temporary table within the "from" clause.
  --the temp table must run twice, which will invariably make this query slower than the above.

  select 
	 A.[Street]
	 ,A._Count_
	 ,convert(varchar,
			round(
				 convert(float, A._Count_)/convert(float, B._Total_)*100
				 ,2
			 )
	 ) + '%'as _Percent_
  from    (
		  select 
	      [Street]
		  ,count([Charge Description]) as _Count_
		  from [dbo].[spd_PDCitations$]
		  where [Charge Description] like '%DUI%'
		  group by [Street]
		  
  ) as A

  cross join  (
				select 
			    sum(_Count_) as _Total_
			    from (
				
				  select 
					[Street]
	               ,count([Charge Description]) as _Count_
                   from [dbo].[spd_PDCitations$]
                   where [Charge Description] like '%DUI%'
                   group by [Street]) as C  --interestingly an alias is needed here, even though I'm not calling the alias anywhere else in the querry
 ) as B
			   
  group by A.[Street], A._Count_, (convert(float, A._Count_)/convert(float, B._Total_)*100)
  order by _Percent_ desc

  -- based on histogram, most DUIs take place between 2 - 3AM
  -- what percent of total DUIs take place between these times?  Approximately 35%
  select 
	 A.DUIs_between_2_and_3am
	,B.DUIs_total
	,convert(varchar,
		round(
			convert(float,A.DUIs_between_2_and_3am)/convert(float,B.DUIs_total)*100
			,2
		)
	)  + '%' as _Percent_
  from (
		select 
		count([Citation Time]) as DUIs_between_2_and_3am
		from [dbo].[spd_PDCitations$]
		where [Citation Time] between 100 and 300 and 
		[Charge Description] like '%DUI%'
		) as A
  cross join   (
				select 
				count([Citation Time]) as DUIs_total
				from [dbo].[spd_PDCitations$]
				where [Charge Description] like '%DUI%'
				) as B
  group by A.DUIs_between_2_and_3am, B.DUIs_total