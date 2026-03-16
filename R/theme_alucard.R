#' @title Theme Alucard
#'
#' @description Provides a minimal `ggplot2` theme with a Alucard, light backdrop.
#'
#' @importFrom ggplot2 '%+replace%' theme element_text element_rect element_line element_blank theme_minimal
#'
#' @examples
#' # Set the current `ggplot2` theme with `ggplot2::theme_set`:
#' library(ggplot2)
#' theme_set(theme_alucard())
#'
#' # Or set it for the plot in the pipeline:
#' library(dplyr)
#' library(dRacula)
#' library(ggplot2)
#'
#' mpg %>%
#'   filter(manufacturer %in% c("honda", "ford", "dodge", "audi")) %>%
#'   group_by(manufacturer) %>%
#'   summarize(mean_hwy = mean(hwy)) %>%
#'   ggplot(aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) +
#'   theme(legend.position = "none") +
#'   coord_flip() + geom_col() +
#'   scale_fill_alucard(discrete = TRUE) +
#'   theme_alucard()
#' @export
theme_alucard <- function() {
  theme_minimal(base_size = 12) %+replace%
    theme(
      axis.text  = element_text(color = "#1F1F1F"),
      axis.title = element_text(face = "bold", color = "#6C664B"),

      strip.text = element_text(face = "bold", colour = "#6C664B"),

      legend.background     = element_rect(fill = "transparent", color = NA),
      legend.box.background = element_rect(fill = "transparent", color = "#1F1F1F", linewidth = 0.25),
      legend.key            = element_rect(fill = "transparent", color = NA),
      legend.text           = element_text(color = "#1F1F1F"),
      legend.title          = element_text(face = "bold", color = "#6C664B"),

      panel.background  = element_blank(),
      panel.grid        = element_line(color = "#CFCFDE"),

      plot.background = element_rect(fill = "#FFFBEB", color = "#CFCFDE"),

      title = element_text(face = "bold", color = "#1F1F1F")
    )
}
