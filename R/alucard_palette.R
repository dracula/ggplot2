#' @title Alucard Tibble
#'
#' @description A Tibble of Alucard data that includes the palette specification.
#'  See https://spec.draculatheme.com for details.
#'
#' @importFrom tibble tribble
#'
#' @return Alucard Tibble
#'
#' @export
alucard_tibble <- tribble(
  ~palette,   ~hex,        ~rgb,                 ~hsl,
  "green",  "#14710A", "RGB(20, 113, 10)",  "HSL(114, 84, 24)",
  "cyan",   "#036A96", "RGB(3, 106, 150)", "HSL(198, 96, 30)",
  "purple", "#644AC9", "RGB(100, 74, 201)", "HSL(252, 54, 54)",
  "pink",   "#A3144D", "RGB(163, 20, 77)", "HSL(336, 78, 36)",
  "red",    "#CB3A2A", "RGB(203, 58, 42)",   "HSL(6, 66, 48)",
  "orange", "#A34D14", "RGB(163, 77, 20)", "HSL(24, 78, 36)",
  "yellow", "#846E15", "RGB(132, 110, 21)", "HSL(48, 73, 30)"
)


#' @title Alucard Bright Palette
#'
#' @description Used in conjunction with `alucard_discrete_bright_palette` as an
#'   internal closure for interfacing with `scale_fill_alucard` and `scale_color_alucard`.
#'
#' @noRd
#'
#' @importFrom dplyr pull
alucard_bright_palette <- function() {
  function(n) {
    pull(alucard_tibble, "hex")[1:n]
  }
}


#' @title Alucard Discrete Bright Palette
#'
#' @description Used in conjunction with `alucard_bright_palette` as an
#'   internal closure for interfacing with `scale_fill_alucard` and `scale_color_alucard`
#'
#' @param n Number of colors to return.
#'  If missing, defaults to the length of the entire palette
#'
#' @noRd
#'
#' @return Function for interfacing with scale functions
alucard_discrete_bright_palette <- function(n) {
  if (missing(n)) {
    n <- 7
  }

  if (n > 7) {
    stop("WARNING: Cannot use n > 7")
  }

  alucard <- alucard_bright_palette()(n)

  structure(
    alucard,
    name  = "alucard",
    class = "palette"
  )
}
