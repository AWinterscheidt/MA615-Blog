

overall<- lm(formula = score ~ margin + factor(year), data = MIT_State)
child<- lm(formula = cs ~ margin + factor(year), data = MIT_State)
women<- lm(formula = ws ~ margin + factor(year), data = MIT_State)
rural<- lm(formula = rs ~ margin, data = MIT_State)
foreign<- lm(formula = fs ~ margin + factor(year), data = MIT_State)

#experiment with combining all factors into a single model
overall_vari <- lm(formula = score ~ margin + cs + ws + fs + factor(year), data = MIT_State)
summary(overall_vari)
library(car)
qqPlot(overall_vari, main="QQ Plot")

summary(overall)
summary(child)
summary(women)
summary(rural)
summary(foreign)

ggplot(data=MIT_State)+
  geom_smooth(aes(x = margin, y = score, color = year),se=FALSE)
ggplot(data=MIT_State)+
  geom_smooth(aes(x = margin, y = cs, color = year),se=FALSE)
ggplot(data=MIT_State)+
  geom_smooth(aes(x = margin, y = ws, color = year),se=FALSE)
ggplot(data=MIT_State)+
  geom_smooth(aes(x = margin, y = rs, color = year),se=FALSE)
ggplot(data=MIT_State)+
  geom_smooth(aes(x = margin, y = fs, color = year),se=FALSE)


install.packages(c("usmap"))
remotes::install_github('thomasp85/gganimate', force = TRUE)

library(tidyverse)
library(usmap)
library(av)
library(gifski)
library(gganimate)

 MIT_animate<-
  MIT_State%>%
  mutate(date = as.Date(paste0("11/01/",year),"%m/%d/%Y"))%>%
   mutate(frame = as.numeric(year))
  

plot_usmap("state",data=MIT_animate,values="score")+
  scale_fill_continuous(low="blue",high="red",name="Score")+
  theme(legend.position = "right")+
  labs(title ="Election Year:{frame_time}")+
  transition_time(date)+
  ease_aes("exponential-in-out")

plot_usmap("state",data=MIT_animate,values="cs")+
  scale_fill_continuous(low="blue",high="red",name="Child Score")+
  theme(legend.position = "right")+
  labs(title ="Election Year:{frame_time}")+
  transition_time(date)+
  ease_aes("linear")

plot_usmap("state",data=MIT_animate,values="ws")+
  scale_fill_continuous(low="blue",high="red",name="Women Score")+
  theme(legend.position = "right")+
  labs(title ="Election Year:{frame_time}")+
  transition_time(date)+
  ease_aes("linear")

plot_usmap("state",data=MIT_animate,values="fs")+
  scale_fill_continuous(low="blue",high="red",name="Foreign Score")+
  theme(legend.position = "right")+
  labs(title ="Election Year:{frame_time}")+
  transition_time(date)+
  ease_aes("linear")

plot_usmap("state",data=MIT_animate,values="rs")+
  scale_fill_continuous(low="blue",high="red",name="Rural Score")+
  theme(legend.position = "right")+
  labs(title ="Election Year:{frame_time}")+
  transition_time(date)+
  ease_aes("linear")

