test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("throws error on non dataframe", {
  expect_error(preproc(1))
})

test_that("scales numerical columns", {
  result_df <- preproc(as_tibble(mtcars))
  expect_equal(mean(result_df$mpg), 0)
})

test_that("one hot encodes categorical text columns", {
  result_df <- preproc(as_tibble(band_instruments))
  columns <- colnames(result_df)
  print(result_df)
  expect_equal(columns, c("name_Paul", "name_Keith", "plays_bass"))
})