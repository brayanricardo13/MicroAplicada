* Microeconomia Aplicada 
* Clase 2 de marzo 2021
* // Datos de panel  //
* Efectos fijos 
*Datos de panel en dos periodos

use "C:\Users\jhona\Downloads\Entrenamiento.dta"
*Declarar base como panel de datos
tsset emp_cod periodo
* Minimos cuadrados ordinarios 
reg ldesperdicio subsidio lventas lempleados y88 y89  

* Estimacion Efectos fijos  
xtreg ldesperdicio subsidio lventas lempleados y88 y89 , fe 

* Estimacion con Subsidio rezagado un periodo 
xtreg ldesperdicio subsidio subsidio_1 lventas lempleados y88 y89 , fe 

*Estimacion Manual Efectos fijos 
* organizar 
sort emp_cod
* 
by emp_cod : egen media_ldsp = mean(ldesperdicio) 

gen wt_dsp = ldesperdicio - media_ldsp

by  emp_cod  : egen media_sub = mean(subsidio)

gen wt_dsp = subsidio - media_sub 

by  emp_cod  : egen media_emp = mean(lempleados)

gen wt_dsp = lempleados - media_emp






  