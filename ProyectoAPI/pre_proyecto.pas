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

Begin
  caldo := '';
  repeat
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
          clrscr;
          if (caldo <> '') then
            begin
              textcolor(12);
              writeln('NOTA: Si genera un nuevo caldo, se sobreescribira al existente.');
              writeln;
              writeln;
            end;
            
          textcolor(10);
          writeln('Ingrese 1 para configuracion manual o 2 para configuracion aleatoria');
          writeln;
          writeln('1. Configuracion Manual');
          writeln('2. Configuracion Aleatoria');
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
                
              end;
            3:
              begin

              end;

          end;
        end;

      2:
        begin
          clrscr;
        end;
      3:
        begin
          clrscr;
        end;
      4:
        begin
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
