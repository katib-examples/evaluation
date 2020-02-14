library(ggplot2)
library(rjson)
library(purrr)

getResults <- function(filename) {
  noErrorData <- fromJSON(file = filename)
  
  results <- c()
  max <- 10000000
  
  for (trial in noErrorData$items) {
    metrics <- trial$status$observation$metrics[[1]]$value
    if (!is.null(metrics)) {
      if (metrics < max) {
        max = metrics
      }
    }
    results <- append(results, max)
  }
  
  x <- 1:150
  return(list("results"=results, "x"=x))
}

noError <- getResults("0-error.txt")
failure5 <- getResults("5-failure-5.txt")
failure <- getResults("5-failure.txt")
failure50 <- getResults("5-failure-50.txt")
failure70 <- getResults("5-failure-70.txt")
failure100 <- getResults("5-failure-100.txt")

results <- data.frame("noError"=noError$results, "failure5"=failure5$results,
                "failure50"=failure50$results, "failure100"=failure100$results, 
                "x"=noError$x)

p <- ggplot(results) + 
  geom_line(aes(x, noError, colour="0%", linetype="0%")) +
  geom_line(aes(x, failure5, colour="5%", linetype="5%")) +
  geom_line(aes(x, failure50, colour="50%", linetype="50%")) +
  geom_line(aes(x, failure100, colour="100%", linetype="100%"))

p + theme_minimal() + scale_fill_brewer(palette="Set2") + 
  xlab("Number of trials") + ylab("cross-entropy") + 
  scale_colour_manual(name = "#% unavailable trials in the interval",
                      labels = c("0%", "5%", "50%", "100%"),
                      values = c("darkred", "darkblue", "black", "darkgreen")) +   
  scale_linetype_manual(name = "#% unavailable trials in the interval",
                        labels = c("0%", "5%", "50%", "100%"),
                        values = c(6, 2, 5, 4)) +
  theme(legend.position = c(0.7, 0.7))