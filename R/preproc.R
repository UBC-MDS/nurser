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
  preproc <- function(X_train, X_test=NULL) {
  X_train
}

