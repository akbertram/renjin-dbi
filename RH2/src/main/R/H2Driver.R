

#' Class H2Driver (and methods)
#'
#' H2Driver objects are created by [RH2()], and used to select the
#' correct method in [dbConnect()].
#' They are a superclass of the [DBIDriver-class] class,
#' and used purely for dispatch.
#' The "Usage" section lists the class methods overridden by \pkg{RSQLite}.
#' The [dbUnloadDriver()] method is a null-op.
#'
#' @keywords internal
#' @export
setClass("H2Driver",
  contains = "JDBCDriver"
)

setMethod("initialize", "H2Driver", function(.Object, ...) {
  .Object@ptr <- Driver$new()
  .Object
})

setMethod("dbConnect", "H2Driver",
  function(drv, url = "", ...) {

    con <- new("H2Connection",
      ptr = drv@ptr$connect(url, import(java.util.Properties)$new())
    )
    con
  }
)
