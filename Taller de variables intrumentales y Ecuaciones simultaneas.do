*Taller de variables instrumentales y ecuaciones simultaneas  
*18 de mayo de 2021 III Corte  
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MEPS.dta"
reg lgmp as_empsind total_cc edad mujer neg_latin ling
reg lgmp as_empsind total_cc edad mujer neg_latin ling,robust 
* Variable que se sospecha que es endogena 
as_empsind
//**Variables instrumentos 
ssiratio 
ing_b 
firma 
multlc
**//
* 1.A) Relevancia Instrumental ()
reg as_empsind ssiratio ing_b firma multlc 
correlate as_empsind ssiratio ing_b firma multlc 

* 1.B) Estimacion de un modelo exactamnete identificado por lV 
*extactamente identificado (mismas variables exogenas que endogenas)
reg lgmp as_empsind total_cc edad mujer neg_latin ling,robust 
*Estimacion 2sls
ivregress 2sls lgmp total_cc edad mujer neg_latin ling (as_empsind = ssiratio ),robust 

* 1.C) Estimacion de un modelo sobreidentificado por 2SLS 
*sobreidentificado (Mas variables exogenas que endogenas )
reg lgmp as_empsind total_cc edad mujer negro ling,robust 
ivregress 2sls lgmp total_cc edad mujer neg_latin ling (as_empsind = ssiratio multlc ),robust   

*test de sobreidentificacion 
estat overid 
*test de endogeniedad
estat endogenous
* exogenidad instrumental (que no  exista relacion entre variable y el error ) 
 predict uhat,resid 

* 1.D) Seleccion de un modelo 

ivregress 2sls lgmp total_cc edad mujer neg_latin ling (as_empsind = ssiratio multlc firma ing_b   ),robust   

*test de sobreidentificacion 
estat overid 
*test de endogeniedad
estat endogenous


*2 punto 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\airfare.dta"  
 
lpassen
lfare 
ldist
ldistsq
 
reg lpassen lfare ldist ldistsq, robust  

 * 2.A  
twoway (lfit lpassen lfare) (scatter lfare lpassen)
 * 2.B
reg lpassen lfare ldist ldistsq if year ==1997
 * 2.C y  2.D 
 * Declarar la base de datos como panel de datos  
xtset id year 
xtdescribe

*operador primeras diferencias (camino largo )
* Clear variables Rezagadas atravez del tiempo
gen lpassen_1 = lpassen[_n-1]
gen lfare_1 = lfare[_n-1]
gen ldist_1 = ldist[_n-1] 
gen ldistsq_1 = ldistsq[_n-1] 
gen concen_1 = concen[_n-1] 
gen y98_1 = y98[_n-1] 
gen y99_1 = y99[_n-1] 
gen y00_1 = y00[_n-1] 

* diferencias 
gen lpassen_2 =  lpassen_1 - lpassen
gen lfare_2 =  lfare_1 - lfare
gen ldist_2 =  ldist_1 - ldist
gen ldistsq_2 =  ldistsq_1 - ldistsq
gen concen_2 = concen_1- concen
gen y98_2 = y98_1 - y00 
gen y99_2 = y99_1 -  y99 
gen y00_2 = y00_1 - y00 


*operador primeras diferencias (camino corto )
gen lpassen_3 = l.lpassen - l.lpassen
gen lfare_3 = l.lfare  -  l.lfare 
gen ldist_3 = l.ldist - l.ldist
gen ldistsq_3 = l.ldistsq - l.ldistsq


 * 2.E 
 
reg lpassen_2 lfare_2 ldist_2 ldistsq_2  y98_2  y99_2 y00_2 , nocons robust

ivregress 2sls lpassen_2   y98_2  y99_2 y00_2 (lfare_2 =  concen_2), nocons robust

ivregress 2sls lpassen_2 ldist_2 ldistsq_2  y98_2  y99_2 y00_2 (lfare_2 =  concen_2), nocons robust



 
ivregress 2sls lpassen_2  y98_2  y99_2 y00_2 (lfare_2 =  concen_2), nocons robust
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 