#' Get the http interactions of the current cassette
#' 
#' @export
#' @return object of class `HTTPInteractionList` if there is a current
#' cassette in use, or `NullList` if no cassette in use
#' @examples \dontrun{
#' insert_cassette("foo_bar")
#' library(crul)
#' cli <- crul::HttpClient$new("https://httpbin.org/get")
#' one <- cli$get(query = list(a = 5))
#' z <- http_interactions()
#' z
#' z$interactions
#' z$used_interactions
#' eject_cassette("foo_bar")
#' }
http_interactions <- function() {
  trycurr <- tryCatch(cassette_current(), error = function(e) e)
  if (!inherits(trycurr, "error")) return(trycurr$http_interactions_)
  NullList$new()
}