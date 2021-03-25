*Microeconomia aplicada 
* 23 de marzo del 2021 
* Panel de Datos - Microeconomia aplicada (Panel de datos)   
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\PSID.dta"
* declarar base de datos como panel de datos 
xtset id t

xtline lsalario if id <=20
xtline lsalario if id <=20,overlay 
xtline lsalario if id <=20,overlay legend(off)
xtline semanas if id <= 20,overlay legend(off)
xtline semanas if id <= 20,overlay legend(off) saving(lsalario,replace)
xtline semanas if id <= 20,overlay legend(off) saving(semanas,replace)

graph combine lsalario.gph semanas.gph

* Graficos de dispersion general 
 
graph twoway (scatter lsalario exp) (qfit lsalario exp) (lowess lsalario exp)

* grafico variacion within 
- 
preserve 
xtdata,fe   

graph twoway (scatter lsalario exp) (qfit lsalario exp) (lowess lsalario exp) plotregion(style(none)title("dispersion general") 


/////////////////////////////////////////////////////////////////////////////////////////////
*Segunda parte Manejo de informacion datos panel 
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\cigarrillos_0.dta" 
*Formato ancho(no sirve)
list, clean
*cambiar de ancho a largo 
reshape long 
list, clean
list in 1/6, sepby(state)
*cambiar de largo a ancho 
reshape wide 

////////////////////////////////////////////////////////////////////////////////////////////
*tercera parte combinacion de archivos de datos 
append 
observaciones 
merge 

*1.combinancion uno a uno 
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\A1.DTA" 
summarize
describe 
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\A2.DTA"
summarize
describe 
*unir 
use "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\A1.DTA" 
* unir A1 Con A2 
merge 1:1 id using "C:\Users\jhona\Desktop\Brayan\Github\Microeconomia-Aplicada\BASES DE DATOS\A2.DTA" 
* Grabar datos
* crear Nueva base de datos 
save Encuesta.dta 





















