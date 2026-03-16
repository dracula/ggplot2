library(dplyr)
library(ggplot2)
library(vdiffr)

# Many of these test plots are similar/identical to the viridis package:
# https://github.com/sjmgarnier/viridis

test_that("rnorm-hex-plot", {
  set.seed(1)

  test_plot <- ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
    geom_hex() +
    coord_fixed() +
    ggtitle("rnorm-hex-plot") +
    scale_fill_dracula(discrete = FALSE) +
    theme_dracula()

  expect_doppelganger("rnorm-hex-plot", test_plot)
})


test_that("diamonds-point-plot", {
  dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
  dsub$diff <- with(dsub, sqrt(abs(x - y)) * sign(x - y))

  test_plot <- ggplot(dsub, aes(x, y, colour = diff)) +
    geom_point() +
    ggtitle("scale_color_dracula(discrete = FALSE)") +
    scale_color_dracula(discrete = FALSE) +
    theme_dracula()

  expect_doppelganger("diamonds-point-plot", test_plot)
})


test_that("mtcars-lm-plot", {
  lm <- lm(mpg ~ wt, data = mtcars)

  test_plot <- ggplot(mtcars %>% mutate(resid = abs(resid(lm)), fitted = fitted(lm))) +
    geom_line(aes(wt, fitted)) +
    geom_point(aes(wt, mpg, color = resid)) +
    scale_color_dracula(discrete = FALSE) +
    theme_dracula() +
    ggtitle("mtcars-lm-plot") +
    labs(x = "Weight", y = "MPG", color = "Residuals")

  expect_doppelganger("mtcars-lm-plot", test_plot)
})

test_that("rnorm-hex-plot alucard", {
  set.seed(1)

  test_plot <- ggplot(data.frame(x = rnorm(10000), y = rnorm(10000)), aes(x = x, y = y)) +
    geom_hex() +
    coord_fixed() +
    ggtitle("rnorm-hex-plot alucard") +
    scale_fill_alucard(discrete = FALSE) +
    theme_alucard()

  expect_doppelganger("rnorm-hex-plot_alucard", test_plot)
})


test_that("diamonds-point-plot alucard", {
  dsub <- subset(diamonds, x > 5 & x < 6 & y > 5 & y < 6)
  dsub$diff <- with(dsub, sqrt(abs(x - y)) * sign(x - y))

  test_plot <- ggplot(dsub, aes(x, y, colour = diff)) +
    geom_point() +
    ggtitle("scale_color_alucard(discrete = FALSE)") +
    scale_color_alucard(discrete = FALSE) +
    theme_alucard()

  expect_doppelganger("diamonds-point-plot_alucard", test_plot)
})


test_that("mtcars-lm-plot alucard", {
  lm <- lm(mpg ~ wt, data = mtcars)

  test_plot <- ggplot(mtcars %>% mutate(resid = abs(resid(lm)), fitted = fitted(lm))) +
    geom_line(aes(wt, fitted)) +
    geom_point(aes(wt, mpg, color = resid)) +
    scale_color_alucard(discrete = FALSE) +
    theme_alucard() +
    ggtitle("mtcars-lm-plot alucard") +
    labs(x = "Weight", y = "MPG", color = "Residuals")

  expect_doppelganger("mtcars-lm-plot_alucard", test_plot)
})
