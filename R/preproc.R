library(tidyverse)
library(dplyr)
library(fastDummies)
#' Preproc
#'
#' @param X_train (dpylyr dataframe) X_train dateframe - Required
#' @param X_test (dpylyr dataframe)  X_test dataframe - Default None
#'
#' @return (tuple) Tuple containing two dataframes (X_train, X_test)
#'
#' @export
#'
#' @examples
#' X_train <- vector(mode="list", length=1)
#' X_test <- vector(mode="list", length=1)
#' result = preproc(X_train, X_test)
#' processed_X_train = result[0]
#' processed_X_test = result[1]
  preproc <- function(X) {
    if (!is.data.frame(X)) {
      stop("X_train must be of type dataframe")
    }
    column_types <- sapply(X, class)
    do_dummies <- FALSE
    i<-0
    for (class in column_types) {
      i<-i+1
      if (class == "numeric") {
        X[[i]] <- scale(X[[i]])
      }
      if (class == "factor" | class == "character") {
        do_dummies <- TRUE
      }
    }
    if (do_dummies == TRUE) {
      X <- fastDummies::dummy_cols(X, remove_first_dummy=TRUE, remove_selected_columns = TRUE)
    }
    X
}

