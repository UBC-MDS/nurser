test_that('Plot should use geom_bar and map columns to x-axis, and counts to y-axis.', {
  p <- eda(mtcars)$histograms[[1]]
  expect_true("GeomBar" %in% c(class(p$layers[[1]]$geom)))
  expect_true("mpg" == rlang::get_expr(p$labels$x))
  expect_true("count" == rlang::get_expr(p$labels$y))
})


test_that('Histograms and stats attributes should be generated.', {
  results <- eda(mtcars)
  expect_true("histograms" %in% names(results))
  expect_true("stats" %in% names(results))
})

test_that('Histograms and stats attributes should be of the same length with the number of columns of the input data..', {
  results <- eda(mtcars)
  expect_true(length(results$histograms) == ncol(mtcars))
  expect_true(length(results$stats) == ncol(mtcars))
})


test_that('The actual statistics should be equal to expected statistics for numerical columns.', {
  results <- eda(mtcars)
  expect_true(round(results$stats$mpg[[1]],2) == 10.4)
  expect_true(round(results$stats$mpg[[4]],2) == 20.09)
  expect_true(round(results$stats$mpg[[6]],2) == 33.9)
})

test_that('For the categorical columns stats should calculate the number of unique values in a given column.', {
  new <- eda(iris)
  expect_true(new$stats$Species[[1]] == sum(iris$Species == 'setosa'))
  expect_true(new$stats$Species[[2]] == sum(iris$Species == 'versicolor'))
  expect_true(new$stats$Species[[1]] == sum(iris$Species == 'virginica'))
})


