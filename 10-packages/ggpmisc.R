#ggpmisc

library(ggpmisc)
library(tibble)
ggplot(lynx, as.numeric = FALSE) + geom_line() +  stat_peaks(colour = "red") +   stat_peaks(geom = "text", colour = "red", angle = 66,   hjust = -0.1, x.label.fmt = "%Y") + ylim(NA, 8000)
formula <- y ~ poly(x, 2, raw = TRUE)


ggplot(cars, aes(speed, dist)) + geom_point() +   stat_poly_line(formula = formula) +   stat_poly_eq(use_label(c("eq", "R2", "P")),  formula = formula, parse = TRUE) +  labs(x = expression("Speed, "*x~("mph")), y = expression("Stopping distance, "*y~("ft")))

formula <- y ~ x
ggplot(PlantGrowth, aes(group, weight)) +  stat_summary(fun.data = "mean_se") +  stat_fit_tb(method = "lm", method.args = list(formula = formula),  tb.type = "fit.anova", tb.vars = c(Term = "term", "df", "M.S." = "meansq","italic(F)" = "statistic", "italic(p)" = "p.value"), tb.params = c("Group" = 1, "Error" = 2), table.theme = ttheme_gtbw(parse = TRUE)) +  labs(x = "Group", y = "Dry weight of plants") +   theme_classic()
