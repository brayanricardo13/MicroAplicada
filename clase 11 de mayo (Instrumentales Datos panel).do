*Microeconomia Aplicada 11/05/2021 
*variables Instrumentales panel de datos 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Entrenamiento.dta"
tsset emp_cod periodo 
*primera diferencia 
gen fd_ldesp = ldesperdicio - L.ldesperdicio
gen fd_hemp = hrsemp - L.hrsemp
gen fd_sbsd = subsidio - L.subsidio
reg fd_ldesp fd_hemp  if periodo <- 1988
ivregress 2sls fd_ldesp (fd_ldesp =fd_sbsd )  if periodo <- 1988

xtivreg 
