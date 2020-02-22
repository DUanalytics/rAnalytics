#Multiple Linear Regression 
#Linear Modeling : DV vs more than 1 IVs
#sales Qty vs price & promotion

#Omni Store
#creating data using Vector
sales= c(4141,3842,3056,3519,4226, 4630,3507,3754, 5000,5120,4011, 5015,1916,675, 3636,3224,2295, 2730,2618,4421, 4113,3746, 3532, 3825,1096, 761,2088,820,2114, 1882,2159,1602,3354,2927)
price = c(59,59,59,59,59,59,59,59,59,59,59,59, 79,79,79,79,79,79,79,79,79, 79,79,79,99,99, 99,99,99,99,99,99,99,99)
promotion= c(200,200,200,200,400,400,400,400, 600,600,600,600,200,200,200,200, 400,400,400,400,600,600,600,600, 200,200,200,200,400,400,400,400,600,600)
omni1 = data.frame(sales, price, promotion)
head(omni1)
str(omni1)
#Make one of data frames active
omni = omni1
head(omni)
options(scipen=999)
model2 = lm(sales ~ price + promotion, data = omni)
summary(model2)
#F-stats : pvalue < .05 : LM exists : Y is related to one of the Xs
#Adj R2 > .6 : 74% of variation in price is captured by price and promotion
#coeff : all are significant 
#keeping price constant, if we increase promotion by 1 unit, sales increase by 3.6 units
range(omni$price)
dim(omni)
sdata <- omni %>% sample_n(2)
sdata
ndata3 = data.frame(price, promotion)

cbind(sdata, predict(model2, newdata= sdata))

plot(model2)
plot(model2, which=4)
omni[14,]
model2b = lm(sales ~ price + promotion, data = omni[-14,])
summary(model2b)

AIC(model2b)
AIC(model2)
