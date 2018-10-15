# City of Scottsdale DUI Concentrations
Where do most City of Scottsdale DUI citations occur? 

The City of Scottsdale publishes a data set that includes all citations issed on a one year rolling basis.

http://data.scottsdaleaz.gov/dataset/police-citations

As an avid cyclist I was interested in the areas I should not be cycling in, especially late at night on the weekends.  Based on the "Street" attribute from the City of Scottsdale citations data set citations are located at either a street address(street numbers blocked out) or a street intersection.

I used a temporary table to sumarize a count of DUI citations, grouped by streets and intersections.  Then I used a cross join to append this to a query in order to find the number of total DUIs that took place at any given street or intersection as a percentage of the total.

My data showed that 9.8% of DUIs took place along Indian School Road.  The top intersection was Indian School and Hayden(3.6%), the closest intersection to where I live.

