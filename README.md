
<!-- README.md is rendered from README.qmd. Edit README.qmd and render to update README.md -->

# {`dRacula`} \| Dracula Theme for R <a href="https://draculatheme.com/"><img src="man/figures/logo.svg" align="right" height="139" alt="Dracula logo in an R hex sticker"/></a>

[![R-CMD-check](https://github.com/dracula/dRacula/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dracula/dRacula/actions/workflows/R-CMD-check.yaml)

> All things Dracula themed for R

## Install

All instructions can be found at
[draculatheme.com/dRacula](https://draculatheme.com/dRacula).

``` r
devtools::install_github("dracula/dRacula")
```

or

``` r
remotes::install_github("dracula/dRacula")
```

## Examples

Add a Dracula-themed `_brand.yaml` to your project:

``` r
library(dRacula)
dracula_brand()
```

<p align="center">

<img src="./man/figures/brand.png" alt="Dracula-branded Shiny App" width="500" height="600">
</p>

Apply the Dracula theme and color scale to a linear regression plot:

``` r
library(dplyr)
library(ggplot2)
library(dRacula)

lm <- lm(mpg ~ wt, data = mtcars)

ggplot(mtcars %>% mutate(resid = abs(resid(lm)), fitted = fitted(lm))) +
  geom_line(aes(wt, fitted)) +
  geom_point(aes(wt, mpg, color = resid)) +
  scale_color_dracula(discrete = FALSE) +
  theme_dracula() +
  ggtitle("mtcars: MPG by Weight") +
  labs(x = "Weight", y = "MPG", color = "Residuals")
```

<img src="man/figures/README/mpg-lm-example-1.png" width="480" style="display: block; margin: auto;" />

Apply the Dracula palette and theme to proportional stacked area chart:

``` r
library(dplyr)
library(ggplot2)
library(dRacula)

set.seed(1)
time <- rep(seq(1, 7), each = 5)
value <- runif(35, 10, 100)
group <- rep(LETTERS[1:5], times = 7)

data <- data.frame(time, value, group) %>%
  group_by(time, group) %>%
  summarise(n = sum(value), .groups = "drop") %>%
  mutate(percentage = n / sum(n))

ggplot(data, aes(x = time, y = percentage, fill = group)) +
  geom_area(alpha = 0.7, color = "black", linewidth = 0.4) +
  scale_fill_dracula(discrete = TRUE) +
  labs(
    title = "Proportional Stacked Area Chart",
    x = "Time",
    y = "Proportion",
    fill = "Group"
  ) +
  theme_dracula() +
  theme(legend.position = "bottom")
```

<img src="man/figures/README/proportion-1.png" width="480" style="display: block; margin: auto;" />

## Team

This theme is maintained by the following person(s) and a bunch of
[awesome
contributors](https://github.com/dracula/dRacula/graphs/contributors).

| [![Jordan Bradford](https://github.com/jrdnbradford.png?size=100)](https://github.com/jrdnbradford) |
|----|
| [Jordan Bradford](https://github.com/jrdnbradford) |

## Community

- [X](https://x.com/draculatheme) - Best for getting updates about
  themes and new stuff.
- [GitHub](https://github.com/dracula/dracula-theme/discussions) - Best
  for asking questions and discussing issues.
- [Discord](https://draculatheme.com/discord-invite) - Best for hanging
  out with the community.

## Contributing

See [`CONTRIBUTING.md`](/.github/CONTRIBUTING.md).

## Acknowledgments

I’m indebted to the {[viridis](https://sjmgarnier.github.io/viridis)}
and {[wesanderson](https://github.com/karthik/wesanderson)} `R` packages
for inspiration and several plot examples.

## License

[MIT License](./LICENSE)
