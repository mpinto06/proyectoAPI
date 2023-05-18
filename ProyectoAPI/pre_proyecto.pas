program pre_proyecto;
uses crt;
var
x,y,z,opc: integer;
caldo: string;

procedure encabezado;
   begin
   textcolor(11);
   writeln('                    Universidad Catolica Andres Bello');
   writeln('                  Catedra : Algoritmos y Programacion I');    
   textcolor(14);
   writeln('                            Elaborado por: ');
   writeln('   Miguel Pinto, Juan Brillembourg, Cristina Carnevali, Humberto Aleman');
   writeln;
   writeln;
   end;

procedure fin_programa(accion: string);
   begin
   textcolor(12); textbackground(15);
   writeln;
   writeln;
   writeln('     Pulse cualquier tecla para ',accion,'    ');
   readkey;
   textbackground(0);
   end;

procedure solicitar_generacion;
   begin
   clrscr;
   if (caldo <> '') then
      begin
         textcolor(12);
         writeln('NOTA: Si genera un nuevo caldo, se sobreescribira el existente.');
         caldo:='';
         writeln;
         writeln;
         writeln('     Pulse cualquier tecla para continuar    ');
         readkey;
      end; 
   clrscr;
   
   repeat
      encabezado;
      textcolor(10);
      writeln('Ingrese el numero de columnas: ');
      readln(x);
      if (x < 1) or (x > 20) then
         begin
            textcolor(12);
            writeln('Error: Debe ingresar un numero del 1 al 20');
         end;
   until (x > 0) and (x <= 20);      
   clrscr;
   
   repeat
      encabezado;
      textcolor(10);
      writeln('Ingrese el numero de filas: ');
      readln(y);
      if (y < 1) or (y > 20) then
        begin
          textcolor(12);
          writeln('Error: Debe ingresar un numero del 1 al 20');
        end;
   until (y > 0) and (y <= 20);
   clrscr;
    
   repeat
      encabezado;
      textcolor(10);
      writeln('Ingrese el numero de celulas vivas (un maximo de ', (x*y), '): ');
      readln(z);           
      if (z > (x*y)) then
         begin
            textcolor(12);
            writeln('Error: El numero de celulas excede el numero de posiciones en el caldo');
         end;
      if (z < 1) then
         begin
            textcolor(12);
            writeln('Error: Debe existir al menos una celula viva');
         end;
   until (z > 0) and (z <= (x*y));  
   clrscr;
   end;

procedure generar_caldo_manual(celulas: integer);
   var
      i: integer;
      sx,sy,sz,pos: string;
   begin
      i:=0;
      while i < celulas do
         begin
            clrscr;
            encabezado;
            textcolor(10);
            writeln('Ingrese las coordenadas de esta celula. (y,x)');
            writeln('Ejemplo: "1,2" crea una celula en la segunda celda de la primera fila');
            readln(pos);
            caldo:=(caldo  + pos + '/');
            i:= i + 1;
         end;
      str(x,sx);
      str(y,sy);
      str(z,sz);
      caldo:=( sy + '.' + sx + '.' + sz + '.' + caldo);
      clrscr;
      encabezado;
      textcolor(10);
      writeln('Su caldo ha sido creado con exito!');
      writeln(caldo);
      delay(500);
   end;

procedure generar_caldo_automatico(celulas: integer);
   var
      i: integer;
      sx,sy,sz,pos,sp1,sp2: string;
   begin
      for i:=1 to celulas do
         begin
            str((random(y) + 1),sp1);
            str((random(x) + 1),sp2);
            pos:= (sp1) + ',' + (sp2);
            caldo:=(caldo  + pos + '/');  
         end;
      str(x,sx);
      str(y,sy);
      str(z,sz);
      caldo:=( sy + '.' + sx + '.' + sz + '.' + caldo);
      encabezado;
      textcolor(10);
      writeln('Su caldo ha sido creado con exito!');
      writeln(caldo);
      delay(500);
   end;  

function carga(palabra:string):string;
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
      clrscr;
   end;

Begin
   randomize;
   caldo := '';
   repeat
      carga('Cargando');
      encabezado;
      textcolor(10);
      writeln('Bienvenido al Automata Celular Alive (ACA), ingrese 1, 2 o 3 para el menu.');
      writeln;
      writeln('1. Generar Caldo de Cautivo');
      writeln('2. Mostrar Caldo de Cautivo');
      writeln('3. Modificar Caldo de Cautivo existente');
      writeln('4. Salir');
      writeln;
      readln(opc);

      case opc of
      1: begin
         solicitar_generacion; 
         repeat
            clrscr;
            encabezado;
            textcolor(10);
            writeln('Seleccione 1 o 2');
            writeln;
            writeln('1. Configuracion Manual');
            writeln('2. Configuracion Aleatoria');
            writeln;
            readln(opc);
                  
            case opc of
               1: begin
                  clrscr;
                  generar_caldo_manual(z);
                  fin_programa('regresar al menu');                  
                  end;
               2: begin
                  clrscr;
                  generar_caldo_automatico(z);
                  fin_programa('regresar al menu'); 
                  end; 
               else
                  begin
                  clrscr;
                  textcolor(12);
                  writeln('Error: Solo debe ingresar 1 o 2');
                  fin_programa('regresar');
                  end;
            end;
         until(opc = 1) or (opc = 2); 
         end;
      2: begin
         clrscr;
         if (caldo = '') then
            begin
               writeln('Actualmente no existe ningun caldo de cautivo,');
               writeln('pulse 1 en el menu principal para crearlo.');
               fin_programa('regresar al menu');
            end;
         end;
      3: begin
         clrscr;
         if (caldo = '') then
            begin
               writeln('Actualmente no existe ningun caldo de cautivo,');
               writeln('pulse 1 en el menu principal para crearlo.');
               fin_programa('regresar al menu');
            end;
         end;
      4: begin
         clrscr;
         writeln('Gracias por usar el programa.');
         fin_programa('finalizar');
         end;
      
      else
         begin
            clrscr;
            textcolor(12);
            writeln('      Error: debe ingresar numeros del 1 al 4');
            writeln;
            fin_programa('regresar al menu');
            clrscr;
         end;
      end;
   until (opc = 4);    
End.
