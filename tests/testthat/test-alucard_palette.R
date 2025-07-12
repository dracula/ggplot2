test_that("palette is correct number of colors", {
  expect_length(alucard_discrete_bright_palette(), 7)
  expect_length(alucard_discrete_bright_palette(1), 1)
})

test_that("alucard_discrete_bright_palette() cannot return more than 7", {
  expect_error(alucard_discrete_bright_palette(8))
})
