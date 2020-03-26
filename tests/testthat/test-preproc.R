
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
  for (column in columns) {
    expect_true(column %in% c("name_Paul", "name_Keith", "name_John", "plays_bass", "plays_guitar"))
  }
  expect_true(length(columns) == 3)
})

test_that("label encoder changes to specified levels", {
  band <- dplyr::band_instruments
  levels <- c( "bass", "guitar", "drums")
  band$plays <- factor(band$plays, levels = levels)
  result_df <- preproc(band)
  expect_equal(result_df$plays[1], result_df$plays[3])
  expect_gt(result_df$plays[1], result_df$plays[2])
  expect_true(is.numeric(result_df$plays[1]))
})
