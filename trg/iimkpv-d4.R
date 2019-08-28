#Day 4 - IIM Revision



(gender = sample(c('M','F'), size=3, replace=T))

(gender = sample(c('M','F'), size=30, replace=T, prob=c(.7,.3)))
t1= table(gender)
prop.table(t1)

(course = sample(c('BBA','MBA'), size=30, replace=T, prob=c(.5,.5)))
summary(course)
courseF = factor(course)
summary(course)
summary(courseF)

(grades = sample(c(LETTERS[1:5]), size=30, replace=T))
summary(grades)
gradesF = factor(grades)
summary(gradesF)
# Ex, Good, Sat, Poor
#Poor < Sat < Good < Ex
gradesOF = factor(grades, ordered=T, levels=c('E','D','A','C','B'))
summary(gradesOF)
gradesOF
levels(gradesOF)
levels(gradesOF)[1]
