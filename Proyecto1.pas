program Proyecto1;

uses crt,SysUtils;

var
//Areglos
estacionesStr: array[1..4] of string;
estaciones: array[1..4] of integer;
//Menu inicial
opMenuIni: string;
//Contadores
ContAsientosDisponibles: integer;
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

begin
//Iniciar array
	estacionesStr[1]:= 'La montaña';
	estacionesStr[2]:= 'La Aguada';
	estacionesStr[3]:= 'Loma Redonda';
	estacionesStr[4]:= 'Pico Espejo';
	
//Iniciar el contador
contAsientosDisponibles:= 60;
Ganancia:= 0;

//Iniciar Variables
precio:= 0;
precioAcumulado:= 0; 

  repeat
    // Menu Inicial
    textcolor (green);
    writeln('|--------------------------------------|');
    writeln('|  Bienvenido al teleferico de Merida  |');
    writeln('|                                      |');
    writeln('|            Que desea hacer?          |');
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
        writeln('|    Ingrese su Cedula de Identidad    |');
        writeln('|                                      |');
        writeln('|--------------------------------------|');      
        readln(CI);
        ClrScr;
        //Solicitando a que estacion desea ir
        repeat
        writeln('|---------------------------------------|');
        writeln('|   Estas en la estacion Barinitas      |');
        writeln('|   Hasta que estacion quiere llegar?   |');
        writeln('|    1. La monta',char(164),'a                      |');
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
          writeln('|       Ingrese una Opcion Valida      |');
          writeln('|                                      |');
          writeln('|--------------------------------------|');   
        until((errorMenuTramos=0) and ((opMenuTramos>0) and (opMenuTramos<5)));
        //Solicitar la informacion de cuantos boletos quiere comprar y de que tipo
        repeat
          writeln('Ha selecconado la estacion ',estacionesStr[opMenuTramos],' por lo que recorrera ',opMenuTramos, ' estaciones');
          writeln('|---------------------------------------|');
          writeln('|                                       |');
          writeln('|  Que tipo de Boletos desea comprar?   |');
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
            writeln('|    Cuantos Boletos de este tipo      |');
            writeln('|            desea comprar?            |');
            writeln('|                                      |');
            writeln('|--------------------------------------|');
            readln(opMenuCantBoletosstr);
            ClrScr;
            val(opMenuCantBoletosstr, opMenuCantBoletosint, errorCantBoletos);
            if (errorCantBoletos <> 0) then
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
        writeln('')
      end;
    //Salir
    '3': 
    Break
    //Por si no ingresa una opcion correcta
    else
      begin
        ClrScr;
        writeln('Ingrese una opcion valida');
      end;
      
    end;
  until(opMenuIni='3');
  writeln(Ganancia:0:0);
end.
