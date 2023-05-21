program pre_proyecto;
uses crt;
var
   caldo: string;

function MinMax(min, max, seleccion:integer): boolean;
   // Verifica si el usuario ingreso un numero dentro del rango dado
   begin
      MinMax:= True;
      if ((seleccion < min) or (seleccion > max)) then
         begin
            MinMax:= False;
            textcolor(lightred);
            writeln('ERROR: Por favor ingrese un numero entre ',min,' y ',max);
            writeln();
            readln();
            textcolor(lightgreen);
         end;
   end;

function IntToString(int: integer): string;
   // Convierte enteros a una string
   begin
      str(int, IntToString);
   end;
   
function StringToInt(str: string): integer;
   // Convierte strings a una variable integer
   begin
      val(str, StringToInt);
   end;

procedure Encabezado;
   // El encabezado del programa
   begin
   textcolor(lightcyan);
   writeln('                    Universidad Catolica Andres Bello');
   writeln('                  Catedra : Algoritmos y Programacion I');    
   textcolor(yellow);
   writeln('                            Elaborado por: ');
   writeln('   Humberto Aleman, Juan Brillembourg, Cristina Carnevali, Miguel Pinto ');
   writeln;
   writeln;
   end;

procedure Carga(palabra:string);
   // Animacion que muestra una letra a la vez
   var
      i,j:integer;
   begin
      for i:=1 to length(palabra) do
      begin
         write(palabra[i]);
         delay(100);
      end;
      j:=0;
      repeat
         write('.');
         delay(120);
         j:=(j+1);
      until (j=3);
      writeln();
      delay(120);
   end;
   

   
procedure TerminarPrograma(accion: string);
   begin
      textcolor(darkgray);
      writeln;
      writeln;
      writeln('     Pulse cualquier tecla para ' + accion + '    ');
      readkey;
   end;

function SolicitarFilas(): integer;
   // Solicita al usuario la cantidad de filas del caldo
   begin
      repeat
         clrscr();
         Encabezado();
         textcolor(lightgreen); write('Ingrese el numero de filas: ');
         textcolor(yellow); readln(SolicitarFilas);
      until MinMax(1, 20, SolicitarFilas);      
      clrscr;
   end;

function SolicitarColumnas(): integer;
   // Solicita al usuario la cantidad de columnas del caldo
   begin
      repeat
         clrscr();
         Encabezado();
         textcolor(lightgreen); write('Ingrese el numero de columnas: ');
         textcolor(yellow); readln(SolicitarColumnas);
      until MinMax(1, 20, SolicitarColumnas);      
      clrscr;
   end;

function SolicitarCelulasVivas(x, y: integer): integer;
   // Solicita al usuario la cantidad de celulas vivas del caldo
   begin
      repeat
         clrscr();
         Encabezado();
         textcolor(lightgreen); write('Ingrese el numero de celulas vivas (un maximo de ', (x*y), '): ');
         textcolor(yellow); readln(SolicitarCelulasVivas);           
      until MinMax(0, (x*y), SolicitarCelulasVivas);      
      clrscr;
   end;

procedure SolicitarDatos(var columnas, filas, celulas: integer);
   // Solicita al usuario todos los datos para la generacion del caldo
   begin 
      columnas := SolicitarColumnas();
      filas := SolicitarFilas();
      celulas  := SolicitarCelulasVivas(filas, columnas);
   end;

function PedirCoordenadas(columnas, filas: integer): string;
   // Solicita al usuario las coordenadas de las celulas en la generacion manual
   var
      x,y: integer;
   begin
      repeat
         clrscr();
         Encabezado();
         textcolor(lightgreen); write('Ingrese la coordenada X (Posicion Horizontal) de la celula a colocar: ');
         textcolor(yellow); readln(x);
      until((MinMax(1, filas, x)));
      
      repeat
         clrscr();
         Encabezado();
         textcolor(lightgreen); write('Ingrese la coordenada Y (Posicion Vertical) de la celula a colocar: ');
         textcolor(yellow); readln(y);
      until((MinMax(1, columnas, y)));
      
      PedirCoordenadas := IntToString(x) + ',' + IntToString(y);
   end;

function PosicionDespuesDeDivisores(slashes: integer): integer;
   // Cuenta la posicion de los separadores "/" en el string del caldo
   begin
      PosicionDespuesDeDivisores := 1;
      while (slashes > 0) do
         begin
            if (caldo[PosicionDespuesDeDivisores] = '/') then
               begin
                  slashes := (slashes - 1);
               end;
            PosicionDespuesDeDivisores := (PosicionDespuesDeDivisores + 1);
         end;
   end;

// ANCHOR ObtenerNumeroDivisor
function ObtenerNumeroDivisor(divisor: integer): string;
   // Devuelve el valor despues del divisor "/" en el caldo
   var
      i: integer;
   begin
      i := PosicionDespuesDeDivisores(divisor);
      ObtenerNumeroDivisor := '';
      repeat
         ObtenerNumeroDivisor := (ObtenerNumeroDivisor + caldo[i]);
         i := (i + 1);
      until(caldo[i] = '/');
   end;

function VerificarCoordenadas(coordenadas: string): boolean;
   // Verifica que las coordenadas existan en el caldo
   var
      i, cantidadCelulas: integer;
   begin
      VerificarCoordenadas := True;

      cantidadCelulas := StringToInt(ObtenerNumeroDivisor(2));

      for i := 3 to (cantidadCelulas + 2) do
         begin
            if (coordenadas = ObtenerNumeroDivisor(i)) then
               begin
                  VerificarCoordenadas := False;
               end;
         end;
   end;

procedure EliminarCoordenadas(coordenadas: string);
   // Verifica que las coordenadas existan en el caldo
   var
      caldoTemporal: string;
      i, cantidadCelulas: integer;
   begin
      cantidadCelulas := StringToInt(ObtenerNumeroDivisor(2));
      caldoTemporal := ObtenerNumeroDivisor(0) + '/' + ObtenerNumeroDivisor(1) + '/' + ObtenerNumeroDivisor(2) + '/';

      for i := 3 to (cantidadCelulas + 2) do
         begin
            if (coordenadas <> ObtenerNumeroDivisor(i)) then
               begin
                  caldoTemporal := (caldoTemporal + ObtenerNumeroDivisor(i) + '/');
               end;
         end;

      caldo := caldoTemporal;
   end;

procedure MostrarCelulas();
   // Dibuja las celulas en pantalla
   var
      i, cantidadCelulas: integer;
   begin
      cantidadCelulas := StringToInt(ObtenerNumeroDivisor(2));
      for i := 3 to (cantidadCelulas + 2) do
         begin
               delay(150);
               textcolor(lightgreen); write('Celula #', i - 2); 
               textcolor(darkgray); write(' | ');
               textcolor(lightcyan); writeln('Posicion: ', ObtenerNumeroDivisor(i));
         end;
   end;

procedure ExisteCaldo();
   // Ve si hay un caldo existente
   begin
      if (caldo <> '') then
         begin
            clrscr();
            Encabezado();
            textcolor(lightred);
            writeln();
            writeln('NOTA: Si genera un nuevo caldo, se sobreescribira el existente.');
            writeln;
            writeln;
            writeln('     Pulse cualquier tecla para continuar    ');
            readkey;
         end; 
      clrscr;
   end;

procedure GeneracionCaldoManual();
   // Proceso de la generacion del caldo manual
   var
      i, columnas, filas, celulas: integer;
      coordenadas: string;
   begin
      caldo := ''; filas := 0; columnas := 0; celulas := 0;

      SolicitarDatos(columnas, filas, celulas);
      caldo := (caldo + IntToString(columnas) + '/');
      caldo := (caldo + IntToString(filas) + '/');
      caldo := (caldo + IntToString(celulas) + '/');
      
      i := celulas;
      
      repeat
         clrscr;
         Encabezado;
         textcolor(lightgreen);
         coordenadas := PedirCoordenadas(filas, columnas);
         if (VerificarCoordenadas(coordenadas)) then
            begin
               caldo := (caldo + coordenadas + '/');
               i := i - 1;
            end
            else
               begin
                  textcolor(lightred);
                  writeln('Las coordenadas ingresadas ya se encuentran en el caldo');
                  readkey();
               end;
      until(i <= 0);

      clrscr();
      Encabezado;
      delay(300);
      textcolor(lightgreen); writeln('Su caldo ha sido creado con exito!');
      delay(300);
      textcolor(lightcyan); writeln('Caldo: ', caldo);
   end;

// ANCHOR GeneracionCaldoAutomatico
procedure GenerarCaldoAutomatico();
   // Proceso de la generacion del caldo automatico
   var
      i, columnas, filas, celulas: integer;
      coordenadas: string;
   begin
      caldo := ''; filas := 0; columnas := 0; celulas := 0;

      SolicitarDatos(columnas, filas, celulas);
      caldo := (caldo + IntToString(columnas) + '/');
      caldo := (caldo + IntToString(filas) + '/');
      caldo := (caldo + IntToString(celulas) + '/');

      i := celulas;

      repeat
         begin
            coordenadas := (IntToString((random(columnas) + 1)) + ',' + IntToString((random(filas) + 1)));
            if (VerificarCoordenadas(coordenadas)) then
               begin
                  caldo := (caldo + coordenadas + '/');
                  i := i - 1;
               end;
         end;
      until(i <= 0);

      clrscr();
      Encabezado;
      delay(300);
      textcolor(lightgreen); writeln('Su caldo ha sido creado con exito!');
      delay(300);
      textcolor(lightcyan); writeln('Caldo: ', caldo);
   end;  

// ANCHOR MenuGeneracion
procedure MenuGeneracion();
   // Menu para escojer las opciones de la generacion
   var
      seleccion: integer;
   begin
      repeat
         clrscr;
         Encabezado();
         textcolor(lightgreen);
         writeln('Seleccione una opcion:');
         writeln();
         delay(250); writeln('1. Configuracion Manual');
         delay(250); writeln('2. Configuracion Aleatoria');
         delay(250); writeln('3. Salir al menu principal');
         writeln();
         textcolor(yellow);
         readln(seleccion);

         case seleccion of
            1: begin
               clrscr();
               GeneracionCaldoManual();
               TerminarPrograma('regresar al menu');                  
               end;
            2: begin
               clrscr();
               GenerarCaldoAutomatico();
               TerminarPrograma('regresar al menu'); 
               end;
         end;
      until(MinMax(1, 3, seleccion)); 
   end;
   
// ANCHOR MostrarCaldo
procedure MostrarCaldo();
   // Dibuja el caldo en pantalla
   var
      i, x, y, total: integer;
      posicion: string;
   begin 
      x := StringToInt(ObtenerNumeroDivisor(0));
      y := StringToInt(ObtenerNumeroDivisor(1));
      total := (x * y);

      for i := 1 to total do
         begin
            if (((i - 1) mod x = 0) or (i = 1)) then
               begin
                  writeln();
                  delay(75);
               end
               else
                  begin

                     textcolor(lightgreen); write('|');
                  end;

            posicion := (IntToString(((i - 1) mod x) + 1) + ',' + IntToString(((i - 1) div x) + 1));
            if (VerificarCoordenadas(posicion)) then
               begin
                  textcolor(darkgray); write('-');
               end 
               else
                  begin
                     textcolor(lightcyan); write('o');
                  end;
         end;
         writeln();
         writeln();
   end;

// ANCHOR MostrarInformacionCaldo
procedure MostrarInformacionCaldo();
   // Muestra la informacion del caldo
   begin 
      delay(200);
      textcolor(lightgreen); write('Columnas: '); 
      textcolor(lightcyan); writeln(ObtenerNumeroDivisor(0));
      delay(200);
      textcolor(lightgreen); write('Filas: '); 
      textcolor(lightcyan); writeln(ObtenerNumeroDivisor(1));
      delay(200);
      textcolor(lightgreen); write('Celulas: '); 
      textcolor(lightcyan); writeln(ObtenerNumeroDivisor(2));

      writeln();
      MostrarCelulas();
      writeln();

      textcolor(lightgreen); write('Caldo: ');
      textcolor(lightcyan); writeln(caldo);
   end;

procedure CambiarValor (divisor: integer; valor: string);
   var
      caldoTemporal: string;
      i: integer;
   begin
      caldoTemporal := '';
      for i := 1 to length(caldo) do 
         begin
            if (caldo[i] = '/') then
               begin
                  divisor := (divisor - 1);
               end;

            if ((divisor = 0) and (caldo[i] = '/')) then
               begin
                  caldoTemporal := (caldoTemporal + '/' + valor);
               end;
            if (divisor <> 0) then
               begin
                  caldoTemporal := (caldoTemporal + caldo[i]);
               end;
         end;
      caldo := caldoTemporal;
   end;

// ANCHOR Agregar Celula
procedure AgregarCelula(posicion: string);
   begin
      CambiarValor(2, IntToString(StringToInt(ObtenerNumeroDivisor(2)) + 1));
      caldo := caldo + posicion + '/';
   end;

procedure RemoverCelula(posicion: string);
   begin
      EliminarCoordenadas(posicion);
      CambiarValor(2, IntToString(StringToInt(ObtenerNumeroDivisor(2)) - 1));
   end;

procedure ModificarCaldo();
   // Permite el usuario modificar una posicion de el caldo
   var
      columna, fila, seleccion: integer;
      posicion: string;
   begin
      repeat
         textcolor(lightgreen); write('Seleccione la posicion X a modificar: ');
         textcolor(yellow); readln(columna);
      until(MinMax(1, StringToInt(ObtenerNumeroDivisor(0)), columna));

      repeat
         textcolor(lightgreen); write('Seleccione la posicion Y a modificar: ');
         textcolor(yellow); readln(fila);
      until(MinMax(1, StringToInt(ObtenerNumeroDivisor(1)), fila));

      posicion := (IntToString(columna) + ',' + IntToString(fila));
      
      if (VerificarCoordenadas(posicion)) then
         begin
            repeat
               writeln();
               textcolor(lightgreen); writeln('Desea convertir este espacio en una celula viva? (0: No | 1: Si)');
               writeln();
               textcolor(yellow); readln(seleccion);
            until (MinMax(0, 1, seleccion));
            if (seleccion = 1) then
               begin
                  AgregarCelula(posicion);
               end;
         end
         else
            begin
               repeat
                  writeln();
                  textcolor(lightgreen); writeln('Desea convertir este espacio en una celula muerta? (0: No | 1: Si)');
                  writeln();
                  textcolor(yellow); readln(seleccion);
               until (MinMax(0, 1, seleccion));
               if (seleccion = 1) then
                  begin
                     RemoverCelula(posicion);
                  end;
            end;
   end;

procedure MenuModificacion();
   var
      seleccion: integer;
   begin
      repeat
         repeat
            clrscr(); Encabezado();
            MostrarCaldo();
            textcolor(lightgreen);
            delay(200); writeln('Modificacion del Caldo');
            writeln();
            delay(200); writeln('1. Modificar caldo');
            delay(200); writeln('2. Regresar al menu principal');
            writeln();
            textcolor(yellow); readln(seleccion);
         until(MinMax(1, 2, seleccion));

         if (seleccion = 1) then
            begin
               clrscr();
               Encabezado();
               MostrarCaldo();
               ModificarCaldo();
               
               clrscr(); Encabezado();
               MostrarCaldo();
               MostrarInformacionCaldo();
               writeln();
               TerminarPrograma('continuar');
            end;
      until(seleccion = 2);
   end;

procedure MenuPrincipal();
   var
      seleccion: integer;
   begin
      repeat

         clrscr();
         Encabezado();
         textcolor(lightgreen);
         delay(200); writeln('Bienvenido al Automata Celular Alive (ACA), ingrese 1, 2 o 3 para el menu.');
         writeln;
         delay(200); writeln('1. Generar Caldo de Cultivo');
         delay(200); writeln('2. Mostrar Caldo de Cultivo');
         delay(200); writeln('3. Modificar Caldo de Cultivo existente');
         delay(200); writeln('4. Salir');
         writeln;

         readln(seleccion);

         case seleccion of
            1: begin
               ExisteCaldo(); 
               MenuGeneracion();
               end;
            2: begin
               clrscr();
               Encabezado();
               if (caldo = '') then
                  begin
                     textcolor(lightred);
                     writeln('Actualmente no existe ningun caldo de cautivo.');
                     writeln('Pulse 1 en el menu principal para crearlo.');
                     TerminarPrograma('regresar al menu principal');
                  end
                  else
                     begin
                        MostrarCaldo();
                        MostrarInformacionCaldo();
                        TerminarPrograma('regresar al menu principal');
                     end;
               end;
            3: begin
               clrscr;
               if (caldo = '') then
                  begin
                     Encabezado();
                     textcolor(lightred);
                     writeln('Actualmente no existe ningun caldo de cautivo.');
                     writeln('Pulse 1 en el menu principal para crearlo.');
                     TerminarPrograma('regresar al menu principal');
                  end
                  else
                     begin
                        MenuModificacion();
                     end;
               end;
            4: begin
               clrscr();
               Encabezado();
               writeln('Gracias por usar el programa.');
               TerminarPrograma('finalizar');
               end;
            else
               begin
                  clrscr;
                  textcolor(lightred);
                  writeln('      Error: debe ingresar numeros del 1 al 4');
                  writeln;
                  TerminarPrograma('regresar al menu');
                  clrscr;
               end;
            end;
      until (seleccion = 4);
   end;

Begin
   randomize;
   caldo := '';

   clrscr();
   Encabezado();
   textcolor(lightgreen); Carga('Cargando');

   MenuPrincipal();
End.