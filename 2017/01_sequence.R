library(stringr)
library(tidyverse)

n_sim <- 10000
max_len <- 500

simulate_coin <- function(n_throws) {
  z <- sample(x = c(0L, 1L), replace = TRUE, size = max_len) 
  z_txt <- paste0(z, collapse = "")
  return(z_txt)
}

experiments <- tibble(len = rep(max_len, times = n_sim))

wait_for <- "10111"
experiments <- mutate(experiments, x = map(len, simulate_coin))
experiments <- mutate(experiments, 
        first_pos = str_locate(x, wait_for)[, 2])

experiments <- mutate(experiments, x_sub = str_sub(x, end = first_pos))

experiments <- mutate(experiments, 
                      n_10 = str_count(x_sub, "10"), 
                      n_00 = str_count(x_sub, "00"))
ggplot(data = experiments) + geom_jitter(aes(x = n_00, y = n_10), alpha = 0.1) 


