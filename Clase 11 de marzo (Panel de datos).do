/*Microeconomia Aplicada / 11 de marzo del 2021 */
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia Aplicada\Bases de datos\PSID.dta"
* Exploracion de variables 
describe
* Estadisticas descritivas
summarize

list id t exp semanas obrero in 1/3, clean 
* Declarar la base de datos como panel de datos  
xtset id t
xtdescribe
* Importacia relativa "Winthin" "between"












