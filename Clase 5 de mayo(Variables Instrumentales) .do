*Microeconomia Aplicada 05/05/2021 
*variables Instrumentales  
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\Salario2.DTA"
reg lsalario educ exper antiguedad ec sur urbano negro 
*incluir variable coeficiente intelectual  
 reg lsalario educ IQ exper antiguedad ec sur urbano negro 
 *Instrumentalizar IQ utilizando una proxy de la habilidad que es KWW 
 ivregress 2sls lsalario educ exper antiguedad ec sur urbano negro (IQ = KWW)
 
*prueba de restricciones de sobre identificacion                                                                   
 use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MROZ_1.DTA"
 reg lsalario educ exper exper2 
 ivregress 2sls lsalario exper exper2 (educ = educ_p educ_m) 
 
 *vamos a calcular la (relacion intrumental) y exgonedidad instrumental 
 *1) test de relavacia instrumental (que exista correlacion entre la variable y el instrumento)
 *2) exogenidad instrumental(que no  exista relacion entre variable y el error ) 
 *3) test de endogeniedad(que no exista relacion entre instrumento y el error )
 //////////////////////////////////////////////////////////////////////////////////
 *calcular el residuo 
 predict uhat,resid 
 regress uhat exper exper2 educ_p educ_m 
 gen rsq = e(r2)
 su rsq
 gen n_rsq =428*rsq 
 su n_rsq
 *Estadistico de sargan   
 estat overid 
 * si tengo sostpechas de heterocedansticidad hansen 
  ivregress 2sls lsalario exper exper2 (educ = educ_p educ_m) , robust 
   estat overid 
   
*test endogeniedad 

 *forma manual 
   ivregress 2sls lsalario exper exper2 (educ = educ_p educ_m) 
   *variables dummy 
   gen fullsample =e(sample)
   
   reg educ exper exper2 educ_p educ_m if fullsample == 1 
   
  predict uhat_red,resid   

reg lsalario educ exper exper2 uhat_red
   
*p<0.1 significativo 10% 
*p<0.05 significativo 5%    
*p<0.01 significativo 1% 
   
  *rechazo la hipotesis nula la variable es endogena al 10% 
 *durwin   
  estat endog
  
  

   
   
   
  
  
  