* Econometria Clase 19 de abril 2021 
*creamos datos aleatorios 
set obs 1000
*serie de tiempo 
generate t=1+_n-1
tsset t 
*creamos el termino de errror 
generate vy=rnormal(0,1) 
generate vx=rnormal(0,1)
*Creamos a y, digamos que su valor inicial es 10 
generate y=10 
replace y=l.y+vy in 2/1000
tsline y

*Creamos a x, digamos que su valor inicial es 10 
generate x=8
replace x=l.x+vx in 2/1000
tsline x

tsline y x 
twoway (scatter y x )

*Vamos hacer una prueba de raiz unitaria a y 
regress d.y l.y, noconst
