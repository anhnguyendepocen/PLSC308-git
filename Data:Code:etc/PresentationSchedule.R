############################################
# R code to randomly select individuals
# from PLSC 308 into either Tuesday (4/19)
# or Thursday (4/21) class presentations
############################################

# install.packages("RCurl") # <- uncomment to install RCurl package

library(RCurl)

# Get data:

temp<-getURL("https://raw.githubusercontent.com/PrisonRodeo/PLSC308-git/master/Data%3ACode%3Aetc/ClassRoster.csv")
PLSC308<-read.csv(text=temp, header=TRUE)
rm(temp)

# Assign a random number to each class member:

set.seed(7222009)
PLSC308$Random <- rnorm(nrow(PLSC308))

# Sort according to the random number:

PLSC308 <- PLSC308[order(PLSC308$Random),]

# First half present on Tuesday, second on Thursday:

Tuesday <- PLSC308[1:(nrow(PLSC308)/2),]
Tuesday <- data.frame(First = Tuesday$FIRSTNAME,
                      Last = Tuesday$LASTNAME)
Thursday <- PLSC308[((nrow(PLSC308)/2)+1):(nrow(PLSC308)),]
Thursday <- data.frame(First = Thursday$FIRSTNAME,
                      Last = Thursday$LASTNAME)

Tuesday
Thursday