*clase 25 de marzo Microaplicada 
*unir datos panel 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A1.DTA"
resumir
describir 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A2.DTA"
resumir
describir 
* unir 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A1.DTA"
* unir A1 Con A2 
merge id 1:1 using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A2.DTA"
* Datos de Grabar
* crear Nueva base de datos 
guardar Encuesta.dta 

///////////////////////////////////////////////////////////////////////////////////
*clase 25 de marzo 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A1.DTA"

merge 1:1 id using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A3.DTA"
*Balancear 
keep  if _merge ==2
*eliminar variable
drop ciudad 

* one-to-many (jerarquico)
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\B1.DTA", clear

sort id_estudiante  

use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\B2.DTA" 

merge 1:m id_universidad "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\B1.DTA" 

merge 1:1 id using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A3.DTA"


//////////////////////////////////////////////////////////////////////////////////
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\A1.DTA"
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\C1.DTA"
append using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\C1.DTA"

//////////////////////////////////////////////////////////////////////////////////
















