program pre_proyecto;

uses crt;
var
x,y,opc: integer;
caldo: string;

procedure encabezado;
  begin
    textcolor(11);
    writeln('                    Universidad Catolica Andres Bello');
    writeln('                  Materia : Algoritmos y Programacion I');
    textcolor(14);
    writeln('                            Elaborado por: ');
    writeln('      Miguel Pinto, Juan Brillembourg, Cristina Carnevali, Humberto Aleman');
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

procedure generar_caldo;
  begin
  {TODO: terminar este procedimiento}
  end;

procedure cargando;
  begin
    textcolor(12);
    delay(120);
    write('.');
    delay(120);
    write('.');
    delay(120);
    write('.');
    delay(120);
    write('c');
    delay(120);
    write('a');
    delay(120);
    write('r');
    delay(120);
    write('g');
    delay(120);
    write('a');
    delay(120);
    write('n');
    delay(120);
    write('d');
    delay(120);
    write('o');
    delay(120);
    write('.');
    delay(120);
    write('.');
    delay(120);
    write('.');
    clrscr;
  end;

Begin
  caldo := '';
  repeat
    cargando;
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
      1:
        begin
          repeat
            clrscr;
            if (caldo <> '') then
              begin
                textcolor(12);
                writeln('NOTA: Si genera un nuevo caldo, se sobreescribira al existente.');
                writeln;
                writeln;
              end;
              
            textcolor(10);
            writeln('Seleccione 1, 2 o 3 para las diferentes opciones');
            writeln;
            writeln('1. Configuracion Manual');
            writeln('2. Configuracion Aleatoria');
            writeln('3. Regresar al Menu');
            writeln;
            readln(opc);
                
            case opc of
              1: 
                begin
                  clrscr;
                  repeat
                      textcolor(10);
                      writeln('Ingrese el numero de filas: ');
                      readln(x);

                      if (x < 1) or (x > 20) then
                        begin
                          textcolor(12);
                          writeln('Error: Debe ingresar un numero del 1 al 20');
                        end;
                  until (x > 0) and (x <= 20);
                  
                  clrscr;
                  repeat
                    textcolor(10);
                    writeln('Ingrese el numero de columnas: ');
                    readln(y);
                    
                    if (y < 1) or (y > 20) then
                      begin
                        textcolor(12);
                        writeln('Error: Debe ingresar un numero del 1 al 20');
                      end;
                  until (y > 0) and (y <= 20);
                end;
              2:
                begin
                  randomize;
                  x := random(20) + 1;
                  y := random(20) + 1;  
                end;
              3:
                begin
                  fin_programa('regresar al menu');
                end;
              else
                begin
                  clrscr;
                  textcolor(12);
                  writeln('Error: Solo debe ingresar numeros del 1 al 3');
                  fin_programa('regresar');
                end;
            end;
          until (opc = 3);
        end;

      2:
        begin
          clrscr;
          if (caldo = '') then
            begin
              writeln('Actualmente no existe ningun caldo de cautivo,');
              writeln('pulse 1 en el menu principal para crearlo.');
              fin_programa('regresar al menu');
            end;
        end;
      3:
        begin
          clrscr;
          if (caldo = '') then
            begin
              writeln('Actualmente no existe ningun caldo de cautivo,');
              writeln('pulse 1 en el menu principal para crearlo.');
              fin_programa('regresar al menu');
            end;
        end;
      4:
        begin
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
