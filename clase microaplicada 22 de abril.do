* Variables instrumentales Microaplicada 22/04/2021
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MROZ_1.DTA"
*endogenidad
reg lsalario educ
ta educ
tsline lsalario
* variables instrumentales 2 etapas
ivregress 2sls lsalario (educ = educ_p)
ivregress 2sls lsalario (educ = educ_p),robust
*correlacion entre educacion y educacion del hijo
reg educ educ_p if merc_lab == 1, robust 
clear
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Salario2.DTA"
* dos variables estan correlacionadas 
reg educ hermanos 
correlate educ hermanos 
reg lsalario educ 
ivregress 2sls lsalario (educ = hermanos  )