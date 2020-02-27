#' Eda
#'
#' @param input_data (dpylyr dataframe) input dataframe to be analyzed- Required
#'
#' @return (list) List that contains a histogram and summary statistics for each column.
#'
#' @export
#'
#' @examples
#' my_data <- vector(mode="list", length=1)
#' names(my_data) <- c("tic")
#' my_data[[1]] <- c(1,2,3,4,5)
#'
#' result = eda(my_data)
#' hist_tic = result$histograms$tic
#' stats_tic = result$stats$tic
eda <- function(data) {

}
