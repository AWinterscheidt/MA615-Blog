library(tidyverse)
library(naniar)
ANES <- read.csv(here::here("dataset-ignore","ANES.csv"))

dataset<- ANES %>% 
  select("V202065x","V201014b","V201502","V201458x","V202117","V202073","V202266","V202267","V202268","V202269","V202270","V202273x","V202276x","V202279x","V202282x","V202286x","V202290x","V202291","V202292")%>%
  replace_with_na_if(.predicate = is.numeric,condition = ~.x<0)

