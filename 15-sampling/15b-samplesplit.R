# Sample Split


library(caTools)
df=mtcars

(train_rows = sample.split(df$am, SplitRatio=0.7))

(train_a =df[train_rows == TRUE, ])
#both methods are same - above and below
(train = df[ train_rows,])
train == train_a #check is same

table(train$am)
prop.table(table(train$am))
nrow(train)
(test  = df[!train_rows,])
table(test$am)
prop.table(table(test$am))
nrow(test)

nrow(train) + nrow(test)
#Both the proportions are approx same


#use with gears
(train_rows2 = sample.split(df$gear, SplitRatio=0.75))

(train2 = df[ train_rows2,])
table(train2$gear)
prop.table(table(train2$gear))
nrow(train2)

(test2  = df[!train_rows2,])
table(test2$gear)
prop.table(table(test2$gear))
nrow(test2)

#Both the proportions are approx same

nrow(train2) + nrow(test2)
