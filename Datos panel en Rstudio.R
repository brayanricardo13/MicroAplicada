# Microeconomia Aplicada 18/02/2021
# Datos Panel 
install.packages("wooldridge")
library(wooldridge)
data("fertil1")
regresion <- lm(fertil1$kids ~ fertil1$educ + fertil1$age + fertil1$agesq + fertil1$black
                + fertil1$east + fertil1$northcen + fertil1$west + fertil1$farm + fertil1$othrural+ fertil1$othrural+ 
                  fertil1$town + fertil1$smcity + fertil1$y74 + fertil1$y76 + fertil1$y78+
                  fertil1$y80 + fertil1$y82+ fertil1$y84 ,data = fertil1)

summary(regresion)

