
############ LINEAR REGRESSION ############
## Continuous - Continuous

# data
xVar <- 1:10
yVar <- runif(10)
dataFrame <- data.frame(xVar,yVar)

# model
regModel <- lm(yVar~xVar,data=dataFrame) # lm=linear regression function

# model output
print(regModel) # gives intercept & slope
print(summary(regModel)) # gives more info, including p-value

# plot
plot(y=dataFrame$yVar,x=dataFrame$xVar,pch=21,bg="lightblue",cex=2, main = "Linear Regression",xlab="Number of cats",ylab = "Probability of being crazy")
abline(regModel)



############ ANOVA ############
## Dependent - Continuous; Independent = discrete
# data
xVar <- as.factor(rep(c("Control","Heated","Cooled"),each=5)) # repeating these 5 times each
yVar <- c(rgamma(10,shape=5,scale=5),rgamma(5,shape=5,scale=10))
dataFrame <- data.frame(xVar,yVar)

# model
anovaModel <- aov(yVar~xVar,data=dataFrame) # aov = the function that runs anova

# model output
print(anovaModel)
summary(anovaModel)

# plot
boxplot(yVar~xVar,data=dataFrame,col=c("grey","thistle","orchid"))



############ CONTINGENCY ############
##Both discrete
# data
vec1 <- c(50,66,22)
vec2 <- c(120,22,30)
dataMatrix <- rbind(vec1,vec2)
print(dataMatrix) # at this point, columns and rows are not named, add that below
rownames(dataMatrix) <- c("Cold","Warm")
colnames(dataMatrix) <-c("Aphaenogaster",
                         "Camponotus",
                         "Crematogaster")
print(dataMatrix)

# model + model output
print(chisq.test(dataMatrix))

# plot
mosaicplot(x=dataMatrix,
           col=c("goldenrod","grey","black"),
           shade=FALSE)
barplot(height=dataMatrix,
        beside=TRUE,
        col=c("cornflowerblue","tomato"))

chisq.test(dataMatrix)$expected #getting expected values from chi-square test
## Verify expected counts
(sum(dataMatrix[,1])*sum(dataMatrix[1,]))/sum(dataMatrix)

par(mfrow=c(2,1))
expected<-as.matrix(chisq.test(dataMatrix)$expected)

barplot(height=expected,
        beside=TRUE,
        col=c("cornflowerblue","tomato"))

barplot(height=dataMatrix,
        beside=TRUE,
        col=c("cornflowerblue","tomato"))


############ LOGISTIC REGRESSION ############
## Dependent - discrete; Independent = continuous

# data
xVar <- rgamma(n=20,shape=5,scale=5)
yVar <- rbinom(n=20,size=1,p=0.5)
dataFrame <- data.frame(xVar,yVar)

# model
logRegMod <- glm(yVar ~ xVar,
                 data=dataFrame,
                 family=binomial(link="logit"))
# model output
print(logRegMod)
summary(logRegMod)

par(mfrow=c(1,1))
# plot
plot(x=dataFrame$xVar, y=dataFrame$yVar,pch=21,bg="tan",cex=2.5)
curve(predict(logRegMod,data.frame(xVar=x),type="response"),add=TRUE,lwd=2) # curve = prediction part of the logistic regression # add = TRUE means adding to the plot we just created


