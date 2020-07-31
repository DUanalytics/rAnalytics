

library(rpart)
library(rpart.plot)

url = 'https://raw.githubusercontent.com/DUanalytics/datasets/master/csv/pima-indians-diabetes.csv'
df = read.csv(url)
df
names(df) = c('pregnant', 'glucose', 'bp', 'skin', 'insulin', 'bmi', 'pedigree', 'age', 'label')
df
table(df$label)
model = rpart(label ~ ., data = df)
model
rpart.plot(model, cex=.8)
printcp(model)

model1 = prune(model, cp=.04)
model1
rpart.plot(model1, type=2)
