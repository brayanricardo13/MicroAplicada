/*clase 27 de abril 2021*/ 
* Microeconomia aplicada - variables instrumentales  
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Card1.DTA"
*Instrumentalizando la educacion en la ecuacion del ingreso 
reg lsalario educ exper exper2 smsa sur

correlate univprx4 salario

ivregress 2sls lsalario exper exper2 smsa sur (educ = univprx4 )

*comprobar la relavancia instrumental 

reg educ exper exper2 smsa sur univprx4 






































