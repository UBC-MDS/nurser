#' Impute Missing Data
#'
#' Consolidates several different imputation methods inlcuding summary statistics
#'
#' @param df dataframe containing missing values to impute
#'
#' @return a list object with attributes containing summary statistics and
#' imputed data of different methods
#' @export
#'
#' @examples
#' my_data = data.frame(...)
#' imputed_data = impute_summary(my_data)

impute_summary <- function(df){
  #Check Input
  if(class(df) != class(data.frame())){
    stop('df must of class data.frame')
  }
  if(nrow(df) < 3){
    stop('insufficient data to impute')
  }

  #Summary Statistics on NaN values
  ##over columns
  col_count <- sapply(df, function(x)sum(is.na(x)))
  total_count <- data.frame(NaN_count = sum(col_count))
  row.names(total_count) <- 'Total'

  if(sum(col_count) == 0){
    stop('no missing values to impute')
  }

  col_counts <- data.frame(NaN_count = col_count)
  nan_counts <- rbind(col_counts, total_count)

  ##over rows
  nan_rows <- seq_along(1:nrow(df)) * !complete.cases(df)
  nan_rowindex <- c()
  for(i in 1:nrow(df)){
    if (nan_rows[i] != 0){
      nan_rowindex <- append(nan_rowindex, i)
    }
  }
  nan_rowindex <- data.frame(NaN_Rows = nan_rowindex)

  #Perform imputation using different methods
  columns <- df %>% colnames()

  ##Hmisc package - simple imputation
  hmisc_mean <- list()
  hmisc_median <- list()
  hmisc_max <- list()
  hmisc_min <- list()
  hmisc_random <- list()

  for(i in columns){
    hmisc_mean[[i]] <- Hmisc::impute(df[[i]], mean)
    hmisc_median[[i]] <- Hmisc::impute(df[[i]], median)
    hmisc_max[[i]] <- Hmisc::impute(df[[i]], max)
    hmisc_min[[i]] <- Hmisc::impute(df[[i]], min)
    hmisc_random[[i]] <- Hmisc::impute(df[[i]], 'random')
  }

  hmisc_mean <- data.frame(hmisc_mean)
  hmisc_median <- data.frame(hmisc_median)
  hmisc_max <- data.frame(hmisc_max)
  hmisc_min <- data.frame(hmisc_min)
  hmisc_random <- data.frame(hmisc_random)

  ##mi package - multiple impuation
  mi_multimp <- mi::mi(df, verbose = FALSE)
  mi_multimp <- mi::complete(mi_multimp)[4][[1]][1:length(columns)]

  ##mice pacakge - pmm
  mice_pmm <- mice::complete(mice(df,m=1), 1)

  ##missForest package - non-parametric random forest
  missForest_randomforest <- missForest::missForest(df)$ximp

  #Compile output list
  output <- list()

  output$nan_counts <- nan_counts
  output$nan_rowindex <- nan_rowindex
  output$hmisc_mean <- hmisc_mean
  output$hmisc_median <- hmisc_median
  output$hmisc_max <- hmisc_max
  output$hmisc_min <- hmisc_min
  output$hmisc_random <- hmisc_random
  output$mi_multimp <- mi_multimp
  output$mice_pmm <- mice_pmm
  output$missForest_randomforest <- missForest_randomforest

  return(output)
}


