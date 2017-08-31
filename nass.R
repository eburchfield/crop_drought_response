# This script reconstructs the dataset used in the ca_drought_response.RMD file.
# Details for the original USDA data used can be found at:
#https://www.nass.usda.gov/Statistics_by_State/California/Publications/AgComm/Detail/

rm(list=ls())

library(tidyverse)
library(stringr)

setwd("./data")

######################################################################################################################
# Initial dataset construction
######################################################################################################################

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

# drop "Sum of Others" and "State Totals"
df <- filter(df, !grepl("Total", County))
df <- filter(df, !grepl("Sum of", County))
df <- filter(df, !grepl("  ", County))

# df notes: 
## Some trailing spaces after Crop.Name
## Yield (tons per acre)
## Production (tons)
## Price.P.U and (total) Value (USD)
## Use County.Code rather than County as County ID

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


# OUTLIER CHECK

df$Index <- seq(1, nrow(df))

# visual inspection for each crop using this plot:
df %>% filter(Crop.Name %in% rice_cname) %>% group_by(Year) %>% 
  ggplot(., mapping=aes(x=Year, y=Yield)) +
  geom_point() +
  geom_smooth(method="loess") +
  ggtitle('Average yield (tons/acre) - RICE')

# NOTE: this will not work if RASTER package is loaded

#ALFALFA: crazy value over 800 (n=1)
idx1 <- df %>% filter(Crop.Name %in% alfalfa_cname, Yield > 100) %>% select(Index)

#ALMONDS: crazy value (n=1)
idx2 <- df %>% filter(Crop.Name %in% almonds_cname, Yield > 100) %>% select(Index)

#GRAPES: drop values over 25 (n=1)
idx3 <- df %>% filter(Crop.Name %in% grapes_cname, Yield > 25) %>% select(Index)

#LETTUCE: drop values over 50 (n=2)
idx4 <- df %>% filter(Crop.Name %in% lettuce_cname, Yield > 50) %>% select(Index)

#STRAWBERRIES: drop values over 100 (n=1)
idx5 <- df %>% filter(Crop.Name %in% strawberries_cname, Yield > 50) %>% select(Index)

#TOMATOES: drop values over 100 (n=4)
idx6 <- df %>% filter(Crop.Name %in% tomatoes_cname, Yield > 100) %>% select(Index)

#WALNUTS: drop over 5 (n=3)
idx7 <- df %>% filter(Crop.Name %in% walnut_cname, Yield > 5) %>% select(Index)

#NA outlier rows
idx <- as.data.frame(unlist(c(idx1, idx2, idx3, idx4, idx5, idx6, idx7)))
df <- df[!(df$Index %in% idx$`unlist(c(idx1, idx2, idx3, idx4, idx5, idx6, idx7))`),]
remove(idx1, idx2, idx3, idx4, idx5, idx6, idx, idx7)

# # test for differences in variations in crop name
# df %>% filter(Crop.Name %in% alfalfa_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Alfalfa')
# #drop seed and sprount
# 
# df %>% filter(Crop.Name %in% almonds_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Almonds')
# #drop hulls b/c no observations
# 
# df %>% filter(Crop.Name %in% lettuce_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Lettuce')
# #group multiple types of lettuce 
# 
# df %>% filter(Crop.Name %in% tomatoes_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Tomatoes')
# #focus on processing tomatoes only, yield seems pretty different for processing v. FRESH AMRKET, CHERRY, and UNSPECIFIED
# 
# df %>% filter(Crop.Name %in% pistachio_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Pistachios')
# 
# df %>% filter(Crop.Name %in% walnut_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Walnuts')
# #hardly any BLACK observations, so drop
# 
# df %>% filter(Crop.Name %in% strawberries_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Strawberries')
# #lots of variability, but no clear reason to ungroup

# #RICE - rice plot shows two distinct yield levels, replot removing "RICE SEED"
#rice_cname <- rice_cname[!grepl("SEED", rice_cname)]#remove rice seed
# df %>% filter(Crop.Name %in% rice_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Rice')
# #remove wild rice, much lower yields
# 
# df %>% filter(Crop.Name %in% grapes_cname) %>% group_by(Year) %>% 
#   ggplot(., mapping=aes(x=Year, y=Yield)) +
#   geom_point(mapping=aes(color=Crop.Name)) +
#   geom_smooth(method="loess", mapping=aes(group=Commodity.Code, color=Crop.Name)) +
#   ggtitle('Average yield (tons/acre) - Wine grapes')
# #keep all grapes


# UPDATED CNAME
alfalfa_cname <- grep("ALF", cn, value=T)
alfalfa_cname <- alfalfa_cname[!grepl("SEED", alfalfa_cname)] #remove SEED ALFALFA
alfalfa_cname <- alfalfa_cname[!grepl("SPROUT", alfalfa_cname)] #remove SPROUT ALFALFA

almonds_cname <- grep("ALMOND", cn, value=T)
almonds_cname <- almonds_cname[!grepl("HULLS", almonds_cname)] #remove SPROUT ALFALFA

grapes_cname <- grep("GRAPES", cn, value=T) #adding S drops GRAPEFRUIT

lettuce_cname <- grep("LETTUCE", cn, value=T)

pistachio_cname <- grep("PISTACH", cn, value=T)

rice_cname <- grep("RICE MILLING", cn, value=T)

strawberries_cname <- grep("STRAWB", cn, value=T) 
strawberries_cname <- strawberries_cname[!grepl("NURSERY", strawberries_cname)] #remove berries grown in nursery

tomatoes_cname <- grep("TOMATOES PROC", cn, value=T) 

walnut_cname <- grep("WALNUTS ENGLISH", cn, value=T)

# update crop names
df$Crop.Name[df$Crop.Name %in% alfalfa_cname] <- "Alfalfa"
df$Crop.Name[df$Crop.Name %in% almonds_cname] <- "Almonds"
df$Crop.Name[df$Crop.Name %in% grapes_cname] <- "Grapes"
df$Crop.Name[df$Crop.Name %in% lettuce_cname] <- "Lettuce"
df$Crop.Name[df$Crop.Name %in% pistachio_cname] <- "Pistachios"
df$Crop.Name[df$Crop.Name %in% rice_cname] <- "Rice"
df$Crop.Name[df$Crop.Name %in% strawberries_cname] <- "Strawberries"
df$Crop.Name[df$Crop.Name %in% tomatoes_cname] <- "Tomatoes"
df$Crop.Name[df$Crop.Name %in% walnut_cname] <- "Walnuts"

# trim white space in county names
df$County <- trimws(df$County, which = "both")

saveRDS(df, "./data/cdfa_county_annual_reports.RDS")

