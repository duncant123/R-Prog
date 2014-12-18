pollutantmean <- function(directory, pollutant, id = 1:332) {
## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

# Check direcory has files in it
# Check directory is valid
# Check 
  
        curwd <- getwd()
        setwd(directory)
  
  
        if (is.element( pollutant,c("sulfate","nitrate")) ) {
#               print(" Valid pollutant") 
        }
        else {
#               print(" Invalid pollutant choice ")
        }
        allmon <- c("Date"=character(0),"sulfate"=numeric(0),"nitrate" =numeric(0),"ID"=integer(0))
        for ( i in id ) {
                fn <- sprintf( "%03d%s", i, ".csv")
                mon <- read.csv(file = fn )
                allmon <- rbind(allmon,mon)
 #              print(paste("File ",fn," read into mon (",nrow(mon),")" ))
        }

        setwd(curwd)
        
        if( pollutant == "sulfate") {
                pollutantmean <- mean(allmon$sulfate, na.rm = TRUE)
        }
        else {
                pollutantmean <- mean(allmon$nitrate, na.rm = TRUE)
        }
  
        return(pollutantmean)
}

