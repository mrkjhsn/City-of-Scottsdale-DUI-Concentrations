--create temporary table including just DUI citations and grouping citations by the street locations they take place at
  select 
	 [Street]
	,count([Charge Description]) as _Count_
  into #DUI_Percent
  from [dbo].[spd_PDCitations$]
  where [Charge Description] like '%DUI%'
  group by [Street]

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


  --perform the above, but instead embed the temporary table within the "from" clause

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
