complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
        
        curwd <- getwd()
        setwd(directory)

        allnobs <- data.frame("id"=integer(0),"nobs"=integer(0) )
        
        for ( i in id ) {
                fn   <- sprintf( "%03d%s", i, ".csv")
                data <- read.csv(file = fn )
        
                # Count complete cases
                good    <- complete.cases(data)
                allnobs <- rbind( allnobs, c( i,  nrow(data[good,]) ))
        }
        names(allnobs) <- c("id", "nobs")
        setwd(curwd)
        return(allnobs)
}