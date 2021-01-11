# veriff_task
Task to create 
* function measuring distance between vectors
* clustering of provided data basing on distances

## Files included
* init.sql - SQL script creatin initial structures such as scheme, tables and inporting source data
* clustering_do.sql - file with 2 functions:
    * **clustering_do()** - parameteless function initiating prcedure of clustering
    * **clustering_do(int, int)** - recursive function called from clustering_do() or itself finding closest clusters for every iteration 
* linkage_do.sql 
    * **linkage_do(text[],int)** - function linkging clusters using Single method for updating related distances matrix, called from clustering_do(int) function
    
* distance_get.sql 
    * **distance_get(float8[],float8[])** - function calculating Eucledian distance between provided vectors

* clustering_get.sql
    * **clustering_get(int)** - function quering result of clustering for particulat ammount of clusters

## Procedure of clustering
* importing data into **veriff.input_data** table
* running **veriff.clustering_do()** function
* running **clustering_get(int)** for requered ammount of clusters