
setClass("H2Connection",
  contains = "JDBCConnection"
)

setMethod("dbListTables", "H2Connection", def = function(conn) {
    JDBCUtils$getTables(conn@ptr, c("TABLE", "VIEW", "TABLE LINK", "EXTERNAL"))
})
