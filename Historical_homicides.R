library(tidyverse)



# Measures and timeframe for long-term homicide in western Europe


library(readr)
## Western_Europe <- read_csv("homicide-rates-across-western-europe.csv")
Western_Europe <- read_csv("new_homicide.csv")

##View(homicide_rates_across_western_europe)
View(new_homicide)


##ggplot(data = new_homicide, aes(x = Year, y = Homicide, color = Entity)) +
  

ggplot(data = new_homicide) + 
  geom_point(mapping = aes(x = Year, y = Homicide, color = Entity)) +
  #coord_flip() +
  labs(x = "Year",
       y = "Homicides per 100,000",
       title = "Homicide rate in Europe over long-term")

??coord_flip

ggplot(data = new_homicide) + 
  geom_point(mapping = aes(x = Year, y = Homicide, color = Entity)) +
  facet_wrap(~ Entity, nrow = 2) +
#  coord_flip() +
  labs(x = "Year",
       y = "Homicides per 100,000",
       title = "Homicide rate in Europe over long-term")




# Three European countries - datasets from The Ohio State University 



#GERMANY

##Germany <- readr::read_csv("Data_Germany/Homicide-Rates-in-Germany-2c-1254-1805 (1).xlsx")

### following will show the difficulties by merging the sheets of the centuries. It is from ge_16c the non merging starts.


####Germany<-rbind(ge_13c, ge_14c, ge_15c, ge_16c, ge_17c, ge_18c, ge_19c)

identical(ge_13c, ge_16c)

identical(ge_13c, ge_14c)
ge_final <- rbind(ge_13c, ge_14c, ge_15c)
ge_final <- rbind(ge_17c, ge_18c)
identical(ge_18c, ge_19c)

genames<-typeof(ge_16c)

count(genames)

typeof(ge_16c[1])

sapply(ge_13c, class)
sapply(ge_14c, class)
sapply(ge_15c, class)
sapply(ge_16c, class)
sapply(ge_17c, class)
sapply(ge_18c, class)
sapply(ge_19c, class)

for(i in genames)
{
  print(typeof(i))
}

head(ge_16c)



str(ge_14c)
str(ge_15c)
str(ge_16c)

head(ge_13c, n = 10L, addrownums = TRUE)
head(ge_14c)
head(ge_15c)
head(ge_16c)
head(ge_17c)
head(ge_18c)
head(ge_19c)

#Change column 4 from numeric to character
ge_16c[, c(10)]<-sapply(ge_16c[,c(10)], as.character)
ge_17c[, c(10)]<-sapply(ge_17c[,c(10)], as.character)
ge_18c[, c(10)]<-sapply(ge_18c[,c(10)], as.character)
ge_19c[, c(10)]<-sapply(ge_19c[,c(10)], as.character)

identical(ge_13c, ge_14c)

ge_19c[, c(3)]<-sapply(ge_19c[,c(3)], as.character)

ge1 <- rbind(ge_13c, ge_14c, ge_15c)
ge1<-rbind(ge1, ge_17c)
ge2 <- rbind(ge_13c, ge_14c, ge_15c, ge_16c, ge_17c, ge_18c, ge_19c)

Germany1<-rbind(c13_ge, c14_ge, c15_ge, c16_ge)

rm(Germany)
rm(Germany1)


colnames(ge_13c)<-colnames(ge_14c)<-colnames(ge_15c)<-colnames(ge_16c)<-colnames(ge_17c)<-colnames(ge_18c)<-colnames(ge_19c)

Germany<-rbind(ge_13c, ge_14c, ge_15c, ge_16c, ge_17c, ge_18c, ge_19c)

  

ggplot(data = Germany) + 
  geom_point(mapping = aes(x = Year, y = Homicide_Rate)) +
  #coord_flip() +
  labs(x = "Year",
       y = "Homicides per 100,000",
       title = "Homicide in Germany 1300-1800")
       


ggplot(data = ge_16c) + 
  geom_point(mapping = aes(x = Year, y = Homicide_Rate)) +
  #  coord_flip() +
  labs(x = "Year",
       y = "Homicides per 100,000",
       title = "Homicide in Germany 1500s")

ggplot(data = Germany) + 
  geom_point(mapping = aes(x = Year, y = Homicide_Rate, color = City)) +
  facet_wrap(~ City, nrow = 2) +
  #  coord_flip() +
  labs(x = "Year",
       y = "Homicides per 100,000",
       title = "Homicide in Germany 1300-1800")



## England (London)

library(readr)
London_homicides <- read_csv("Data_England/London_homicides.csv")
View(London_homicides)

data(London_homicides)
head(London_homicides)
summary(London_homicides)


ggplot(data = London_homicides) + 
  geom_smooth(mapping = aes(x = Year, y = Homicide_rate )) +
  labs(x = "Years",
       y = "Homicides per 100,000 persons per year",
       title = "Long-term homicide rate in London")


ggplot(data = London_homicides) + 
  geom_point(mapping = aes(x = Year, y = Homicide_rate )) +
  labs(x = "Years",
       y = "Homicides per 100,000 persons per year",
       title = "Long-term homicide rate in London")



ggplot(data = London_homicides) + 
  geom_smooth(mapping = aes(x = Year, y = Population )) +
  labs(x = "Years",
       y = "Rate",
       title = "Homicide in London")
  
  
# SWEDEN

## Mergint to variables togheter

Stockholm <- c("Stockholm_Karonen", "Stockholm_Soderberg")

ggplot(data = "Stockholm") + 
  geom_point(mapping = aes(x = Year, y = "Stockholm")) +
  labs(x = "Years",
       y = "Rate",
       title = "Homicide in Stockholm 1500-1700")


## Statistic with both smooth and point

ggplot(data = Scandinavian_homicide_rate_2) + 
  geom_smooth(mapping = aes(x = Year, y = Homicide )) +
  geom_point(mapping = aes(x = Year, y = Homicide, colour = Homicide )) +
  labs(x = "Years",
       y = "Rate",
       title = "Homicide in Sweden 1500-1700")



#Cleaning the global inviroment from non used data - rm = remove:

rm("Open_refine_London_and_Liverpool_homicides_csv")
rm("c13")
rm("c14")
rm("Germany")
rm("Homicide_Rates_in_Germany_2c_1254_1805_1_")
rm("Western_Europe")
rm(Scandinavian_homicide_rate)
rm(c13)
rm(c19_ge)
rm(ge_final)
