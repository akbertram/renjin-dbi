[R DBI](http://cran.r-project.org/web/packages/DBI/index.html) interface and various database interfaces for [Renjn](http://www.renjin.org/).

Example usage:

## MonetDB
```R
library(MonetDB.R)
con <- dbConnect(MonetDB.R(), url="jdbc:monetdb://localhost:50000/somedatabase", username="monetdb", password="monetdb")
df  <- dbGetQuery(con, "SELECT * from sometable")
```

## MySQL/MariaDB
```R
library(RMySQL)
con <- dbConnect(RMySQL(), url="jdbc:mysql://localhost:3306/somedatabase", username="someuser", password="somepass")
df  <- dbGetQuery(con, "SELECT * from sometable")
```

## Oracle ®
```R
library(ROracle)
con <- dbConnect(ROracle(), url="jdbc:oracle:thin:@localhost", username="someuser", password="somepass")
df  <- dbGetQuery(con, "SELECT * from sometable")
```

## PostgreSQL
```R
library(RPostgreSQL)
con <- dbConnect(RPostgreSQL(), url="jdbc:postgresql://localhost:5432/somedatabase", username="someuser", password="somepass")
df  <- dbGetQuery(con, "SELECT * from sometable")
```

## SQLite
```R
library(RSQLite)
con <- dbConnect(RSQLite(), url="jdbc:sqlite:", username="", password="")
df  <- dbGetQuery(con, "SELECT * from sometable")
```


## H2 database
```R
library(RH2)
con <- dbConnect(RH2(), url="jdbc:h2:file:/tmp/mydb", username="", password="")
df  <- dbGetQuery(con, "SELECT * from sometable")
```

## H2GIS database
```R
library(RH2GIS)
con <- dbConnect(RH2GIS(), url="jdbc:h2:file:/tmp/mydb", username="sa", password="")
loadSpatialFunctions(con)
#Create a table with a geometry column
dbSendQuery(con,"CREATE TABLE VANNES (the_geom geometry, id int)")
#Insert a polygon
dbSendQuery(con,"INSERT INTO VANNES VALUES('POLYGON ((100 300, 210 300, 210 200, 100 200, 100 300))'::geometry, 1)"); 
#Run a spatial function
df  <- dbGetQuery(con,"SELECT ST_AREA(the_geom) as area FROM VANNES")
```

## Plain RJDBC
```R
library("DBI")
library("RJDBC")
drv <- JDBC("org.h2.Driver") 
con <- dbConnect(drv, url="jdbc:h2:mem:test") 
df  <- dbGetQuery(con, "SELECT * from sometable")
dbDisconnect(con)

```
Note that you need to add the driver jar to the classpath in addition to RJDBC e.g.

```
        <dependency>
            <groupId>org.renjin.cran</groupId>
            <artifactId>RJDBC</artifactId>
            <version>10.0.14</version>
        </dependency>
        <!-- the driver -->
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.197</version>
        </dependency>
```

# Building 
Note:
This does not build properly on Windows for some reason (classes are does not end correctly with RData,
this is probably a bug in the renjin-maven-plugin)
