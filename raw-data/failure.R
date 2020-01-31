library(ggplot2)
library(rjson)
library(purrr)
library(chron)
library(parsedate)

getResults <- function(filename) {
  noErrorData <- fromJSON(file = filename)
  
  results <- c()
  times <- c()
  
  for (trial in noErrorData$items) {
    time <- trial$status$completionTime
    if (length(trial$status$conditions) >= 3 &&
        trial$status$conditions[[3]]$type == "Succeeded") {
      results <- append(results, 0)
    } else {
      results <- append(results, 1)
    }
    times <- append(times, parse_iso_8601(time))
  }
  
  df <- data.frame("time"=times, "results"=results)
  df <- df[do.call(order, df),]
  df["x"] = 1:150
  count <- 0
  realResults <- c()
  for (v in df$results) {
    count <- count + v
    realResults <- append(realResults, as.integer(count))
  }
  x <- 1:150
  print(realResults)
  df <- data.frame("x"=x, "results"=realResults)
  df
}

noError <- getResults("0-error.txt")
failure5 <- getResults("5-failure-5.txt")
failure <- getResults("5-failure.txt")
failure50 <- getResults("5-failure-50.txt")
#failure70 <- getResults("5-failure-70.txt")
failure100 <- getResults("5-failure-100.txt")

p <- ggplot() + 
  geom_line(aes(noError$x, noError$results, colour="0%"), linetype=6) +
  geom_line(aes(failure5$x, failure5$results, colour="5%"), linetype=2) +
  geom_line(aes(failure50$x, failure50$results, colour="50%"), linetype=4) +
  geom_line(aes(failure100$x, failure100$results, colour="100%"), linetype=5)

p + theme_minimal() + scale_fill_brewer(palette="Set2") + 
  guides(colour = guide_legend(title = "#% unavailabel trials")) + 
  xlab("Number") + ylab("Failures") + scale_color_discrete(limits = c("0%", "5%", "50%", "100%"))