
#https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/Detail/

rm(list=ls())

library(tidyverse)
library(stringr)

setwd("C:\\Users\\Emily\\Box Sync\\WF\\CA drought response\\data\\")

# read in data.frame
df <- readRDS("C:\\Users\\Emily\\Box Sync\\WF\\CA drought response\\data\\cdfa_county_annual_reports.RDS")

# drop "Sum of Others" and "State Totals"
df <- filter(df, !grepl("Total", County))
df <- filter(df, !grepl("Sum of", County))
df <- filter(df, !grepl("  ", County))

####################### YOU ARE HERE ############################
# duplicate county names, group by County.Code
cty.name <- df %>% group_by(County.Code) %>% filter(n() > 1) %>% summarize(n=n())
  
  
  select(Year, County, County.Code) %>%
  group_by(County.Code) %>% 
  summarize(County.Name = list(paste0(County, collapse = ","))) %>%
  mutate(N.County = length(unique(County.Name)))



# different observations for counties (some 2013-2015, some longer, etc.)









# df notes: 
## Some trailing spaces after Crop.Name
## Yield (tons per acre)
## Production (tons)
## Price.P.U and (total) Value (USD)

# refine crop categories: alfalfa, almonds, grapes, lettuce, pistachios, rice, strawberries, tomatoes, walnuts

cn <- unique(df$Crop.Name)
alfalfa_cname <- grep("ALF", cn, value=T)
almonds_cname <- grep("ALMOND", cn, value=T)
grapes_cname <- grep("GRAPES", cn, value=T) #adding S drops GRAPEFRUIT
lettuce_cname <- grep("LETTUCE", cn, value=T)
pistachio_cname <- grep("PISTACH", cn, value=T)
rice_cname <- grep("RICE", cn, value=T)
strawberries_cname <- grep("STRAWB", cn, value=T) 
strawberries_cname <- strawberries_cname[!grepl("NURSERY", strawberries_cname)] #remove berries grown in nursery
tomatoes_cname <- grep("TOMATO", cn, value=T) 
tomatoes_cname <- tomatoes_cname[!grepl("GREENHOUSE", tomatoes_cname)] #drop greenhouse tomatoes
walnut_cname <- grep("WALNUT", cn, value=T)


# create county-year-yield panels for each crop of interest
## Yield.Avg = aggregate average yield across land use categories listed in cname objects

walnut <- df %>% filter(Crop.Name %in% walnut_cname) %>% group_by(County.Code, Year) %>% 
  summarize(Yield.Avg = mean(Yield, na.rm=T), County.Name = paste0(County, collapse=" "))

w <- walnut %>% filter(County == "San Joaquin")
ggplot(data=w, mapping=aes(x=Year, y=Yield.Avg)) +
  geom_point(mapping=aes(color=County)) +
  geom_smooth(mapping=aes(group=County, color=County)) +
  scale_x_continuous(breaks=seq(1980,2015,1)) + ggtitle('Average county yield (tons/acre) - WALNUTS')



######################################################################################################################
# ARCHIVE
######################################################################################################################

### DATASET CONSTRUCTION ###
y15 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2015/2015cropyear.csv"), stringsAsFactors = F)
y14 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2014/2014cropyear.csv"), stringsAsFactors = F)
y13 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2013/2013cropyear.csv"), stringsAsFactors = F)
y12 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2012/201212cactb00.csv"), stringsAsFactors = F)
y11 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2011/201112cactb00.csv"), stringsAsFactors = F)
y10 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2010/201010cactb00.csv"), stringsAsFactors = F)
y09 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2009/200910cactb00.csv"), stringsAsFactors = F)
y08 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2008/200810cactb00.csv"), stringsAsFactors = F)
y07 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2007/200708cactb00.csv"), stringsAsFactors = F)
y06 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2006/200608cactb00.csv"), stringsAsFactors = F)
y05 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2005/200508cactb00.csv"), stringsAsFactors = F)
y04 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2004/200410cactb00.csv"), stringsAsFactors = F)
y03 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2003/200308cactb00.csv"), stringsAsFactors = F)
y02 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2002/200208cactb00.csv"), stringsAsFactors = F)
y01 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2001/200108cactb00.csv"), stringsAsFactors = F)
y00 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/2000/200008cactb00.csv"), stringsAsFactors = F)
y99 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199908cactb00.csv"), stringsAsFactors = F)
y98 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199808cactb00.csv"), stringsAsFactors = F)
y97 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199708cactb00.csv"), stringsAsFactors = F)
y96 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199608cactb00.csv"), stringsAsFactors = F)
y95 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199508cactb00.csv"), stringsAsFactors = F)
y94 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199408cactb00.csv"), stringsAsFactors = F)
y93 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199308cactb00.csv"), stringsAsFactors = F)
y92 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199208cactb00.csv"), stringsAsFactors = F)
y91 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199108cactb00.csv"), stringsAsFactors = F)
y90 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1990s/199008cactb00.csv"), stringsAsFactors = F)
y89 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198908cactb00.csv"), stringsAsFactors = F)
y88 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198808cactb00.csv"), stringsAsFactors = F)
y87 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198708cactb00.csv"), stringsAsFactors = F)
y86 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198608cactb00.csv"), stringsAsFactors = F)
y85 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198508cactb00.csv"), stringsAsFactors = F)
y84 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198408cactb00.csv"), stringsAsFactors = F)
y83 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198308cactb00.csv"), stringsAsFactors = F)
y82 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198208cactb00.csv"), stringsAsFactors = F)
y81 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198108cactb00.csv"), stringsAsFactors = F)
y80 <- read.csv(url("https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/1980s/198008cactb00.csv"), stringsAsFactors = F)

# fix names for 2002, found using bind_rows(list(y08, y81, ...)) and looking at extraneous columns
colnames(y02) <- colnames(y01)

# construct full data.frame
df <- rbind(y80 ,y81, y82, y83, y84, y85, y86, y87, y88, y89, 
            y90, y91, y92, y93, y94, y95, y96, y97, y98, y99, 
            y00, y01, y02, y03, y04, y05, y06, y07, y08, y09, 
            y10, y11, y12, y13, y14, y15)

# write out data.frame
saveRDS(df, "C:\\Users\\Emily\\Box Sync\\WF\\CA drought response\\data\\cdfa_county_annual_reports.RDS")
