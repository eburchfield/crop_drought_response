library(tidyverse)
library(raster)
library(cdlTools)

setwd("C:\\Users\\Emily\\Box Sync\\WF\\CA drought response\\data\\")



ca <- getCDL("California", c(2016))


# land cover change from one year to the next
matchCount()