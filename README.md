# City of Scottsdale DUI Concentrations
Where do most City of Scottsdale DUI citations occur? 

The City of Scottsdale publishes a [dataset](http://data.scottsdaleaz.gov/dataset/police-citations)* that includes all citations issed on a one year rolling basis.



As a cyclist I was interested in the areas I should not be cycling in, especially late at night on the weekends.  Based on the "Street" attribute from the City of Scottsdale citations data set citations are located at either a street address(street numbers blocked out) or a street intersection.

My analysis was performed in SQL.  I used a temporary table to sumarize a count of DUI citations, grouped by streets and intersections.  Then I used a cross join to append this to a query in order to find the number of total DUIs that took place at any given street or intersection as a percentage of the total.

#### Results:
1. My data showed that the road associated with the highest number of DUIs with Indian School with 9.8%.  This makes sense since Indian School Road is the primary east/west corridor running through Old Town Scottsdale(an area of town with a high concentration of drinking establishments).
2. The top intersection associated with DUI citations was Indian School and Hayden with 3.6%.  This surprised me since Scottsdale Road is the primary north/south corridor running through Old Town Scottsdale.
3.  Approximately 35% of DUIs were issued between 1 and 3AM.

#### Further Things to Consider: 
1. Correlate DUI counts with times of the day.
2. ~~Is it possible to graphically show a cluster map of the count associated with streets and intersections?~~  This doesn't seem possible based on the data provided at this time.  For instance, Hayden Rd. runs from 15000 in the north to 1000 in the South.  If a citation occurs in eiher of those locations it will appear as 1XXX.  For other streets in Scottsdale that aren't as long this analysis may be possible.


*Contains information from the City of Scottsdale Open Database Portal, which is made available here under the [Open Database License](http://www.scottsdaleaz.gov/AssetFactory.aspx?did=69351).
