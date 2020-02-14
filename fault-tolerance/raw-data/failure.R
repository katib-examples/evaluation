library(ggplot2)
library(rjson)
library(purrr)
library(chron)
library(parsedate)

getResults <- function(filename) {
  noErrorData <- fromJSON(file = filename)
  
  results <- c(0)
  times <- c(0)
  
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
  df["x"] = 0:150
  count <- 0
  realResults <- c()
  for (v in df$results) {
    count <- count + v
    realResults <- append(realResults, as.integer(count))
  }
  x <- 0:150
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
  geom_line(aes(noError$x, noError$results, colour="0%", linetype="0%")) +
  geom_line(aes(failure5$x, failure5$results, colour="5%", linetype="5%")) +
  geom_line(aes(failure50$x, failure50$results, colour="50%", linetype="50%")) +
  geom_line(aes(failure100$x, failure100$results, colour="100%", linetype="100%")) +
  annotate("rect", xmin = 60, xmax = 65, ymin = 0, ymax = 2,
             alpha = .5) +
  annotate("text", x = 70, y = 4, label = "Outlier") +
  annotate("segment", x=63, y= 1, xend=65, yend=3, colour="red")

p + theme_minimal() + scale_fill_brewer(palette="Set2") + 
  xlab("Number of trials") + ylab("Cumulative Failures") + 
  scale_colour_manual(name = "#% unavailable trials in the interval",
                      labels = c("0%", "5%", "50%", "100%"),
                    values = c("darkred", "darkblue", "black", "darkgreen")) +   
  scale_linetype_manual(name = "#% unavailable trials in the interval",
                     labels = c("0%", "5%", "50%", "100%"),
                     values = c(6, 2, 5, 4)) +
  theme(legend.position = c(0.3, 0.7))
  