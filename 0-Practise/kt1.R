?which

LETTERS
which(LETTERS == "K")  #11th alphabet

marks = c(10,30,40, 60)
which(marks > 30)  #position
marks[which(marks > 30)]  #which of thos valuees

names = c('kanika','dhiraj', 'tanvi','poonam','dhananjay', 'upen')
#which names have dh
grep('[dh]', names, ignore.case=T)
names[grep('[dh]', names, ignore.case=T)]

mtcars
which(mtcars$mpg > 25)
mtcars[which(mtcars$mpg > 25),]


j = c(2,3,4,5,6,7,8,9,23,24,22,1,10)
j > 6
which(j > 6)
j[ which(j > 6) ]


?grep

which(ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE)) #> 1 3 7
names(ll) <- letters[seq(ll)]
which(ll)
which((1:12)%%2 == 0) # which are even?
which(1:10 > 3, arr.ind = TRUE)
