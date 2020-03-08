
test_that("throws error on non dataframe", {
  # confirms that an error is returned if you send in a non df type var
  expect_error(preproc(1))
})

test_that("scales numerical columns", {
  # checks to see that numerical cols are scaled appropriately
  result_df <- preproc(dplyr::as_tibble(mtcars))
  expect_equal(mean(result_df$mpg), 0)
})

test_that("one hot encodes categorical text columns", {
  # text columns should be OHE, onne column should be dropped, col names are named
  # appropriately
  band <- dplyr::band_instruments
  result_df <- preproc(band)
  columns <- colnames(result_df)
  print(result_df)
  expect_equal(columns, c("name_Paul", "name_Keith", "plays_bass"))
})