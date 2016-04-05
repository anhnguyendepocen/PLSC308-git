# Plots for Chapter 13

N <- 400
set.seed(7222009)
X <- runif(N,0,100)
YPmon <- X + runif(N,-40,40)
YPmon <- ifelse(X>30,YPmon+30,YPmon)
YPmon <- ifelse(X>60,-60+4*X+runif(N,-30,30),YPmon)
YPlin <- X + runif(N,-20,20)
YPnonlin <- (log(X)) + runif(N,-0.7,0.7)
YPnonmon <- ((100*X - X^2)/100) + runif(N,-20,20)  

pdf("ContinuousRelationships.pdf",9,6)
par(mfrow=c(2,4))
plot(X,YPmon,pch=19,main="Monotonic",ylab="Positive")
plot(X,YPlin,pch=19,main="Linear",ylab=" ")
plot(X,YPnonlin,pch=19,main="Non-Linear",ylab=" ")
plot(X,YPnonmon,pch=19,main="Non-Monotonic",ylab=" ")
plot(X,-YPmon,pch=19,main=" ",ylab="Negative")
plot(X,-YPlin,pch=19,main=" ",ylab=" ")
plot(X,-YPnonlin,pch=19,main=" ",ylab=" ")
plot(X,-YPnonmon,pch=19,main=" ",ylab=" ")
dev.off()

# Strengths of relationships

Yzero <- (rnorm(N)*50)+200
Yweak <- X + (rnorm(N)*40)
Ystrong <- X + (rnorm(N)*4)

pdf("RelationshipStrengths.pdf",9,7)
par(mfrow=c(1,3))
plot(X,Yzero,pch=19,main="No Relationship",ylab="Y")
plot(X,Yweak,pch=19,main="Weak Relationship",ylab="Y")
plot(X,Ystrong,pch=19,main="Strong Relationship",ylab="Y")
dev.off()

# Africa (2001) Data:

Africa <- read.csv("africa2001.csv")

TABLE<-with(Africa, table(internalwar,subsaharan))
TABLE
prop.table(TABLE,1)*100
prop.table(TABLE,2)*100

# chi-square

chisq.test(TABLE)

# Graphics...

# barplot

pdf("Barplot.pdf",7,7)
par(mfrow=c(1,1))
barplot(TABLE)
dev.off()



