//******************************************************************************
//Universidad del Valle de Guatemala
//IE2023 Programación de microcontroladores
//Autor : Josué Ortíz 
//Proyecto: Prelab 1
//Idescripción
//Hardware: ATMega328P
//Created:
//******************************************************************************
//ENCABEZADO
//******************************************************************************
.include "M328PDEF.inc"

.cseg
.org 0x00
//******************************************************************************
//Configuración de la pila
//******************************************************************************
LDI R16, LOW(RAMEND)
OUT SPL, R16
LDI R17, HIGH(RAMEND)
OUT SPH, R17
//******************************************************************************


//******************************************************************************
//CONFIGURACIONES
//******************************************************************************
SETUP:
SBI DDRD, PD2 ; DEFINIENDO PD2 COMO SALIDA
SBI DDRD, PD3 ; DEFINIENDO PD3 COMO SALIDA
SBI DDRD, PD4 ; DEFINIENDO PD4 COMO SALIDA
SBI DDRD, PD5 ; DEFINIENDO PD5 COMO SALIDA
CBI PORTD, PD2 ; COLOCAR 0 EN EL PD2
CBI PORTD, PD3 ; COLOCAR 0 EN EL PD3
CBI PORTD, PD4 ; COLOCAR 0 EN EL PD4
CBI PORTD, PD5 ; COLOCAR 0 EN EL PD5
//******************************************************************************
//Loop Infinito
//******************************************************************************
LOOP:
CPI PINB, XXXXXXXX ; SE COMPARA EL BOTON DE SUMA1 PARA SABER SI FUE ACCIONADO 
BREQ XX; si se presiona el boton se manda a llamar la subrutina de sumar1
CPI PINB, XXXXXXXX ; SE COMPARA EL BOTON DE SUMA2 PARA SABER SI FUE ACCIONADO 
BREQ XX; si se presiona el boton se manda a llamar la subrutina de sumar2
CPI PINB, XXXXXXXX ; SE COMPARA EL BOTON DE SUMATOTAL PARA SABER SI FUE ACCIONADO
BREQ XX; si se presiona el boton se manda a llamar la subrutina de SUMARTOTAL
CALL SUMAR1
CALL SUMAR2
CALL SUMARTOTAL 

RJMP LOOP


//******************************************************************************
//SUB RUTINA
//******************************************************************************


DELAY:
LDI R18, 0
INC R18 ; INCREMENTAR EL VALOR DEL REGISTRO 18
CPI R18, 100
BRNE INCR18 
RET

SUMAR1: 
INC XX; SE SUMA 1 AL REGISTRO
CPI XXX, 16 ; SE COMPARA SI EL VALOR EN EL REGISTRO ES MAYOR A 15 
SBIS xxx; SE SALTA EL RET SI EL VALOR ES MAYOR A 15
RET
LDI XXX, 0; SE REINICIA EL CONTADOR
RET 

SUMAR2: 
INC XX; SE SUMA 1 AL REGISTRO
CPI XXX, 16 ; SE COMPARA SI EL VALOR EN EL REGISTRO ES MAYOR A 15
SBIS xxx; SE SALTA EL RET SI EL VALOR ES MAYOR A 15
RET
LDI XXX, 0; SE REINICIA EL CONTADOR
RET 

SUMARTOTAL:
INC XX; SE SUMA 1 AL REGISTRO
CPI XXX, 16 ; SE COMPARA SI EL VALOR EN EL REGISTRO ES MAYOR A 15
SBIS xxx; SE SALTA EL RET SI EL VALOR ES MAYOR A 15
RET
LDI XXX, 0; SE REINICIA EL CONTADOR
RET 

RESTAR1:
SUBI XXX, 1; SE RESTA 1 AL REGISTRO 
CPI XXX, -1; SE COMPARA SI EL VALOR EN EL REGISTRO ES MENOR A 0
SBIS xxx; SE SALTA EL RET SI EL VALOR ES MENOR A 0
RET
LDI XXX,5; SE LLEVA HASTA 15 EL CONTADOR
RET

RESTAR2:
SUBI XXX, 1; SE RESTA 1 AL REGISTRO 
CPI XXX, -1; SE COMPARA SI EL VALOR EN EL REGISTRO ES MENOR A 0
SBIS xxx; SE SALTA EL RET SI EL VALOR ES MENOR A 0
RET
LDI XX,15; SE LLEVA HASTA 15 EL CONTADOR
RET
 