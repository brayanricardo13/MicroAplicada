*clase 18/02/2021
use "C:\Users\jhona\Downloads\KIELMC.dta"
 reg rprice nearinc if year ==1981
 
su rprice

*vamos a estimar otro año 
reg rprice nearinc if year ==1978

*Estimador de diferencias en diferencias 
 -30688.27-(-18824.37)
 -11863.4
 *estimador DID
reg rprice nearinc y81 y81nrinc 
*importante el coeficiente de y81nrinc 
 *Experimentos naturales (cuasiexperimentos)
 
 clear 
 
*Datos de panel en dos periodos
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Entrenamiento.dta"

reg ldesperdicio subsidio lventas lempleados if periodo ==1988

*Eliminacion de sesgos

//**Eliminar efecto fijo**//
//**Declarar panel de datos**//

tsset emp_cod periodo

//**Generamos las primeras diferencias- FD**//
operador primeras diferencias 
gen difl_desp = ldesperdicio - l.ldesperdicio
gen difl_sub = subsidio - l.subsidio
gen difl_vts = lventas - l.ventas
gen difl_emp = lempleados - l.empleados
gen difl_y88 = y88 - l.y88

reg difl_desp difl_sub difl_vts difl_emp difl_y88








