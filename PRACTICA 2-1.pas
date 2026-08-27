{1.- Implementar un programa que invoque a los siguientes modulos.

a. Un modulo recursivo que retorne un vector de a lo sumo 15 numeros enteros (random) mayores a 130 y menores a 145 (incluidos ambos).
La carga finaliza con el valor 130.  YA VIENE HECHO

b. Un modulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector. YA VIENE HECHO

c. Un modulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un modulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores contenidos en el vector.
e. Un modulo recursivo que reciba el vector generado en a) y devuelva el maximo valor del vector.
f. Un modulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un modulo que reciba el vector generado en a) e imprima, para cada numero contenido en el vector, sus digitos en el orden en que aparecen en el numero. 
Debe implementarse un modulo recursivo que reciba el numero e imprima lo pedido. Ejemplo si se recibe el valor 134, se debe imprimir 1  3  4
}

//COMPLETAR EL CODIGO

Program Clase2MI;
const dimF = 15;
      min = 130;
      max = 145;
      
type vector = array [1..dimF] of integer;
     


procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
var
valor: integer;
begin
    valor:= min + random (max - min + 1);    //valor guarda un numero random entre 130 y 145
    if ((valor <> 130 ) and (dimL < dimF))   // 2 casos base
    then begin
          dimL:= dimL + 1;
          v[dimL]:= valor;
          CargarVectorRecursivo (v, dimL);  // este modulo esta bien en teoria, seria el inciso a. cuando se
         end;                               // terminan todas las instancias simplemente vuelve al prog. ppal.
end;
 
procedure CargarVector (var v: vector; var dimL: integer);
begin
  dimL:= 0;                         // dimL debe estar en 0
  CargarVectorRecursivo (v, dimL);  // supongo q va aca
end;

 
procedure ImprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('------');
     writeln;                   // los writeln son para dejar espacios vacios entre lineas
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('------');
     writeln;
     writeln;
End;     

procedure ImprimirVectorRecursivo (v: vector; dimL: integer);   //SEGUIR ACA
var
aux1: integer;
aux2: integer;
begin
    aux1:= dimL; 
    aux2:= dimL;  
	if(dimL <> 0)then begin
		write ('------');
		imprimirVectorRecursivo(v,diml-1);
	end;
	
	writeln;
    write (' ');
	
	if(aux1 <> 0)then begin	
		write(v[aux1], ' | ');
		imprimirVectorRecursivo(v,aux1-1);
	end;
	
	writeln;
	
	if(aux2 <> 0)then begin
		write ('------');
		imprimirVectorRecursivo(v,aux2-1);
	end;
end; 
    
function Sumar (v: vector; dimL: integer): integer; 

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;

  Begin
    if (pos <= dimL)  
    then SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
    else SumarRecursivo:=0  
  End;
 
var pos: integer; 
begin
 pos:= 1;
 Sumar:= SumarRecursivo (v, pos, dimL);
end;

function  ObtenerMaximo (v: vector; dimL: integer): integer;
begin
  {-- Completar --} 
end;     
     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;
begin
  {-- Completar --} 
end; 

procedure ImprimirDigitos (v: vector; dimL: integer);
begin    
     {-- Completar --}     
end; 

var
dimL, suma, maximo, valor: integer; 
v: vector;
encontre: boolean;

Begin 
  randomize;
  CargarVector (v, dimL);      //empezar aca
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                     {  ImprimirVector (v, dimL);  }
                      
                       writeln('dimL vale: ',dimL);
                       ImprimirVectorRecursivo (v, dimL);
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
 { maximo:= ObtenerMaximo(v, dimL);
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);}
end.
