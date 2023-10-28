#BAN400 Assignment Parallel computing

#Problem1
# updated the ReadMe file

#Problem2

#load packages
library(tweedie) 
library(ggplot2)
library(tictoc)

#create a function to print out the results of log by tictoc in a data frame
printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }


#01_AsIs solution
#check time and store the log

tic.clearlog()
tic("AsIs")

#read script01
source("scripts/01_AsIs.R")

#Take log
toc(log = TRUE)

#Store the log for comparisons
printTicTocLog() %>%
  knitr::kable()



#02 Improved a loop by parallel computing, 4 cores

#check time and store the log

#tic.clearlog()
tic(paste0("Parallel loop, ", Cores, " cores"))

#read script02
source("scripts/02_Improve_1.R")

#Take log
toc(log = TRUE)

#Store the log for comparisons
printTicTocLog() %>%
  knitr::kable()


#03 Improved MTweedie parallel computing, 4 cores

#check time and store the log

#tic.clearlog()
tic(paste0("Parallel MTweedie, ", Cores, " cores"))

#read script02
source("scripts/03_Improve_2.R")

#Take log
toc(log = TRUE)

#Store the log for comparisons
printTicTocLog() %>%
  knitr::kable()
