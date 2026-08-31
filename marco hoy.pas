{Escribir un programa que:

a. Implemente un modulo que almacene informacion de socios de un club participantes de un evento cultural en un arbol binario de busqueda.
De cada socio se debe almacenar numero de socio (entre 100 y 150), 
nombre y edad (entre 12 y 90). La carga finaliza con el numero de socio 100 (que no debe agregarse al arbol) y el arbol debe quedar ordenado por numero de socio.
La informacion de cada socio debe generarse aleatoriamente.  ( NO SE REPITEN LOS NUMEROS)  HECHO

b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro para: 
   
    i. Informar los datos de los socios en orden creciente por número de socio.      HECHO
    ii. Informar los datos de los socios en orden decreciente por número de socio.   HECHO
    iii. Informar el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor. HECHO
    
    iv. Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad. HECHO
   
    vi. Leer un nombre e informar si existe o no existe un socio con ese nombre.
    Debe invocar a un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
    vii. Informar la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
    viii. Informar el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que
    retorne la suma de las edades de los socios.


 Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. ESO ESTABA ABAJO DE GENERAR ARBOL}


Program ImperativoClase3;

type rangoEdad = 12..100;
     rangoSocio = 100..200;
     cadena15 = string [15];
     socio = record
               numero: rangoSocio;
               nombre: cadena15;
               edad: rangoEdad;
             end;
             
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
                 
     conjunto = set of rangoSocio;


  Procedure CargarSocio (var s: socio; var conj: conjunto);   // es cargarle los datos al registro, como un leerRegistro
  var vNombres:array [0..9] of string= ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  
  begin
    s.numero:= random (51) + 100;
    while (s.numero in conj) do             //permite controlar que no se repitan numeros
      s.numero:= random (51) + 100;
    If (s.numero <> 100)
    then begin
           conj:= conj + [s.numero];        //el numero EN el conjunto
           s.nombre:= vNombres[random(10)]; //random de 1 a 9 seria
           s.edad:= 12 + random (79);       //entre 12 y 90 (78 + 12)=90
         end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);   // procedimiento agregar en el arbol
  Begin
    if (a = nil) 
    then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.numero < a^.dato.numero)                 // los ordena de menor a mayor, con los mas chicos a la izquierda (ascendente)
         then InsertarElemento(a^.HI, elem)
         else InsertarElemento(a^.HD, elem); 
  End;

procedure GenerarArbol (var a: arbol);
var
unSocio: socio;  
conj: conjunto;
Begin
 writeln;
 writeln ('----- Ingreso de socios y armado del arbol ----->');
 writeln;
 a:= nil;                         // le pone nil al arbol
 conj:=[];                        // inicializa en vacio el conjunto
 CargarSocio (unSocio, conj);
 while (unSocio.numero <> 100)do
  begin
   writeln ('Numero generado: ', unSocio.numero);
   InsertarElemento (a, unSocio);
   CargarSocio (unSocio, conj);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if (a <> nil) then begin
        InformarDatosSociosOrdenCreciente (a^.HI);       // RECURSIVIDAD
        writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
        InformarDatosSociosOrdenCreciente (a^.HD);
    end;
  end;

procedure InformarSociosOrdenCreciente (a: arbol);
Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;

  procedure InformarDatosSociosOrdenDecreciente(a: arbol);
  begin
    if (a <> nil) then begin
        InformarDatosSociosOrdenDecreciente (a^.HD);       // RECURSIVIDAD
        writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
        InformarDatosSociosOrdenDecreciente (a^.HI);
    end;
  end;

procedure informarSociosOrdenDecreciente(a: arbol);
Begin
 writeln;
 writeln ('----- Socios en orden decreciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenDecreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;
 
     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);  //CALCULA EL SOCIO con MAX EDAD ENTRE TODOS LOS NODOS
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
var maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) 
  then writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;
  
  function AumentarEdad (a: arbol): integer;
  var resto: integer;
  begin
     if (a = nil)       //recordar que a tiene puntero inicial y termina en nil como cualquier lista
     then AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then a^.dato.edad:= a^.dato.edad + 1;                  // LE SUMA 1 A LOS SOCIOS DE EDAD IMPAR (TODOS)
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);   // en ALGUN MOMENTO VA A LLEGAR A 0 y luego se va a sumar la cant. a los que se les sumo
          end;  
  end;

procedure AumentarEdadNumeroImpar (a: arbol);
begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;

var
a: arbol; 
Begin
  randomize;
  
  GenerarArbol (a);
  InformarSociosOrdenCreciente (a); //hasta aca HECHO
  
  InformarSociosOrdenDecreciente (a); //HECHO, informar primero HD y dsp HI
  
  InformarNumeroSocioConMasEdad (a);  // viene HECHO
  
  AumentarEdadNumeroImpar (a);
  InformarSociosOrdenCreciente (a);    //viene HECHO
   
  { InformarExistenciaNombreSocio (a); COMPLETAR
    InformarCantidadSocios (a); COMPLETAR
    InformarPromedioDeEdad (a); COMPLETAR
  }   
End.
