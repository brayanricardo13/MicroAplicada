*Probabilidad lineal 
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MROZ_1.DTA"
reg merc_lab nwifeinc educ  exper exper2 edad hijos1 hijos2, robust
*Probit
probit merc_lab nwifeinc educ exper exper2 edad hijos1 hijos2, robust
estat classification

*Probit-Efectos Parciales 
*27/05/2021
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\MROZ_1.DTA"

reg merc_lab educ exper, robust 
ta exper
probit merc_lab educ exper, robust 
egen m_exper = mean(exper) 
egen m_educ = mean(educ) 

gen mediaxbeta = _b[_cons]+_b[educ]*m_educ+_b[exper]* m_exper
gen PEA=normalden(mediaxbeta)*_b[educ]

su PEA
*Comando stata eFectos marginales 
mfx, varlist(educ)

*********************************************
*ponderado 
gen APE = normalden(xbeta)*_b[educ]
***************************************************************************************************
*probit-Continua-discreta
use "C:\Users\jhona\Desktop\Brayan\Github\MicroAplicada\BASES DE DATOS\PSID.dta"
reg ind_man exp sindicato, robust
probit ind_man exp sindicato, robust
*Paso a mano (parcial_promedio)
egen m_exp = mean(exp)
/////////////////////////////////////////////////////////////////////////////////////////////////// 
gen xbeta1 = _b[_cons]+_b[exp]*m_exp+_b[sindicato]* 1
gen xbeta0 = _b[_cons]+_b[exp]*m_exp+_b[sindicato]* 0

gen P1 = normal(xbeta1)
gen P2 = normal(xbeta0)
gen PEA = P1- P2
su PEA
*Comando stata eFectos marginales 
mfx, varlist(sindicato)

///////////////////////////////////////////////////////////////////////////////
*promedio 
gen Xb1 =_b[_cons]+_b[exp]*exp+_b[sindicato]*1 
gen Xb2 =_b[_cons]+_b[exp]*exp+_b[sindicato]*0

gen pp1 =normal(Xb1 )
gen pp2 =normal(Xb2 )

gen APE = pp1- pp2
su APE 




