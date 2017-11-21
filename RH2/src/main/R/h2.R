RH2 <- H2 <- function() {
	new("H2Driver")
} 

# load DBI to replicate GNU R 'Depends:'
.onLoad <- function(libname, pkgname) library(DBI)

#
#dbListFields      <- function(con, ...)       UseMethod("dbListFields")
#dbListFields.JDBCConnection <- function(con, name, ...) {
#	if (!dbExistsTable(con, name))
#		stop("Unknown table ", name);
#	JDBCUtils$getColumns(con$conn, name)
#}