 use "C:\Users\jhona\Downloads\Vivienda_VC.dta"
 *Clase Microeconomia aplicada 23/02/2021 
 * taller variables Dummy
 
regress aprobado blanco
* Incluimos variables control
regress aprobado blanco gst_prop obl_prop crd_prc desemp hombre casado dep educ otro_sol pas_jud centrales ret_ct1 ret_ct2 rural 
 * Se crea una variable que muestre la intereccion de la raza con 
 gen raza_obl_prop = blanco* obl_prop 
 
 regress aprobado blanco gst_prop obl_prop crd_prc desemp hombre casado dep educ otro_sol pas_jud centrales ret_ct1 ret_ct2 rural raza_obl_prop
 
 
 * QUIZ
 regress aprobado blanco gst_prop obl_prop crd_prc desemp hombre casado dep educ otro_sol pas_jud centrales ret_ct1 ret_ct2 rural , robust