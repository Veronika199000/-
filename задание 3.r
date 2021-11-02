library(tidyverse)
library(dplyr)
library(readr)
library(jsonlite)
library(sf)


greendb = read_csv("~/urban_modeling/greendb.csv")

greendb %>% summary
greendb |> summary()

#######
### Регрессионная зависимость высоты от диаметра ствола 
###

data = greendb %>% 
  filter(species_ru == "Дуб черешчатый", adm_region == "район Внуково") %>% select(
    height_m, d_trunk_m
  )

model = lm(d_trunk_m ~ height_m, data)

summary(model)

# d_trunk_m = 0.0173771 * heght_m +0.0254454
# p < 0.001

anova(model)
# Analysis of Variance Table
# Response: d_trunk_m
# Df Sum Sq Mean Sq F value    Pr(>F)    
# height_m     1 24.891 24.8912  1797.3 < 2.2e-16 ***
#   Residuals 2458 34.041  0.0138                      
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# Зависит p < 0.05