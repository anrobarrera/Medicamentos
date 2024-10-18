Proceso Inventario_Medicamentos
    Definir num_medicamentos, i, CC, CC_anterior, turno_caja, seguir Como Entero;
    Definir compra Como Entero;
    Definir medicamentos Como Cadena;
    Definir cantidades Como Entero;
    Definir consulta_med Como Cadena;
    Definir consulta_medicamento_minus, medicamento_minus Como Cadena;
    Definir encontrado Como Logico;
	
    turno_caja = 1;
    num_medicamentos = 5;
    CC_anterior = 0;
    seguir = 1;
	
    Dimension medicamentos[num_medicamentos];
    Dimension cantidades[num_medicamentos];
    
    medicamentos[1] = "paracetamol";
    cantidades[1] = 50;
    medicamentos[2] = "ibuprofeno";
    cantidades[2] = 30;
    medicamentos[3] = "amoxicilina";
    cantidades[3] = 20;
    medicamentos[4] = "loratadina";
    cantidades[4] = 10;
    medicamentos[5] = "omeprazol";
    cantidades[5] = 15;
	
    Mientras seguir = 1 Hacer
        Escribir "Ingrese su número de documento sin puntos ni comas:";
        Leer CC;
		
        Si CC <= 0 Entonces
            Escribir "Error, ingrese un número de documento válido.";
        SiNo
            Escribir "Ingrese el nombre del medicamento que desea consultar:";
            Leer consulta_med;
			
            consulta_medicamento_minus = minusculas(consulta_med);
            encontrado = Falso;
			
            Para i = 1 Hasta num_medicamentos Con Paso 1
                medicamento_minus = minusculas(medicamentos[i]);
				
                Si medicamento_minus = consulta_medicamento_minus Entonces
                    Escribir "El medicamento ", medicamentos[i], " está disponible con una cantidad de: ", cantidades[i];
                    encontrado = Verdadero;
					
                    Escribir "¿Desea comprar el medicamento? 1 para SI, 2 para NO";
                    Leer compra;
					
                    Si compra = 1 Entonces
                        Si CC <> CC_anterior Entonces
                            Escribir "Compra realizada exitosamente.";
                            Escribir "Su turno de caja es: ", turno_caja;
                            turno_caja = turno_caja + 1;
                            CC_anterior = CC;
                        SiNo
                            Escribir "Compra realizada exitosamente. Ya tiene asignado el turno de caja: ", turno_caja - 1;
                        FinSi
						
                        Si cantidades[i] > 0 Entonces
                            cantidades[i] = cantidades[i] - 1;
                            Escribir "Quedan ", cantidades[i], " unidades de ", medicamentos[i];
                        SiNo
                            Escribir "Lo sentimos, no hay más unidades disponibles.";
                        FinSi
                    FinSi
					
                    Si compra = 2 Entonces
                        Escribir "Gracias por su consulta.";
                    FinSi
                FinSi
				
                Si encontrado Entonces
                    i = num_medicamentos + 1;
                FinSi
            FinPara
			
            Si NO encontrado Entonces
                Escribir "El medicamento no está disponible en este momento.";
            FinSi
        FinSi
		
        Escribir "¿Desea consultar otro medicamento? 1 para SI, 2 para NO";
        Leer seguir;
    FinMientras
FinProceso