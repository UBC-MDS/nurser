
#' Eda
#'
#' @param input_data (dpylyr dataframe) input dataframe to be analyzed- Required
#'
#' @return (list) List that contains a histogram and summary statistics for each column.
#'
#' @export
#'
#' @examples
#'
#'
#' result = eda(mtcars)
#' hist_mpg = result$histograms[[1]]
#' stats_mpg = result$stats$mpg
eda <- function(input_data) {
  results <- vector('list', 2)
  names(results) <- c("histograms", "stats")

  # create histograms for each column
  histograms <- vector('list', length = ncol(input_data))
  for (i in seq_along(input_data)) {
    message(i)
    histograms[[i]] <- local({
      i <- i
      p1 <- ggplot2::ggplot(input_data, ggplot2::aes(x = input_data[[i]])) +
        ggplot2::geom_histogram() +
        ggplot2::xlab(colnames(input_data)[i])
    })
  }

  # create descriptive statistics for each column
  stats <- list()
  for (i in colnames(input_data)){
    stats[[i]] <- summary(input_data[[i]])
  }
  results[[1]] <- histograms
  results[[2]] <- stats

  return(results)
}
