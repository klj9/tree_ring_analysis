library(tidyverse)

precip_data = read.csv("data/owens_precip_data.csv", header=TRUE)

head(precip_data)

annual_precip = precip_data %>%
  filter(YEAR!=1998, YEAR!=2023) %>%
  group_by(YEAR) %>%
  summarize(total_precip_in = sum(PRCP, na.rm=TRUE))

ggplot(data=annual_precip, aes(x=YEAR, y=total_precip_in))+
  geom_bar(stat="identity")+
  xlab("Year")+
  ylab("Total Precipitation (in)")+
  theme_bw()
