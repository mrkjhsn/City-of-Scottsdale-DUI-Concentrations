# City of Scottsdale DUI Concentrations
Where do most City of Scottsdale DUI citations occur? 

The City of Scottsdale publishes a [dataset](http://data.scottsdaleaz.gov/dataset/police-citations) that includes all citations issed on a one year rolling basis.



As a cyclist I was interested in the areas I should not be cycling in, especially late at night on the weekends.  Based on the "Street" attribute from the City of Scottsdale citations data set citations are located at either a street address(street numbers blocked out) or a street intersection.

My analysis was performed in SQL.  I used a temporary table to sumarize a count of DUI citations, grouped by streets and intersections.  Then I used a cross join to append this to a query in order to find the number of total DUIs that took place at any given street or intersection as a percentage of the total.

#### Results:
My data showed that 9.8% of DUIs took place along Indian School Road.  The top intersection was Indian School and Hayden(3.6%).  This seems to be consistent with the high number of drinking establishments in Old Town Scottsdale.  

#### Further Things to Consider: 
1. Correlate DUI counts with times of the day.
2. ~~Is it possible to graphically show a cluster map of the count associated with streets and intersections?~~  This doesn't seem possible based on the data provided at this time.  For instance Hayden Rd. runs from 15000 in the north to 1000 in the South.  If a citation occurs in eiher of those locations it will appear as 1XXX.

