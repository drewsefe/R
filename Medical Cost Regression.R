# loading in the data
data
num_cols <- unlist(lapply(data, is.numeric))
plot(data[,num_cols])

round(cor(data[,num_cols]),2)

smoker = as.factor(data$smoker)
sex = as.factor(data$sex)
region = as.factor(data$region)

boxplot(data$charges ~ smoker,main = 'Smoker')
boxplot(data$charges ~ sex, main = 'sex')
boxplot(data$charges ~ region, main ='region')
