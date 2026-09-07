{5. Una veterinaria desea procesar la información de las consultas realizadas durante el año.


De cada consulta se conoce: número de consulta, número de historia clínica de la mascota,
fecha, tipo de consulta y costo de la consulta. La lectura de las consultas finaliza cuando se
ingresa el número de consulta -1.

Implementar un programa que invoque a los siguientes módulos y compruebe el correcto
funcionamiento del mismo.

a. Un módulo que retorne la información de las historias clínicas en un árbol binario de
búsqueda ordenado por número de historia clínica. Para cada historia clínica se debe
almacenar una lista con las consultas realizadas a la mascota correspondiente.

b. Un módulo que imprima recursivamente todas las historias clínicas en orden creciente
de número.
c. Un módulo que reciba el árbol y retorne el número de historia clínica con mayor
cantidad de consultas.
d. Un módulo que reciba el árbol y un número de historia clínica. Debe retornar la
cantidad total de consultas realizadas a dicha mascota. En caso
e. Un módulo que reciba el árbol y un valor de costo. Debe retornar la cantidad de
consultas cuyo costo supera el valor recibido.
f. Un módulo que reciba el árbol y dos números de historia clínica. Debe retornar el costo
total de las consultas correspondientes a las historias clínicas comprendidas entre
ambos números, inclusive.
g. Un módulo que reciba el árbol y genere una nueva estructura ordenada por número de
historia clínica, donde cada historia aparezca una única vez junto con el costo total
acumulado de sus consultas.
}


program practica4_5;

type

{De cada consulta se conoce: número de consulta, número de historia clínica de la mascota,
fecha, tipo de consulta y costo de la consulta. La lectura de las consultas finaliza cuando se
ingresa el número de consulta -1.}}

infoFecha = record
dia: integer;
mes: integer;
anio: integer;
end;

consulta = record
numero: integer;
numHistoria: integer;
fecha: infoFecha;
tipo: integer;
costo: real;
end;

// ARBOL 1

infoLista = record;
numero: integer;
fecha: infoFecha;
tipo: integer;
costo: real;
end;

listaConsultas = ^nodo
nodo = record
dato: infoLista;
sig: listaConsultas;
end;

infoHistoria = record
numHistoria: integer;
lista: listaConsultas;
end;

arbol = ^nodoArbol;
nodoArbol = record
dato: infoHistoria;
HI: arbol;
HD: arbol;
end;

{a. Un módulo que retorne la información de las historias clínicas en un árbol binario de
búsqueda ordenado por número de historia clínica. Para cada historia clínica se debe
almacenar una lista con las consultas realizadas a la mascota correspondiente.}

procedure leerConsulta(var c: consulta);
begin
	writeln('Ingrese un numero de consulta');
	readln(c.numero);
	if(c.numero <> -1)then begin
			writeln('Ingrese un numero de historia clinica');
	        readln(c.numHistoria);
			writeln('Ingrese un dia de consulta');
	        readln(c.fecha.dia);
			writeln('Ingrese un mes de consulta');
	        readln(c.fecha.mes);
			writeln('Ingrese un año de consulta');
	        readln(c.fecha.anio);	
			writeln('Ingrese un tipo de consulta');
	        readln(c.tipo);
			writeln('Ingrese un costo de consulta');
	        readln(c.costo);
	end;
end;


procedure generarArbol(var a: arbol);
var
c: consulta;
begin
	leerConsulta(c);
	while(c.numero <> -1)do begin
		leerConsulta(c);
		insertarNodo(a,c);
	end;
end;

var
a: arbol;

BEGIN
a:= nil;
generarArbol(a);
	
	
END.

