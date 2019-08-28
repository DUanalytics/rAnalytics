# Samples from original set

#rollno, product no etc
(rollno=1:10)

#pick 4 random values from x
sample(x=rollno, size=4)
#run again : different values
sample(x=rollno, size=4)

#if same values are required use set.seed
set.seed(1234) ;sample(x=rollno, size=4)
set.seed(1234) ;sample(x=rollno, size=4)


#size more than the length of set of values
sample(x=c('Male', 'Female'), size=10, replace=TRUE)

#probability of occurance is known 
gender = sample(x=c('Male', 'Female'), size=10, replace=TRUE, prob=c(.6,.4))
table(gender)
prop.table(table(gender))

#proportion will not be exactly same as asked due to small size
prop.table(table(sample(x=c('Male', 'Female'), size=1000, replace=TRUE, prob=c(.6,.4))))  # now proportion as required

