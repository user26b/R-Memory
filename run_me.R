# 
# Quellen:
# Informativer Text ueber Memory in R aus "Advanced R" 
#   http://adv-r.had.co.nz/memory.html
# 
#   die im Text benutzte library "lineprof" ist depreceated
#   und provfis empfohlen
#   https://github.com/hadley/lineprof
# 
# konkrete vorschläge
#   https://rpubs.com/msundar/large_data_analysis
# 
#   ffbase (habe ich aber noch nie benutzt)
#   https://rdrr.io/cran/ffbase/
# 
# 

# 
# Mempry Usage analyse tools 
# 

# 
# Profvis
# https://rstudio.github.io/profvis/
# 

install.packages("profvis")

library(profvis)

library(ggplot2)


# bsp 1
p <- profvis({
  g <- ggplot(diamonds, aes(carat, price)) + geom_point(size = 1, alpha = 0.2)
  print(g)
})

print(p)


# bsp 2
source("bsp_skript.R")

p <- profvis(read_delim("diamonds.csv"))

print(p)


# 
# depreciated
# http://adv-r.had.co.nz/memory.html
# 

install.packages("devtools")
devtools::install_github("hadley/lineprof")

library(lineprof)

library(ggplot2)

source("bsp_skript.R")
prof <- lineprof(read_delim("diamonds.csv"))
shine(prof)

