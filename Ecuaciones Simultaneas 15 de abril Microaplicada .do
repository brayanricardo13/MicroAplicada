*Microeconomia aplicada 15/04/2021 
*Ecuaciones simultaneas 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MROZ_1.DTA"
reg horas lsalario educ edad hijos1 nwifeinc, robust 
*Dos etapas 
ivregress 2sls horas educ edad hijos1 nwifeinc (lsalario= exper2), robust 
*MCO
reg lsalario horas educ exper exper2,robust
*2 etapas
ivregress 2sls lsalario educ exper exper2 (horas= edad hijos1 nwifeinc ),robust 








use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Prision.DTA"











