*Taller de variables instrumentales y ecuaciones simultaneas  
*18 de mayo de 2021 III Corte  
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MEPS.dta"
reg lgmp as_empsind total_cc edad mujer negro ling
reg lgmp as_empsind total_cc edad mujer negro ling,robust 
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
graph matrix as_empsind ssiratio  ing_b  firma multlc

* 1.B) Estimacion de un modelo exactamnete identificado por lV  

* 1.C) Estimacion de un modelo sobreidentificado por 2SLS 

* 1.D) Seleccion de un modelo 


 use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\airfare.dta"  
 
reg lpassen lfare ldist ldistsq 


 
 
 