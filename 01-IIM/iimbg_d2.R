
mtcars ; proportion of am to be maintained
train_MTC  - 70%
test_MTC  - 30%

set.seed(34)
library(caret)
split1 <- ...
train_MTC  <-  ....
test_MTC <- ....
table(train_MTC$am)
table(test_MTC$test)
