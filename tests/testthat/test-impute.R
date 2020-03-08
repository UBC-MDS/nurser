random_data <- function(){
  output <- list()

  mis <- data.frame(one = rnorm(10, 3, 10),
                    two = rnorm(10, 1, 5),
                    three = rnorm(10, 10, 2),
                    four = rnorm(10, 20, 6),
                    five = rnorm(10, -9, 6))

  mis[3:5, 'two'] <- NA
  mis[7, 'three'] <- NA
  mis[1, 'four'] <- NA
  mis[3:8, 'four'] <- NA
  mis[2, 'five'] <- NA

  compl <- data.frame(a = rnorm(4, 3, 10),
                      b = rnorm(4, 1, 5),
                      c = rnorm(4, 10, 2),
                      d = rnorm(4, 20, 6))

  output <- list()
  output$mis <- mis
  output$compl <- compl

  return(output)
}

test_that('impute_summary() returns errors as expected', {
  expect_error(impute_summary(NaN))
  expect_error(impute_summary(data.frame(test = c(1,2))))
  expect_error(impute_summary(random_data()$compl))
})

test_that('outputs match as expected', {
  #Generate Data
  mis_imp <- impute_summary(random_data()$mis)

  #Output is of correct size
  expect_equal(length(mis_imp), 10)

  #Number of Missing Values is equal to 12
  expect_equal(mis_imp$nan_counts[nrow(mis_imp$nan_counts), 1], 12)

  #Row indeces of observations that contain at least one missing value
  expect_equal(mis_imp$nan_rowindex[[1]], c(1,2,3,4,5,6,7,8))

  #Check if one of the impuation method outputs contains no missing values
  expect_equal(sum(is.na(mis_imp$hmisc_max)), 0)
})
