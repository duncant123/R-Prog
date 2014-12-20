# Data Cleaning Quiz 3
# Q1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ", destfile="/Users/duncan/Documents/R Programming/R - Data Cleaning/Q3ACS2006.csv" , method ="curl")
acs <-read.csv(file = "./Documents/R Programming/R - Data Cleaning/Q3ACS2006.csv")
agricultureLogical <- c(acs$ACR==3 & acs$AGS ==6)
which(agricultureLogical)

# Q2
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "/Users/duncan/Documents/R Programming/R - Data Cleaning/jeff.jpg", method = "curl")
quantile( readJPEG("/Users/duncan/Documents/R Programming/R - Data Cleaning/jeff.jpg", native = TRUE), probs=c(.3,.8))

# Q3
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "./Documents/R Programming/R - Data Cleaning/Q3GDP.csv", method="curl")
GDP <- read.csv("./Documents/R Programming/R - Data Cleaning/Q3GDP.csv", header = FALSE, skip=5 , nrows = 190)
names(GDP) <- c("CountryCode","Ranking","","LongName","Economy")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "./Documents/R Programming/R - Data Cleaning/Q3Country.csv", method="curl")
Country <- read.csv("./Documents/R Programming/R - Data Cleaning/Q3Country.csv",head=T)
mergedData <- merge(Country, GDP, by.x="CountryCode",by.y="CountryCode" )
dim(mergedData)
arrange(mergedData,desc(Ranking))
tail(mergedData,13)
head( arrange(mergedData,desc(Ranking)),13)
# Q4
sapply(c("High income: OECD","High income: nonOECD"),function(x) mean(mergedData$Ranking[mergedData$Income.Group==x]))
# Q5
mergedData$Q <- with(mergedData,cut(Ranking , breaks=quantile(Ranking, p=c(0,.2,.4,.6,.8,1)),include.lowest = T))
table(mergedData$Income.Group,mergedData$Q)
