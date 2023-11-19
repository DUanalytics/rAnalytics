#analyzer
#https://cran.r-project.org/web/packages/analyzer/analyzer.pdf

library(analyzer)

explainer(mtcars)

anderson.test(mtcars$mpg)

tb <- mtcars
tb$cyl <- as.factor(tb$cyl)
tb$vs <- as.factor(tb$vs)
out <- association(tb, categorical = c("cyl", "vs"))
out
# To use the methodMats parameter, create a matrix like this
methodMats <- out$method_used
methodMats["mpg", "disp"] <- methodMats["disp", "mpg"] <- "spearman"

out <- association(tb, categorical = c("cyl", "vs"), methodMats = methodMats)
out
rm(tb)

CCassociation(tb)
consoleBoxplot(x=mtcars$mpg)


explainer(mtcars)
explainer(mtcars$mpg) #same as explainer.numeric(mtcars$mpg)
# for factor
explainer(as.factor(mtcars$cyl)) #same as explainer.factor(as.factor(mtcars$cyl))


alphabets <- as.factor(sample(LETTERS[1:5], 50, replace = TRUE))
explainer(alphabets)
#rm(alphabets)

GenerateReport(dtpath = mtcars,
               catVars = c("cyl", "vs", "am", "gear"),
               yvar = "vs", model = "binClass",
               output_format = NULL,
               title = "Report",
               output_dir = 'E:/analytics/output/', # pass the output directory
               interactive.plots = FALSE)

kurtosis(mtcars)
linedivider(20)


norm_test_fun(mtcars$mpg)
norm_test_fun(mtcars$mpg, method = "shapiro",
              pval = 0.05, xn = "mpg", bin = TRUE)

# creating the plot
p <- plottr(mtcars)
plot(p$mpg)
plot(p$hp)


p <- plotNA(airquality)
# function to show the 'analyzerPlot' class plot
plot(p)
p1 <- plotNA(airquality, order = FALSE)
plot(p1)


# simple use for one variable
?plottr
p <- plottr(mtcars$mpg)
# To display the plot
plot(p$x)
# With complete dataframe and assuming 'mpg' as a dependent variable
p <- plottr(mtcars, yvar = "mpg", yclass = "numeric")
plot(p$wt)
