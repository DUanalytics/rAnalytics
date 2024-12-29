#LP - SS

# #MINIMIZE
# -50*x + 20*y + 0
# SUBJECT TO
# _C1: 2 x - y >= -5
# _C2: 3 x + y >= 3
# _C3: 2 x - 3 y <= 12
# VARIABLES
# x Continuous
# y Continuous



library(linprog)
f.obj <- c(-50, 20)
f.con <- matrix(c(2,-1, 3, 1, 2, -3), nrow = 3, byrow = TRUE)
f.dir <- c(">=", ">=", "<=")
f.rhs <- c(-5, 3, 12)
solveLP(cvec = f.obj, bvec = f.rhs, Amat = f.con, maximum = T, const.dir = f.dir)

library(lpSolve)
results <- lp(direction = "max", objective.in = f.obj, const.mat = f.con,   const.dir = f.dir, const.rhs = f.rhs)

str(results)
results$solution
cat("The optimal solution is:", results$solution, "\nAnd the optimal objective function value is:", results$objval)


#eg
#Minimise Z = 2x + y  st - 6x + 2y >= 18, 3x + 3y  > 21
#2x + 4y >= 16 ; x >= 0, y >=0

f.obj <- c(2, 1)
f.con <- matrix(c(6,2, 3, 3, 2, 4), nrow = 3, byrow = TRUE)
f.dir <- c(">=", ">", ">=")
f.rhs <- c(18, 21, 16)
solveLP(cvec = f.obj, bvec = f.rhs, Amat = f.con, maximum = F, const.dir = f.dir)

library(lpSolve)
results <- lp(direction = "max", objective.in = f.obj, const.mat = f.con,   const.dir = f.dir, const.rhs = f.rhs)


pacman::p_load(gMOIP)
A <-matrix(c(1,2,1,2,0,-2,-1,2,3),ncol=3,byrow=TRUE)
A
A <- matrix(c(1,-1,-1,-1,0,1,1,0), ncol = 2, byrow = TRUE)
A
b <- c(1,-4,3,4)
obj <- c(98,50)
plotPolytope( A,  b, obj,  type = rep("c", ncol(A)), crit = "min",  faces = rep("c", ncol(A)), plotFaces = TRUE,  plotFeasible = TRUE, plotOptimum = FALSE,  labels = NULL)

#Ss------
#https://tnmutusva.github.io/course/lpp.html
#To plot the feasible region we will use the plotPolytope command.Define the model as max/min subject to A x<=b, x>=0. A is the matrix of coefficients on the left hand side of the inequality signs. b represents the coeffients on the right had side of the coefficients. obj represents the coefficients of the objective function. To use plotPolytope all the constraints must be less or equal to constraints. If there are any greater or equal to contraints first multiply them by -1 to get the required form. 
#6x + 2y >= 18 -> -6x - 2y <= -18 
#3x + 3y >= 21 -> -3x - 3y <= -21
#2x + 4y >= 16 -> -2x - 4y <= -16
#Z=2x+y
A <- matrix(c(-6,-2,-3,-3,-2,-4), ncol = 2, byrow = TRUE)
A
b <- c(-18,-21,-16)
obj <- c(2,1)
plotPolytope( A,  b, obj,  type = rep("c", ncol(A)), crit = "min",  faces = rep("c", ncol(A)), plotFaces = TRUE,  plotFeasible = TRUE, plotOptimum = FALSE,  labels = 'coord')

plotPolytope( A,  b, obj,  type = rep("c", ncol(A)), crit = "min",  faces = rep("c", ncol(A)), plotFaces = TRUE,  plotFeasible = TRUE, plotOptimum = T,  labels = 'coord')
