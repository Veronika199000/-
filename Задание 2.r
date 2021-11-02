library(dplyr)


data = read_csv(file = "greendb.csv")

data = data %>% filter(species_ru == "Дуб черешчатый")
model = lm(d_trunk_m ~ adm_region, data)

anova(model)

# При P=0  можно сделать вывод, что район произростания 
# влияет на высоту дуба черешчатого

#  Analysis of Variance Table
#  Response: d_trunk_m
#                Df Sum Sq Mean Sq F value    Pr(>F)    
#  adm_region   111 127.07 1.14478   30.32 < 2.2e-16 ***
#  Residuals  13203 498.50 0.03776                      
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

