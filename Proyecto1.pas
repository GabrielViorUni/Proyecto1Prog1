program Proyecto1;
{$codepage UTF8}
uses crt,SysUtils;

var
//Areglos
estacionesStr: array[1..4] of string;
//Menu inicial
opMenuIni: string;
//Contadores
totalAsientos: Integer;
//Datos del Usuario
name, CI: string;
//Tramos
opMenuTramos: Integer;
opMenuTramosStr: String;
errorMenuTramos: Integer;
//Cantidad de boletos comprados 1 vez
boletos: string;
opMenuCantBoletosstr: string;
opMenuCantBoletosint: integer;
opMenuTipoBoletos: string;
precioboleto: integer;
errorCantBoletos: integer;
//Ganancia 
Ganancia: real;
//Precio 1 Compra
precio: real;
precioAcumulado: real;
//Menu ventas
opMenuVentas: string;
asientosDisponibles: real;
begin
//Iniciar array
	estacionesStr[1]:= 'La montaña';
	estacionesStr[2]:= 'La Aguada';
	estacionesStr[3]:= 'Loma Redonda';
	estacionesStr[4]:= 'Pico Espejo';
	
//Iniciar el contador
Ganancia:= 0;
totalAsientos:= 60;

//Iniciar Variables
precio:= 0;
precioAcumulado:= 0; 

  repeat
    // Menu Inicial
    textcolor (green);
    writeln('|--------------------------------------|');
    writeln('|  Bienvenido al Teleférico de Mérida  |');
    writeln('|                                      |');
    writeln('|           ¿Qué desea hacer?          |');
    writeln('|    1. Comprar Boleto                 |');
    writeln('|    2. Ver estado de Ventas           |');
    writeln('|    3. Salir                          |');
    writeln('|                                      |');
    writeln('|--------------------------------------|');
    readln(opMenuIni);
    case (opMenuIni) of
    //Comprar Boleto
    '1':
      begin
      //Menu de compra
        ClrScr;
        textcolor (lightblue);
        writeln('|--------------------------------------|');
        writeln('|                                      |');
        writeln('|     Ingrese su Nombre y Apellido     |');
        writeln('|                                      |');
        writeln('|--------------------------------------|');
        readln(name);
        ClrScr;
        textcolor (lightblue);
        writeln('|--------------------------------------|');
        writeln('|                                      |');
        writeln('|    Ingrese su Cédula de Identidad    |');
        writeln('|                                      |');
        writeln('|--------------------------------------|');      
        readln(CI);
        ClrScr;
        //Solicitando a que estacion desea ir
        repeat
        writeln('|---------------------------------------|');
        writeln('|   Estas en la estacion Barinitas      |');
        writeln('|   ¿Hasta que estación quiere llegar?  |');
        writeln('|    1. La montaña                      |');
        writeln('|    2. La Aguada                       |');
        writeln('|    3. Loma Redonda                    |');
        writeln('|    4. Pico Espejo                     |');
        writeln('|                                       |');
        writeln('|---------------------------------------|');
        readln(opMenuTramosStr);
        Val(opMenuTramosStr,opMenuTramos,errorMenuTramos);
        ClrScr;
        if((errorMenuTramos<>0) or ((opMenuTramos<1) or (opMenuTramos>4))) then
          writeln('|--------------------------------------|');
          writeln('|                                      |');
          writeln('|       Ingrese una Opción Válida      |');
          writeln('|                                      |');
          writeln('|--------------------------------------|');   
        until((errorMenuTramos=0) and ((opMenuTramos>0) and (opMenuTramos<5)));
        //Solicitar la informacion de cuantos boletos quiere comprar y de que tipo
        repeat
          writeln('Ha selecconado la estación ',estacionesStr[opMenuTramos],' por lo que recorrerá ',opMenuTramos, ' estaciones');
          writeln('|---------------------------------------|');
          writeln('|                                       |');
          writeln('|  ¿Qué tipo de Boletos desea comprar?  |');
          writeln('|    1. Boleto General: 5$ por tramo    |');
          writeln('|    2. Tercera edad y niños de         |');
          writeln('|       3 a 12 años: 3$ por tramo       |');
          writeln('|    3. Niños menores de 3 años         |');
          writeln('|       exonerados sin embargo, solo    |');
          writeln('|       pueden subir hasta Loma Redonda |');
          writeln('|    4. No deseo comprar mas            |');
          writeln('|                                       |');
          writeln('|---------------------------------------|');
          readln(opMenuTipoBoletos);
          ClrScr;
          case (opMenuTipoBoletos) of
          '1':
          precioboleto:= 5;
          '2': 
          precioboleto:= 3;
          '3':
          precioboleto:= 0;
          '4':
          break;
          end;
            repeat
                  writeln('|--------------------------------------|');
                  writeln('|                                      |');
                  writeln('|    ¿Cuántos Boletos de este tipo     |');
                  writeln('|            desea comprar?            |');
                  writeln('|                                      |');
                  writeln('|--------------------------------------|');
                  readln(opMenuCantBoletosstr);
                ClrScr;
                val(opMenuCantBoletosstr, opMenuCantBoletosint, errorCantBoletos);
                if (errorCantBoletos <> 0) then
              repeat     
                  begin
                    writeln('|--------------------------------------|');
                    writeln('|                                      |');
                    writeln('|     Ingrese una Cantidad Valida      |');
                    writeln('|                                      |');
                    writeln('|--------------------------------------|');   
                  end;
              until(errorCantBoletos=0);
              precio:= opMenuCantBoletosint*opMenuTramos*precioboleto;
              precioAcumulado:= precioAcumulado+precio;
              if (opMenuCantBoletosint > totalAsientos) then
                begin
                  asientosDisponibles:= totalAsientos - opMenuCantBoletosint;
                  writeln ('La cantidad de asientos solicitados excede el número de asientos disponibles');
                end;
            until (opMenuCantBoletosint < asientosDisponibles);
          //ACA FALTA DE TODO UN POCO, FALTA SUMAR EL PRECIO, AGG UNA CONDICION DE QUE SI LA CANTIDAD DE ASIENTOS A COMPRAR ES 
          //MAYOR A A LOS DISPONIBLES DE ERROR, FALTA SUMAR EL DINERO Y PEDIR QUE ESTACION DESEA IR, CUALQUIER DUDA ME ESCRIBES
        until (opMenuTipoBoletos='4');
        writeln('El total a pagar es de ',precioAcumulado:0:0,'$');
        Ganancia:= Ganancia+precioAcumulado;
        precioAcumulado:= 0;
      end;
    //Ver estado de ventas
    '2':
      begin
        repeat
            textcolor (lightmagenta);
            writeln('|---------------------------------------|');
            writeln('|                                       |');
            writeln('|            Estado de ventas           |');
            writeln('|    ¿Qué desea ver?                    |');
            writeln('|    1. Cantidad de boletos vendidos    |');
            writeln('|    2. Asientos disponibles            |');
            writeln('|    3. Reporte del día                 |');
            writeln('|    4. Volver a menú inicial           |');
            writeln('|---------------------------------------|');
            readln(opMenuVentas);
              case (opMenuVentas) of
                '1':
                begin
                  textcolor (lightblue);
                  writeln('|--------------------------------------|');
                  writeln('|                                      |');
                  writeln('|   La cantidad de boletos vendidos    |');
                  writeln('|   Es:                                |');
                  writeln('|                                      |');
                  writeln('|--------------------------------------|');
                end;
                '2':
                begin
                  textcolor (lightblue);
                  writeln('|--------------------------------------|');
                  writeln('|                                      |');
                  writeln('|  La cantidad de asientos disponibles |');
                  writeln('|  Es:                                 |');
                  writeln('|       ', asientosDisponibles:0:0,'                 |');
                  writeln('|--------------------------------------|');
                end; 
                '3':
                begin
                  textcolor (lightblue);
                  writeln('|--------------------------------------|');
                  writeln('|                                      |');
                  writeln('|  La ganancia del día es              |');
                  writeln('|  Es:                                 |');
                  writeln('|       ', Ganancia:0:0, '$','                            |');
                  writeln('|--------------------------------------|');
                end; 
              end;  
        until (opMenuVentas= '4');      
      end;
    //Salir
    '3': 
    Break
    //Por si no ingresa una opcion correcta
    else
      begin
        ClrScr;
        writeln('Ingrese una opción valida');
      end;
      
    end;
  until(opMenuIni='3');
  writeln(Ganancia:0:0);
end.
