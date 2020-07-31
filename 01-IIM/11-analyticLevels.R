#all levels of analytics - Descriptive, Diagnostic, Predictive, Prescriptive

#import from ggsheet
library(gsheet)
slr1 = "https://docs.google.com/spreadsheets/d/1qLHa5qFTyWacta8F-IGo6J3Zpf-BVR9OrlqONuJDqYc/edit#gid=2023826519"
df = as.data.frame(gsheet2tbl(slr1))
names(df) = c('area','sales')
head(df)
df
#X-area in sqft, Y-sales in some unit currency
str(df)
linearmodel = lm(sales ~ area, data=df)
plot(df$area, df$sales)
abline(lm(sales ~ area, data=df), col='red')
cor(df$area, df$sales)
cov(df$area, df$sales)
summary(linearmodel)
#Ho: (F Test) : No relationship between Y and any X
#Ha:  There is relationship between Y and at least one X
# p < 0.05 Reject Ho in favour of Ha
coef(linearmodel)
#Y = 0.96 + 1.66 * X
range(df$area) #value of X to be betw this range : interpolation not extrapolation 
(new2 = data.frame(area=c(1.5,2,3,4,5)))

(p2sales= predict(linearmodel, newdata= new2))
cbind(new2, p2sales)

summary(linearmodel)
head(df)
#residual
(sales = 0.96 + 1.66 * 2.2)
(r = 5.6 - 4.61)
plot(df$area, df$sales)
abline(lm(sales ~ area, data=df), col='red')
abline(v=2.2,h=c(5.6, 4.61))
cbind(resid(linearmodel))
fitted(linearmodel) - df$sales

#assumptions
plot(linearmodel)

#descriptive ------
df
head(df)
summary(df)
hist(df$area)
hist(df$sales)
range(df$sales)
range(df$area)

#diagnostic -----
cor(df)
cov(df)

#predictive -------
model = lm(sales ~ area, data = df)
model
summary(model)
testdata = data.frame(area=c(3,4))
predicted = predict(model, newdata = testdata)
cbind(testdata, predicted)
#prescriptive-----
pacman::p_load(lpSolveAPI)
#we want min sales to be 11 units where area can be between 2 & 5 units

#model : (sales = 0.96 + 1.66 * area)

#First we create an empty model x.
11/1.66  - .96  #5.6 units of area required 
#max: 0.96 + 1.66 * area
lprec1 <- make.lp(0, 1)
lprec1
set.objfn(lprec1, c(1.66))
lprec1



#maximise it
lp.control(lprec1, sense="max")
lprec1
set.bounds(lprec1, lower = c(2), columns = c(1))
lprec1
set.bounds(lprec1, upper = c(4.5), columns = c(1))
lprec1
ColNames <- c("area")
dimnames(lprec1)[[2]] <- list(ColNames)
lprec1
solve(lprec1)   #[1] 0  ok
#get.dual.solution(lprec)
get.objective(lprec1)
get.variables(lprec1)
get.constraints(lprec1)
print(lprec1)

#another way------
# Set 0 constraints and 1 decision variables
lprec2 <- make.lp(nrow = 0, ncol = 1)
# Set the type of problem we are trying to solve
lp.control(lprec2, sense="max")
# Set type of decision variables
set.type(lprec2, 1, type=c("real"))
## Set the coefficients of the decision variables -> C
C <- c(1.66)
# Set objective function coefficients vector C
set.objfn(lprec2, C)
lprec2
# Add constraints
add.constraint(lprec2, c(1) , "<=", 4.5)
lprec2
add.constraint(lprec2, c(1) , ">=", 2)
lprec2
solve(lprec2)
get.objective(lprec2)
.96 + 1.66 * get.objective(lprec2)
# Get the decision variables values
get.variables(lprec2)
# Get the value of the objective function
get.objective(lprec2)

# Note that the default boundaries on the decision variable are c(0, 0, 0) and c(Inf, Inf, Inf)
get.bounds(lprec2)
# Boundaries can be set with following function
#lpSolveAPI::set.bounds()
set.bounds(lprec2, lower=3, upper=NULL, columns = 1)

#contain a constant, but this constant does not change the optimization problem or the optimal solution.

4.5 * 1.66 + .96
