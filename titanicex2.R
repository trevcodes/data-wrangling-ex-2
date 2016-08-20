install.packages("tidyr")
install.packages("dplyr")

library("tidyr")
library("dplyr")

titanic_original <- read.csv("titanic_original.csv", header=TRUE)
titanicdf1 <- data.frame(titanic_original)

str(titanicdf1)

titanicdf1$embarked
levels(titanicdf1$embarked)

titanicdf1$embarked[titanicdf1$embarked == ""] <- "S"

levels(titanicdf1$embarked) #Question for Dhiraj - levels leaves the 'na' field?

summary(titanicdf1$embarked)

summarise(titanicdf1,avg_age =mean(age, na.rm=TRUE))

titanicdf1[ ,"age"][is.na(titanicdf1[, "age"])] <- mean(titanicdf1$age, na.rm=TRUE, trim=0) #Mean looks wrong

summary(titanicdf1$boat)

titanicdf3 <- titanicdf1

titanicdf3$boat <- as.character(titanicdf3$boat)
titanicdf3[, "boat"][is.na(titanicdf3[, "boat"])] <- "None"

titanicdf3$has_cabin_num <- ifelse(is.na(titanicdf3$cabin), 0, 1)

write.csv(titanicdf3, file = "titanic_clean.csv")
