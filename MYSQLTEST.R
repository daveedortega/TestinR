#MySQL stuff
library(RMySQL)
#assigning a handle for the connection to the database
uscsDb<-dbConnect(MySQL(),user='genome',
                host='genome-mysql.cse.ucsc.edu')

#passing a MySQL command to the db, using mysql through r using the query function
#MY FUCKING IP IS WRONG, CANT ACCESS THE WEBPAGE

result<-dbGetQuery(uscsDb,'show databases;'); dbDisconnect(uscsDb);
#gets names of all databases

#getting hg19 db
hg19<-dbConnect(MySQL(),user='genome', db='hg19'
                  host='genome-mysql.cse.ucsc.edu')

#how many tables the db has
allTables<-dbListTables(hg19)

#each data type has its own table
length(allTables)

#looking at the fields, the column name, space in the array of the table aff---

dbListFields(hg19,'affyU133Plus2')

#count all records from the table passing it through MySQL w dbgq
dbGetQuery(hg19,'select count(*) from affyU133Plus2')

#getting the data
affydata<-dbReadTable(hg19, 'affyU133Plus2')

#sometimes shit too large, so we do this
#getting specifically some subset of data
query<-dbSendQuery(hg19, 'select * from affyU133Plus2 where misMatches between 1 and 3')
#onlygetting those where the columns mismatches is in 1-3

#query=consulta MANY FUCKING QUERYS but this are important, but there are many


affyMis<-fetch(query);quantile(affyMis$misMatches)

#can use so we only cot 
#ALWAYS CLOSE THE CONNECTION
affyMis<-fetch(query,n=10);dbClearResult(query);
#CLOSING
dbDisconnect(hg19)

