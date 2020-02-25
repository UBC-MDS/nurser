#' Preproc
#'
#' @param X_train (dpylyr dataframe) X_train dateframe - Required
#' @param X_test (dpylyr dataframe)  X_test dataframe - Default None
#' @param auto (boolean) If true we will automatically decide how to process columns, 
#'
#' @return (tuple) Tuple containing two dataframes (X_train, X_test)
#' 
#' @export
#'
#' @examples
#' result = preproc(X_train, X_test)
#' processed_X_train = result[0]
#' processed_X_test = result[1]
preproc <- function(X_train, X_test=None) {
  X_train
}

