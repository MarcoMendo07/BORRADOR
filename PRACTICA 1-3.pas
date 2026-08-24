// Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
//septiembre de 2025. De cada película se conoce: código de película, código de género
//(1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8:
//terror) y puntaje promedio otorgado por las críticas.
//Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:

//a. Lea los datos de películas, almacenarlos por orden de llegada y agrupados por
//código de género, y retornar en una estructura de datos adecuada. La lectura finaliza cuando se lee el código de la película -1.

//b. Genere y retorne en un vector, para cada género, el código de película con
//mayor puntaje obtenido entre todas las críticas, a partir de la estructura
//generada en a).     (calcular maximo y guardar en vec contador el codigo)  (corte de control --> info ordenada)
//c. Ordene los elementos del vector generado en b) por puntaje utilizando el
//método visto en la teoría.
//d. Muestre el código de película con mayor puntaje y el código de película con
//menor puntaje, del vector obtenido en el punto c)

program practica1_3;

type

RangoGeneros = 1..8;

pelicula = record
codigo: integer;
genero: RangoGeneros;
puntaje: real;
end;

listaPeliculas = ^nodo;
nodo = record
dato: pelicula;
sig: listaPeliculas;
end;

vectorGeneros = array[RangoGeneros] of pelicula;   // el vector debe devolver el CODIGO con mayor puntaje para CADA GENERO (usar los campos del reg.)

procedure leerPelicula(var p: pelicula);
begin
	writeln('Ingrese un genero de pelicula:');
	readln(p.genero);
	writeln('Ingrese un puntaje:');
	readln(p.puntaje);
end;

procedure insertarOrdenado(var l: listaPeliculas; p:pelicula);   // p es el dato que entra al modulo
var
ant,act,nue: listaPeliculas;
begin
	new(nue);
	nue^.dato:= p;
	ant:= l;
	act:= l;
	while(act <> nil) and (p.codigo > act^.dato.codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;	
    if(act = ant)then
		l:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;		

procedure cargarLista(var l: listaPeliculas);
var
p: pelicula;
begin
	writeln('Ingrese un codigo de pelicula:');
	readln(p.codigo);
	while(p.codigo <> -1)do begin
		leerPelicula(p);
		insertarOrdenado(l,p);
		writeln('Ingrese un codigo de pelicula:');
		readln(p.codigo);
    end;
end;

procedure inicializarVector(var vGeneros: vectorGeneros);
var
i: RangoGeneros;
begin
	for i:= 1 to 8 do
		vGeneros[i]:= 0;
end;

procedure actualizarMaximo

procedure incisoB(l: listaPeliculas; var vGeneros: vectorGeneros);
var
generoAct: RangoGeneros;

begin
	generoAct:= l^.dato.genero;
	
	while(l <> nil) and (generoAct = l^.dato.genero)do begin
		vGeneros[l^.dato.genero]:= vGeneros[l^.dato.genero] + 1;
		actualizarMaximo(vGeneros



end



var
l: listaPeliculas;
vGeneros: vectorGeneros;
dimL: integer;

BEGIN
l:= nil;
cargarLista(l);	

inicializarVector(vGeneros);
incisoB(l,vGeneros);


END.

