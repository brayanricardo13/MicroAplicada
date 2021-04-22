*Microeconomia Aplicada 18/04/2021
*Gran encuesta integrada de hogares 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Cabecera - Características generales (Personas).dta"

append using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Resto - Caracteristicas generales (Personas).dta"

joinby DIRECTORIO ORDEN HOGAR using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Cabecera - Desocupados.dta", update unmatched(both) _merge(_merge1)

joinby DIRECTORIO ORDEN HOGAR using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Resto - Desocupados.dta", update unmatched(both) _merge(_merge2)

joinby DIRECTORIO ORDEN HOGAR using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Cabecera - Ocupados.dta", update unmatched(both) _merge(_merge3)

joinby DIRECTORIO ORDEN HOGAR using "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Gran Encuesta integral de hogares (GEIH)\Febrero 2021.dta\Resto - Ocupados.dta", update unmatched(both) _merge(_merge4)

sum P6040
gen GE=10*int(P6040/10)
label var GE "Grupos etarios: 10 años"
label define RGE 0 "0-10" 10 "11-20" 20 "21-30" 30 "31-40"  40 "41-50" 50 "51-60" 60 "61-70" 70 "71-80" 80 "81-90" 90 "91-100" 100 "101-110"
label values GE RGE
egen PT=sum(fex_c_2011)
egen PTGE=sum(fex_c_2011), by(GE P6020) 
gen HOMBRE=-100*PTGE/PT if P6020==1
gen MUJER=100*PTGE/PT if P6020==2
gen CERO=0
twoway (bar HOMBRE GE, horizontal barwidth(5)) (bar MUJER GE, horizontal barwidth(5)) (scatter GE CERO, msymbol(i) mlabel(GE) mlabcolor(black))



